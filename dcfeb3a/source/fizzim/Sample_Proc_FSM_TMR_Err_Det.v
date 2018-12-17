
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:15:48 (www.fizzim.com)

module Sample_Proc_FSM_TMR_Err_Det (
  output CE,
  output CLR_CRC,
  output LAST_WRD,
  output LD_L1A_H,
  output LD_L1A_L,
  output RD,
  output wire [6:0] SEQ,
  output VALID,
  output wire [3:0] SMP_STATE,
  output wire [15:0] TMR_ERR_COUNT,
  input CLK,
  input FAMT,
  input L1A_BUF_MT,
  input L1A_HEAD,
  input RST,
  input wire [6:0] SAMP_MAX,
  input TXACK 
);

  // state bits
  parameter 
  Idle        = 4'b0000, 
  Inc_Samp    = 4'b0001, 
  Last_Word   = 4'b0010, 
  Ld_L1A_High = 4'b0011, 
  Ld_L1A_Low  = 4'b0100, 
  Read        = 4'b0101, 
  St_Data     = 4'b0110, 
  Strt_Seq    = 4'b0111, 
  Tail        = 4'b1000, 
  W4Data      = 4'b1001, 
  W4TXACK     = 4'b1010; 

  (* syn_preserve = "true" *) reg [3:0] state_1;
  (* syn_preserve = "true" *) reg [3:0] state_2;
  (* syn_preserve = "true" *) reg [3:0] state_3;

  (* syn_keep = "true" *) wire [3:0] voted_state_1;
  (* syn_keep = "true" *) wire [3:0] voted_state_2;
  (* syn_keep = "true" *) wire [3:0] voted_state_3;

  (* syn_keep = "true" *) wire err_det_state_1;
  (* syn_keep = "true" *) wire err_det_state_2;
  (* syn_keep = "true" *) wire err_det_state_3;

  (* syn_preserve = "true" *) reg [15:0] ed_cnt_1;
  (* syn_preserve = "true" *) reg [15:0] ed_cnt_2;
  (* syn_preserve = "true" *) reg [15:0] ed_cnt_3;

  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_1;
  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_2;
  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_3;

  assign voted_state_1    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_2    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_3    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic

  assign err_det_state_1    = |(~((~state_1    & ~state_2    & ~state_3   ) | (state_1    & state_2    & state_3   ))); // error detection logic
  assign err_det_state_2    = |(~((~state_1    & ~state_2    & ~state_3   ) | (state_1    & state_2    & state_3   ))); // error detection logic
  assign err_det_state_3    = |(~((~state_1    & ~state_2    & ~state_3   ) | (state_1    & state_2    & state_3   ))); // error detection logic

  assign voted_ed_cnt_1   = (ed_cnt_1   & ed_cnt_2  ) | (ed_cnt_2   & ed_cnt_3  ) | (ed_cnt_1   & ed_cnt_3  ); // Majority logic
  assign voted_ed_cnt_2   = (ed_cnt_1   & ed_cnt_2  ) | (ed_cnt_2   & ed_cnt_3  ) | (ed_cnt_1   & ed_cnt_3  ); // Majority logic
  assign voted_ed_cnt_3   = (ed_cnt_1   & ed_cnt_2  ) | (ed_cnt_2   & ed_cnt_3  ) | (ed_cnt_1   & ed_cnt_3  ); // Majority logic

  assign SMP_STATE = voted_state_1;
  assign TMR_ERR_COUNT = voted_ed_cnt_1;

  (* syn_keep = "true" *) reg [3:0] nextstate_1;
  (* syn_keep = "true" *) reg [3:0] nextstate_2;
  (* syn_keep = "true" *) reg [3:0] nextstate_3;

  (* syn_preserve = "true" *)  reg CE_1;
  (* syn_preserve = "true" *)  reg CE_2;
  (* syn_preserve = "true" *)  reg CE_3;
  (* syn_preserve = "true" *)  reg CLR_CRC_1;
  (* syn_preserve = "true" *)  reg CLR_CRC_2;
  (* syn_preserve = "true" *)  reg CLR_CRC_3;
  (* syn_preserve = "true" *)  reg LAST_WRD_1;
  (* syn_preserve = "true" *)  reg LAST_WRD_2;
  (* syn_preserve = "true" *)  reg LAST_WRD_3;
  (* syn_preserve = "true" *)  reg LD_L1A_H_1;
  (* syn_preserve = "true" *)  reg LD_L1A_H_2;
  (* syn_preserve = "true" *)  reg LD_L1A_H_3;
  (* syn_preserve = "true" *)  reg LD_L1A_L_1;
  (* syn_preserve = "true" *)  reg LD_L1A_L_2;
  (* syn_preserve = "true" *)  reg LD_L1A_L_3;
  (* syn_preserve = "true" *)  reg RD_1;
  (* syn_preserve = "true" *)  reg RD_2;
  (* syn_preserve = "true" *)  reg RD_3;
  (* syn_preserve = "true" *)  reg [6:0] SEQ_1;
  (* syn_preserve = "true" *)  reg [6:0] SEQ_2;
  (* syn_preserve = "true" *)  reg [6:0] SEQ_3;
  (* syn_preserve = "true" *)  reg VALID_1;
  (* syn_preserve = "true" *)  reg VALID_2;
  (* syn_preserve = "true" *)  reg VALID_3;
  (* syn_preserve = "true" *)  reg [6:0] seqn_1;
  (* syn_preserve = "true" *)  reg [6:0] seqn_2;
  (* syn_preserve = "true" *)  reg [6:0] seqn_3;
  (* syn_keep = "true" *)      wire [6:0] voted_seqn_1;
  (* syn_keep = "true" *)      wire [6:0] voted_seqn_2;
  (* syn_keep = "true" *)      wire [6:0] voted_seqn_3;
  (* syn_preserve = "true" *)  reg [6:0] smp_1;
  (* syn_preserve = "true" *)  reg [6:0] smp_2;
  (* syn_preserve = "true" *)  reg [6:0] smp_3;
  (* syn_keep = "true" *)      wire [6:0] voted_smp_1;
  (* syn_keep = "true" *)      wire [6:0] voted_smp_2;
  (* syn_keep = "true" *)      wire [6:0] voted_smp_3;
  (* syn_keep = "true" *)  wire err_det_CE_1;
  (* syn_keep = "true" *)  wire err_det_CE_2;
  (* syn_keep = "true" *)  wire err_det_CE_3;
  (* syn_keep = "true" *)  wire err_det_CLR_CRC_1;
  (* syn_keep = "true" *)  wire err_det_CLR_CRC_2;
  (* syn_keep = "true" *)  wire err_det_CLR_CRC_3;
  (* syn_keep = "true" *)  wire err_det_LAST_WRD_1;
  (* syn_keep = "true" *)  wire err_det_LAST_WRD_2;
  (* syn_keep = "true" *)  wire err_det_LAST_WRD_3;
  (* syn_keep = "true" *)  wire err_det_LD_L1A_H_1;
  (* syn_keep = "true" *)  wire err_det_LD_L1A_H_2;
  (* syn_keep = "true" *)  wire err_det_LD_L1A_H_3;
  (* syn_keep = "true" *)  wire err_det_LD_L1A_L_1;
  (* syn_keep = "true" *)  wire err_det_LD_L1A_L_2;
  (* syn_keep = "true" *)  wire err_det_LD_L1A_L_3;
  (* syn_keep = "true" *)  wire err_det_RD_1;
  (* syn_keep = "true" *)  wire err_det_RD_2;
  (* syn_keep = "true" *)  wire err_det_RD_3;
  (* syn_keep = "true" *)  wire err_det_SEQ_1;
  (* syn_keep = "true" *)  wire err_det_SEQ_2;
  (* syn_keep = "true" *)  wire err_det_SEQ_3;
  (* syn_keep = "true" *)  wire err_det_VALID_1;
  (* syn_keep = "true" *)  wire err_det_VALID_2;
  (* syn_keep = "true" *)  wire err_det_VALID_3;
  (* syn_keep = "true" *)  wire err_det_seqn_1;
  (* syn_keep = "true" *)  wire err_det_seqn_2;
  (* syn_keep = "true" *)  wire err_det_seqn_3;
  (* syn_keep = "true" *)  wire err_det_smp_1;
  (* syn_keep = "true" *)  wire err_det_smp_2;
  (* syn_keep = "true" *)  wire err_det_smp_3;
  (* syn_keep = "true" *)  wire err_det_1;
  (* syn_keep = "true" *)  wire err_det_2;
  (* syn_keep = "true" *)  wire err_det_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign CE       = (CE_1       & CE_2      ) | (CE_2       & CE_3      ) | (CE_1       & CE_3      ); // Majority logic
  assign CLR_CRC  = (CLR_CRC_1  & CLR_CRC_2 ) | (CLR_CRC_2  & CLR_CRC_3 ) | (CLR_CRC_1  & CLR_CRC_3 ); // Majority logic
  assign LAST_WRD = (LAST_WRD_1 & LAST_WRD_2) | (LAST_WRD_2 & LAST_WRD_3) | (LAST_WRD_1 & LAST_WRD_3); // Majority logic
  assign LD_L1A_H = (LD_L1A_H_1 & LD_L1A_H_2) | (LD_L1A_H_2 & LD_L1A_H_3) | (LD_L1A_H_1 & LD_L1A_H_3); // Majority logic
  assign LD_L1A_L = (LD_L1A_L_1 & LD_L1A_L_2) | (LD_L1A_L_2 & LD_L1A_L_3) | (LD_L1A_L_1 & LD_L1A_L_3); // Majority logic
  assign RD       = (RD_1       & RD_2      ) | (RD_2       & RD_3      ) | (RD_1       & RD_3      ); // Majority logic
  assign SEQ      = (SEQ_1      & SEQ_2     ) | (SEQ_2      & SEQ_3     ) | (SEQ_1      & SEQ_3     ); // Majority logic
  assign VALID    = (VALID_1    & VALID_2   ) | (VALID_2    & VALID_3   ) | (VALID_1    & VALID_3   ); // Majority logic
  assign voted_seqn_1     = (seqn_1     & seqn_2    ) | (seqn_2     & seqn_3    ) | (seqn_1     & seqn_3    ); // Majority logic
  assign voted_seqn_2     = (seqn_1     & seqn_2    ) | (seqn_2     & seqn_3    ) | (seqn_1     & seqn_3    ); // Majority logic
  assign voted_seqn_3     = (seqn_1     & seqn_2    ) | (seqn_2     & seqn_3    ) | (seqn_1     & seqn_3    ); // Majority logic
  assign voted_smp_1      = (smp_1      & smp_2     ) | (smp_2      & smp_3     ) | (smp_1      & smp_3     ); // Majority logic
  assign voted_smp_2      = (smp_1      & smp_2     ) | (smp_2      & smp_3     ) | (smp_1      & smp_3     ); // Majority logic
  assign voted_smp_3      = (smp_1      & smp_2     ) | (smp_2      & smp_3     ) | (smp_1      & smp_3     ); // Majority logic

  // Assignment of error detection logic to replicated signals
  assign err_det_CE_1       =  (~((~CE_1       & ~CE_2       & ~CE_3      ) | (CE_1       & CE_2       & CE_3      ))); // error detection logic
  assign err_det_CE_2       =  (~((~CE_1       & ~CE_2       & ~CE_3      ) | (CE_1       & CE_2       & CE_3      ))); // error detection logic
  assign err_det_CE_3       =  (~((~CE_1       & ~CE_2       & ~CE_3      ) | (CE_1       & CE_2       & CE_3      ))); // error detection logic
  assign err_det_CLR_CRC_1  =  (~((~CLR_CRC_1  & ~CLR_CRC_2  & ~CLR_CRC_3 ) | (CLR_CRC_1  & CLR_CRC_2  & CLR_CRC_3 ))); // error detection logic
  assign err_det_CLR_CRC_2  =  (~((~CLR_CRC_1  & ~CLR_CRC_2  & ~CLR_CRC_3 ) | (CLR_CRC_1  & CLR_CRC_2  & CLR_CRC_3 ))); // error detection logic
  assign err_det_CLR_CRC_3  =  (~((~CLR_CRC_1  & ~CLR_CRC_2  & ~CLR_CRC_3 ) | (CLR_CRC_1  & CLR_CRC_2  & CLR_CRC_3 ))); // error detection logic
  assign err_det_LAST_WRD_1 =  (~((~LAST_WRD_1 & ~LAST_WRD_2 & ~LAST_WRD_3) | (LAST_WRD_1 & LAST_WRD_2 & LAST_WRD_3))); // error detection logic
  assign err_det_LAST_WRD_2 =  (~((~LAST_WRD_1 & ~LAST_WRD_2 & ~LAST_WRD_3) | (LAST_WRD_1 & LAST_WRD_2 & LAST_WRD_3))); // error detection logic
  assign err_det_LAST_WRD_3 =  (~((~LAST_WRD_1 & ~LAST_WRD_2 & ~LAST_WRD_3) | (LAST_WRD_1 & LAST_WRD_2 & LAST_WRD_3))); // error detection logic
  assign err_det_LD_L1A_H_1 =  (~((~LD_L1A_H_1 & ~LD_L1A_H_2 & ~LD_L1A_H_3) | (LD_L1A_H_1 & LD_L1A_H_2 & LD_L1A_H_3))); // error detection logic
  assign err_det_LD_L1A_H_2 =  (~((~LD_L1A_H_1 & ~LD_L1A_H_2 & ~LD_L1A_H_3) | (LD_L1A_H_1 & LD_L1A_H_2 & LD_L1A_H_3))); // error detection logic
  assign err_det_LD_L1A_H_3 =  (~((~LD_L1A_H_1 & ~LD_L1A_H_2 & ~LD_L1A_H_3) | (LD_L1A_H_1 & LD_L1A_H_2 & LD_L1A_H_3))); // error detection logic
  assign err_det_LD_L1A_L_1 =  (~((~LD_L1A_L_1 & ~LD_L1A_L_2 & ~LD_L1A_L_3) | (LD_L1A_L_1 & LD_L1A_L_2 & LD_L1A_L_3))); // error detection logic
  assign err_det_LD_L1A_L_2 =  (~((~LD_L1A_L_1 & ~LD_L1A_L_2 & ~LD_L1A_L_3) | (LD_L1A_L_1 & LD_L1A_L_2 & LD_L1A_L_3))); // error detection logic
  assign err_det_LD_L1A_L_3 =  (~((~LD_L1A_L_1 & ~LD_L1A_L_2 & ~LD_L1A_L_3) | (LD_L1A_L_1 & LD_L1A_L_2 & LD_L1A_L_3))); // error detection logic
  assign err_det_RD_1       =  (~((~RD_1       & ~RD_2       & ~RD_3      ) | (RD_1       & RD_2       & RD_3      ))); // error detection logic
  assign err_det_RD_2       =  (~((~RD_1       & ~RD_2       & ~RD_3      ) | (RD_1       & RD_2       & RD_3      ))); // error detection logic
  assign err_det_RD_3       =  (~((~RD_1       & ~RD_2       & ~RD_3      ) | (RD_1       & RD_2       & RD_3      ))); // error detection logic
  assign err_det_SEQ_1      = |(~((~SEQ_1      & ~SEQ_2      & ~SEQ_3     ) | (SEQ_1      & SEQ_2      & SEQ_3     ))); // error detection logic
  assign err_det_SEQ_2      = |(~((~SEQ_1      & ~SEQ_2      & ~SEQ_3     ) | (SEQ_1      & SEQ_2      & SEQ_3     ))); // error detection logic
  assign err_det_SEQ_3      = |(~((~SEQ_1      & ~SEQ_2      & ~SEQ_3     ) | (SEQ_1      & SEQ_2      & SEQ_3     ))); // error detection logic
  assign err_det_VALID_1    =  (~((~VALID_1    & ~VALID_2    & ~VALID_3   ) | (VALID_1    & VALID_2    & VALID_3   ))); // error detection logic
  assign err_det_VALID_2    =  (~((~VALID_1    & ~VALID_2    & ~VALID_3   ) | (VALID_1    & VALID_2    & VALID_3   ))); // error detection logic
  assign err_det_VALID_3    =  (~((~VALID_1    & ~VALID_2    & ~VALID_3   ) | (VALID_1    & VALID_2    & VALID_3   ))); // error detection logic
  assign err_det_seqn_1     = |(~((~seqn_1     & ~seqn_2     & ~seqn_3    ) | (seqn_1     & seqn_2     & seqn_3    ))); // error detection logic
  assign err_det_seqn_2     = |(~((~seqn_1     & ~seqn_2     & ~seqn_3    ) | (seqn_1     & seqn_2     & seqn_3    ))); // error detection logic
  assign err_det_seqn_3     = |(~((~seqn_1     & ~seqn_2     & ~seqn_3    ) | (seqn_1     & seqn_2     & seqn_3    ))); // error detection logic
  assign err_det_smp_1      = |(~((~smp_1      & ~smp_2      & ~smp_3     ) | (smp_1      & smp_2      & smp_3     ))); // error detection logic
  assign err_det_smp_2      = |(~((~smp_1      & ~smp_2      & ~smp_3     ) | (smp_1      & smp_2      & smp_3     ))); // error detection logic
  assign err_det_smp_3      = |(~((~smp_1      & ~smp_2      & ~smp_3     ) | (smp_1      & smp_2      & smp_3     ))); // error detection logic


  // Assign 'OR' of all error detection signals
  assign err_det_1 = err_det_state_1   | err_det_CE_1   | err_det_CLR_CRC_1   | err_det_LAST_WRD_1   | err_det_LD_L1A_H_1   | err_det_LD_L1A_L_1   | err_det_RD_1   | err_det_SEQ_1   | err_det_VALID_1   | err_det_seqn_1   | err_det_smp_1  ;
  assign err_det_2 = err_det_state_2   | err_det_CE_2   | err_det_CLR_CRC_2   | err_det_LAST_WRD_2   | err_det_LD_L1A_H_2   | err_det_LD_L1A_L_2   | err_det_RD_2   | err_det_SEQ_2   | err_det_VALID_2   | err_det_seqn_2   | err_det_smp_2  ;
  assign err_det_3 = err_det_state_3   | err_det_CE_3   | err_det_CLR_CRC_3   | err_det_LAST_WRD_3   | err_det_LD_L1A_H_3   | err_det_LD_L1A_L_3   | err_det_RD_3   | err_det_SEQ_3   | err_det_VALID_3   | err_det_seqn_3   | err_det_smp_3  ;

  // comb always block
  always @* begin
    nextstate_1 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_2 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_3 = 4'bxxxx; // default to x because default_state_is_x is set
    SEQ_1 = voted_seqn_1; // default
    SEQ_2 = voted_seqn_2; // default
    SEQ_3 = voted_seqn_3; // default
    case (voted_state_1)
      Idle       : if      (!L1A_BUF_MT)                          nextstate_1 = W4Data;
                   else                                           nextstate_1 = Idle;
      Inc_Samp   : if      (voted_smp_1 == SAMP_MAX)              nextstate_1 = Last_Word;
                   else                                           nextstate_1 = Strt_Seq;
      Last_Word  :                                                nextstate_1 = Idle;
      Ld_L1A_High:                                                nextstate_1 = Ld_L1A_Low;
      Ld_L1A_Low :                                                nextstate_1 = St_Data;
      Read       : if      (voted_seqn_1 == 7'd95)                nextstate_1 = Tail;
                   else                                           nextstate_1 = Read;
      St_Data    : if      (L1A_HEAD)                             nextstate_1 = W4TXACK;
                   else if (!L1A_HEAD && (voted_seqn_1 == 7'd2))  nextstate_1 = W4TXACK;
                   else                                           nextstate_1 = St_Data;
      Strt_Seq   :                                                nextstate_1 = Read;
      Tail       : if      (voted_seqn_1 == 7'd98)                nextstate_1 = Inc_Samp;
                   else                                           nextstate_1 = Tail;
      W4Data     : if      (!FAMT && L1A_HEAD)                    nextstate_1 = Ld_L1A_High;
                   else if (!FAMT && !L1A_HEAD)                   nextstate_1 = St_Data;
                   else                                           nextstate_1 = W4Data;
      W4TXACK    : if      (TXACK)                                nextstate_1 = Read;
                   else                                           nextstate_1 = W4TXACK;
    endcase
    case (voted_state_2)
      Idle       : if      (!L1A_BUF_MT)                          nextstate_2 = W4Data;
                   else                                           nextstate_2 = Idle;
      Inc_Samp   : if      (voted_smp_2 == SAMP_MAX)              nextstate_2 = Last_Word;
                   else                                           nextstate_2 = Strt_Seq;
      Last_Word  :                                                nextstate_2 = Idle;
      Ld_L1A_High:                                                nextstate_2 = Ld_L1A_Low;
      Ld_L1A_Low :                                                nextstate_2 = St_Data;
      Read       : if      (voted_seqn_2 == 7'd95)                nextstate_2 = Tail;
                   else                                           nextstate_2 = Read;
      St_Data    : if      (L1A_HEAD)                             nextstate_2 = W4TXACK;
                   else if (!L1A_HEAD && (voted_seqn_2 == 7'd2))  nextstate_2 = W4TXACK;
                   else                                           nextstate_2 = St_Data;
      Strt_Seq   :                                                nextstate_2 = Read;
      Tail       : if      (voted_seqn_2 == 7'd98)                nextstate_2 = Inc_Samp;
                   else                                           nextstate_2 = Tail;
      W4Data     : if      (!FAMT && L1A_HEAD)                    nextstate_2 = Ld_L1A_High;
                   else if (!FAMT && !L1A_HEAD)                   nextstate_2 = St_Data;
                   else                                           nextstate_2 = W4Data;
      W4TXACK    : if      (TXACK)                                nextstate_2 = Read;
                   else                                           nextstate_2 = W4TXACK;
    endcase
    case (voted_state_3)
      Idle       : if      (!L1A_BUF_MT)                          nextstate_3 = W4Data;
                   else                                           nextstate_3 = Idle;
      Inc_Samp   : if      (voted_smp_3 == SAMP_MAX)              nextstate_3 = Last_Word;
                   else                                           nextstate_3 = Strt_Seq;
      Last_Word  :                                                nextstate_3 = Idle;
      Ld_L1A_High:                                                nextstate_3 = Ld_L1A_Low;
      Ld_L1A_Low :                                                nextstate_3 = St_Data;
      Read       : if      (voted_seqn_3 == 7'd95)                nextstate_3 = Tail;
                   else                                           nextstate_3 = Read;
      St_Data    : if      (L1A_HEAD)                             nextstate_3 = W4TXACK;
                   else if (!L1A_HEAD && (voted_seqn_3 == 7'd2))  nextstate_3 = W4TXACK;
                   else                                           nextstate_3 = St_Data;
      Strt_Seq   :                                                nextstate_3 = Read;
      Tail       : if      (voted_seqn_3 == 7'd98)                nextstate_3 = Inc_Samp;
                   else                                           nextstate_3 = Tail;
      W4Data     : if      (!FAMT && L1A_HEAD)                    nextstate_3 = Ld_L1A_High;
                   else if (!FAMT && !L1A_HEAD)                   nextstate_3 = St_Data;
                   else                                           nextstate_3 = W4Data;
      W4TXACK    : if      (TXACK)                                nextstate_3 = Read;
                   else                                           nextstate_3 = W4TXACK;
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
      CE_1 <= 1;
      CE_2 <= 1;
      CE_3 <= 1;
      CLR_CRC_1 <= 0;
      CLR_CRC_2 <= 0;
      CLR_CRC_3 <= 0;
      LAST_WRD_1 <= 0;
      LAST_WRD_2 <= 0;
      LAST_WRD_3 <= 0;
      LD_L1A_H_1 <= 0;
      LD_L1A_H_2 <= 0;
      LD_L1A_H_3 <= 0;
      LD_L1A_L_1 <= 0;
      LD_L1A_L_2 <= 0;
      LD_L1A_L_3 <= 0;
      RD_1 <= 0;
      RD_2 <= 0;
      RD_3 <= 0;
      VALID_1 <= 0;
      VALID_2 <= 0;
      VALID_3 <= 0;
      seqn_1 <= 7'h7F;
      seqn_2 <= 7'h7F;
      seqn_3 <= 7'h7F;
      smp_1 <= 7'h00;
      smp_2 <= 7'h00;
      smp_3 <= 7'h00;
    end
    else begin
      CE_1 <= 1; // default
      CE_2 <= 1; // default
      CE_3 <= 1; // default
      CLR_CRC_1 <= 0; // default
      CLR_CRC_2 <= 0; // default
      CLR_CRC_3 <= 0; // default
      LAST_WRD_1 <= 0; // default
      LAST_WRD_2 <= 0; // default
      LAST_WRD_3 <= 0; // default
      LD_L1A_H_1 <= 0; // default
      LD_L1A_H_2 <= 0; // default
      LD_L1A_H_3 <= 0; // default
      LD_L1A_L_1 <= 0; // default
      LD_L1A_L_2 <= 0; // default
      LD_L1A_L_3 <= 0; // default
      RD_1 <= 0; // default
      RD_2 <= 0; // default
      RD_3 <= 0; // default
      VALID_1 <= 0; // default
      VALID_2 <= 0; // default
      VALID_3 <= 0; // default
      seqn_1 <= 7'h7F; // default
      seqn_2 <= 7'h7F; // default
      seqn_3 <= 7'h7F; // default
      smp_1 <= voted_smp_1; // default
      smp_2 <= voted_smp_2; // default
      smp_3 <= voted_smp_3; // default
      case (nextstate_1)
        Idle       :        smp_1 <= 7'h00;
        Inc_Samp   : begin
                            CLR_CRC_1 <= 1;
                            VALID_1 <= 1;
                            seqn_1 <= voted_seqn_1 + 1;
        end
        Last_Word  :        LAST_WRD_1 <= 1;
        Ld_L1A_High: begin
                            CLR_CRC_1 <= 1;
                            LD_L1A_H_1 <= 1;
        end
        Ld_L1A_Low : begin
                            CLR_CRC_1 <= 1;
                            LD_L1A_L_1 <= 1;
        end
        Read       : begin
                            RD_1 <= 1;
                            VALID_1 <= 1;
                            seqn_1 <= voted_seqn_1 + 1;
        end
        St_Data    : begin
                            RD_1 <= 1;
                            VALID_1 <= 1;
                            seqn_1 <= voted_seqn_1 + 1;
        end
        Strt_Seq   : begin
                            RD_1 <= 1;
                            VALID_1 <= 1;
                            seqn_1 <= 7'h00;
                            smp_1 <= voted_smp_1 + 1;
        end
        Tail       : begin
                            VALID_1 <= 1;
                            seqn_1 <= voted_seqn_1 + 1;
        end
        W4Data     :        CLR_CRC_1 <= 1;
        W4TXACK    : begin
                            CE_1 <= 0;
                            VALID_1 <= 1;
                            seqn_1 <= voted_seqn_1;
        end
      endcase
      case (nextstate_2)
        Idle       :        smp_2 <= 7'h00;
        Inc_Samp   : begin
                            CLR_CRC_2 <= 1;
                            VALID_2 <= 1;
                            seqn_2 <= voted_seqn_2 + 1;
        end
        Last_Word  :        LAST_WRD_2 <= 1;
        Ld_L1A_High: begin
                            CLR_CRC_2 <= 1;
                            LD_L1A_H_2 <= 1;
        end
        Ld_L1A_Low : begin
                            CLR_CRC_2 <= 1;
                            LD_L1A_L_2 <= 1;
        end
        Read       : begin
                            RD_2 <= 1;
                            VALID_2 <= 1;
                            seqn_2 <= voted_seqn_2 + 1;
        end
        St_Data    : begin
                            RD_2 <= 1;
                            VALID_2 <= 1;
                            seqn_2 <= voted_seqn_2 + 1;
        end
        Strt_Seq   : begin
                            RD_2 <= 1;
                            VALID_2 <= 1;
                            seqn_2 <= 7'h00;
                            smp_2 <= voted_smp_2 + 1;
        end
        Tail       : begin
                            VALID_2 <= 1;
                            seqn_2 <= voted_seqn_2 + 1;
        end
        W4Data     :        CLR_CRC_2 <= 1;
        W4TXACK    : begin
                            CE_2 <= 0;
                            VALID_2 <= 1;
                            seqn_2 <= voted_seqn_2;
        end
      endcase
      case (nextstate_3)
        Idle       :        smp_3 <= 7'h00;
        Inc_Samp   : begin
                            CLR_CRC_3 <= 1;
                            VALID_3 <= 1;
                            seqn_3 <= voted_seqn_3 + 1;
        end
        Last_Word  :        LAST_WRD_3 <= 1;
        Ld_L1A_High: begin
                            CLR_CRC_3 <= 1;
                            LD_L1A_H_3 <= 1;
        end
        Ld_L1A_Low : begin
                            CLR_CRC_3 <= 1;
                            LD_L1A_L_3 <= 1;
        end
        Read       : begin
                            RD_3 <= 1;
                            VALID_3 <= 1;
                            seqn_3 <= voted_seqn_3 + 1;
        end
        St_Data    : begin
                            RD_3 <= 1;
                            VALID_3 <= 1;
                            seqn_3 <= voted_seqn_3 + 1;
        end
        Strt_Seq   : begin
                            RD_3 <= 1;
                            VALID_3 <= 1;
                            seqn_3 <= 7'h00;
                            smp_3 <= voted_smp_3 + 1;
        end
        Tail       : begin
                            VALID_3 <= 1;
                            seqn_3 <= voted_seqn_3 + 1;
        end
        W4Data     :        CLR_CRC_3 <= 1;
        W4TXACK    : begin
                            CE_3 <= 0;
                            VALID_3 <= 1;
                            seqn_3 <= voted_seqn_3;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [87:0] statename;
  always @* begin
    case (state_1)
      Idle       : statename = "Idle";
      Inc_Samp   : statename = "Inc_Samp";
      Last_Word  : statename = "Last_Word";
      Ld_L1A_High: statename = "Ld_L1A_High";
      Ld_L1A_Low : statename = "Ld_L1A_Low";
      Read       : statename = "Read";
      St_Data    : statename = "St_Data";
      Strt_Seq   : statename = "Strt_Seq";
      Tail       : statename = "Tail";
      W4Data     : statename = "W4Data";
      W4TXACK    : statename = "W4TXACK";
      default    : statename = "XXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

