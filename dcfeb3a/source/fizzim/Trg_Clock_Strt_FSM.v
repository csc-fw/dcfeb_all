
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:51:12 (www.fizzim.com)

module Trg_Clock_Strt_FSM (
  output reg GTX_RST,
  output reg TRG_RST,
  input CLK,
  input CLK_PHS_CHNG,
  input MMCM_LOCK,
  input RST,
  input SYNC_DONE 
);

  // state bits
  parameter 
  GTX_Idle     = 2'b00, 
  Clk_Phs_Chng = 2'b01, 
  Clk_Run      = 2'b10, 
  W4TxSync     = 2'b11; 

  reg [1:0] state;

  reg [1:0] nextstate;


  // comb always block
  always @* begin
    nextstate = 2'bxx; // default to x because default_state_is_x is set
    case (state)
      GTX_Idle    : if      (MMCM_LOCK)      nextstate = W4TxSync;
                    else                     nextstate = GTX_Idle;
      Clk_Phs_Chng: if      (!CLK_PHS_CHNG)  nextstate = GTX_Idle;
                    else                     nextstate = Clk_Phs_Chng;
      Clk_Run     : if      (!MMCM_LOCK)     nextstate = GTX_Idle;
                    else if (CLK_PHS_CHNG)   nextstate = Clk_Phs_Chng;
                    else                     nextstate = Clk_Run;
      W4TxSync    : if      (SYNC_DONE)      nextstate = Clk_Run;
                    else                     nextstate = W4TxSync;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST)
      state <= GTX_Idle;
    else
      state <= nextstate;
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      GTX_RST <= 1;
      TRG_RST <= 1;
    end
    else begin
      GTX_RST <= 1; // default
      TRG_RST <= 1; // default
      case (nextstate)
        Clk_Run     : begin
                             GTX_RST <= 0;
                             TRG_RST <= 0;
        end
        W4TxSync    :        GTX_RST <= 0;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [95:0] statename;
  always @* begin
    case (state)
      GTX_Idle    : statename = "GTX_Idle";
      Clk_Phs_Chng: statename = "Clk_Phs_Chng";
      Clk_Run     : statename = "Clk_Run";
      W4TxSync    : statename = "W4TxSync";
      default     : statename = "XXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

