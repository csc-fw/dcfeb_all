
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2016:06:27 at 14:57:51 (www.fizzim.com)

module op_link_rst_FSM 
  #(
    parameter PULSE_DUR = 12'd4000
  )(
  output reg DAQ_TDIS,
  output reg TRG_TDIS,
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

  reg [1:0] state;


  reg [1:0] nextstate;


  reg [11:0] cnt;
  reg daq_tdis_i;
  reg trg_tdis_i;

  // comb always block
  always @* begin
    nextstate = 2'bxx; // default to x because default_state_is_x is set
    DAQ_TDIS = daq_tdis_i; // default
    TRG_TDIS = trg_tdis_i; // default
    case (state)
      Idle  : if (STRTUP_OP_RST || DAQ_OP_RST || TRG_OP_RST)     nextstate = Tx_Dis;
              else                                               nextstate = Idle;
      Tx_Dis: if (cnt == PULSE_DUR)                              nextstate = Wait;
              else                                               nextstate = Tx_Dis;
      Wait  : if (!(STRTUP_OP_RST || DAQ_OP_RST || TRG_OP_RST))  nextstate = Idle;
              else                                               nextstate = Wait;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST)
      state <= Idle;
    else
      state <= nextstate;
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      cnt <= 12'h000;
      daq_tdis_i <= 0;
      trg_tdis_i <= 0;
    end
    else begin
      cnt <= cnt; // default
      daq_tdis_i <= 0; // default
      trg_tdis_i <= 0; // default
      case (nextstate)
        Idle  :        cnt <= 12'h000;
        Tx_Dis: begin
                       cnt <= cnt + 1;
                       daq_tdis_i <= STRTUP_OP_RST || DAQ_OP_RST || daq_tdis_i;
                       trg_tdis_i <= STRTUP_OP_RST || TRG_OP_RST || trg_tdis_i;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [47:0] statename;
  always @* begin
    case (state)
      Idle  :  statename = "Idle";
      Tx_Dis:  statename = "Tx_Dis";
      Wait  :  statename = "Wait";
      default: statename = "XXXXXX";
    endcase
  end
  `endif

endmodule

