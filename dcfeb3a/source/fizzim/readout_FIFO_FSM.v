
// Created by fizzim.pl version 3.60 on 2011:05:27 at 18:46:02 (www.fizzim.com)

module Readout_FIFO_FSM (
  output reg INC_CHAN,
  output reg INC_CHIP,
  output reg INC_SAMP,
  output reg RDENA,
  output reg RST_SAMP,
  input CLK,
  input JTAG_MODE,
  input RDY,
  input RST,
  input wire [2:0] CHIP,
  input wire [3:0] CHAN,
  input wire [6:0]SAMP,
  input wire [6:0]SAMP_MAX 
);
  
  // state bits
  parameter 
  Idle     = 3'b000, 
  Inc_Chan = 3'b001, 
  Inc_Samp = 3'b010, 
  Last     = 3'b011, 
  Rd_Ena   = 3'b100; 
  
  reg [2:0] state;
  reg [2:0] nextstate;
  
  // comb always block
  always @* begin
    nextstate = 3'bx; // default to x because default_state_is_x is set
    INC_CHAN = 0; // default
    INC_CHIP = 1; // default
    INC_SAMP = 0; // default
    RDENA = 1; // default
    RST_SAMP = 0; // default
    case (state)
      Idle    : begin
                                                                            INC_CHIP = 0;
                                                                            RDENA = 0;
        if              (RDY && !JTAG_MODE)                                 nextstate = Rd_Ena;
        else                                                                nextstate = Idle;
      end
      Inc_Chan: begin
                                                                            INC_CHAN = 1;
                                                                            nextstate = Rd_Ena;
      end
      Inc_Samp: begin
                                                                            INC_CHAN = 1;
                                                                            INC_SAMP = 1;
                                                                            nextstate = Rd_Ena;
      end
      Last    : begin
                                                                            INC_CHAN = 1;
                                                                            RST_SAMP = 1;
        if              (RDY && !JTAG_MODE)                                 nextstate = Rd_Ena;
        else                                                                nextstate = Idle;
      end
      Rd_Ena  : if      ((CHIP == 4) && (CHAN ==15) && (SAMP == SAMP_MAX))  nextstate = Last;
                else if ((CHIP == 4) && (CHAN == 15))                       nextstate = Inc_Samp;
                else if ((CHIP == 4))                                       nextstate = Inc_Chan;
                else                                                        nextstate = Rd_Ena;
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
  
  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [63:0] statename;
  always @* begin
    case (state)
      Idle    : statename = "Idle";
      Inc_Chan: statename = "Inc_Chan";
      Inc_Samp: statename = "Inc_Samp";
      Last    : statename = "Last";
      Rd_Ena  : statename = "Rd_Ena";
      default : statename = "XXXXXXXX";
    endcase
  end
  `endif

endmodule

