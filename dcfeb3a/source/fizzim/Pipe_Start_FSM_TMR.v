
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 12:21:30 (www.fizzim.com)

module Pipe_Start_FSM_TMR (
  output PIP_RST,
  output RE,
  output WE,
  input CLK,
  input wire [8:0] PDEPTH,
  input RESTART,
  input RST 
);

  // state bits
  parameter 
  Idle       = 3'b000, 
  Clear      = 3'b001, 
  Pause      = 3'b010, 
  Reset_Pipe = 3'b011, 
  Run        = 3'b100, 
  Start_Pipe = 3'b101; 

  (* syn_preserve = "true" *) reg [2:0] state_1;
  (* syn_preserve = "true" *) reg [2:0] state_2;
  (* syn_preserve = "true" *) reg [2:0] state_3;

  (* syn_keep = "true" *) wire [2:0] voted_state_1;
  (* syn_keep = "true" *) wire [2:0] voted_state_2;
  (* syn_keep = "true" *) wire [2:0] voted_state_3;

  assign voted_state_1   = (state_1   & state_2  ) | (state_2   & state_3  ) | (state_1   & state_3  ); // Majority logic
  assign voted_state_2   = (state_1   & state_2  ) | (state_2   & state_3  ) | (state_1   & state_3  ); // Majority logic
  assign voted_state_3   = (state_1   & state_2  ) | (state_2   & state_3  ) | (state_1   & state_3  ); // Majority logic

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg PIP_RST_1;
  (* syn_preserve = "true" *)  reg PIP_RST_2;
  (* syn_preserve = "true" *)  reg PIP_RST_3;
  (* syn_preserve = "true" *)  reg RE_1;
  (* syn_preserve = "true" *)  reg RE_2;
  (* syn_preserve = "true" *)  reg RE_3;
  (* syn_preserve = "true" *)  reg WE_1;
  (* syn_preserve = "true" *)  reg WE_2;
  (* syn_preserve = "true" *)  reg WE_3;
  (* syn_preserve = "true" *)  reg [3:0] hold_1;
  (* syn_preserve = "true" *)  reg [3:0] hold_2;
  (* syn_preserve = "true" *)  reg [3:0] hold_3;
  (* syn_keep = "true" *)      wire [3:0] voted_hold_1;
  (* syn_keep = "true" *)      wire [3:0] voted_hold_2;
  (* syn_keep = "true" *)      wire [3:0] voted_hold_3;
  (* syn_preserve = "true" *)  reg [8:0] wcnt_1;
  (* syn_preserve = "true" *)  reg [8:0] wcnt_2;
  (* syn_preserve = "true" *)  reg [8:0] wcnt_3;
  (* syn_keep = "true" *)      wire [8:0] voted_wcnt_1;
  (* syn_keep = "true" *)      wire [8:0] voted_wcnt_2;
  (* syn_keep = "true" *)      wire [8:0] voted_wcnt_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign PIP_RST = (PIP_RST_1 & PIP_RST_2) | (PIP_RST_2 & PIP_RST_3) | (PIP_RST_1 & PIP_RST_3); // Majority logic
  assign RE      = (RE_1      & RE_2     ) | (RE_2      & RE_3     ) | (RE_1      & RE_3     ); // Majority logic
  assign WE      = (WE_1      & WE_2     ) | (WE_2      & WE_3     ) | (WE_1      & WE_3     ); // Majority logic
  assign voted_hold_1    = (hold_1    & hold_2   ) | (hold_2    & hold_3   ) | (hold_1    & hold_3   ); // Majority logic
  assign voted_hold_2    = (hold_1    & hold_2   ) | (hold_2    & hold_3   ) | (hold_1    & hold_3   ); // Majority logic
  assign voted_hold_3    = (hold_1    & hold_2   ) | (hold_2    & hold_3   ) | (hold_1    & hold_3   ); // Majority logic
  assign voted_wcnt_1    = (wcnt_1    & wcnt_2   ) | (wcnt_2    & wcnt_3   ) | (wcnt_1    & wcnt_3   ); // Majority logic
  assign voted_wcnt_2    = (wcnt_1    & wcnt_2   ) | (wcnt_2    & wcnt_3   ) | (wcnt_1    & wcnt_3   ); // Majority logic
  assign voted_wcnt_3    = (wcnt_1    & wcnt_2   ) | (wcnt_2    & wcnt_3   ) | (wcnt_1    & wcnt_3   ); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle      :                              nextstate_1 = Clear;
      Clear     : if (voted_hold_1 == 4'd5)    nextstate_1 = Reset_Pipe;
                  else                         nextstate_1 = Clear;
      Pause     : if (voted_hold_1 == 4'd15)   nextstate_1 = Start_Pipe;
                  else                         nextstate_1 = Pause;
      Reset_Pipe: if (voted_hold_1 == 4'd10)   nextstate_1 = Pause;
                  else                         nextstate_1 = Reset_Pipe;
      Run       : if (RESTART)                 nextstate_1 = Idle;
                  else                         nextstate_1 = Run;
      Start_Pipe: if (voted_wcnt_1 == PDEPTH)  nextstate_1 = Run;
                  else                         nextstate_1 = Start_Pipe;
    endcase
    case (voted_state_2)
      Idle      :                              nextstate_2 = Clear;
      Clear     : if (voted_hold_2 == 4'd5)    nextstate_2 = Reset_Pipe;
                  else                         nextstate_2 = Clear;
      Pause     : if (voted_hold_2 == 4'd15)   nextstate_2 = Start_Pipe;
                  else                         nextstate_2 = Pause;
      Reset_Pipe: if (voted_hold_2 == 4'd10)   nextstate_2 = Pause;
                  else                         nextstate_2 = Reset_Pipe;
      Run       : if (RESTART)                 nextstate_2 = Idle;
                  else                         nextstate_2 = Run;
      Start_Pipe: if (voted_wcnt_2 == PDEPTH)  nextstate_2 = Run;
                  else                         nextstate_2 = Start_Pipe;
    endcase
    case (voted_state_3)
      Idle      :                              nextstate_3 = Clear;
      Clear     : if (voted_hold_3 == 4'd5)    nextstate_3 = Reset_Pipe;
                  else                         nextstate_3 = Clear;
      Pause     : if (voted_hold_3 == 4'd15)   nextstate_3 = Start_Pipe;
                  else                         nextstate_3 = Pause;
      Reset_Pipe: if (voted_hold_3 == 4'd10)   nextstate_3 = Pause;
                  else                         nextstate_3 = Reset_Pipe;
      Run       : if (RESTART)                 nextstate_3 = Idle;
                  else                         nextstate_3 = Run;
      Start_Pipe: if (voted_wcnt_3 == PDEPTH)  nextstate_3 = Run;
                  else                         nextstate_3 = Start_Pipe;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= Idle;
      state_2 <= Idle;
      state_3 <= Idle;
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
      PIP_RST_1 <= 0;
      PIP_RST_2 <= 0;
      PIP_RST_3 <= 0;
      RE_1 <= 0;
      RE_2 <= 0;
      RE_3 <= 0;
      WE_1 <= 0;
      WE_2 <= 0;
      WE_3 <= 0;
      hold_1 <= 4'h0;
      hold_2 <= 4'h0;
      hold_3 <= 4'h0;
      wcnt_1 <= 9'h000;
      wcnt_2 <= 9'h000;
      wcnt_3 <= 9'h000;
    end
    else begin
      PIP_RST_1 <= 0; // default
      PIP_RST_2 <= 0; // default
      PIP_RST_3 <= 0; // default
      RE_1 <= 0; // default
      RE_2 <= 0; // default
      RE_3 <= 0; // default
      WE_1 <= 0; // default
      WE_2 <= 0; // default
      WE_3 <= 0; // default
      hold_1 <= 4'h0; // default
      hold_2 <= 4'h0; // default
      hold_3 <= 4'h0; // default
      wcnt_1 <= 9'h000; // default
      wcnt_2 <= 9'h000; // default
      wcnt_3 <= 9'h000; // default
      case (nextstate_1)
        Clear     :        hold_1 <= voted_hold_1 + 1;
        Pause     :        hold_1 <= voted_hold_1 + 1;
        Reset_Pipe: begin
                           PIP_RST_1 <= 1;
                           hold_1 <= voted_hold_1 + 1;
        end
        Run       : begin
                           RE_1 <= 1;
                           WE_1 <= 1;
                           wcnt_1 <= voted_wcnt_1;
        end
        Start_Pipe: begin
                           WE_1 <= 1;
                           wcnt_1 <= voted_wcnt_1 + 1;
        end
      endcase
      case (nextstate_2)
        Clear     :        hold_2 <= voted_hold_2 + 1;
        Pause     :        hold_2 <= voted_hold_2 + 1;
        Reset_Pipe: begin
                           PIP_RST_2 <= 1;
                           hold_2 <= voted_hold_2 + 1;
        end
        Run       : begin
                           RE_2 <= 1;
                           WE_2 <= 1;
                           wcnt_2 <= voted_wcnt_2;
        end
        Start_Pipe: begin
                           WE_2 <= 1;
                           wcnt_2 <= voted_wcnt_2 + 1;
        end
      endcase
      case (nextstate_3)
        Clear     :        hold_3 <= voted_hold_3 + 1;
        Pause     :        hold_3 <= voted_hold_3 + 1;
        Reset_Pipe: begin
                           PIP_RST_3 <= 1;
                           hold_3 <= voted_hold_3 + 1;
        end
        Run       : begin
                           RE_3 <= 1;
                           WE_3 <= 1;
                           wcnt_3 <= voted_wcnt_3;
        end
        Start_Pipe: begin
                           WE_3 <= 1;
                           wcnt_3 <= voted_wcnt_3 + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [79:0] statename;
  always @* begin
    case (state_1)
      Idle      : statename = "Idle";
      Clear     : statename = "Clear";
      Pause     : statename = "Pause";
      Reset_Pipe: statename = "Reset_Pipe";
      Run       : statename = "Run";
      Start_Pipe: statename = "Start_Pipe";
      default   : statename = "XXXXXXXXXX";
    endcase
  end
  `endif

endmodule

