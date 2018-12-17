`timescale 1ns / 1ps
`define DLY #1

module sep_tx_rx_sim_top(
   input SYS_RST,
	input QPLL_CLK_AC_P,QPLL_CLK_AC_N,
	input [7:0] G1C_LV, G2C_LV, G3C_LV, G4C_LV, G5C_LV, G6C_LV,  //Comparator data inputs
	output [1:0] CMODE,
	output [2:0] CTIME,
	output LCTCLK, LCTRST,
	output CDAC_ENB_LV_B, CDAC_CK_LV, CDAC_DAT_LV
);

	wire trg_sigdet;
	wire trg_rx_n,trg_rx_p;
   wire trg_tdis;
   wire trg_tx_p,trg_tx_n;
 	wire daq_tx_n,daq_tx_p;
	wire daq_rx_sd;
	wire cmp_tdis;
	wire trg_tx_160_refclk;
	wire trg_tx_160_refclk_dv2;
	wire comp_clk;
	wire comp_clk80;

	wire trg_txoutclk,trg_tx_pll_lock,trg_txusrclk;
	wire trg_mmcm_lock;

 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Comparator I/O and Comparator DAC control signals                      //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

	wire [7:0]g1c,g2c,g3c,g4c,g5c,g6c;
	wire [1:0]comp_mode;
	wire [2:0]comp_time;
	wire cdac_enb,cdac_ck,cdac_dat;
	
	assign comp_mode = 2'b10;
	assign comp_time = 3'b010;
	assign cdac_enb = 1'b0;
	assign cdaq_ck = 1'b0;
	assign cdaq_dat = 1'b0;
	
	comparator_io
	comp_io1 (
	   // External I/O
		.G1C_LV(G1C_LV), .G2C_LV(G2C_LV), .G3C_LV(G3C_LV), .G4C_LV(G4C_LV), .G5C_LV(G5C_LV), .G6C_LV(G6C_LV), // Comparator inputs
		.CMODE(CMODE),  // Comparator Mode output
		.CTIME(CTIME),  // Comparator Timing output
		.LCTCLK(LCTCLK), .LCTRST(LCTRST), //Comparator clock and reset
		.CDAC_ENB_LV_B(CDAC_ENB_LV_B), .CDAC_CK_LV(CDAC_CK_LV), .CDAC_DAT_LV(CDAC_DAT_LV),  // DAC signals for setting threshold
		// Internal signals
		.G1C(g1c), .G2C(g2c), .G3C(g3c), .G4C(g4c), .G5C(g5c), .G6C(g6c), // Encoded Di-Strip signals from Comparator
		.COMP_MODE(comp_mode),
		.COMP_TIME(comp_time),
		.LCT_CLK(comp_clk), .LCT_RST(trg_rst),
      .CDAC_ENB(cdac_enb), .CDAC_CK(cdac_ck), .CDAC_DAT(cdac_dat)
	);

 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Clock management for Trigger Path                                      //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

	IBUFDS_GTXE1 q3_clk1_refclk_ibufds_i (.O(trg_tx_160_refclk),.ODIV2(trg_tx_160_refclk_dv2),.CEB(1'b0),.I(QPLL_CLK_AC_P),.IB(QPLL_CLK_AC_N));
	
	trg_mmcm trg_mmcm1(.CLK_IN1(trg_txoutclk),.CLK_OUT1(trg_txusrclk),.CLK_OUT2(comp_clk80),.CLK_OUT3(comp_clk),.RESET(~trg_tx_pll_lock),.LOCKED(trg_mmcm_lock));




 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Trigger Path Optical Transceiver signals and GTX signals               //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
	wire trg_rx_sd;
	wire trg_gtxtxreset;
   wire trg_txresetdone;
	wire trg_tx_pllrst;
	reg trg_rst;
   wire tx_sync_done, rx_sync_done;
	wire ena_test_pat;
	wire strt_ltncy;
	wire strt_mtch;
	wire mon_tx_sel;
	wire [3:0] mon_trg_tx_isk;
	wire [31:0] mon_trg_tx_data;
	wire man_rst;
	wire ltncy_ce;
	wire cmp_rx_clk160;
	wire valid;
	wire match;
	wire [47:0] rcv_data;
	wire cew0,cew1,cew2,cew3;
	reg [7:0] ltncy;
	wire ltncy_trig_strt;
	wire ltncy_trig_stop;
	reg [15:0] err_cnt;
	wire pulse_in;
	wire pulse_out;

	assign trg_gtxtxreset = 0;
	assign trg_tx_pllrst = 0;
	assign man_rst = 0;
	assign ena_test_pat = 0;
	assign trg_sigdet =0;
	
	tmb_fiber_out #(
		.SIM_SPEEDUP(1)
	)
	tmb_fiber_out1 (
	   .RST(SYS_RST),
		// External signals
		.TRG_SIGDET(trg_sigdet),                 // receiver signal detected
		.TRG_RX_N(trg_rx_n),.TRG_RX_P(trg_rx_p), // high speed serial input
		.TRG_TDIS(trg_tdis),                     // disable optical transmission
		.TRG_TX_N(trg_tx_n),.TRG_TX_P(trg_tx_p), // high speed serial output
		// Internal signals
		.G1C(g1c), .G2C(g2c), .G3C(g3c), .G4C(g4c), .G5C(g5c), .G6C(g6c), // from comparators
		.TRG_TX_REFCLK(trg_tx_160_refclk),       // 160 MHz for comparator data
		.TRG_TXUSRCLK(trg_txusrclk),             // 160 MHz GTX parallel clock
		.TRG_CLK80(comp_clk80),                  //  80 MHz GTX User interface clock
 		.TRG_GTXTXRST(trg_gtxtxreset),           // GTX reset tx side
		.TRG_TX_PLLRST(trg_tx_pllrst),           // Reset Transmit PLL
		.TRG_RST(trg_rst),                       // Reset for Pseudo Random Bit Stream
		.ENA_TEST_PAT(ena_test_pat),             // Enable test with Pseudo Random Bit Stream
		.TRG_SD(trg_rx_sd),                      // Signal detect from optical xcvr buffered (receive side)
		.TRG_TXOUTCLK(trg_txoutclk),             // GTX txoutclk 80 MHz for MMCM input
		.TRG_TX_PLL_LOCK(trg_tx_pll_lock),       // tx side pll lock
		.TRG_TXRESETDONE(trg_txresetdone),       // tx side reset done
		.TX_SYNC_DONE(tx_sync_done),           // tx side phase alignment done
		.STRT_LTNCY(strt_ltncy),                 // signal to start latency counter
		.LTNCY_TRIG(ltncy_trig_strt),            // trigger for scope to start latency measurement
		.MON_TX_SEL(mon_tx_sel),
		.MON_TRG_TX_ISK(mon_trg_tx_isk),
		.MON_TRG_TX_DATA(mon_trg_tx_data)
  ); 
  
	always @(posedge comp_clk) begin
		trg_rst <= SYS_RST | man_rst | !tx_sync_done | !rx_sync_done;
	end
  	assign ltncy_ce = strt_ltncy & strt_mtch;
	always @(posedge cmp_rx_clk160 or posedge trg_rst) begin
	   if(trg_rst)
		   ltncy <= 8'h00;
		else if(ltncy_ce)
		   ltncy <= ltncy +1;
	end

	always @(posedge cmp_rx_clk160) begin
		if(strt_mtch)
			err_cnt = 16'h0000;
		else
			if(cew3 && valid && !match)
				err_cnt = err_cnt+1;
	end

	comp_fiber_in #(
		.USE_CHIPSCOPE(0),
		.SIM_SPEEDUP(1)
	)
	comp_fiber_in1 (
	   .RST(trg_rst),
		// External signals
		.CMP_SIGDET(1'b1),                 // receiver signal detected
		.CMP_RX_N(trg_tx_n),.CMP_RX_P(trg_tx_p), // high speed serial input
		.CMP_TDIS(cmp_tdis),                     // disable optical transmission
		.CMP_TX_N(daq_tx_n),.CMP_TX_P(daq_tx_p), // high speed serial output
		// Internal signals
		.CMP_RX_REFCLK(trg_tx_160_refclk),       // 160 MHz for comparator data
		.CMP_SD(daq_rx_sd),
		.CMP_RX_CLK160(cmp_rx_clk160),
		.STRT_MTCH(strt_mtch),
		.VALID(valid),
		.MATCH(match),
		.RCV_DATA(rcv_data),
		.CEW0(cew0),
		.CEW1(cew1),
		.CEW2(cew2),
		.CEW3(cew3),
		.LTNCY_TRIG(ltncy_trig_stop),
		.RX_SYNC_DONE(rx_sync_done)
  );
  
  
	
endmodule
