
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:25 at 17:28:09 (www.fizzim.com)

module dyn_phase_shift_FSM (
  output reg BUSY,
  output reg PSEN,
  output wire [2:0] DYN_PHS_STATE,
  input CLK,
  input LOCKED,
  input PH_CHANGE,
  input PS_DONE,
  input RST 
);

  // state bits
  parameter 
  Idle      = 3'b000, 
  Inc_Dec   = 3'b001, 
  Standby   = 3'b010, 
  W4Lock    = 3'b011, 
  W4_PSDone = 3'b100; 

  reg [2:0] state;

  assign DYN_PHS_STATE = state;

  reg [2:0] nextstate;


  // comb always block
  always @* begin
    nextstate = 3'bxxx; // default to x because default_state_is_x is set
    case (state)
      Idle     :                                 nextstate = W4Lock;
      Inc_Dec  :                                 nextstate = W4_PSDone;
      Standby  : if      (PH_CHANGE)             nextstate = Inc_Dec;
                 else                            nextstate = Standby;
      W4Lock   : if      (LOCKED)                nextstate = Standby;
                 else                            nextstate = W4Lock;
      W4_PSDone: if      (PS_DONE && PH_CHANGE)  nextstate = Inc_Dec;
                 else if (PS_DONE)               nextstate = Standby;
                 else                            nextstate = W4_PSDone;
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
      BUSY <= 0;
      PSEN <= 0;
    end
    else begin
      BUSY <= 0; // default
      PSEN <= 0; // default
      case (nextstate)
        Inc_Dec  : begin
                          BUSY <= 1;
                          PSEN <= 1;
        end
        W4_PSDone:        BUSY <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [71:0] statename;
  always @* begin
    case (state)
      Idle     : statename = "Idle";
      Inc_Dec  : statename = "Inc_Dec";
      Standby  : statename = "Standby";
      W4Lock   : statename = "W4Lock";
      W4_PSDone: statename = "W4_PSDone";
      default  : statename = "XXXXXXXXX";
    endcase
  end
  `endif

endmodule

