
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:09:02 at 14:34:45 (www.fizzim.com)

module Startup_Display_FSM_TMR (
  output CLEAR,
  output DISP,
  output LOAD_PAT,
  output NXT_ADR,
  output RST_TIMER,
  input CLK,
  input DONE,
  input RST,
  input RUN,
  input wire [15:0] TIMER 
);

  // state bits
  parameter 
  Reset = 3'b000, 
  End   = 3'b001, 
  Load  = 3'b010, 
  Next  = 3'b011, 
  Skip  = 3'b100, 
  Wait  = 3'b101; 

  (* syn_preserve = "true" *) reg [2:0] state_1;
  (* syn_preserve = "true" *) reg [2:0] state_2;
  (* syn_preserve = "true" *) reg [2:0] state_3;

  (* syn_keep = "true" *) wire [2:0] voted_state_1;
  (* syn_keep = "true" *) wire [2:0] voted_state_2;
  (* syn_keep = "true" *) wire [2:0] voted_state_3;

  assign voted_state_1     = (state_1     & state_2    ) | (state_2     & state_3    ) | (state_1     & state_3    ); // Majority logic
  assign voted_state_2     = (state_1     & state_2    ) | (state_2     & state_3    ) | (state_1     & state_3    ); // Majority logic
  assign voted_state_3     = (state_1     & state_2    ) | (state_2     & state_3    ) | (state_1     & state_3    ); // Majority logic

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg CLEAR_1;
  (* syn_preserve = "true" *)  reg CLEAR_2;
  (* syn_preserve = "true" *)  reg CLEAR_3;
  (* syn_preserve = "true" *)  reg DISP_1;
  (* syn_preserve = "true" *)  reg DISP_2;
  (* syn_preserve = "true" *)  reg DISP_3;
  (* syn_preserve = "true" *)  reg LOAD_PAT_1;
  (* syn_preserve = "true" *)  reg LOAD_PAT_2;
  (* syn_preserve = "true" *)  reg LOAD_PAT_3;
  (* syn_preserve = "true" *)  reg NXT_ADR_1;
  (* syn_preserve = "true" *)  reg NXT_ADR_2;
  (* syn_preserve = "true" *)  reg NXT_ADR_3;
  (* syn_preserve = "true" *)  reg RST_TIMER_1;
  (* syn_preserve = "true" *)  reg RST_TIMER_2;
  (* syn_preserve = "true" *)  reg RST_TIMER_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign CLEAR     = (CLEAR_1     & CLEAR_2    ) | (CLEAR_2     & CLEAR_3    ) | (CLEAR_1     & CLEAR_3    ); // Majority logic
  assign DISP      = (DISP_1      & DISP_2     ) | (DISP_2      & DISP_3     ) | (DISP_1      & DISP_3     ); // Majority logic
  assign LOAD_PAT  = (LOAD_PAT_1  & LOAD_PAT_2 ) | (LOAD_PAT_2  & LOAD_PAT_3 ) | (LOAD_PAT_1  & LOAD_PAT_3 ); // Majority logic
  assign NXT_ADR   = (NXT_ADR_1   & NXT_ADR_2  ) | (NXT_ADR_2   & NXT_ADR_3  ) | (NXT_ADR_1   & NXT_ADR_3  ); // Majority logic
  assign RST_TIMER = (RST_TIMER_1 & RST_TIMER_2) | (RST_TIMER_2 & RST_TIMER_3) | (RST_TIMER_1 & RST_TIMER_3); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Reset: if (RUN)               nextstate_1 = Wait;
             else                   nextstate_1 = Reset;
      End  :                        nextstate_1 = End;
      Load : if (DONE)              nextstate_1 = End;
             else                   nextstate_1 = Wait;
      Next :                        nextstate_1 = Skip;
      Skip :                        nextstate_1 = Load;
      Wait : if (TIMER == 16'hBB8)  nextstate_1 = Next;
             else                   nextstate_1 = Wait;
    endcase
    case (voted_state_2)
      Reset: if (RUN)               nextstate_2 = Wait;
             else                   nextstate_2 = Reset;
      End  :                        nextstate_2 = End;
      Load : if (DONE)              nextstate_2 = End;
             else                   nextstate_2 = Wait;
      Next :                        nextstate_2 = Skip;
      Skip :                        nextstate_2 = Load;
      Wait : if (TIMER == 16'hBB8)  nextstate_2 = Next;
             else                   nextstate_2 = Wait;
    endcase
    case (voted_state_3)
      Reset: if (RUN)               nextstate_3 = Wait;
             else                   nextstate_3 = Reset;
      End  :                        nextstate_3 = End;
      Load : if (DONE)              nextstate_3 = End;
             else                   nextstate_3 = Wait;
      Next :                        nextstate_3 = Skip;
      Skip :                        nextstate_3 = Load;
      Wait : if (TIMER == 16'hBB8)  nextstate_3 = Next;
             else                   nextstate_3 = Wait;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= Reset;
      state_2 <= Reset;
      state_3 <= Reset;
    end
    else begin
      state_1 <= nextstate_1;
      state_2 <= nextstate_2;
      state_3 <= nextstate_3;
    end
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      CLEAR_1 <= 0;
      CLEAR_2 <= 0;
      CLEAR_3 <= 0;
      DISP_1 <= 1;
      DISP_2 <= 1;
      DISP_3 <= 1;
      LOAD_PAT_1 <= 0;
      LOAD_PAT_2 <= 0;
      LOAD_PAT_3 <= 0;
      NXT_ADR_1 <= 0;
      NXT_ADR_2 <= 0;
      NXT_ADR_3 <= 0;
      RST_TIMER_1 <= 1;
      RST_TIMER_2 <= 1;
      RST_TIMER_3 <= 1;
    end
    else begin
      CLEAR_1 <= 0; // default
      CLEAR_2 <= 0; // default
      CLEAR_3 <= 0; // default
      DISP_1 <= 1; // default
      DISP_2 <= 1; // default
      DISP_3 <= 1; // default
      LOAD_PAT_1 <= 0; // default
      LOAD_PAT_2 <= 0; // default
      LOAD_PAT_3 <= 0; // default
      NXT_ADR_1 <= 0; // default
      NXT_ADR_2 <= 0; // default
      NXT_ADR_3 <= 0; // default
      RST_TIMER_1 <= 1; // default
      RST_TIMER_2 <= 1; // default
      RST_TIMER_3 <= 1; // default
      case (nextstate_1)
        Reset: begin
                      CLEAR_1 <= 1;
                      DISP_1 <= 0;
        end
        End  : begin
                      CLEAR_1 <= 1;
                      DISP_1 <= 0;
        end
        Load :        LOAD_PAT_1 <= 1;
        Next :        NXT_ADR_1 <= 1;
        Wait :        RST_TIMER_1 <= 0;
      endcase
      case (nextstate_2)
        Reset: begin
                      CLEAR_2 <= 1;
                      DISP_2 <= 0;
        end
        End  : begin
                      CLEAR_2 <= 1;
                      DISP_2 <= 0;
        end
        Load :        LOAD_PAT_2 <= 1;
        Next :        NXT_ADR_2 <= 1;
        Wait :        RST_TIMER_2 <= 0;
      endcase
      case (nextstate_3)
        Reset: begin
                      CLEAR_3 <= 1;
                      DISP_3 <= 0;
        end
        End  : begin
                      CLEAR_3 <= 1;
                      DISP_3 <= 0;
        end
        Load :        LOAD_PAT_3 <= 1;
        Next :        NXT_ADR_3 <= 1;
        Wait :        RST_TIMER_3 <= 0;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [39:0] statename;
  always @* begin
    case (state_1)
      Reset:   statename = "Reset";
      End  :   statename = "End";
      Load :   statename = "Load";
      Next :   statename = "Next";
      Skip :   statename = "Skip";
      Wait :   statename = "Wait";
      default: statename = "XXXXX";
    endcase
  end
  `endif

endmodule

