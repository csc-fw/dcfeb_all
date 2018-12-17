
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2018:11:14 at 14:13:58 (www.fizzim.com)

module Pow_on_Rst_FSM 
  #(
    parameter POR_tmo = 120,
    parameter Strt_dly = 20'h7FFFF
  )(
  output reg MMCM_RST,
  output reg POR,
  output reg RUN,
  input CLK,
  input EOS,
  input MMCM_LOCK,
  input QPLL_LOCK 
);

  // state bits
  parameter 
  Idle       = 2'b00, 
  Pow_on_Rst = 2'b01, 
  Run_State  = 2'b10, 
  W4SysClk   = 2'b11; 

  reg [1:0] state;


  reg [1:0] nextstate;


  reg [6:0] por_cnt;
  reg [19:0] strtup_cnt;

  // comb always block
  always @* begin
    nextstate = 2'bxx; // default to x because default_state_is_x is set
    case (state)
      Idle      : if      (strtup_cnt == Strt_dly)  nextstate = W4SysClk;
                  else                              nextstate = Idle;
      Pow_on_Rst: if      (!MMCM_LOCK)              nextstate = Idle;
                  else if (por_cnt == POR_tmo)      nextstate = Run_State;
                  else                              nextstate = Pow_on_Rst;
      Run_State :                                   nextstate = Run_State;
      W4SysClk  : if      (MMCM_LOCK)               nextstate = Pow_on_Rst;
                  else                              nextstate = W4SysClk;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or negedge EOS) begin
    if (!EOS)
      state <= Idle;
    else
      state <= nextstate;
  end

  // datapath sequential always block
  always @(posedge CLK or negedge EOS) begin
    if (!EOS) begin
      MMCM_RST <= 1;
      POR <= 1;
      RUN <= 0;
      por_cnt <= 7'h00;
      strtup_cnt <= 20'h00000;
    end
    else begin
      MMCM_RST <= 0; // default
      POR <= 0; // default
      RUN <= 0; // default
      por_cnt <= 7'h00; // default
      strtup_cnt <= 20'h00000; // default
      case (nextstate)
        Idle      : begin
                           MMCM_RST <= 1;
                           POR <= 1;
                           strtup_cnt <= strtup_cnt + 1;
        end
        Pow_on_Rst: begin
                           POR <= 1;
                           por_cnt <= por_cnt + 1;
        end
        Run_State :        RUN <= 1;
        W4SysClk  :        POR <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [79:0] statename;
  always @* begin
    case (state)
      Idle      : statename = "Idle";
      Pow_on_Rst: statename = "Pow_on_Rst";
      Run_State : statename = "Run_State";
      W4SysClk  : statename = "W4SysClk";
      default   : statename = "XXXXXXXXXX";
    endcase
  end
  `endif

endmodule

