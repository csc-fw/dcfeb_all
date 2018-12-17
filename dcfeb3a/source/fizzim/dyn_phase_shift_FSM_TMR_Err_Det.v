
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:25 at 17:29:04 (www.fizzim.com)

module dyn_phase_shift_FSM_TMR_Err_Det (
  output BUSY,
  output PSEN,
  output wire [2:0] DYN_PHS_STATE,
  output wire [15:0] TMR_ERR_COUNT,
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

  (* syn_preserve = "true" *) reg [2:0] state_1;
  (* syn_preserve = "true" *) reg [2:0] state_2;
  (* syn_preserve = "true" *) reg [2:0] state_3;

  (* syn_keep = "true" *) wire [2:0] voted_state_1;
  (* syn_keep = "true" *) wire [2:0] voted_state_2;
  (* syn_keep = "true" *) wire [2:0] voted_state_3;

  (* syn_keep = "true" *) wire err_det_state_1;
  (* syn_keep = "true" *) wire err_det_state_2;
  (* syn_keep = "true" *) wire err_det_state_3;

  (* syn_preserve = "true" *) reg [15:0] ed_cnt_1;
  (* syn_preserve = "true" *) reg [15:0] ed_cnt_2;
  (* syn_preserve = "true" *) reg [15:0] ed_cnt_3;

  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_1;
  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_2;
  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_3;

  assign voted_state_1 = (state_1 & state_2) | (state_2 & state_3) | (state_1 & state_3); // Majority logic
  assign voted_state_2 = (state_1 & state_2) | (state_2 & state_3) | (state_1 & state_3); // Majority logic
  assign voted_state_3 = (state_1 & state_2) | (state_2 & state_3) | (state_1 & state_3); // Majority logic

  assign err_det_state_1 = |(~((~state_1 & ~state_2 & ~state_3) | (state_1 & state_2 & state_3))); // error detection logic
  assign err_det_state_2 = |(~((~state_1 & ~state_2 & ~state_3) | (state_1 & state_2 & state_3))); // error detection logic
  assign err_det_state_3 = |(~((~state_1 & ~state_2 & ~state_3) | (state_1 & state_2 & state_3))); // error detection logic

  assign voted_ed_cnt_1 = (ed_cnt_1 & ed_cnt_2) | (ed_cnt_2 & ed_cnt_3) | (ed_cnt_1 & ed_cnt_3); // Majority logic
  assign voted_ed_cnt_2 = (ed_cnt_1 & ed_cnt_2) | (ed_cnt_2 & ed_cnt_3) | (ed_cnt_1 & ed_cnt_3); // Majority logic
  assign voted_ed_cnt_3 = (ed_cnt_1 & ed_cnt_2) | (ed_cnt_2 & ed_cnt_3) | (ed_cnt_1 & ed_cnt_3); // Majority logic

  assign DYN_PHS_STATE = voted_state_1;
  assign TMR_ERR_COUNT = voted_ed_cnt_1;

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg BUSY_1;
  (* syn_preserve = "true" *)  reg BUSY_2;
  (* syn_preserve = "true" *)  reg BUSY_3;
  (* syn_preserve = "true" *)  reg PSEN_1;
  (* syn_preserve = "true" *)  reg PSEN_2;
  (* syn_preserve = "true" *)  reg PSEN_3;
  (* syn_keep = "true" *)  wire err_det_BUSY_1;
  (* syn_keep = "true" *)  wire err_det_BUSY_2;
  (* syn_keep = "true" *)  wire err_det_BUSY_3;
  (* syn_keep = "true" *)  wire err_det_PSEN_1;
  (* syn_keep = "true" *)  wire err_det_PSEN_2;
  (* syn_keep = "true" *)  wire err_det_PSEN_3;
  (* syn_keep = "true" *)  wire err_det_1;
  (* syn_keep = "true" *)  wire err_det_2;
  (* syn_keep = "true" *)  wire err_det_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign BUSY = (BUSY_1 & BUSY_2) | (BUSY_2 & BUSY_3) | (BUSY_1 & BUSY_3); // Majority logic
  assign PSEN = (PSEN_1 & PSEN_2) | (PSEN_2 & PSEN_3) | (PSEN_1 & PSEN_3); // Majority logic

  // Assignment of error detection logic to replicated signals
  assign err_det_BUSY_1 =  (~((~BUSY_1 & ~BUSY_2 & ~BUSY_3) | (BUSY_1 & BUSY_2 & BUSY_3))); // error detection logic
  assign err_det_BUSY_2 =  (~((~BUSY_1 & ~BUSY_2 & ~BUSY_3) | (BUSY_1 & BUSY_2 & BUSY_3))); // error detection logic
  assign err_det_BUSY_3 =  (~((~BUSY_1 & ~BUSY_2 & ~BUSY_3) | (BUSY_1 & BUSY_2 & BUSY_3))); // error detection logic
  assign err_det_PSEN_1 =  (~((~PSEN_1 & ~PSEN_2 & ~PSEN_3) | (PSEN_1 & PSEN_2 & PSEN_3))); // error detection logic
  assign err_det_PSEN_2 =  (~((~PSEN_1 & ~PSEN_2 & ~PSEN_3) | (PSEN_1 & PSEN_2 & PSEN_3))); // error detection logic
  assign err_det_PSEN_3 =  (~((~PSEN_1 & ~PSEN_2 & ~PSEN_3) | (PSEN_1 & PSEN_2 & PSEN_3))); // error detection logic


  // Assign 'OR' of all error detection signals
  assign err_det_1 = err_det_state_1   | err_det_BUSY_1   | err_det_PSEN_1  ;
  assign err_det_2 = err_det_state_2   | err_det_BUSY_2   | err_det_PSEN_2  ;
  assign err_det_3 = err_det_state_3   | err_det_BUSY_3   | err_det_PSEN_3  ;

  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle     :                                 nextstate_1 = W4Lock;
      Inc_Dec  :                                 nextstate_1 = W4_PSDone;
      Standby  : if      (PH_CHANGE)             nextstate_1 = Inc_Dec;
                 else                            nextstate_1 = Standby;
      W4Lock   : if      (LOCKED)                nextstate_1 = Standby;
                 else                            nextstate_1 = W4Lock;
      W4_PSDone: if      (PS_DONE && PH_CHANGE)  nextstate_1 = Inc_Dec;
                 else if (PS_DONE)               nextstate_1 = Standby;
                 else                            nextstate_1 = W4_PSDone;
    endcase
    case (voted_state_2)
      Idle     :                                 nextstate_2 = W4Lock;
      Inc_Dec  :                                 nextstate_2 = W4_PSDone;
      Standby  : if      (PH_CHANGE)             nextstate_2 = Inc_Dec;
                 else                            nextstate_2 = Standby;
      W4Lock   : if      (LOCKED)                nextstate_2 = Standby;
                 else                            nextstate_2 = W4Lock;
      W4_PSDone: if      (PS_DONE && PH_CHANGE)  nextstate_2 = Inc_Dec;
                 else if (PS_DONE)               nextstate_2 = Standby;
                 else                            nextstate_2 = W4_PSDone;
    endcase
    case (voted_state_3)
      Idle     :                                 nextstate_3 = W4Lock;
      Inc_Dec  :                                 nextstate_3 = W4_PSDone;
      Standby  : if      (PH_CHANGE)             nextstate_3 = Inc_Dec;
                 else                            nextstate_3 = Standby;
      W4Lock   : if      (LOCKED)                nextstate_3 = Standby;
                 else                            nextstate_3 = W4Lock;
      W4_PSDone: if      (PS_DONE && PH_CHANGE)  nextstate_3 = Inc_Dec;
                 else if (PS_DONE)               nextstate_3 = Standby;
                 else                            nextstate_3 = W4_PSDone;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= Idle;
      state_2 <= Idle;
      state_3 <= Idle;
      ed_cnt_1 <= 0;
      ed_cnt_2 <= 0;
      ed_cnt_3 <= 0;
    end
    else begin
      state_1 <= nextstate_1;
      state_2 <= nextstate_2;
      state_3 <= nextstate_3;
      ed_cnt_1 <= err_det_1 ? voted_ed_cnt_1 + 1 : voted_ed_cnt_1;
      ed_cnt_2 <= err_det_2 ? voted_ed_cnt_2 + 1 : voted_ed_cnt_2;
      ed_cnt_3 <= err_det_3 ? voted_ed_cnt_3 + 1 : voted_ed_cnt_3;
    end
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      BUSY_1 <= 0;
      BUSY_2 <= 0;
      BUSY_3 <= 0;
      PSEN_1 <= 0;
      PSEN_2 <= 0;
      PSEN_3 <= 0;
    end
    else begin
      BUSY_1 <= 0; // default
      BUSY_2 <= 0; // default
      BUSY_3 <= 0; // default
      PSEN_1 <= 0; // default
      PSEN_2 <= 0; // default
      PSEN_3 <= 0; // default
      case (nextstate_1)
        Inc_Dec  : begin
                          BUSY_1 <= 1;
                          PSEN_1 <= 1;
        end
        W4_PSDone:        BUSY_1 <= 1;
      endcase
      case (nextstate_2)
        Inc_Dec  : begin
                          BUSY_2 <= 1;
                          PSEN_2 <= 1;
        end
        W4_PSDone:        BUSY_2 <= 1;
      endcase
      case (nextstate_3)
        Inc_Dec  : begin
                          BUSY_3 <= 1;
                          PSEN_3 <= 1;
        end
        W4_PSDone:        BUSY_3 <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [71:0] statename;
  always @* begin
    case (state_1)
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

