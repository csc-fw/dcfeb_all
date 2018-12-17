
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:06:20 (www.fizzim.com)

module ChnLnk_Frame_FSM_TMR (
  output CLR_CRC,
  output LAST_WRD,
  output RD,
  output wire [6:0] SEQ,
  output VALID,
  output wire [2:0] FRM_STATE,
  input CLK,
  input END_EVT,
  input F_MT,
  input L1A_BUF_MT,
  input RST 
);

  // state bits
  parameter 
  Idle        = 3'b000, 
  Last_Word   = 3'b001, 
  Read        = 3'b010, 
  Strt_Sample = 3'b011, 
  Tail_End    = 3'b100, 
  Tail_No_End = 3'b101, 
  W4Data      = 3'b110; 

  (* syn_preserve = "true" *) reg [2:0] state_1;
  (* syn_preserve = "true" *) reg [2:0] state_2;
  (* syn_preserve = "true" *) reg [2:0] state_3;

  (* syn_keep = "true" *) wire [2:0] voted_state_1;
  (* syn_keep = "true" *) wire [2:0] voted_state_2;
  (* syn_keep = "true" *) wire [2:0] voted_state_3;

  assign voted_state_1    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_2    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_3    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic

  assign FRM_STATE = voted_state_1;

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg CLR_CRC_1;
  (* syn_preserve = "true" *)  reg CLR_CRC_2;
  (* syn_preserve = "true" *)  reg CLR_CRC_3;
  (* syn_preserve = "true" *)  reg LAST_WRD_1;
  (* syn_preserve = "true" *)  reg LAST_WRD_2;
  (* syn_preserve = "true" *)  reg LAST_WRD_3;
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

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign CLR_CRC  = (CLR_CRC_1  & CLR_CRC_2 ) | (CLR_CRC_2  & CLR_CRC_3 ) | (CLR_CRC_1  & CLR_CRC_3 ); // Majority logic
  assign LAST_WRD = (LAST_WRD_1 & LAST_WRD_2) | (LAST_WRD_2 & LAST_WRD_3) | (LAST_WRD_1 & LAST_WRD_3); // Majority logic
  assign RD       = (RD_1       & RD_2      ) | (RD_2       & RD_3      ) | (RD_1       & RD_3      ); // Majority logic
  assign SEQ      = (SEQ_1      & SEQ_2     ) | (SEQ_2      & SEQ_3     ) | (SEQ_1      & SEQ_3     ); // Majority logic
  assign VALID    = (VALID_1    & VALID_2   ) | (VALID_2    & VALID_3   ) | (VALID_1    & VALID_3   ); // Majority logic
  assign voted_seqn_1     = (seqn_1     & seqn_2    ) | (seqn_2     & seqn_3    ) | (seqn_1     & seqn_3    ); // Majority logic
  assign voted_seqn_2     = (seqn_1     & seqn_2    ) | (seqn_2     & seqn_3    ) | (seqn_1     & seqn_3    ); // Majority logic
  assign voted_seqn_3     = (seqn_1     & seqn_2    ) | (seqn_2     & seqn_3    ) | (seqn_1     & seqn_3    ); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    SEQ_1 = voted_seqn_1; // default
    SEQ_2 = voted_seqn_2; // default
    SEQ_3 = voted_seqn_3; // default
    case (voted_state_1)
      Idle       : if      (!L1A_BUF_MT)                       nextstate_1 = W4Data;
                   else                                        nextstate_1 = Idle;
      Last_Word  :                                             nextstate_1 = Idle;
      Read       : if      (voted_seqn_1 == 7'd95 && END_EVT)  nextstate_1 = Tail_End;
                   else if (voted_seqn_1 == 7'd95)             nextstate_1 = Tail_No_End;
                   else                                        nextstate_1 = Read;
      Strt_Sample:                                             nextstate_1 = Read;
      Tail_End   : if      (voted_seqn_1 == 7'd99)             nextstate_1 = Last_Word;
                   else                                        nextstate_1 = Tail_End;
      Tail_No_End: if      (voted_seqn_1 == 7'd99)             nextstate_1 = W4Data;
                   else                                        nextstate_1 = Tail_No_End;
      W4Data     : if      (!F_MT)                             nextstate_1 = Strt_Sample;
                   else                                        nextstate_1 = W4Data;
    endcase
    case (voted_state_2)
      Idle       : if      (!L1A_BUF_MT)                       nextstate_2 = W4Data;
                   else                                        nextstate_2 = Idle;
      Last_Word  :                                             nextstate_2 = Idle;
      Read       : if      (voted_seqn_2 == 7'd95 && END_EVT)  nextstate_2 = Tail_End;
                   else if (voted_seqn_2 == 7'd95)             nextstate_2 = Tail_No_End;
                   else                                        nextstate_2 = Read;
      Strt_Sample:                                             nextstate_2 = Read;
      Tail_End   : if      (voted_seqn_2 == 7'd99)             nextstate_2 = Last_Word;
                   else                                        nextstate_2 = Tail_End;
      Tail_No_End: if      (voted_seqn_2 == 7'd99)             nextstate_2 = W4Data;
                   else                                        nextstate_2 = Tail_No_End;
      W4Data     : if      (!F_MT)                             nextstate_2 = Strt_Sample;
                   else                                        nextstate_2 = W4Data;
    endcase
    case (voted_state_3)
      Idle       : if      (!L1A_BUF_MT)                       nextstate_3 = W4Data;
                   else                                        nextstate_3 = Idle;
      Last_Word  :                                             nextstate_3 = Idle;
      Read       : if      (voted_seqn_3 == 7'd95 && END_EVT)  nextstate_3 = Tail_End;
                   else if (voted_seqn_3 == 7'd95)             nextstate_3 = Tail_No_End;
                   else                                        nextstate_3 = Read;
      Strt_Sample:                                             nextstate_3 = Read;
      Tail_End   : if      (voted_seqn_3 == 7'd99)             nextstate_3 = Last_Word;
                   else                                        nextstate_3 = Tail_End;
      Tail_No_End: if      (voted_seqn_3 == 7'd99)             nextstate_3 = W4Data;
                   else                                        nextstate_3 = Tail_No_End;
      W4Data     : if      (!F_MT)                             nextstate_3 = Strt_Sample;
                   else                                        nextstate_3 = W4Data;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= Idle;
      state_2 <= Idle;
      state_3 <= Idle;
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
      CLR_CRC_1 <= 0;
      CLR_CRC_2 <= 0;
      CLR_CRC_3 <= 0;
      LAST_WRD_1 <= 0;
      LAST_WRD_2 <= 0;
      LAST_WRD_3 <= 0;
      RD_1 <= 0;
      RD_2 <= 0;
      RD_3 <= 0;
      VALID_1 <= 0;
      VALID_2 <= 0;
      VALID_3 <= 0;
      seqn_1 <= 7'h00;
      seqn_2 <= 7'h00;
      seqn_3 <= 7'h00;
    end
    else begin
      CLR_CRC_1 <= 0; // default
      CLR_CRC_2 <= 0; // default
      CLR_CRC_3 <= 0; // default
      LAST_WRD_1 <= 0; // default
      LAST_WRD_2 <= 0; // default
      LAST_WRD_3 <= 0; // default
      RD_1 <= 0; // default
      RD_2 <= 0; // default
      RD_3 <= 0; // default
      VALID_1 <= 0; // default
      VALID_2 <= 0; // default
      VALID_3 <= 0; // default
      seqn_1 <= 7'h00; // default
      seqn_2 <= 7'h00; // default
      seqn_3 <= 7'h00; // default
      case (nextstate_1)
        Last_Word  :        LAST_WRD_1 <= 1;
        Read       : begin
                            RD_1 <= 1;
                            VALID_1 <= 1;
                            seqn_1 <= voted_seqn_1 + 1;
        end
        Strt_Sample: begin
                            RD_1 <= 1;
                            VALID_1 <= 1;
        end
        Tail_End   : begin
                            VALID_1 <= 1;
                            seqn_1 <= voted_seqn_1 + 1;
        end
        Tail_No_End: begin
                            VALID_1 <= 1;
                            seqn_1 <= voted_seqn_1 + 1;
        end
        W4Data     :        CLR_CRC_1 <= 1;
      endcase
      case (nextstate_2)
        Last_Word  :        LAST_WRD_2 <= 1;
        Read       : begin
                            RD_2 <= 1;
                            VALID_2 <= 1;
                            seqn_2 <= voted_seqn_2 + 1;
        end
        Strt_Sample: begin
                            RD_2 <= 1;
                            VALID_2 <= 1;
        end
        Tail_End   : begin
                            VALID_2 <= 1;
                            seqn_2 <= voted_seqn_2 + 1;
        end
        Tail_No_End: begin
                            VALID_2 <= 1;
                            seqn_2 <= voted_seqn_2 + 1;
        end
        W4Data     :        CLR_CRC_2 <= 1;
      endcase
      case (nextstate_3)
        Last_Word  :        LAST_WRD_3 <= 1;
        Read       : begin
                            RD_3 <= 1;
                            VALID_3 <= 1;
                            seqn_3 <= voted_seqn_3 + 1;
        end
        Strt_Sample: begin
                            RD_3 <= 1;
                            VALID_3 <= 1;
        end
        Tail_End   : begin
                            VALID_3 <= 1;
                            seqn_3 <= voted_seqn_3 + 1;
        end
        Tail_No_End: begin
                            VALID_3 <= 1;
                            seqn_3 <= voted_seqn_3 + 1;
        end
        W4Data     :        CLR_CRC_3 <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [87:0] statename;
  always @* begin
    case (state_1)
      Idle       : statename = "Idle";
      Last_Word  : statename = "Last_Word";
      Read       : statename = "Read";
      Strt_Sample: statename = "Strt_Sample";
      Tail_End   : statename = "Tail_End";
      Tail_No_End: statename = "Tail_No_End";
      W4Data     : statename = "W4Data";
      default    : statename = "XXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

