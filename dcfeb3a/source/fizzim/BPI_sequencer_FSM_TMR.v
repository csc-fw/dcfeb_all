
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:25 at 17:18:52 (www.fizzim.com)

module BPI_sequencer_FSM_TMR (
  output check_PEC,
  output check_buf,
  output check_stat,
  output cnfrm_lk,
  output wire [4:0] command,
  output read_es_state,
  output rpt_error,
  output seq_cmplt,
  output seqr_idle,
  output set_asynch,
  output wire [4:0] OUT_STATE,
  input CLK,
  input RST,
  input ack,
  input buf_prog,
  input error,
  input lk_ok,
  input lk_unlk,
  input noop_seq,
  input pec_busy,
  input wire [4:0] seq_cmnd,
  input seq_done,
  input simple_cmd,
  input std_seq 
);

  // Inserted from attribute insert_at_top_of_module:
  localparam // commands 
  	NoOp            = 5'h00, 
  	Write_1         = 5'h01, 
  	Read_1          = 5'h02, 
  	Write_n         = 5'h03, 
  	Read_n          = 5'h04, 
  	Read_Array      = 5'h05, 
  	Read_Status_Reg = 5'h06, 
  	Read_Elec_Sig   = 5'h07, 
  	Read_CFI_Qry    = 5'h08, 
  	Clr_Status_Reg  = 5'h09, 
  	Block_Erase     = 5'h0A, 
  	Program         = 5'h0B, 
  	Buffer_Program  = 5'h0C, 
  	Buf_Prog_Wrt_n  = 5'h0D, 
  	Buf_Prog_Conf   = 5'h0E, 
  	PE_Susp         = 5'h0F, 
  	PE_Resume       = 5'h10, 
  	Prot_Reg_Prog   = 5'h11, 
  	Set_Cnfg_Reg    = 5'h12, 
  	Block_Lock      = 5'h13, 
  	Block_UnLock    = 5'h14, 
  	Block_Lock_Down = 5'h15, 
  	Blank_Check     = 5'h16, 
  	Load_Address    = 5'h17, 
  	Unassigned      = 5'h18, 
  	Start_Timer     = 5'h19, 
  	Stop_Timer      = 5'h1A, 
  	Reset_Timer     = 5'h1B, 
  	Clr_BPI_Status  = 5'h1C; 

  // state bits
  parameter 
  Reset         = 5'b00000, 
  Buf_Prg_Cnf   = 5'b00001, 
  Buf_Prog      = 5'b00010, 
  Buf_Prog_n    = 5'b00011, 
  Check_Buf     = 5'b00100, 
  Check_PEC     = 5'b00101, 
  Check_Stat    = 5'b00110, 
  Clr_SR        = 5'b00111, 
  Cnfrm_LK      = 5'b01000, 
  Complete      = 5'b01001, 
  Idle          = 5'b01010, 
  Issue_Cmd     = 5'b01011, 
  Issue_LK_UnLK = 5'b01100, 
  NoOp1         = 5'b01101, 
  NoOp2         = 5'b01110, 
  NoOp3         = 5'b01111, 
  NoOp4         = 5'b10000, 
  NoOp5         = 5'b10001, 
  NoOp6         = 5'b10010, 
  NoOp7         = 5'b10011, 
  RES_mode      = 5'b10100, 
  Rd_Array_Mode = 5'b10101, 
  Read_Buf_Stat = 5'b10110, 
  Read_ES       = 5'b10111, 
  Read_Status   = 5'b11000, 
  Rpt_Error     = 5'b11001, 
  Set_Asynch    = 5'b11010, 
  Simple_Cmd    = 5'b11011, 
  Write_n_Wrds  = 5'b11100; 

  (* syn_preserve = "true" *) reg [4:0] state_1;
  (* syn_preserve = "true" *) reg [4:0] state_2;
  (* syn_preserve = "true" *) reg [4:0] state_3;

  (* syn_keep = "true" *) wire [4:0] voted_state_1;
  (* syn_keep = "true" *) wire [4:0] voted_state_2;
  (* syn_keep = "true" *) wire [4:0] voted_state_3;

  assign voted_state_1         = (state_1         & state_2        ) | (state_2         & state_3        ) | (state_1         & state_3        ); // Majority logic
  assign voted_state_2         = (state_1         & state_2        ) | (state_2         & state_3        ) | (state_1         & state_3        ); // Majority logic
  assign voted_state_3         = (state_1         & state_2        ) | (state_2         & state_3        ) | (state_1         & state_3        ); // Majority logic

  assign OUT_STATE = voted_state_1;

  (* syn_keep = "true" *) reg [4:0] nextstate_1;
  (* syn_keep = "true" *) reg [4:0] nextstate_2;
  (* syn_keep = "true" *) reg [4:0] nextstate_3;

  (* syn_preserve = "true" *)  reg check_PEC_1;
  (* syn_preserve = "true" *)  reg check_PEC_2;
  (* syn_preserve = "true" *)  reg check_PEC_3;
  (* syn_preserve = "true" *)  reg check_buf_1;
  (* syn_preserve = "true" *)  reg check_buf_2;
  (* syn_preserve = "true" *)  reg check_buf_3;
  (* syn_preserve = "true" *)  reg check_stat_1;
  (* syn_preserve = "true" *)  reg check_stat_2;
  (* syn_preserve = "true" *)  reg check_stat_3;
  (* syn_preserve = "true" *)  reg cnfrm_lk_1;
  (* syn_preserve = "true" *)  reg cnfrm_lk_2;
  (* syn_preserve = "true" *)  reg cnfrm_lk_3;
  (* syn_preserve = "true" *)  reg [4:0] command_1;
  (* syn_preserve = "true" *)  reg [4:0] command_2;
  (* syn_preserve = "true" *)  reg [4:0] command_3;
  (* syn_preserve = "true" *)  reg read_es_state_1;
  (* syn_preserve = "true" *)  reg read_es_state_2;
  (* syn_preserve = "true" *)  reg read_es_state_3;
  (* syn_preserve = "true" *)  reg rpt_error_1;
  (* syn_preserve = "true" *)  reg rpt_error_2;
  (* syn_preserve = "true" *)  reg rpt_error_3;
  (* syn_preserve = "true" *)  reg seq_cmplt_1;
  (* syn_preserve = "true" *)  reg seq_cmplt_2;
  (* syn_preserve = "true" *)  reg seq_cmplt_3;
  (* syn_preserve = "true" *)  reg seqr_idle_1;
  (* syn_preserve = "true" *)  reg seqr_idle_2;
  (* syn_preserve = "true" *)  reg seqr_idle_3;
  (* syn_preserve = "true" *)  reg set_asynch_1;
  (* syn_preserve = "true" *)  reg set_asynch_2;
  (* syn_preserve = "true" *)  reg set_asynch_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign check_PEC     = (check_PEC_1     & check_PEC_2    ) | (check_PEC_2     & check_PEC_3    ) | (check_PEC_1     & check_PEC_3    ); // Majority logic
  assign check_buf     = (check_buf_1     & check_buf_2    ) | (check_buf_2     & check_buf_3    ) | (check_buf_1     & check_buf_3    ); // Majority logic
  assign check_stat    = (check_stat_1    & check_stat_2   ) | (check_stat_2    & check_stat_3   ) | (check_stat_1    & check_stat_3   ); // Majority logic
  assign cnfrm_lk      = (cnfrm_lk_1      & cnfrm_lk_2     ) | (cnfrm_lk_2      & cnfrm_lk_3     ) | (cnfrm_lk_1      & cnfrm_lk_3     ); // Majority logic
  assign command       = (command_1       & command_2      ) | (command_2       & command_3      ) | (command_1       & command_3      ); // Majority logic
  assign read_es_state = (read_es_state_1 & read_es_state_2) | (read_es_state_2 & read_es_state_3) | (read_es_state_1 & read_es_state_3); // Majority logic
  assign rpt_error     = (rpt_error_1     & rpt_error_2    ) | (rpt_error_2     & rpt_error_3    ) | (rpt_error_1     & rpt_error_3    ); // Majority logic
  assign seq_cmplt     = (seq_cmplt_1     & seq_cmplt_2    ) | (seq_cmplt_2     & seq_cmplt_3    ) | (seq_cmplt_1     & seq_cmplt_3    ); // Majority logic
  assign seqr_idle     = (seqr_idle_1     & seqr_idle_2    ) | (seqr_idle_2     & seqr_idle_3    ) | (seqr_idle_1     & seqr_idle_3    ); // Majority logic
  assign set_asynch    = (set_asynch_1    & set_asynch_2   ) | (set_asynch_2    & set_asynch_3   ) | (set_asynch_1    & set_asynch_3   ); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 5'bxxxxx; // default to x because default_state_is_x is set
    nextstate_2 = 5'bxxxxx; // default to x because default_state_is_x is set
    nextstate_3 = 5'bxxxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Reset        :                       nextstate_1 = Set_Asynch;
      Buf_Prg_Cnf  : if      (seq_done)    nextstate_1 = NoOp5;
                     else                  nextstate_1 = Buf_Prg_Cnf;
      Buf_Prog     : if      (seq_done)    nextstate_1 = NoOp2;
                     else                  nextstate_1 = Buf_Prog;
      Buf_Prog_n   : if      (seq_done)    nextstate_1 = NoOp3;
                     else                  nextstate_1 = Buf_Prog_n;
      Check_Buf    : if      (pec_busy)    nextstate_1 = Buf_Prog;
                     else                  nextstate_1 = Buf_Prog_n;
      Check_PEC    : if      (pec_busy)    nextstate_1 = Read_Status;
                     else                  nextstate_1 = Check_Stat;
      Check_Stat   : if      (error)       nextstate_1 = Rpt_Error;
                     else                  nextstate_1 = NoOp1;
      Clr_SR       : if      (seq_done)    nextstate_1 = NoOp1;
                     else                  nextstate_1 = Clr_SR;
      Cnfrm_LK     : if      (lk_ok)       nextstate_1 = NoOp1;
                     else                  nextstate_1 = Issue_LK_UnLK;
      Complete     : if      (noop_seq)    nextstate_1 = Idle;
                     else                  nextstate_1 = Complete;
      Idle         : if      (lk_unlk)     nextstate_1 = Issue_LK_UnLK;
                     else if (buf_prog)    nextstate_1 = Buf_Prog;
                     else if (std_seq)     nextstate_1 = Issue_Cmd;
                     else if (simple_cmd)  nextstate_1 = Simple_Cmd;
                     else                  nextstate_1 = Idle;
      Issue_Cmd    : if      (seq_done)    nextstate_1 = NoOp5;
                     else                  nextstate_1 = Issue_Cmd;
      Issue_LK_UnLK: if      (seq_done)    nextstate_1 = NoOp6;
                     else                  nextstate_1 = Issue_LK_UnLK;
      NoOp1        :                       nextstate_1 = Rd_Array_Mode;
      NoOp2        :                       nextstate_1 = Read_Buf_Stat;
      NoOp3        :                       nextstate_1 = Write_n_Wrds;
      NoOp4        :                       nextstate_1 = Buf_Prg_Cnf;
      NoOp5        :                       nextstate_1 = Read_Status;
      NoOp6        :                       nextstate_1 = RES_mode;
      NoOp7        :                       nextstate_1 = Read_ES;
      RES_mode     : if      (seq_done)    nextstate_1 = NoOp7;
                     else                  nextstate_1 = RES_mode;
      Rd_Array_Mode: if      (seq_done)    nextstate_1 = Complete;
                     else                  nextstate_1 = Rd_Array_Mode;
      Read_Buf_Stat: if      (seq_done)    nextstate_1 = Check_Buf;
                     else                  nextstate_1 = Read_Buf_Stat;
      Read_ES      : if      (seq_done)    nextstate_1 = Cnfrm_LK;
                     else                  nextstate_1 = Read_ES;
      Read_Status  : if      (seq_done)    nextstate_1 = Check_PEC;
                     else                  nextstate_1 = Read_Status;
      Rpt_Error    : if      (ack)         nextstate_1 = Clr_SR;
                     else                  nextstate_1 = Rpt_Error;
      Set_Asynch   : if      (seq_done)    nextstate_1 = NoOp1;
                     else                  nextstate_1 = Set_Asynch;
      Simple_Cmd   : if      (seq_done)    nextstate_1 = Complete;
                     else                  nextstate_1 = Simple_Cmd;
      Write_n_Wrds : if      (seq_done)    nextstate_1 = NoOp4;
                     else                  nextstate_1 = Write_n_Wrds;
    endcase
    case (voted_state_2)
      Reset        :                       nextstate_2 = Set_Asynch;
      Buf_Prg_Cnf  : if      (seq_done)    nextstate_2 = NoOp5;
                     else                  nextstate_2 = Buf_Prg_Cnf;
      Buf_Prog     : if      (seq_done)    nextstate_2 = NoOp2;
                     else                  nextstate_2 = Buf_Prog;
      Buf_Prog_n   : if      (seq_done)    nextstate_2 = NoOp3;
                     else                  nextstate_2 = Buf_Prog_n;
      Check_Buf    : if      (pec_busy)    nextstate_2 = Buf_Prog;
                     else                  nextstate_2 = Buf_Prog_n;
      Check_PEC    : if      (pec_busy)    nextstate_2 = Read_Status;
                     else                  nextstate_2 = Check_Stat;
      Check_Stat   : if      (error)       nextstate_2 = Rpt_Error;
                     else                  nextstate_2 = NoOp1;
      Clr_SR       : if      (seq_done)    nextstate_2 = NoOp1;
                     else                  nextstate_2 = Clr_SR;
      Cnfrm_LK     : if      (lk_ok)       nextstate_2 = NoOp1;
                     else                  nextstate_2 = Issue_LK_UnLK;
      Complete     : if      (noop_seq)    nextstate_2 = Idle;
                     else                  nextstate_2 = Complete;
      Idle         : if      (lk_unlk)     nextstate_2 = Issue_LK_UnLK;
                     else if (buf_prog)    nextstate_2 = Buf_Prog;
                     else if (std_seq)     nextstate_2 = Issue_Cmd;
                     else if (simple_cmd)  nextstate_2 = Simple_Cmd;
                     else                  nextstate_2 = Idle;
      Issue_Cmd    : if      (seq_done)    nextstate_2 = NoOp5;
                     else                  nextstate_2 = Issue_Cmd;
      Issue_LK_UnLK: if      (seq_done)    nextstate_2 = NoOp6;
                     else                  nextstate_2 = Issue_LK_UnLK;
      NoOp1        :                       nextstate_2 = Rd_Array_Mode;
      NoOp2        :                       nextstate_2 = Read_Buf_Stat;
      NoOp3        :                       nextstate_2 = Write_n_Wrds;
      NoOp4        :                       nextstate_2 = Buf_Prg_Cnf;
      NoOp5        :                       nextstate_2 = Read_Status;
      NoOp6        :                       nextstate_2 = RES_mode;
      NoOp7        :                       nextstate_2 = Read_ES;
      RES_mode     : if      (seq_done)    nextstate_2 = NoOp7;
                     else                  nextstate_2 = RES_mode;
      Rd_Array_Mode: if      (seq_done)    nextstate_2 = Complete;
                     else                  nextstate_2 = Rd_Array_Mode;
      Read_Buf_Stat: if      (seq_done)    nextstate_2 = Check_Buf;
                     else                  nextstate_2 = Read_Buf_Stat;
      Read_ES      : if      (seq_done)    nextstate_2 = Cnfrm_LK;
                     else                  nextstate_2 = Read_ES;
      Read_Status  : if      (seq_done)    nextstate_2 = Check_PEC;
                     else                  nextstate_2 = Read_Status;
      Rpt_Error    : if      (ack)         nextstate_2 = Clr_SR;
                     else                  nextstate_2 = Rpt_Error;
      Set_Asynch   : if      (seq_done)    nextstate_2 = NoOp1;
                     else                  nextstate_2 = Set_Asynch;
      Simple_Cmd   : if      (seq_done)    nextstate_2 = Complete;
                     else                  nextstate_2 = Simple_Cmd;
      Write_n_Wrds : if      (seq_done)    nextstate_2 = NoOp4;
                     else                  nextstate_2 = Write_n_Wrds;
    endcase
    case (voted_state_3)
      Reset        :                       nextstate_3 = Set_Asynch;
      Buf_Prg_Cnf  : if      (seq_done)    nextstate_3 = NoOp5;
                     else                  nextstate_3 = Buf_Prg_Cnf;
      Buf_Prog     : if      (seq_done)    nextstate_3 = NoOp2;
                     else                  nextstate_3 = Buf_Prog;
      Buf_Prog_n   : if      (seq_done)    nextstate_3 = NoOp3;
                     else                  nextstate_3 = Buf_Prog_n;
      Check_Buf    : if      (pec_busy)    nextstate_3 = Buf_Prog;
                     else                  nextstate_3 = Buf_Prog_n;
      Check_PEC    : if      (pec_busy)    nextstate_3 = Read_Status;
                     else                  nextstate_3 = Check_Stat;
      Check_Stat   : if      (error)       nextstate_3 = Rpt_Error;
                     else                  nextstate_3 = NoOp1;
      Clr_SR       : if      (seq_done)    nextstate_3 = NoOp1;
                     else                  nextstate_3 = Clr_SR;
      Cnfrm_LK     : if      (lk_ok)       nextstate_3 = NoOp1;
                     else                  nextstate_3 = Issue_LK_UnLK;
      Complete     : if      (noop_seq)    nextstate_3 = Idle;
                     else                  nextstate_3 = Complete;
      Idle         : if      (lk_unlk)     nextstate_3 = Issue_LK_UnLK;
                     else if (buf_prog)    nextstate_3 = Buf_Prog;
                     else if (std_seq)     nextstate_3 = Issue_Cmd;
                     else if (simple_cmd)  nextstate_3 = Simple_Cmd;
                     else                  nextstate_3 = Idle;
      Issue_Cmd    : if      (seq_done)    nextstate_3 = NoOp5;
                     else                  nextstate_3 = Issue_Cmd;
      Issue_LK_UnLK: if      (seq_done)    nextstate_3 = NoOp6;
                     else                  nextstate_3 = Issue_LK_UnLK;
      NoOp1        :                       nextstate_3 = Rd_Array_Mode;
      NoOp2        :                       nextstate_3 = Read_Buf_Stat;
      NoOp3        :                       nextstate_3 = Write_n_Wrds;
      NoOp4        :                       nextstate_3 = Buf_Prg_Cnf;
      NoOp5        :                       nextstate_3 = Read_Status;
      NoOp6        :                       nextstate_3 = RES_mode;
      NoOp7        :                       nextstate_3 = Read_ES;
      RES_mode     : if      (seq_done)    nextstate_3 = NoOp7;
                     else                  nextstate_3 = RES_mode;
      Rd_Array_Mode: if      (seq_done)    nextstate_3 = Complete;
                     else                  nextstate_3 = Rd_Array_Mode;
      Read_Buf_Stat: if      (seq_done)    nextstate_3 = Check_Buf;
                     else                  nextstate_3 = Read_Buf_Stat;
      Read_ES      : if      (seq_done)    nextstate_3 = Cnfrm_LK;
                     else                  nextstate_3 = Read_ES;
      Read_Status  : if      (seq_done)    nextstate_3 = Check_PEC;
                     else                  nextstate_3 = Read_Status;
      Rpt_Error    : if      (ack)         nextstate_3 = Clr_SR;
                     else                  nextstate_3 = Rpt_Error;
      Set_Asynch   : if      (seq_done)    nextstate_3 = NoOp1;
                     else                  nextstate_3 = Set_Asynch;
      Simple_Cmd   : if      (seq_done)    nextstate_3 = Complete;
                     else                  nextstate_3 = Simple_Cmd;
      Write_n_Wrds : if      (seq_done)    nextstate_3 = NoOp4;
                     else                  nextstate_3 = Write_n_Wrds;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= Reset;
      state_2 <= Reset;
      state_3 <= Reset;
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
      check_PEC_1 <= 0;
      check_PEC_2 <= 0;
      check_PEC_3 <= 0;
      check_buf_1 <= 0;
      check_buf_2 <= 0;
      check_buf_3 <= 0;
      check_stat_1 <= 0;
      check_stat_2 <= 0;
      check_stat_3 <= 0;
      cnfrm_lk_1 <= 0;
      cnfrm_lk_2 <= 0;
      cnfrm_lk_3 <= 0;
      command_1 <= 5'b00000;
      command_2 <= 5'b00000;
      command_3 <= 5'b00000;
      read_es_state_1 <= 0;
      read_es_state_2 <= 0;
      read_es_state_3 <= 0;
      rpt_error_1 <= 0;
      rpt_error_2 <= 0;
      rpt_error_3 <= 0;
      seq_cmplt_1 <= 0;
      seq_cmplt_2 <= 0;
      seq_cmplt_3 <= 0;
      seqr_idle_1 <= 0;
      seqr_idle_2 <= 0;
      seqr_idle_3 <= 0;
      set_asynch_1 <= 0;
      set_asynch_2 <= 0;
      set_asynch_3 <= 0;
    end
    else begin
      check_PEC_1 <= 0; // default
      check_PEC_2 <= 0; // default
      check_PEC_3 <= 0; // default
      check_buf_1 <= 0; // default
      check_buf_2 <= 0; // default
      check_buf_3 <= 0; // default
      check_stat_1 <= 0; // default
      check_stat_2 <= 0; // default
      check_stat_3 <= 0; // default
      cnfrm_lk_1 <= 0; // default
      cnfrm_lk_2 <= 0; // default
      cnfrm_lk_3 <= 0; // default
      command_1 <= 5'b00000; // default
      command_2 <= 5'b00000; // default
      command_3 <= 5'b00000; // default
      read_es_state_1 <= 0; // default
      read_es_state_2 <= 0; // default
      read_es_state_3 <= 0; // default
      rpt_error_1 <= 0; // default
      rpt_error_2 <= 0; // default
      rpt_error_3 <= 0; // default
      seq_cmplt_1 <= 0; // default
      seq_cmplt_2 <= 0; // default
      seq_cmplt_3 <= 0; // default
      seqr_idle_1 <= 0; // default
      seqr_idle_2 <= 0; // default
      seqr_idle_3 <= 0; // default
      set_asynch_1 <= 0; // default
      set_asynch_2 <= 0; // default
      set_asynch_3 <= 0; // default
      case (nextstate_1)
        Buf_Prg_Cnf  :        command_1 <= Buf_Prog_Conf;
        Buf_Prog     :        command_1 <= Buffer_Program;
        Buf_Prog_n   :        command_1 <= Buf_Prog_Wrt_n;
        Check_Buf    :        check_buf_1 <= 1;
        Check_PEC    :        check_PEC_1 <= 1;
        Check_Stat   :        check_stat_1 <= 1;
        Clr_SR       :        command_1 <= Clr_Status_Reg;
        Cnfrm_LK     :        cnfrm_lk_1 <= 1;
        Complete     :        seq_cmplt_1 <= 1;
        Idle         :        seqr_idle_1 <= 1;
        Issue_Cmd    :        command_1 <= seq_cmnd;
        Issue_LK_UnLK:        command_1 <= seq_cmnd;
        RES_mode     :        command_1 <= Read_Elec_Sig;
        Rd_Array_Mode:        command_1 <= Read_Array;
        Read_Buf_Stat:        command_1 <= Read_1;
        Read_ES      : begin
                              command_1 <= Read_1;
                              read_es_state_1 <= 1;
        end
        Read_Status  :        command_1 <= Read_1;
        Rpt_Error    :        rpt_error_1 <= 1;
        Set_Asynch   : begin
                              command_1 <= Set_Cnfg_Reg;
                              set_asynch_1 <= 1;
        end
        Simple_Cmd   :        command_1 <= seq_cmnd;
        Write_n_Wrds :        command_1 <= Write_n;
      endcase
      case (nextstate_2)
        Buf_Prg_Cnf  :        command_2 <= Buf_Prog_Conf;
        Buf_Prog     :        command_2 <= Buffer_Program;
        Buf_Prog_n   :        command_2 <= Buf_Prog_Wrt_n;
        Check_Buf    :        check_buf_2 <= 1;
        Check_PEC    :        check_PEC_2 <= 1;
        Check_Stat   :        check_stat_2 <= 1;
        Clr_SR       :        command_2 <= Clr_Status_Reg;
        Cnfrm_LK     :        cnfrm_lk_2 <= 1;
        Complete     :        seq_cmplt_2 <= 1;
        Idle         :        seqr_idle_2 <= 1;
        Issue_Cmd    :        command_2 <= seq_cmnd;
        Issue_LK_UnLK:        command_2 <= seq_cmnd;
        RES_mode     :        command_2 <= Read_Elec_Sig;
        Rd_Array_Mode:        command_2 <= Read_Array;
        Read_Buf_Stat:        command_2 <= Read_1;
        Read_ES      : begin
                              command_2 <= Read_1;
                              read_es_state_2 <= 1;
        end
        Read_Status  :        command_2 <= Read_1;
        Rpt_Error    :        rpt_error_2 <= 1;
        Set_Asynch   : begin
                              command_2 <= Set_Cnfg_Reg;
                              set_asynch_2 <= 1;
        end
        Simple_Cmd   :        command_2 <= seq_cmnd;
        Write_n_Wrds :        command_2 <= Write_n;
      endcase
      case (nextstate_3)
        Buf_Prg_Cnf  :        command_3 <= Buf_Prog_Conf;
        Buf_Prog     :        command_3 <= Buffer_Program;
        Buf_Prog_n   :        command_3 <= Buf_Prog_Wrt_n;
        Check_Buf    :        check_buf_3 <= 1;
        Check_PEC    :        check_PEC_3 <= 1;
        Check_Stat   :        check_stat_3 <= 1;
        Clr_SR       :        command_3 <= Clr_Status_Reg;
        Cnfrm_LK     :        cnfrm_lk_3 <= 1;
        Complete     :        seq_cmplt_3 <= 1;
        Idle         :        seqr_idle_3 <= 1;
        Issue_Cmd    :        command_3 <= seq_cmnd;
        Issue_LK_UnLK:        command_3 <= seq_cmnd;
        RES_mode     :        command_3 <= Read_Elec_Sig;
        Rd_Array_Mode:        command_3 <= Read_Array;
        Read_Buf_Stat:        command_3 <= Read_1;
        Read_ES      : begin
                              command_3 <= Read_1;
                              read_es_state_3 <= 1;
        end
        Read_Status  :        command_3 <= Read_1;
        Rpt_Error    :        rpt_error_3 <= 1;
        Set_Asynch   : begin
                              command_3 <= Set_Cnfg_Reg;
                              set_asynch_3 <= 1;
        end
        Simple_Cmd   :        command_3 <= seq_cmnd;
        Write_n_Wrds :        command_3 <= Write_n;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [103:0] statename;
  always @* begin
    case (state_1)
      Reset        : statename = "Reset";
      Buf_Prg_Cnf  : statename = "Buf_Prg_Cnf";
      Buf_Prog     : statename = "Buf_Prog";
      Buf_Prog_n   : statename = "Buf_Prog_n";
      Check_Buf    : statename = "Check_Buf";
      Check_PEC    : statename = "Check_PEC";
      Check_Stat   : statename = "Check_Stat";
      Clr_SR       : statename = "Clr_SR";
      Cnfrm_LK     : statename = "Cnfrm_LK";
      Complete     : statename = "Complete";
      Idle         : statename = "Idle";
      Issue_Cmd    : statename = "Issue_Cmd";
      Issue_LK_UnLK: statename = "Issue_LK_UnLK";
      NoOp1        : statename = "NoOp1";
      NoOp2        : statename = "NoOp2";
      NoOp3        : statename = "NoOp3";
      NoOp4        : statename = "NoOp4";
      NoOp5        : statename = "NoOp5";
      NoOp6        : statename = "NoOp6";
      NoOp7        : statename = "NoOp7";
      RES_mode     : statename = "RES_mode";
      Rd_Array_Mode: statename = "Rd_Array_Mode";
      Read_Buf_Stat: statename = "Read_Buf_Stat";
      Read_ES      : statename = "Read_ES";
      Read_Status  : statename = "Read_Status";
      Rpt_Error    : statename = "Rpt_Error";
      Set_Asynch   : statename = "Set_Asynch";
      Simple_Cmd   : statename = "Simple_Cmd";
      Write_n_Wrds : statename = "Write_n_Wrds";
      default      : statename = "XXXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

