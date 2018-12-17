
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:25 at 17:16:00 (www.fizzim.com)

module BPI_cmd_parser_FSM_TMR (
  output ACK,
  output DECODE,
  output ENABLE_CMD,
  output IDLE,
  output LD_CNTS,
  output LD_FULL,
  output LD_STATUS,
  output LD_USR,
  output READ_FF,
  output wire [3:0] OUT_STATE,
  input BUF_PROG,
  input CLK,
  input CNT_CMD,
  input DATA,
  input ENABLE,
  input LOCAL,
  input LOOP_DONE,
  input MT,
  input PASS,
  input READ_N,
  input RPT_ERROR,
  input RST,
  input SEQR_IDLE,
  input SEQ_CMPLT,
  input XTRA_WORD 
);

  // state bits
  parameter 
  Idle          = 4'b0000, 
  Ack           = 4'b0001, 
  Dcd_n_Ld      = 4'b0010, 
  Exec_1Data    = 4'b0011, 
  Exec_Buf32    = 4'b0100, 
  Exec_Local    = 4'b0101, 
  Exec_Pass     = 4'b0110, 
  Load_Cmd      = 4'b0111, 
  Load_Cnts     = 4'b1000, 
  Load_Full     = 4'b1001, 
  Read_FF       = 4'b1010, 
  Update_Status = 4'b1011, 
  Wait4Seq      = 4'b1100; 

  (* syn_preserve = "true" *) reg [3:0] state_1;
  (* syn_preserve = "true" *) reg [3:0] state_2;
  (* syn_preserve = "true" *) reg [3:0] state_3;

  (* syn_keep = "true" *) wire [3:0] voted_state_1;
  (* syn_keep = "true" *) wire [3:0] voted_state_2;
  (* syn_keep = "true" *) wire [3:0] voted_state_3;

  assign voted_state_1      = (state_1      & state_2     ) | (state_2      & state_3     ) | (state_1      & state_3     ); // Majority logic
  assign voted_state_2      = (state_1      & state_2     ) | (state_2      & state_3     ) | (state_1      & state_3     ); // Majority logic
  assign voted_state_3      = (state_1      & state_2     ) | (state_2      & state_3     ) | (state_1      & state_3     ); // Majority logic

  assign OUT_STATE = voted_state_1;

  (* syn_keep = "true" *) reg [3:0] nextstate_1;
  (* syn_keep = "true" *) reg [3:0] nextstate_2;
  (* syn_keep = "true" *) reg [3:0] nextstate_3;

  (* syn_preserve = "true" *)  reg ACK_1;
  (* syn_preserve = "true" *)  reg ACK_2;
  (* syn_preserve = "true" *)  reg ACK_3;
  (* syn_preserve = "true" *)  reg DECODE_1;
  (* syn_preserve = "true" *)  reg DECODE_2;
  (* syn_preserve = "true" *)  reg DECODE_3;
  (* syn_preserve = "true" *)  reg ENABLE_CMD_1;
  (* syn_preserve = "true" *)  reg ENABLE_CMD_2;
  (* syn_preserve = "true" *)  reg ENABLE_CMD_3;
  (* syn_preserve = "true" *)  reg IDLE_1;
  (* syn_preserve = "true" *)  reg IDLE_2;
  (* syn_preserve = "true" *)  reg IDLE_3;
  (* syn_preserve = "true" *)  reg LD_CNTS_1;
  (* syn_preserve = "true" *)  reg LD_CNTS_2;
  (* syn_preserve = "true" *)  reg LD_CNTS_3;
  (* syn_preserve = "true" *)  reg LD_FULL_1;
  (* syn_preserve = "true" *)  reg LD_FULL_2;
  (* syn_preserve = "true" *)  reg LD_FULL_3;
  (* syn_preserve = "true" *)  reg LD_STATUS_1;
  (* syn_preserve = "true" *)  reg LD_STATUS_2;
  (* syn_preserve = "true" *)  reg LD_STATUS_3;
  (* syn_preserve = "true" *)  reg LD_USR_1;
  (* syn_preserve = "true" *)  reg LD_USR_2;
  (* syn_preserve = "true" *)  reg LD_USR_3;
  (* syn_preserve = "true" *)  reg READ_FF_1;
  (* syn_preserve = "true" *)  reg READ_FF_2;
  (* syn_preserve = "true" *)  reg READ_FF_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign ACK        = (ACK_1        & ACK_2       ) | (ACK_2        & ACK_3       ) | (ACK_1        & ACK_3       ); // Majority logic
  assign DECODE     = (DECODE_1     & DECODE_2    ) | (DECODE_2     & DECODE_3    ) | (DECODE_1     & DECODE_3    ); // Majority logic
  assign ENABLE_CMD = (ENABLE_CMD_1 & ENABLE_CMD_2) | (ENABLE_CMD_2 & ENABLE_CMD_3) | (ENABLE_CMD_1 & ENABLE_CMD_3); // Majority logic
  assign IDLE       = (IDLE_1       & IDLE_2      ) | (IDLE_2       & IDLE_3      ) | (IDLE_1       & IDLE_3      ); // Majority logic
  assign LD_CNTS    = (LD_CNTS_1    & LD_CNTS_2   ) | (LD_CNTS_2    & LD_CNTS_3   ) | (LD_CNTS_1    & LD_CNTS_3   ); // Majority logic
  assign LD_FULL    = (LD_FULL_1    & LD_FULL_2   ) | (LD_FULL_2    & LD_FULL_3   ) | (LD_FULL_1    & LD_FULL_3   ); // Majority logic
  assign LD_STATUS  = (LD_STATUS_1  & LD_STATUS_2 ) | (LD_STATUS_2  & LD_STATUS_3 ) | (LD_STATUS_1  & LD_STATUS_3 ); // Majority logic
  assign LD_USR     = (LD_USR_1     & LD_USR_2    ) | (LD_USR_2     & LD_USR_3    ) | (LD_USR_1     & LD_USR_3    ); // Majority logic
  assign READ_FF    = (READ_FF_1    & READ_FF_2   ) | (READ_FF_2    & READ_FF_3   ) | (READ_FF_1    & READ_FF_3   ); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_2 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_3 = 4'bxxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle         : if      (!MT && ENABLE && SEQR_IDLE)           nextstate_1 = Load_Cmd;
                     else                                           nextstate_1 = Idle;
      Ack          : if      (!RPT_ERROR)                           nextstate_1 = Wait4Seq;
                     else                                           nextstate_1 = Ack;
      Dcd_n_Ld     : if      (PASS)                                 nextstate_1 = Exec_Pass;
                     else if (CNT_CMD)                              nextstate_1 = Load_Full;
                     else if (DATA && !MT)                          nextstate_1 = Exec_1Data;
                     else if (LOCAL && !XTRA_WORD)                  nextstate_1 = Exec_Local;
                     else if (LOCAL && XTRA_WORD && !MT)            nextstate_1 = Exec_Local;
                     else if (!DATA && !LOCAL)                      nextstate_1 = Idle;
                     else                                           nextstate_1 = Dcd_n_Ld;
      Exec_1Data   : if      (RPT_ERROR)                            nextstate_1 = Update_Status;
                     else if (SEQ_CMPLT)                            nextstate_1 = Read_FF;
                     else                                           nextstate_1 = Exec_1Data;
      Exec_Buf32   : if      (RPT_ERROR)                            nextstate_1 = Update_Status;
                     else if (SEQ_CMPLT && LOOP_DONE)               nextstate_1 = Idle;
                     else if (SEQ_CMPLT)                            nextstate_1 = Load_Cnts;
                     else                                           nextstate_1 = Exec_Buf32;
      Exec_Local   : if      (XTRA_WORD)                            nextstate_1 = Read_FF;
                     else                                           nextstate_1 = Idle;
      Exec_Pass    : if      (RPT_ERROR)                            nextstate_1 = Update_Status;
                     else if (SEQ_CMPLT)                            nextstate_1 = Idle;
                     else                                           nextstate_1 = Exec_Pass;
      Load_Cmd     :                                                nextstate_1 = Dcd_n_Ld;
      Load_Cnts    :                                                nextstate_1 = Exec_Buf32;
      Load_Full    : if      (READ_N)                               nextstate_1 = Exec_Pass;
                     else                                           nextstate_1 = Load_Cnts;
      Read_FF      :                                                nextstate_1 = Idle;
      Update_Status:                                                nextstate_1 = Ack;
      Wait4Seq     : if      (SEQ_CMPLT && BUF_PROG && !LOOP_DONE)  nextstate_1 = Load_Cnts;
                     else if (SEQ_CMPLT && XTRA_WORD)               nextstate_1 = Read_FF;
                     else if (SEQ_CMPLT)                            nextstate_1 = Idle;
                     else                                           nextstate_1 = Wait4Seq;
    endcase
    case (voted_state_2)
      Idle         : if      (!MT && ENABLE && SEQR_IDLE)           nextstate_2 = Load_Cmd;
                     else                                           nextstate_2 = Idle;
      Ack          : if      (!RPT_ERROR)                           nextstate_2 = Wait4Seq;
                     else                                           nextstate_2 = Ack;
      Dcd_n_Ld     : if      (PASS)                                 nextstate_2 = Exec_Pass;
                     else if (CNT_CMD)                              nextstate_2 = Load_Full;
                     else if (DATA && !MT)                          nextstate_2 = Exec_1Data;
                     else if (LOCAL && !XTRA_WORD)                  nextstate_2 = Exec_Local;
                     else if (LOCAL && XTRA_WORD && !MT)            nextstate_2 = Exec_Local;
                     else if (!DATA && !LOCAL)                      nextstate_2 = Idle;
                     else                                           nextstate_2 = Dcd_n_Ld;
      Exec_1Data   : if      (RPT_ERROR)                            nextstate_2 = Update_Status;
                     else if (SEQ_CMPLT)                            nextstate_2 = Read_FF;
                     else                                           nextstate_2 = Exec_1Data;
      Exec_Buf32   : if      (RPT_ERROR)                            nextstate_2 = Update_Status;
                     else if (SEQ_CMPLT && LOOP_DONE)               nextstate_2 = Idle;
                     else if (SEQ_CMPLT)                            nextstate_2 = Load_Cnts;
                     else                                           nextstate_2 = Exec_Buf32;
      Exec_Local   : if      (XTRA_WORD)                            nextstate_2 = Read_FF;
                     else                                           nextstate_2 = Idle;
      Exec_Pass    : if      (RPT_ERROR)                            nextstate_2 = Update_Status;
                     else if (SEQ_CMPLT)                            nextstate_2 = Idle;
                     else                                           nextstate_2 = Exec_Pass;
      Load_Cmd     :                                                nextstate_2 = Dcd_n_Ld;
      Load_Cnts    :                                                nextstate_2 = Exec_Buf32;
      Load_Full    : if      (READ_N)                               nextstate_2 = Exec_Pass;
                     else                                           nextstate_2 = Load_Cnts;
      Read_FF      :                                                nextstate_2 = Idle;
      Update_Status:                                                nextstate_2 = Ack;
      Wait4Seq     : if      (SEQ_CMPLT && BUF_PROG && !LOOP_DONE)  nextstate_2 = Load_Cnts;
                     else if (SEQ_CMPLT && XTRA_WORD)               nextstate_2 = Read_FF;
                     else if (SEQ_CMPLT)                            nextstate_2 = Idle;
                     else                                           nextstate_2 = Wait4Seq;
    endcase
    case (voted_state_3)
      Idle         : if      (!MT && ENABLE && SEQR_IDLE)           nextstate_3 = Load_Cmd;
                     else                                           nextstate_3 = Idle;
      Ack          : if      (!RPT_ERROR)                           nextstate_3 = Wait4Seq;
                     else                                           nextstate_3 = Ack;
      Dcd_n_Ld     : if      (PASS)                                 nextstate_3 = Exec_Pass;
                     else if (CNT_CMD)                              nextstate_3 = Load_Full;
                     else if (DATA && !MT)                          nextstate_3 = Exec_1Data;
                     else if (LOCAL && !XTRA_WORD)                  nextstate_3 = Exec_Local;
                     else if (LOCAL && XTRA_WORD && !MT)            nextstate_3 = Exec_Local;
                     else if (!DATA && !LOCAL)                      nextstate_3 = Idle;
                     else                                           nextstate_3 = Dcd_n_Ld;
      Exec_1Data   : if      (RPT_ERROR)                            nextstate_3 = Update_Status;
                     else if (SEQ_CMPLT)                            nextstate_3 = Read_FF;
                     else                                           nextstate_3 = Exec_1Data;
      Exec_Buf32   : if      (RPT_ERROR)                            nextstate_3 = Update_Status;
                     else if (SEQ_CMPLT && LOOP_DONE)               nextstate_3 = Idle;
                     else if (SEQ_CMPLT)                            nextstate_3 = Load_Cnts;
                     else                                           nextstate_3 = Exec_Buf32;
      Exec_Local   : if      (XTRA_WORD)                            nextstate_3 = Read_FF;
                     else                                           nextstate_3 = Idle;
      Exec_Pass    : if      (RPT_ERROR)                            nextstate_3 = Update_Status;
                     else if (SEQ_CMPLT)                            nextstate_3 = Idle;
                     else                                           nextstate_3 = Exec_Pass;
      Load_Cmd     :                                                nextstate_3 = Dcd_n_Ld;
      Load_Cnts    :                                                nextstate_3 = Exec_Buf32;
      Load_Full    : if      (READ_N)                               nextstate_3 = Exec_Pass;
                     else                                           nextstate_3 = Load_Cnts;
      Read_FF      :                                                nextstate_3 = Idle;
      Update_Status:                                                nextstate_3 = Ack;
      Wait4Seq     : if      (SEQ_CMPLT && BUF_PROG && !LOOP_DONE)  nextstate_3 = Load_Cnts;
                     else if (SEQ_CMPLT && XTRA_WORD)               nextstate_3 = Read_FF;
                     else if (SEQ_CMPLT)                            nextstate_3 = Idle;
                     else                                           nextstate_3 = Wait4Seq;
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
      ACK_1 <= 0;
      ACK_2 <= 0;
      ACK_3 <= 0;
      DECODE_1 <= 0;
      DECODE_2 <= 0;
      DECODE_3 <= 0;
      ENABLE_CMD_1 <= 0;
      ENABLE_CMD_2 <= 0;
      ENABLE_CMD_3 <= 0;
      IDLE_1 <= 0;
      IDLE_2 <= 0;
      IDLE_3 <= 0;
      LD_CNTS_1 <= 0;
      LD_CNTS_2 <= 0;
      LD_CNTS_3 <= 0;
      LD_FULL_1 <= 0;
      LD_FULL_2 <= 0;
      LD_FULL_3 <= 0;
      LD_STATUS_1 <= 0;
      LD_STATUS_2 <= 0;
      LD_STATUS_3 <= 0;
      LD_USR_1 <= 0;
      LD_USR_2 <= 0;
      LD_USR_3 <= 0;
      READ_FF_1 <= 0;
      READ_FF_2 <= 0;
      READ_FF_3 <= 0;
    end
    else begin
      ACK_1 <= 0; // default
      ACK_2 <= 0; // default
      ACK_3 <= 0; // default
      DECODE_1 <= 0; // default
      DECODE_2 <= 0; // default
      DECODE_3 <= 0; // default
      ENABLE_CMD_1 <= 0; // default
      ENABLE_CMD_2 <= 0; // default
      ENABLE_CMD_3 <= 0; // default
      IDLE_1 <= 0; // default
      IDLE_2 <= 0; // default
      IDLE_3 <= 0; // default
      LD_CNTS_1 <= 0; // default
      LD_CNTS_2 <= 0; // default
      LD_CNTS_3 <= 0; // default
      LD_FULL_1 <= 0; // default
      LD_FULL_2 <= 0; // default
      LD_FULL_3 <= 0; // default
      LD_STATUS_1 <= 0; // default
      LD_STATUS_2 <= 0; // default
      LD_STATUS_3 <= 0; // default
      LD_USR_1 <= 0; // default
      LD_USR_2 <= 0; // default
      LD_USR_3 <= 0; // default
      READ_FF_1 <= 0; // default
      READ_FF_2 <= 0; // default
      READ_FF_3 <= 0; // default
      case (nextstate_1)
        Idle         :        IDLE_1 <= 1;
        Ack          :        ACK_1 <= 1;
        Dcd_n_Ld     :        DECODE_1 <= 1;
        Exec_1Data   :        ENABLE_CMD_1 <= 1;
        Exec_Buf32   :        ENABLE_CMD_1 <= 1;
        Exec_Local   :        ENABLE_CMD_1 <= 1;
        Exec_Pass    :        ENABLE_CMD_1 <= 1;
        Load_Cmd     : begin
                              LD_USR_1 <= 1;
                              READ_FF_1 <= 1;
        end
        Load_Cnts    :        LD_CNTS_1 <= 1;
        Load_Full    :        LD_FULL_1 <= 1;
        Read_FF      :        READ_FF_1 <= 1;
        Update_Status:        LD_STATUS_1 <= 1;
      endcase
      case (nextstate_2)
        Idle         :        IDLE_2 <= 1;
        Ack          :        ACK_2 <= 1;
        Dcd_n_Ld     :        DECODE_2 <= 1;
        Exec_1Data   :        ENABLE_CMD_2 <= 1;
        Exec_Buf32   :        ENABLE_CMD_2 <= 1;
        Exec_Local   :        ENABLE_CMD_2 <= 1;
        Exec_Pass    :        ENABLE_CMD_2 <= 1;
        Load_Cmd     : begin
                              LD_USR_2 <= 1;
                              READ_FF_2 <= 1;
        end
        Load_Cnts    :        LD_CNTS_2 <= 1;
        Load_Full    :        LD_FULL_2 <= 1;
        Read_FF      :        READ_FF_2 <= 1;
        Update_Status:        LD_STATUS_2 <= 1;
      endcase
      case (nextstate_3)
        Idle         :        IDLE_3 <= 1;
        Ack          :        ACK_3 <= 1;
        Dcd_n_Ld     :        DECODE_3 <= 1;
        Exec_1Data   :        ENABLE_CMD_3 <= 1;
        Exec_Buf32   :        ENABLE_CMD_3 <= 1;
        Exec_Local   :        ENABLE_CMD_3 <= 1;
        Exec_Pass    :        ENABLE_CMD_3 <= 1;
        Load_Cmd     : begin
                              LD_USR_3 <= 1;
                              READ_FF_3 <= 1;
        end
        Load_Cnts    :        LD_CNTS_3 <= 1;
        Load_Full    :        LD_FULL_3 <= 1;
        Read_FF      :        READ_FF_3 <= 1;
        Update_Status:        LD_STATUS_3 <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [103:0] statename;
  always @* begin
    case (state_1)
      Idle         : statename = "Idle";
      Ack          : statename = "Ack";
      Dcd_n_Ld     : statename = "Dcd_n_Ld";
      Exec_1Data   : statename = "Exec_1Data";
      Exec_Buf32   : statename = "Exec_Buf32";
      Exec_Local   : statename = "Exec_Local";
      Exec_Pass    : statename = "Exec_Pass";
      Load_Cmd     : statename = "Load_Cmd";
      Load_Cnts    : statename = "Load_Cnts";
      Load_Full    : statename = "Load_Full";
      Read_FF      : statename = "Read_FF";
      Update_Status: statename = "Update_Status";
      Wait4Seq     : statename = "Wait4Seq";
      default      : statename = "XXXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

