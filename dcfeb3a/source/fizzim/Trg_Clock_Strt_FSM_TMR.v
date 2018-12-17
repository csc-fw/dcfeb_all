
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:51:44 (www.fizzim.com)

module Trg_Clock_Strt_FSM_TMR (
  output GTX_RST,
  output TRG_RST,
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

  (* syn_preserve = "true" *) reg [1:0] state_1;
  (* syn_preserve = "true" *) reg [1:0] state_2;
  (* syn_preserve = "true" *) reg [1:0] state_3;

  (* syn_keep = "true" *) wire [1:0] voted_state_1;
  (* syn_keep = "true" *) wire [1:0] voted_state_2;
  (* syn_keep = "true" *) wire [1:0] voted_state_3;

  assign voted_state_1   = (state_1   & state_2  ) | (state_2   & state_3  ) | (state_1   & state_3  ); // Majority logic
  assign voted_state_2   = (state_1   & state_2  ) | (state_2   & state_3  ) | (state_1   & state_3  ); // Majority logic
  assign voted_state_3   = (state_1   & state_2  ) | (state_2   & state_3  ) | (state_1   & state_3  ); // Majority logic

  (* syn_keep = "true" *) reg [1:0] nextstate_1;
  (* syn_keep = "true" *) reg [1:0] nextstate_2;
  (* syn_keep = "true" *) reg [1:0] nextstate_3;

  (* syn_preserve = "true" *)  reg GTX_RST_1;
  (* syn_preserve = "true" *)  reg GTX_RST_2;
  (* syn_preserve = "true" *)  reg GTX_RST_3;
  (* syn_preserve = "true" *)  reg TRG_RST_1;
  (* syn_preserve = "true" *)  reg TRG_RST_2;
  (* syn_preserve = "true" *)  reg TRG_RST_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign GTX_RST = (GTX_RST_1 & GTX_RST_2) | (GTX_RST_2 & GTX_RST_3) | (GTX_RST_1 & GTX_RST_3); // Majority logic
  assign TRG_RST = (TRG_RST_1 & TRG_RST_2) | (TRG_RST_2 & TRG_RST_3) | (TRG_RST_1 & TRG_RST_3); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 2'bxx; // default to x because default_state_is_x is set
    nextstate_2 = 2'bxx; // default to x because default_state_is_x is set
    nextstate_3 = 2'bxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      GTX_Idle    : if      (MMCM_LOCK)      nextstate_1 = W4TxSync;
                    else                     nextstate_1 = GTX_Idle;
      Clk_Phs_Chng: if      (!CLK_PHS_CHNG)  nextstate_1 = GTX_Idle;
                    else                     nextstate_1 = Clk_Phs_Chng;
      Clk_Run     : if      (!MMCM_LOCK)     nextstate_1 = GTX_Idle;
                    else if (CLK_PHS_CHNG)   nextstate_1 = Clk_Phs_Chng;
                    else                     nextstate_1 = Clk_Run;
      W4TxSync    : if      (SYNC_DONE)      nextstate_1 = Clk_Run;
                    else                     nextstate_1 = W4TxSync;
    endcase
    case (voted_state_2)
      GTX_Idle    : if      (MMCM_LOCK)      nextstate_2 = W4TxSync;
                    else                     nextstate_2 = GTX_Idle;
      Clk_Phs_Chng: if      (!CLK_PHS_CHNG)  nextstate_2 = GTX_Idle;
                    else                     nextstate_2 = Clk_Phs_Chng;
      Clk_Run     : if      (!MMCM_LOCK)     nextstate_2 = GTX_Idle;
                    else if (CLK_PHS_CHNG)   nextstate_2 = Clk_Phs_Chng;
                    else                     nextstate_2 = Clk_Run;
      W4TxSync    : if      (SYNC_DONE)      nextstate_2 = Clk_Run;
                    else                     nextstate_2 = W4TxSync;
    endcase
    case (voted_state_3)
      GTX_Idle    : if      (MMCM_LOCK)      nextstate_3 = W4TxSync;
                    else                     nextstate_3 = GTX_Idle;
      Clk_Phs_Chng: if      (!CLK_PHS_CHNG)  nextstate_3 = GTX_Idle;
                    else                     nextstate_3 = Clk_Phs_Chng;
      Clk_Run     : if      (!MMCM_LOCK)     nextstate_3 = GTX_Idle;
                    else if (CLK_PHS_CHNG)   nextstate_3 = Clk_Phs_Chng;
                    else                     nextstate_3 = Clk_Run;
      W4TxSync    : if      (SYNC_DONE)      nextstate_3 = Clk_Run;
                    else                     nextstate_3 = W4TxSync;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= GTX_Idle;
      state_2 <= GTX_Idle;
      state_3 <= GTX_Idle;
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
      GTX_RST_1 <= 1;
      GTX_RST_2 <= 1;
      GTX_RST_3 <= 1;
      TRG_RST_1 <= 1;
      TRG_RST_2 <= 1;
      TRG_RST_3 <= 1;
    end
    else begin
      GTX_RST_1 <= 1; // default
      GTX_RST_2 <= 1; // default
      GTX_RST_3 <= 1; // default
      TRG_RST_1 <= 1; // default
      TRG_RST_2 <= 1; // default
      TRG_RST_3 <= 1; // default
      case (nextstate_1)
        Clk_Run     : begin
                             GTX_RST_1 <= 0;
                             TRG_RST_1 <= 0;
        end
        W4TxSync    :        GTX_RST_1 <= 0;
      endcase
      case (nextstate_2)
        Clk_Run     : begin
                             GTX_RST_2 <= 0;
                             TRG_RST_2 <= 0;
        end
        W4TxSync    :        GTX_RST_2 <= 0;
      endcase
      case (nextstate_3)
        Clk_Run     : begin
                             GTX_RST_3 <= 0;
                             TRG_RST_3 <= 0;
        end
        W4TxSync    :        GTX_RST_3 <= 0;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [95:0] statename;
  always @* begin
    case (state_1)
      GTX_Idle    : statename = "GTX_Idle";
      Clk_Phs_Chng: statename = "Clk_Phs_Chng";
      Clk_Run     : statename = "Clk_Run";
      W4TxSync    : statename = "W4TxSync";
      default     : statename = "XXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

