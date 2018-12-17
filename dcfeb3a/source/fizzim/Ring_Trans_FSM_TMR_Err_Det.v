
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 13:28:28 (www.fizzim.com)

module Ring_Trans_FSM_TMR_Err_Det (
  output LD_ADDR,
  output NXT_L1A,
  output RD,
  output wire [2:0] EVT_STATE,
  output wire [15:0] TMR_ERR_COUNT,
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

  assign voted_state_1   = (state_1   & state_2  ) | (state_2   & state_3  ) | (state_1   & state_3  ); // Majority logic
  assign voted_state_2   = (state_1   & state_2  ) | (state_2   & state_3  ) | (state_1   & state_3  ); // Majority logic
  assign voted_state_3   = (state_1   & state_2  ) | (state_2   & state_3  ) | (state_1   & state_3  ); // Majority logic

  assign err_det_state_1   = |(~((~state_1   & ~state_2   & ~state_3  ) | (state_1   & state_2   & state_3  ))); // error detection logic
  assign err_det_state_2   = |(~((~state_1   & ~state_2   & ~state_3  ) | (state_1   & state_2   & state_3  ))); // error detection logic
  assign err_det_state_3   = |(~((~state_1   & ~state_2   & ~state_3  ) | (state_1   & state_2   & state_3  ))); // error detection logic

  assign voted_ed_cnt_1  = (ed_cnt_1  & ed_cnt_2 ) | (ed_cnt_2  & ed_cnt_3 ) | (ed_cnt_1  & ed_cnt_3 ); // Majority logic
  assign voted_ed_cnt_2  = (ed_cnt_1  & ed_cnt_2 ) | (ed_cnt_2  & ed_cnt_3 ) | (ed_cnt_1  & ed_cnt_3 ); // Majority logic
  assign voted_ed_cnt_3  = (ed_cnt_1  & ed_cnt_2 ) | (ed_cnt_2  & ed_cnt_3 ) | (ed_cnt_1  & ed_cnt_3 ); // Majority logic

  assign EVT_STATE = voted_state_1;
  assign TMR_ERR_COUNT = voted_ed_cnt_1;

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg LD_ADDR_1;
  (* syn_preserve = "true" *)  reg LD_ADDR_2;
  (* syn_preserve = "true" *)  reg LD_ADDR_3;
  (* syn_preserve = "true" *)  reg NXT_L1A_1;
  (* syn_preserve = "true" *)  reg NXT_L1A_2;
  (* syn_preserve = "true" *)  reg NXT_L1A_3;
  (* syn_preserve = "true" *)  reg RD_1;
  (* syn_preserve = "true" *)  reg RD_2;
  (* syn_preserve = "true" *)  reg RD_3;
  (* syn_preserve = "true" *)  reg [6:0] seq_1;
  (* syn_preserve = "true" *)  reg [6:0] seq_2;
  (* syn_preserve = "true" *)  reg [6:0] seq_3;
  (* syn_keep = "true" *)      wire [6:0] voted_seq_1;
  (* syn_keep = "true" *)      wire [6:0] voted_seq_2;
  (* syn_keep = "true" *)      wire [6:0] voted_seq_3;
  (* syn_preserve = "true" *)  reg [6:0] smp_1;
  (* syn_preserve = "true" *)  reg [6:0] smp_2;
  (* syn_preserve = "true" *)  reg [6:0] smp_3;
  (* syn_keep = "true" *)      wire [6:0] voted_smp_1;
  (* syn_keep = "true" *)      wire [6:0] voted_smp_2;
  (* syn_keep = "true" *)      wire [6:0] voted_smp_3;
  (* syn_keep = "true" *)  wire err_det_LD_ADDR_1;
  (* syn_keep = "true" *)  wire err_det_LD_ADDR_2;
  (* syn_keep = "true" *)  wire err_det_LD_ADDR_3;
  (* syn_keep = "true" *)  wire err_det_NXT_L1A_1;
  (* syn_keep = "true" *)  wire err_det_NXT_L1A_2;
  (* syn_keep = "true" *)  wire err_det_NXT_L1A_3;
  (* syn_keep = "true" *)  wire err_det_RD_1;
  (* syn_keep = "true" *)  wire err_det_RD_2;
  (* syn_keep = "true" *)  wire err_det_RD_3;
  (* syn_keep = "true" *)  wire err_det_seq_1;
  (* syn_keep = "true" *)  wire err_det_seq_2;
  (* syn_keep = "true" *)  wire err_det_seq_3;
  (* syn_keep = "true" *)  wire err_det_smp_1;
  (* syn_keep = "true" *)  wire err_det_smp_2;
  (* syn_keep = "true" *)  wire err_det_smp_3;
  (* syn_keep = "true" *)  wire err_det_1;
  (* syn_keep = "true" *)  wire err_det_2;
  (* syn_keep = "true" *)  wire err_det_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign LD_ADDR = (LD_ADDR_1 & LD_ADDR_2) | (LD_ADDR_2 & LD_ADDR_3) | (LD_ADDR_1 & LD_ADDR_3); // Majority logic
  assign NXT_L1A = (NXT_L1A_1 & NXT_L1A_2) | (NXT_L1A_2 & NXT_L1A_3) | (NXT_L1A_1 & NXT_L1A_3); // Majority logic
  assign RD      = (RD_1      & RD_2     ) | (RD_2      & RD_3     ) | (RD_1      & RD_3     ); // Majority logic
  assign voted_seq_1     = (seq_1     & seq_2    ) | (seq_2     & seq_3    ) | (seq_1     & seq_3    ); // Majority logic
  assign voted_seq_2     = (seq_1     & seq_2    ) | (seq_2     & seq_3    ) | (seq_1     & seq_3    ); // Majority logic
  assign voted_seq_3     = (seq_1     & seq_2    ) | (seq_2     & seq_3    ) | (seq_1     & seq_3    ); // Majority logic
  assign voted_smp_1     = (smp_1     & smp_2    ) | (smp_2     & smp_3    ) | (smp_1     & smp_3    ); // Majority logic
  assign voted_smp_2     = (smp_1     & smp_2    ) | (smp_2     & smp_3    ) | (smp_1     & smp_3    ); // Majority logic
  assign voted_smp_3     = (smp_1     & smp_2    ) | (smp_2     & smp_3    ) | (smp_1     & smp_3    ); // Majority logic

  // Assignment of error detection logic to replicated signals
  assign err_det_LD_ADDR_1 =  (~((~LD_ADDR_1 & ~LD_ADDR_2 & ~LD_ADDR_3) | (LD_ADDR_1 & LD_ADDR_2 & LD_ADDR_3))); // error detection logic
  assign err_det_LD_ADDR_2 =  (~((~LD_ADDR_1 & ~LD_ADDR_2 & ~LD_ADDR_3) | (LD_ADDR_1 & LD_ADDR_2 & LD_ADDR_3))); // error detection logic
  assign err_det_LD_ADDR_3 =  (~((~LD_ADDR_1 & ~LD_ADDR_2 & ~LD_ADDR_3) | (LD_ADDR_1 & LD_ADDR_2 & LD_ADDR_3))); // error detection logic
  assign err_det_NXT_L1A_1 =  (~((~NXT_L1A_1 & ~NXT_L1A_2 & ~NXT_L1A_3) | (NXT_L1A_1 & NXT_L1A_2 & NXT_L1A_3))); // error detection logic
  assign err_det_NXT_L1A_2 =  (~((~NXT_L1A_1 & ~NXT_L1A_2 & ~NXT_L1A_3) | (NXT_L1A_1 & NXT_L1A_2 & NXT_L1A_3))); // error detection logic
  assign err_det_NXT_L1A_3 =  (~((~NXT_L1A_1 & ~NXT_L1A_2 & ~NXT_L1A_3) | (NXT_L1A_1 & NXT_L1A_2 & NXT_L1A_3))); // error detection logic
  assign err_det_RD_1      =  (~((~RD_1      & ~RD_2      & ~RD_3     ) | (RD_1      & RD_2      & RD_3     ))); // error detection logic
  assign err_det_RD_2      =  (~((~RD_1      & ~RD_2      & ~RD_3     ) | (RD_1      & RD_2      & RD_3     ))); // error detection logic
  assign err_det_RD_3      =  (~((~RD_1      & ~RD_2      & ~RD_3     ) | (RD_1      & RD_2      & RD_3     ))); // error detection logic
  assign err_det_seq_1     = |(~((~seq_1     & ~seq_2     & ~seq_3    ) | (seq_1     & seq_2     & seq_3    ))); // error detection logic
  assign err_det_seq_2     = |(~((~seq_1     & ~seq_2     & ~seq_3    ) | (seq_1     & seq_2     & seq_3    ))); // error detection logic
  assign err_det_seq_3     = |(~((~seq_1     & ~seq_2     & ~seq_3    ) | (seq_1     & seq_2     & seq_3    ))); // error detection logic
  assign err_det_smp_1     = |(~((~smp_1     & ~smp_2     & ~smp_3    ) | (smp_1     & smp_2     & smp_3    ))); // error detection logic
  assign err_det_smp_2     = |(~((~smp_1     & ~smp_2     & ~smp_3    ) | (smp_1     & smp_2     & smp_3    ))); // error detection logic
  assign err_det_smp_3     = |(~((~smp_1     & ~smp_2     & ~smp_3    ) | (smp_1     & smp_2     & smp_3    ))); // error detection logic


  // Assign 'OR' of all error detection signals
  assign err_det_1 = err_det_state_1   | err_det_LD_ADDR_1   | err_det_NXT_L1A_1   | err_det_RD_1   | err_det_seq_1   | err_det_smp_1  ;
  assign err_det_2 = err_det_state_2   | err_det_LD_ADDR_2   | err_det_NXT_L1A_2   | err_det_RD_2   | err_det_seq_2   | err_det_smp_2  ;
  assign err_det_3 = err_det_state_3   | err_det_LD_ADDR_3   | err_det_NXT_L1A_3   | err_det_RD_3   | err_det_seq_3   | err_det_smp_3  ;

  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle      : if      (!L1A_BUF_MT)                nextstate_1 = Load_Addr;
                  else                                 nextstate_1 = Idle;
      Inc_Samp  :                                      nextstate_1 = Read;
      Last      : if      (voted_smp_1 == SAMP_MAX)    nextstate_1 = Next_L1a;
                  else if (EVT_BUF_AFL)                nextstate_1 = W4_EVT_AMT;
                  else if (RING_AMT)                   nextstate_1 = W4Data;
                  else                                 nextstate_1 = Inc_Samp;
      Load_Addr :                                      nextstate_1 = W4Data;
      Next_L1a  :                                      nextstate_1 = Idle;
      Read      : if      (voted_seq_1 == 7'd94)       nextstate_1 = Last;
                  else                                 nextstate_1 = Read;
      W4Data    : if      (!RING_AMT && EVT_BUF_AFL)   nextstate_1 = W4_EVT_AMT;
                  else if (!RING_AMT && !EVT_BUF_AFL)  nextstate_1 = Inc_Samp;
                  else                                 nextstate_1 = W4Data;
      W4_EVT_AMT: if      (EVT_BUF_AMT)                nextstate_1 = Inc_Samp;
                  else                                 nextstate_1 = W4_EVT_AMT;
    endcase
    case (voted_state_2)
      Idle      : if      (!L1A_BUF_MT)                nextstate_2 = Load_Addr;
                  else                                 nextstate_2 = Idle;
      Inc_Samp  :                                      nextstate_2 = Read;
      Last      : if      (voted_smp_2 == SAMP_MAX)    nextstate_2 = Next_L1a;
                  else if (EVT_BUF_AFL)                nextstate_2 = W4_EVT_AMT;
                  else if (RING_AMT)                   nextstate_2 = W4Data;
                  else                                 nextstate_2 = Inc_Samp;
      Load_Addr :                                      nextstate_2 = W4Data;
      Next_L1a  :                                      nextstate_2 = Idle;
      Read      : if      (voted_seq_2 == 7'd94)       nextstate_2 = Last;
                  else                                 nextstate_2 = Read;
      W4Data    : if      (!RING_AMT && EVT_BUF_AFL)   nextstate_2 = W4_EVT_AMT;
                  else if (!RING_AMT && !EVT_BUF_AFL)  nextstate_2 = Inc_Samp;
                  else                                 nextstate_2 = W4Data;
      W4_EVT_AMT: if      (EVT_BUF_AMT)                nextstate_2 = Inc_Samp;
                  else                                 nextstate_2 = W4_EVT_AMT;
    endcase
    case (voted_state_3)
      Idle      : if      (!L1A_BUF_MT)                nextstate_3 = Load_Addr;
                  else                                 nextstate_3 = Idle;
      Inc_Samp  :                                      nextstate_3 = Read;
      Last      : if      (voted_smp_3 == SAMP_MAX)    nextstate_3 = Next_L1a;
                  else if (EVT_BUF_AFL)                nextstate_3 = W4_EVT_AMT;
                  else if (RING_AMT)                   nextstate_3 = W4Data;
                  else                                 nextstate_3 = Inc_Samp;
      Load_Addr :                                      nextstate_3 = W4Data;
      Next_L1a  :                                      nextstate_3 = Idle;
      Read      : if      (voted_seq_3 == 7'd94)       nextstate_3 = Last;
                  else                                 nextstate_3 = Read;
      W4Data    : if      (!RING_AMT && EVT_BUF_AFL)   nextstate_3 = W4_EVT_AMT;
                  else if (!RING_AMT && !EVT_BUF_AFL)  nextstate_3 = Inc_Samp;
                  else                                 nextstate_3 = W4Data;
      W4_EVT_AMT: if      (EVT_BUF_AMT)                nextstate_3 = Inc_Samp;
                  else                                 nextstate_3 = W4_EVT_AMT;
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
      LD_ADDR_1 <= 0;
      LD_ADDR_2 <= 0;
      LD_ADDR_3 <= 0;
      NXT_L1A_1 <= 0;
      NXT_L1A_2 <= 0;
      NXT_L1A_3 <= 0;
      RD_1 <= 0;
      RD_2 <= 0;
      RD_3 <= 0;
      seq_1 <= 7'h00;
      seq_2 <= 7'h00;
      seq_3 <= 7'h00;
      smp_1 <= 7'h00;
      smp_2 <= 7'h00;
      smp_3 <= 7'h00;
    end
    else begin
      LD_ADDR_1 <= 0; // default
      LD_ADDR_2 <= 0; // default
      LD_ADDR_3 <= 0; // default
      NXT_L1A_1 <= 0; // default
      NXT_L1A_2 <= 0; // default
      NXT_L1A_3 <= 0; // default
      RD_1 <= 0; // default
      RD_2 <= 0; // default
      RD_3 <= 0; // default
      seq_1 <= 7'h00; // default
      seq_2 <= 7'h00; // default
      seq_3 <= 7'h00; // default
      smp_1 <= voted_smp_1; // default
      smp_2 <= voted_smp_2; // default
      smp_3 <= voted_smp_3; // default
      case (nextstate_1)
        Idle      :        smp_1 <= 7'h7F;
        Inc_Samp  : begin
                           RD_1 <= 1;
                           smp_1 <= voted_smp_1 + 1;
        end
        Last      : begin
                           RD_1 <= 1;
                           seq_1 <= voted_seq_1 + 1;
        end
        Load_Addr : begin
                           LD_ADDR_1 <= 1;
                           smp_1 <= 7'h7F;
        end
        Next_L1a  :        NXT_L1A_1 <= 1;
        Read      : begin
                           RD_1 <= 1;
                           seq_1 <= voted_seq_1 + 1;
        end
      endcase
      case (nextstate_2)
        Idle      :        smp_2 <= 7'h7F;
        Inc_Samp  : begin
                           RD_2 <= 1;
                           smp_2 <= voted_smp_2 + 1;
        end
        Last      : begin
                           RD_2 <= 1;
                           seq_2 <= voted_seq_2 + 1;
        end
        Load_Addr : begin
                           LD_ADDR_2 <= 1;
                           smp_2 <= 7'h7F;
        end
        Next_L1a  :        NXT_L1A_2 <= 1;
        Read      : begin
                           RD_2 <= 1;
                           seq_2 <= voted_seq_2 + 1;
        end
      endcase
      case (nextstate_3)
        Idle      :        smp_3 <= 7'h7F;
        Inc_Samp  : begin
                           RD_3 <= 1;
                           smp_3 <= voted_smp_3 + 1;
        end
        Last      : begin
                           RD_3 <= 1;
                           seq_3 <= voted_seq_3 + 1;
        end
        Load_Addr : begin
                           LD_ADDR_3 <= 1;
                           smp_3 <= 7'h7F;
        end
        Next_L1a  :        NXT_L1A_3 <= 1;
        Read      : begin
                           RD_3 <= 1;
                           seq_3 <= voted_seq_3 + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [79:0] statename;
  always @* begin
    case (state_1)
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

