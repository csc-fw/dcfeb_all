
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2016:06:27 at 14:58:35 (www.fizzim.com)

module op_link_rst_FSM_TMR 
  #(
    parameter PULSE_DUR = 12'd4000
  )(
  output DAQ_TDIS,
  output TRG_TDIS,
  input CLK,
  input DAQ_OP_RST,
  input RST,
  input STRTUP_OP_RST,
  input TRG_OP_RST 
);

  // state bits
  parameter 
  Idle   = 2'b00, 
  Tx_Dis = 2'b01, 
  Wait   = 2'b10; 

  (* syn_preserve = "true" *) reg [1:0] state_1;
  (* syn_preserve = "true" *) reg [1:0] state_2;
  (* syn_preserve = "true" *) reg [1:0] state_3;

  (* syn_keep = "true" *) wire [1:0] voted_state_1;
  (* syn_keep = "true" *) wire [1:0] voted_state_2;
  (* syn_keep = "true" *) wire [1:0] voted_state_3;

  assign voted_state_1      = (state_1      & state_2     ) | (state_2      & state_3     ) | (state_1      & state_3     ); // Majority logic
  assign voted_state_2      = (state_1      & state_2     ) | (state_2      & state_3     ) | (state_1      & state_3     ); // Majority logic
  assign voted_state_3      = (state_1      & state_2     ) | (state_2      & state_3     ) | (state_1      & state_3     ); // Majority logic


  (* syn_keep = "true" *) reg [1:0] nextstate_1;
  (* syn_keep = "true" *) reg [1:0] nextstate_2;
  (* syn_keep = "true" *) reg [1:0] nextstate_3;


  (* syn_preserve = "true" *)  reg DAQ_TDIS_1;
  (* syn_preserve = "true" *)  reg DAQ_TDIS_2;
  (* syn_preserve = "true" *)  reg DAQ_TDIS_3;
  (* syn_preserve = "true" *)  reg TRG_TDIS_1;
  (* syn_preserve = "true" *)  reg TRG_TDIS_2;
  (* syn_preserve = "true" *)  reg TRG_TDIS_3;
  (* syn_preserve = "true" *)  reg [11:0] cnt_1;
  (* syn_preserve = "true" *)  reg [11:0] cnt_2;
  (* syn_preserve = "true" *)  reg [11:0] cnt_3;
  (* syn_keep = "true" *)      wire [11:0] voted_cnt_1;
  (* syn_keep = "true" *)      wire [11:0] voted_cnt_2;
  (* syn_keep = "true" *)      wire [11:0] voted_cnt_3;
  (* syn_preserve = "true" *)  reg daq_tdis_i_1;
  (* syn_preserve = "true" *)  reg daq_tdis_i_2;
  (* syn_preserve = "true" *)  reg daq_tdis_i_3;
  (* syn_keep = "true" *)      wire voted_daq_tdis_i_1;
  (* syn_keep = "true" *)      wire voted_daq_tdis_i_2;
  (* syn_keep = "true" *)      wire voted_daq_tdis_i_3;
  (* syn_preserve = "true" *)  reg trg_tdis_i_1;
  (* syn_preserve = "true" *)  reg trg_tdis_i_2;
  (* syn_preserve = "true" *)  reg trg_tdis_i_3;
  (* syn_keep = "true" *)      wire voted_trg_tdis_i_1;
  (* syn_keep = "true" *)      wire voted_trg_tdis_i_2;
  (* syn_keep = "true" *)      wire voted_trg_tdis_i_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign DAQ_TDIS   = (DAQ_TDIS_1   & DAQ_TDIS_2  ) | (DAQ_TDIS_2   & DAQ_TDIS_3  ) | (DAQ_TDIS_1   & DAQ_TDIS_3  ); // Majority logic
  assign TRG_TDIS   = (TRG_TDIS_1   & TRG_TDIS_2  ) | (TRG_TDIS_2   & TRG_TDIS_3  ) | (TRG_TDIS_1   & TRG_TDIS_3  ); // Majority logic
  assign voted_cnt_1        = (cnt_1        & cnt_2       ) | (cnt_2        & cnt_3       ) | (cnt_1        & cnt_3       ); // Majority logic
  assign voted_cnt_2        = (cnt_1        & cnt_2       ) | (cnt_2        & cnt_3       ) | (cnt_1        & cnt_3       ); // Majority logic
  assign voted_cnt_3        = (cnt_1        & cnt_2       ) | (cnt_2        & cnt_3       ) | (cnt_1        & cnt_3       ); // Majority logic
  assign voted_daq_tdis_i_1 = (daq_tdis_i_1 & daq_tdis_i_2) | (daq_tdis_i_2 & daq_tdis_i_3) | (daq_tdis_i_1 & daq_tdis_i_3); // Majority logic
  assign voted_daq_tdis_i_2 = (daq_tdis_i_1 & daq_tdis_i_2) | (daq_tdis_i_2 & daq_tdis_i_3) | (daq_tdis_i_1 & daq_tdis_i_3); // Majority logic
  assign voted_daq_tdis_i_3 = (daq_tdis_i_1 & daq_tdis_i_2) | (daq_tdis_i_2 & daq_tdis_i_3) | (daq_tdis_i_1 & daq_tdis_i_3); // Majority logic
  assign voted_trg_tdis_i_1 = (trg_tdis_i_1 & trg_tdis_i_2) | (trg_tdis_i_2 & trg_tdis_i_3) | (trg_tdis_i_1 & trg_tdis_i_3); // Majority logic
  assign voted_trg_tdis_i_2 = (trg_tdis_i_1 & trg_tdis_i_2) | (trg_tdis_i_2 & trg_tdis_i_3) | (trg_tdis_i_1 & trg_tdis_i_3); // Majority logic
  assign voted_trg_tdis_i_3 = (trg_tdis_i_1 & trg_tdis_i_2) | (trg_tdis_i_2 & trg_tdis_i_3) | (trg_tdis_i_1 & trg_tdis_i_3); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 2'bxx; // default to x because default_state_is_x is set
    nextstate_2 = 2'bxx; // default to x because default_state_is_x is set
    nextstate_3 = 2'bxx; // default to x because default_state_is_x is set
    DAQ_TDIS_1 = voted_daq_tdis_i_1; // default
    DAQ_TDIS_2 = voted_daq_tdis_i_2; // default
    DAQ_TDIS_3 = voted_daq_tdis_i_3; // default
    TRG_TDIS_1 = voted_trg_tdis_i_1; // default
    TRG_TDIS_2 = voted_trg_tdis_i_2; // default
    TRG_TDIS_3 = voted_trg_tdis_i_3; // default
    case (voted_state_1)
      Idle  : if (STRTUP_OP_RST || DAQ_OP_RST || TRG_OP_RST)     nextstate_1 = Tx_Dis;
              else                                               nextstate_1 = Idle;
      Tx_Dis: if (voted_cnt_1 == PULSE_DUR)                      nextstate_1 = Wait;
              else                                               nextstate_1 = Tx_Dis;
      Wait  : if (!(STRTUP_OP_RST || DAQ_OP_RST || TRG_OP_RST))  nextstate_1 = Idle;
              else                                               nextstate_1 = Wait;
    endcase
    case (voted_state_2)
      Idle  : if (STRTUP_OP_RST || DAQ_OP_RST || TRG_OP_RST)     nextstate_2 = Tx_Dis;
              else                                               nextstate_2 = Idle;
      Tx_Dis: if (voted_cnt_2 == PULSE_DUR)                      nextstate_2 = Wait;
              else                                               nextstate_2 = Tx_Dis;
      Wait  : if (!(STRTUP_OP_RST || DAQ_OP_RST || TRG_OP_RST))  nextstate_2 = Idle;
              else                                               nextstate_2 = Wait;
    endcase
    case (voted_state_3)
      Idle  : if (STRTUP_OP_RST || DAQ_OP_RST || TRG_OP_RST)     nextstate_3 = Tx_Dis;
              else                                               nextstate_3 = Idle;
      Tx_Dis: if (voted_cnt_3 == PULSE_DUR)                      nextstate_3 = Wait;
              else                                               nextstate_3 = Tx_Dis;
      Wait  : if (!(STRTUP_OP_RST || DAQ_OP_RST || TRG_OP_RST))  nextstate_3 = Idle;
              else                                               nextstate_3 = Wait;
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
      cnt_1 <= 12'h000;
      cnt_2 <= 12'h000;
      cnt_3 <= 12'h000;
      daq_tdis_i_1 <= 0;
      daq_tdis_i_2 <= 0;
      daq_tdis_i_3 <= 0;
      trg_tdis_i_1 <= 0;
      trg_tdis_i_2 <= 0;
      trg_tdis_i_3 <= 0;
    end
    else begin
      cnt_1 <= voted_cnt_1; // default
      cnt_2 <= voted_cnt_2; // default
      cnt_3 <= voted_cnt_3; // default
      daq_tdis_i_1 <= 0; // default
      daq_tdis_i_2 <= 0; // default
      daq_tdis_i_3 <= 0; // default
      trg_tdis_i_1 <= 0; // default
      trg_tdis_i_2 <= 0; // default
      trg_tdis_i_3 <= 0; // default
      case (nextstate_1)
        Idle  :        cnt_1 <= 12'h000;
        Tx_Dis: begin
                       cnt_1 <= voted_cnt_1 + 1;
                       daq_tdis_i_1 <= STRTUP_OP_RST || DAQ_OP_RST || voted_daq_tdis_i_1;
                       trg_tdis_i_1 <= STRTUP_OP_RST || TRG_OP_RST || voted_trg_tdis_i_1;
        end
      endcase
      case (nextstate_2)
        Idle  :        cnt_2 <= 12'h000;
        Tx_Dis: begin
                       cnt_2 <= voted_cnt_2 + 1;
                       daq_tdis_i_2 <= STRTUP_OP_RST || DAQ_OP_RST || voted_daq_tdis_i_2;
                       trg_tdis_i_2 <= STRTUP_OP_RST || TRG_OP_RST || voted_trg_tdis_i_2;
        end
      endcase
      case (nextstate_3)
        Idle  :        cnt_3 <= 12'h000;
        Tx_Dis: begin
                       cnt_3 <= voted_cnt_3 + 1;
                       daq_tdis_i_3 <= STRTUP_OP_RST || DAQ_OP_RST || voted_daq_tdis_i_3;
                       trg_tdis_i_3 <= STRTUP_OP_RST || TRG_OP_RST || voted_trg_tdis_i_3;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [47:0] statename;
  always @* begin
    case (state_1)
      Idle  :  statename = "Idle";
      Tx_Dis:  statename = "Tx_Dis";
      Wait  :  statename = "Wait";
      default: statename = "XXXXXX";
    endcase
  end
  `endif

endmodule

