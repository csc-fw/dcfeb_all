
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 12:20:44 (www.fizzim.com)

module Pipe_Start_FSM (
  output reg PIP_RST,
  output reg RE,
  output reg WE,
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

  reg [2:0] state;

  reg [2:0] nextstate;

  reg [3:0] hold;
  reg [8:0] wcnt;

  // comb always block
  always @* begin
    nextstate = 3'bxxx; // default to x because default_state_is_x is set
    case (state)
      Idle      :                      nextstate = Clear;
      Clear     : if (hold == 4'd5)    nextstate = Reset_Pipe;
                  else                 nextstate = Clear;
      Pause     : if (hold == 4'd15)   nextstate = Start_Pipe;
                  else                 nextstate = Pause;
      Reset_Pipe: if (hold == 4'd10)   nextstate = Pause;
                  else                 nextstate = Reset_Pipe;
      Run       : if (RESTART)         nextstate = Idle;
                  else                 nextstate = Run;
      Start_Pipe: if (wcnt == PDEPTH)  nextstate = Run;
                  else                 nextstate = Start_Pipe;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST)
      state <= Idle;
    else
      state <= nextstate;
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      PIP_RST <= 0;
      RE <= 0;
      WE <= 0;
      hold <= 4'h0;
      wcnt <= 9'h000;
    end
    else begin
      PIP_RST <= 0; // default
      RE <= 0; // default
      WE <= 0; // default
      hold <= 4'h0; // default
      wcnt <= 9'h000; // default
      case (nextstate)
        Clear     :        hold <= hold + 1;
        Pause     :        hold <= hold + 1;
        Reset_Pipe: begin
                           PIP_RST <= 1;
                           hold <= hold + 1;
        end
        Run       : begin
                           RE <= 1;
                           WE <= 1;
                           wcnt <= wcnt;
        end
        Start_Pipe: begin
                           WE <= 1;
                           wcnt <= wcnt + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [79:0] statename;
  always @* begin
    case (state)
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

