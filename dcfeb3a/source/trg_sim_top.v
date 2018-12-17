`timescale 1ns / 1ps
`define DLY #1

module trg_sim_top(
   input SYS_RST,
	input QPLL_CLK_AC_P,QPLL_CLK_AC_N
);

   wire trg_tdis;
   wire trg_tx_p,trg_tx_n;
 
	wire trg_tx_160_refclk;
	wire trg_tx_160_refclk_dv2;
	wire comp_clk;
	wire comp_clk80;

	wire trg_txoutclk,trg_tx_pll_lock,trg_txusrclk;
	wire trg_mmcm_lock;

	IBUFDS_GTXE1 q3_clk1_refclk_ibufds_i (.O(trg_tx_160_refclk),.ODIV2(trg_tx_160_refclk_dv2),.CEB(1'b0),.I(QPLL_CLK_AC_P),.IB(QPLL_CLK_AC_N));
	
	trg_mmcm trg_mmcm1(.CLK_IN1(trg_txoutclk),.CLK_OUT1(trg_txusrclk),.CLK_OUT2(comp_clk80),.CLK_OUT3(comp_clk),.RESET(~trg_tx_pll_lock),.LOCKED(trg_mmcm_lock));



 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Optical Transceiver signals and GTX signals                            //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

	wire trg_rx_sd;
   wire trg_txresetdone;
	wire trg_gtxtxreset;
	wire [35:0] csp_ctrl4 = 36'h000000000;
	wire [35:0] csp_ctrl5 = 36'h000000000;
	wire trg_clk_src_tmb;
	assign trg_gtxtxreset = 0;

	trg_32tx_16rx_io #(
		.USE_CHIPSCOPE(0),
		.SIM_SPEEDUP(1)
	)
	trg_xcvr_io1 (
		.CSP_CNTRL_VIO(csp_ctrl4),
		.CSP_CNTRL_LA(csp_ctrl5),
	   .RST(SYS_RST | ~trg_mmcm_lock),
		// External signals
		.TRG_SIGDET(1'b0),                 // receiver signal detected
		.TRG_RX_N(1'b1),.TRG_RX_P(1'b0), // high speed serial input
		.TRG_TDIS(TRG_TDIS),                     // disable optical transmission
		.TRG_TX_N(TRG_TX_N),.TRG_TX_P(TRG_TX_P), // high speed serial output
		// Internal signals
		.TRG_TX_REFCLK(trg_tx_160_refclk),       // 160 MHz for comparator data
		.TRG_TXUSRCLK(trg_txusrclk),
		.TRG_CLK80(comp_clk80),
		.TRG_CLK40(comp_clk),
		.TRG_GTXTXRST(trg_gtxtxreset),
		.TRG_SD(trg_rx_sd),
		.TRG_TX_PLL_LOCK(trg_tx_pll_lock),
		.TRG_TXRESETDONE(trg_txresetdone),
		.TRG_TXOUTCLK(trg_txoutclk),
		.TRG_CLK_SRC_TMB(trg_clk_src_tmb)      // Select clock source for trigger path (either TMB via Skewclear or QPLL 160MHz)
  );
  
  
  
	
endmodule
module DOUBLE_RESET
(
	input  	CLK,
	input  	PLLLKDET,
        output  GTXTEST_DONE,
	output 	GTXTEST_BIT1
);

   reg        	    plllkdet_sync;
   reg              plllkdet_r;
   reg 	  [10:0]    reset_dly_ctr;
   reg        	    reset_dly_done;
   reg    [3:0]	    testdone_f;


	always @(posedge CLK)
	begin
   	  plllkdet_r    	<= `DLY PLLLKDET;
   	  plllkdet_sync 	<= `DLY plllkdet_r;
   	end

	assign GTXTEST_BIT1  = reset_dly_done; 
        assign GTXTEST_DONE  = (reset_dly_ctr == 11'd0)? testdone_f[0] : 1'b0;

	always @(posedge CLK)
        begin
    	   if (!plllkdet_sync) 
              reset_dly_ctr 	<= `DLY 11'h7FF;
    	   else if (reset_dly_ctr != 11'h000)
              reset_dly_ctr 	<= `DLY reset_dly_ctr - 1'b1;
        end

	always @(posedge CLK)
        begin
    	   if (!plllkdet_sync) 
              reset_dly_done 	<= `DLY 1'b0;
    	   else if (reset_dly_ctr[10] == 1'b0) 
              reset_dly_done 	<= `DLY reset_dly_ctr[8];
        end

	always @(posedge CLK)
        begin
     	   if (reset_dly_ctr != 11'd0)
       	      testdone_f     	<= `DLY 4'b1111;
           else
              testdone_f     	<= `DLY {1'b0, testdone_f[3:1]};
        end

endmodule
