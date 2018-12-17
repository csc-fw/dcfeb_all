
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 13:15:41 (www.fizzim.com)

module transfer_samples_FSM_TMR_Err_Det (
  output wire [3:0] CHAN,
  output L1A_RD_EN,
  output RDENA,
  output wire [2:0] XSTATE,
  output wire [15:0] TMR_ERR_COUNT,
  input CLK,
  input JTAG_MODE,
  input RDY,
  input RST 
);

  // state bits
  parameter 
  Idle           = 3'b000, 
  Inc_Chan_state = 3'b001, 
  L1A_Rd_two     = 3'b010, 
  Rd_Ena         = 3'b011, 
  Strt_Trns      = 3'b100, 
  Wait           = 3'b101; 

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

  assign voted_state_1     = (state_1     & state_2    ) | (state_2     & state_3    ) | (state_1     & state_3    ); // Majority logic
  assign voted_state_2     = (state_1     & state_2    ) | (state_2     & state_3    ) | (state_1     & state_3    ); // Majority logic
  assign voted_state_3     = (state_1     & state_2    ) | (state_2     & state_3    ) | (state_1     & state_3    ); // Majority logic

  assign err_det_state_1     = |(~((~state_1     & ~state_2     & ~state_3    ) | (state_1     & state_2     & state_3    ))); // error detection logic
  assign err_det_state_2     = |(~((~state_1     & ~state_2     & ~state_3    ) | (state_1     & state_2     & state_3    ))); // error detection logic
  assign err_det_state_3     = |(~((~state_1     & ~state_2     & ~state_3    ) | (state_1     & state_2     & state_3    ))); // error detection logic

  assign voted_ed_cnt_1    = (ed_cnt_1    & ed_cnt_2   ) | (ed_cnt_2    & ed_cnt_3   ) | (ed_cnt_1    & ed_cnt_3   ); // Majority logic
  assign voted_ed_cnt_2    = (ed_cnt_1    & ed_cnt_2   ) | (ed_cnt_2    & ed_cnt_3   ) | (ed_cnt_1    & ed_cnt_3   ); // Majority logic
  assign voted_ed_cnt_3    = (ed_cnt_1    & ed_cnt_2   ) | (ed_cnt_2    & ed_cnt_3   ) | (ed_cnt_1    & ed_cnt_3   ); // Majority logic

  assign XSTATE = voted_state_1;
  assign TMR_ERR_COUNT = voted_ed_cnt_1;

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg [3:0] CHAN_1;
  (* syn_preserve = "true" *)  reg [3:0] CHAN_2;
  (* syn_preserve = "true" *)  reg [3:0] CHAN_3;
  (* syn_preserve = "true" *)  reg L1A_RD_EN_1;
  (* syn_preserve = "true" *)  reg L1A_RD_EN_2;
  (* syn_preserve = "true" *)  reg L1A_RD_EN_3;
  (* syn_preserve = "true" *)  reg RDENA_1;
  (* syn_preserve = "true" *)  reg RDENA_2;
  (* syn_preserve = "true" *)  reg RDENA_3;
  (* syn_preserve = "true" *)  reg [2:0] chip_1;
  (* syn_preserve = "true" *)  reg [2:0] chip_2;
  (* syn_preserve = "true" *)  reg [2:0] chip_3;
  (* syn_keep = "true" *)      wire [2:0] voted_chip_1;
  (* syn_keep = "true" *)      wire [2:0] voted_chip_2;
  (* syn_keep = "true" *)      wire [2:0] voted_chip_3;
  (* syn_preserve = "true" *)  reg [2:0] cnt_1;
  (* syn_preserve = "true" *)  reg [2:0] cnt_2;
  (* syn_preserve = "true" *)  reg [2:0] cnt_3;
  (* syn_keep = "true" *)      wire [2:0] voted_cnt_1;
  (* syn_keep = "true" *)      wire [2:0] voted_cnt_2;
  (* syn_keep = "true" *)      wire [2:0] voted_cnt_3;
  (* syn_keep = "true" *)  wire err_det_CHAN_1;
  (* syn_keep = "true" *)  wire err_det_CHAN_2;
  (* syn_keep = "true" *)  wire err_det_CHAN_3;
  (* syn_keep = "true" *)  wire err_det_L1A_RD_EN_1;
  (* syn_keep = "true" *)  wire err_det_L1A_RD_EN_2;
  (* syn_keep = "true" *)  wire err_det_L1A_RD_EN_3;
  (* syn_keep = "true" *)  wire err_det_RDENA_1;
  (* syn_keep = "true" *)  wire err_det_RDENA_2;
  (* syn_keep = "true" *)  wire err_det_RDENA_3;
  (* syn_keep = "true" *)  wire err_det_chip_1;
  (* syn_keep = "true" *)  wire err_det_chip_2;
  (* syn_keep = "true" *)  wire err_det_chip_3;
  (* syn_keep = "true" *)  wire err_det_cnt_1;
  (* syn_keep = "true" *)  wire err_det_cnt_2;
  (* syn_keep = "true" *)  wire err_det_cnt_3;
  (* syn_keep = "true" *)  wire err_det_1;
  (* syn_keep = "true" *)  wire err_det_2;
  (* syn_keep = "true" *)  wire err_det_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign CHAN      = (CHAN_1      & CHAN_2     ) | (CHAN_2      & CHAN_3     ) | (CHAN_1      & CHAN_3     ); // Majority logic
  assign L1A_RD_EN = (L1A_RD_EN_1 & L1A_RD_EN_2) | (L1A_RD_EN_2 & L1A_RD_EN_3) | (L1A_RD_EN_1 & L1A_RD_EN_3); // Majority logic
  assign RDENA     = (RDENA_1     & RDENA_2    ) | (RDENA_2     & RDENA_3    ) | (RDENA_1     & RDENA_3    ); // Majority logic
  assign voted_chip_1      = (chip_1      & chip_2     ) | (chip_2      & chip_3     ) | (chip_1      & chip_3     ); // Majority logic
  assign voted_chip_2      = (chip_1      & chip_2     ) | (chip_2      & chip_3     ) | (chip_1      & chip_3     ); // Majority logic
  assign voted_chip_3      = (chip_1      & chip_2     ) | (chip_2      & chip_3     ) | (chip_1      & chip_3     ); // Majority logic
  assign voted_cnt_1       = (cnt_1       & cnt_2      ) | (cnt_2       & cnt_3      ) | (cnt_1       & cnt_3      ); // Majority logic
  assign voted_cnt_2       = (cnt_1       & cnt_2      ) | (cnt_2       & cnt_3      ) | (cnt_1       & cnt_3      ); // Majority logic
  assign voted_cnt_3       = (cnt_1       & cnt_2      ) | (cnt_2       & cnt_3      ) | (cnt_1       & cnt_3      ); // Majority logic

  // Assignment of error detection logic to replicated signals
  assign err_det_CHAN_1      = |(~((~CHAN_1      & ~CHAN_2      & ~CHAN_3     ) | (CHAN_1      & CHAN_2      & CHAN_3     ))); // error detection logic
  assign err_det_CHAN_2      = |(~((~CHAN_1      & ~CHAN_2      & ~CHAN_3     ) | (CHAN_1      & CHAN_2      & CHAN_3     ))); // error detection logic
  assign err_det_CHAN_3      = |(~((~CHAN_1      & ~CHAN_2      & ~CHAN_3     ) | (CHAN_1      & CHAN_2      & CHAN_3     ))); // error detection logic
  assign err_det_L1A_RD_EN_1 =  (~((~L1A_RD_EN_1 & ~L1A_RD_EN_2 & ~L1A_RD_EN_3) | (L1A_RD_EN_1 & L1A_RD_EN_2 & L1A_RD_EN_3))); // error detection logic
  assign err_det_L1A_RD_EN_2 =  (~((~L1A_RD_EN_1 & ~L1A_RD_EN_2 & ~L1A_RD_EN_3) | (L1A_RD_EN_1 & L1A_RD_EN_2 & L1A_RD_EN_3))); // error detection logic
  assign err_det_L1A_RD_EN_3 =  (~((~L1A_RD_EN_1 & ~L1A_RD_EN_2 & ~L1A_RD_EN_3) | (L1A_RD_EN_1 & L1A_RD_EN_2 & L1A_RD_EN_3))); // error detection logic
  assign err_det_RDENA_1     =  (~((~RDENA_1     & ~RDENA_2     & ~RDENA_3    ) | (RDENA_1     & RDENA_2     & RDENA_3    ))); // error detection logic
  assign err_det_RDENA_2     =  (~((~RDENA_1     & ~RDENA_2     & ~RDENA_3    ) | (RDENA_1     & RDENA_2     & RDENA_3    ))); // error detection logic
  assign err_det_RDENA_3     =  (~((~RDENA_1     & ~RDENA_2     & ~RDENA_3    ) | (RDENA_1     & RDENA_2     & RDENA_3    ))); // error detection logic
  assign err_det_chip_1      = |(~((~chip_1      & ~chip_2      & ~chip_3     ) | (chip_1      & chip_2      & chip_3     ))); // error detection logic
  assign err_det_chip_2      = |(~((~chip_1      & ~chip_2      & ~chip_3     ) | (chip_1      & chip_2      & chip_3     ))); // error detection logic
  assign err_det_chip_3      = |(~((~chip_1      & ~chip_2      & ~chip_3     ) | (chip_1      & chip_2      & chip_3     ))); // error detection logic
  assign err_det_cnt_1       = |(~((~cnt_1       & ~cnt_2       & ~cnt_3      ) | (cnt_1       & cnt_2       & cnt_3      ))); // error detection logic
  assign err_det_cnt_2       = |(~((~cnt_1       & ~cnt_2       & ~cnt_3      ) | (cnt_1       & cnt_2       & cnt_3      ))); // error detection logic
  assign err_det_cnt_3       = |(~((~cnt_1       & ~cnt_2       & ~cnt_3      ) | (cnt_1       & cnt_2       & cnt_3      ))); // error detection logic


  // Assign 'OR' of all error detection signals
  assign err_det_1 = err_det_state_1   | err_det_CHAN_1   | err_det_L1A_RD_EN_1   | err_det_RDENA_1   | err_det_chip_1   | err_det_cnt_1  ;
  assign err_det_2 = err_det_state_2   | err_det_CHAN_2   | err_det_L1A_RD_EN_2   | err_det_RDENA_2   | err_det_chip_2   | err_det_cnt_2  ;
  assign err_det_3 = err_det_state_3   | err_det_CHAN_3   | err_det_L1A_RD_EN_3   | err_det_RDENA_3   | err_det_chip_3   | err_det_cnt_3  ;

  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle          : if      (RDY && !JTAG_MODE)                          nextstate_1 = Wait;
                      else                                                 nextstate_1 = Idle;
      Inc_Chan_state:                                                      nextstate_1 = Rd_Ena;
      L1A_Rd_two    : if      (voted_cnt_1 ==  6)                          nextstate_1 = Strt_Trns;
                      else                                                 nextstate_1 = L1A_Rd_two;
      Rd_Ena        : if      (RDY && (voted_chip_1 == 5) && (CHAN ==15))  nextstate_1 = Wait;
                      else if ((voted_chip_1 == 5) && (CHAN == 15))        nextstate_1 = Idle;
                      else if ((voted_chip_1 == 5))                        nextstate_1 = Inc_Chan_state;
                      else                                                 nextstate_1 = Rd_Ena;
      Strt_Trns     :                                                      nextstate_1 = Rd_Ena;
      Wait          : if      (voted_cnt_1 == 4)                           nextstate_1 = L1A_Rd_two;
                      else                                                 nextstate_1 = Wait;
    endcase
    case (voted_state_2)
      Idle          : if      (RDY && !JTAG_MODE)                          nextstate_2 = Wait;
                      else                                                 nextstate_2 = Idle;
      Inc_Chan_state:                                                      nextstate_2 = Rd_Ena;
      L1A_Rd_two    : if      (voted_cnt_2 ==  6)                          nextstate_2 = Strt_Trns;
                      else                                                 nextstate_2 = L1A_Rd_two;
      Rd_Ena        : if      (RDY && (voted_chip_2 == 5) && (CHAN ==15))  nextstate_2 = Wait;
                      else if ((voted_chip_2 == 5) && (CHAN == 15))        nextstate_2 = Idle;
                      else if ((voted_chip_2 == 5))                        nextstate_2 = Inc_Chan_state;
                      else                                                 nextstate_2 = Rd_Ena;
      Strt_Trns     :                                                      nextstate_2 = Rd_Ena;
      Wait          : if      (voted_cnt_2 == 4)                           nextstate_2 = L1A_Rd_two;
                      else                                                 nextstate_2 = Wait;
    endcase
    case (voted_state_3)
      Idle          : if      (RDY && !JTAG_MODE)                          nextstate_3 = Wait;
                      else                                                 nextstate_3 = Idle;
      Inc_Chan_state:                                                      nextstate_3 = Rd_Ena;
      L1A_Rd_two    : if      (voted_cnt_3 ==  6)                          nextstate_3 = Strt_Trns;
                      else                                                 nextstate_3 = L1A_Rd_two;
      Rd_Ena        : if      (RDY && (voted_chip_3 == 5) && (CHAN ==15))  nextstate_3 = Wait;
                      else if ((voted_chip_3 == 5) && (CHAN == 15))        nextstate_3 = Idle;
                      else if ((voted_chip_3 == 5))                        nextstate_3 = Inc_Chan_state;
                      else                                                 nextstate_3 = Rd_Ena;
      Strt_Trns     :                                                      nextstate_3 = Rd_Ena;
      Wait          : if      (voted_cnt_3 == 4)                           nextstate_3 = L1A_Rd_two;
                      else                                                 nextstate_3 = Wait;
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
      CHAN_1 <= 4'h0;
      CHAN_2 <= 4'h0;
      CHAN_3 <= 4'h0;
      L1A_RD_EN_1 <= 0;
      L1A_RD_EN_2 <= 0;
      L1A_RD_EN_3 <= 0;
      RDENA_1 <= 0;
      RDENA_2 <= 0;
      RDENA_3 <= 0;
      chip_1 <= 3'h0;
      chip_2 <= 3'h0;
      chip_3 <= 3'h0;
      cnt_1 <= 3'h0;
      cnt_2 <= 3'h0;
      cnt_3 <= 3'h0;
    end
    else begin
      CHAN_1 <= 4'h0; // default
      CHAN_2 <= 4'h0; // default
      CHAN_3 <= 4'h0; // default
      L1A_RD_EN_1 <= 0; // default
      L1A_RD_EN_2 <= 0; // default
      L1A_RD_EN_3 <= 0; // default
      RDENA_1 <= 0; // default
      RDENA_2 <= 0; // default
      RDENA_3 <= 0; // default
      chip_1 <= 3'h0; // default
      chip_2 <= 3'h0; // default
      chip_3 <= 3'h0; // default
      cnt_1 <= 3'h0; // default
      cnt_2 <= 3'h0; // default
      cnt_3 <= 3'h0; // default
      case (nextstate_1)
        Inc_Chan_state: begin
                               CHAN_1 <= CHAN + 1;
                               RDENA_1 <= 1;
        end
        L1A_Rd_two    : begin
                               L1A_RD_EN_1 <= 1;
                               cnt_1 <= voted_cnt_1 + 1;
        end
        Rd_Ena        : begin
                               CHAN_1 <= CHAN;
                               RDENA_1 <= 1;
                               chip_1 <= voted_chip_1 + 1;
        end
        Strt_Trns     :        RDENA_1 <= 1;
        Wait          :        cnt_1 <= voted_cnt_1 + 1;
      endcase
      case (nextstate_2)
        Inc_Chan_state: begin
                               CHAN_2 <= CHAN + 1;
                               RDENA_2 <= 1;
        end
        L1A_Rd_two    : begin
                               L1A_RD_EN_2 <= 1;
                               cnt_2 <= voted_cnt_2 + 1;
        end
        Rd_Ena        : begin
                               CHAN_2 <= CHAN;
                               RDENA_2 <= 1;
                               chip_2 <= voted_chip_2 + 1;
        end
        Strt_Trns     :        RDENA_2 <= 1;
        Wait          :        cnt_2 <= voted_cnt_2 + 1;
      endcase
      case (nextstate_3)
        Inc_Chan_state: begin
                               CHAN_3 <= CHAN + 1;
                               RDENA_3 <= 1;
        end
        L1A_Rd_two    : begin
                               L1A_RD_EN_3 <= 1;
                               cnt_3 <= voted_cnt_3 + 1;
        end
        Rd_Ena        : begin
                               CHAN_3 <= CHAN;
                               RDENA_3 <= 1;
                               chip_3 <= voted_chip_3 + 1;
        end
        Strt_Trns     :        RDENA_3 <= 1;
        Wait          :        cnt_3 <= voted_cnt_3 + 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [111:0] statename;
  always @* begin
    case (state_1)
      Idle          : statename = "Idle";
      Inc_Chan_state: statename = "Inc_Chan_state";
      L1A_Rd_two    : statename = "L1A_Rd_two";
      Rd_Ena        : statename = "Rd_Ena";
      Strt_Trns     : statename = "Strt_Trns";
      Wait          : statename = "Wait";
      default       : statename = "XXXXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

