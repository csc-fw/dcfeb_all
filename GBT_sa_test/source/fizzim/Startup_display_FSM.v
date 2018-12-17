
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:09:02 at 14:34:13 (www.fizzim.com)

module Startup_Display_FSM (
  output reg CLEAR,
  output reg DISP,
  output reg LOAD_PAT,
  output reg NXT_ADR,
  output reg RST_TIMER,
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

  reg [2:0] state;

  reg [2:0] nextstate;


  // comb always block
  always @* begin
    nextstate = 3'bxxx; // default to x because default_state_is_x is set
    case (state)
      Reset: if (RUN)               nextstate = Wait;
             else                   nextstate = Reset;
      End  :                        nextstate = End;
      Load : if (DONE)              nextstate = End;
             else                   nextstate = Wait;
      Next :                        nextstate = Skip;
      Skip :                        nextstate = Load;
      Wait : if (TIMER == 16'hBB8)  nextstate = Next;
             else                   nextstate = Wait;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST)
      state <= Reset;
    else
      state <= nextstate;
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      CLEAR <= 0;
      DISP <= 1;
      LOAD_PAT <= 0;
      NXT_ADR <= 0;
      RST_TIMER <= 1;
    end
    else begin
      CLEAR <= 0; // default
      DISP <= 1; // default
      LOAD_PAT <= 0; // default
      NXT_ADR <= 0; // default
      RST_TIMER <= 1; // default
      case (nextstate)
        Reset: begin
                      CLEAR <= 1;
                      DISP <= 0;
        end
        End  : begin
                      CLEAR <= 1;
                      DISP <= 0;
        end
        Load :        LOAD_PAT <= 1;
        Next :        NXT_ADR <= 1;
        Wait :        RST_TIMER <= 0;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [39:0] statename;
  always @* begin
    case (state)
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

