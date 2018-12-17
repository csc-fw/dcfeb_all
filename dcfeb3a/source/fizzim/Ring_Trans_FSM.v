
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 13:27:36 (www.fizzim.com)

module Ring_Trans_FSM (
  output reg LD_ADDR,
  output reg NXT_L1A,
  output reg RD,
  output wire [2:0] EVT_STATE,
  input CLK,
  input EVT_BUF_AFL,
  input EVT_BUF_AMT,
  input L1A_BUF_MT,
  input RING_AMT,
  input RST,
  input wire [6:0] SAMP_MAX 
);

  // state bits
  parameter 
  Idle       = 3'b000, 
  Inc_Samp   = 3'b001, 
  Last       = 3'b010, 
  Load_Addr  = 3'b011, 
  Next_L1a   = 3'b100, 
  Read       = 3'b101, 
  W4Data     = 3'b110, 
  W4_EVT_AMT = 3'b111; 

  reg [2:0] state;

  assign EVT_STATE = state;

  reg [2:0] nextstate;

  reg [6:0] seq;
  reg [6:0] smp;

  // comb always block
  always @* begin
    nextstate = 3'bxxx; // default to x because default_state_is_x is set
    case (state)
      Idle      : if      (!L1A_BUF_MT)                nextstate = Load_Addr;
                  else                                 nextstate = Idle;
      Inc_Samp  :                                      nextstate = Read;
      Last      : if      (smp == SAMP_MAX)            nextstate = Next_L1a;
                  else if (EVT_BUF_AFL)                nextstate = W4_EVT_AMT;
                  else if (RING_AMT)                   nextstate = W4Data;
                  else                                 nextstate = Inc_Samp;
      Load_Addr :                                      nextstate = W4Data;
      Next_L1a  :                                      nextstate = Idle;
      Read      : if      (seq == 7'd94)               nextstate = Last;
                  else                                 nextstate = Read;
      W4Data    : if      (!RING_AMT && EVT_BUF_AFL)   nextstate = W4_EVT_AMT;
                  else if (!RING_AMT && !EVT_BUF_AFL)  nextstate = Inc_Samp;
                  else                                 nextstate = W4Data;
      W4_EVT_AMT: if      (EVT_BUF_AMT)                nextstate = Inc_Samp;
                  else                                 nextstate = W4_EVT_AMT;
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
      LD_ADDR <= 0;
      NXT_L1A <= 0;
      RD <= 0;
      seq <= 7'h00;
      smp <= 7'h00;
    end
    else begin
      LD_ADDR <= 0; // default
      NXT_L1A <= 0; // default
      RD <= 0; // default
      seq <= 7'h00; // default
      smp <= smp; // default
      case (nextstate)
        Idle      :        smp <= 7'h7F;
        Inc_Samp  : begin
                           RD <= 1;
                           smp <= smp + 1;
        end
        Last      : begin
                           RD <= 1;
                           seq <= seq + 1;
        end
        Load_Addr : begin
                           LD_ADDR <= 1;
                           smp <= 7'h7F;
        end
        Next_L1a  :        NXT_L1A <= 1;
        Read      : begin
                           RD <= 1;
                           seq <= seq + 1;
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
      Inc_Samp  : statename = "Inc_Samp";
      Last      : statename = "Last";
      Load_Addr : statename = "Load_Addr";
      Next_L1a  : statename = "Next_L1a";
      Read      : statename = "Read";
      W4Data    : statename = "W4Data";
      W4_EVT_AMT: statename = "W4_EVT_AMT";
      default   : statename = "XXXXXXXXXX";
    endcase
  end
  `endif

endmodule

