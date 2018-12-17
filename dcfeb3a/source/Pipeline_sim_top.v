`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:06 03/16/2011 
// Design Name: 
// Module Name:    Pipeline_sim_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Pipeline_sim_top(
    input CMS_CLK_P,CMS_CLK_N,
    input CMS80_P,CMS80_N,
    input QPLL_CLK_AC_P,QPLL_CLK_AC_N,
    input XO_CLK_AC_P,XO_CLK_AC_N,
    input ALTXO_CLK_AC_P,ALTXO_CLK_AC_N,
	 input TMB_CLK_P,TMB_CLK_N,
    input G1ADCLK0P,G1ADCLK0N,
    input G1ADCLK1P,G1ADCLK1N,
    input G2ADCLK0P,G2ADCLK0N,
    input G2ADCLK1P,G2ADCLK1N,
    input G3ADCLK0P,G3ADCLK0N,
    input G3ADCLK1P,G3ADCLK1N,
    input G4ADCLK0P,G4ADCLK0N,
    input G4ADCLK1P,G4ADCLK1N,
    input G5ADCLK0P,G5ADCLK0N,
    input G5ADCLK1P,G5ADCLK1N,
    input G6ADCLK0P,G6ADCLK0N,
    input G6ADCLK1P,G6ADCLK1N,
    input G1LCLK0P,G1LCLK0N,
    input G1LCLK1P,G1LCLK1N,
    input G2LCLK0P,G2LCLK0N,
    input G2LCLK1P,G2LCLK1N,
    input G3LCLK0P,G3LCLK0N,
    input G3LCLK1P,G3LCLK1N,
    input G4LCLK0P,G4LCLK0N,
    input G4LCLK1P,G4LCLK1N,
    input G5LCLK0P,G5LCLK0N,
    input G5LCLK1P,G5LCLK1N,
    input G6LCLK0P,G6LCLK0N,
    input G6LCLK1P,G6LCLK1N,
    input [15:0] G1AD_P,G1AD_N,
    input [15:0] G2AD_P,G2AD_N,
    input [15:0] G3AD_P,G3AD_N,
    input [15:0] G4AD_P,G4AD_N,
    input [15:0] G5AD_P,G5AD_N,
    input [15:0] G6AD_P,G6AD_N,
    input RST,
    input L1A
    );
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Clock source and management                                            //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

	wire cms80;
	wire daq_tx_125_refclk;
	wire trg_tx_160_refclk;
	wire daq_tx_200_refclk;
	wire tmb_clk;


   wire daq_rx_sd;
	wire daq_tx_pll_lock,daq_txresetdone;
	wire daq_txreset,daq_pll_txreset,daq_gtxtxreset;
	wire trg_rx_sd;
	wire trg_txresetdone;
	wire trg_gtxtxreset;

	wire trg_txoutclk,trg_tx_pll_lock,trg_data_clk, trg_txusrclk;
	wire daq_txoutclk,daq_data_clk;
	wire trg_mmcm_lock;
	wire clk200,clk160,clk120,clk80,clk40,clk20,clk20_180,clk10;
	wire daq_mmcm_rst, daq_mmcm_lock;
	wire strtup_clk, eos;
	wire frm_clk_src;
	wire frame_clock;
	wire bit_clk_odd;
	wire bit_clk_even;
	wire frm_lock;
	wire adc_clk;

   wire TP_B35_0N,TP_B35_0P; 

	Clock_sources
	Clk_src1(
	   // External inputs
		.CMS_CLK_N(CMS_CLK_N), .CMS_CLK_P(CMS_CLK_P),                      // from QPLL
		.CMS80_N(CMS80_N), .CMS80_P(CMS80_P),                              // from QPLL
		.QPLL_CLK_AC_N(QPLL_CLK_AC_N), .QPLL_CLK_AC_P(QPLL_CLK_AC_P),      // alternate clock 160 MHz Ref for TRG GTX (from QPLL)
		.XO_CLK_AC_N(XO_CLK_AC_N), .XO_CLK_AC_P(XO_CLK_AC_P),              // Crystal Osc. 125 MHz    Ref for DAQ GTX for GbE
		.ALTXO_CLK_AC_N(ALTXO_CLK_AC_N), .ALTXO_CLK_AC_P(ALTXO_CLK_AC_P),  // Alternate Crystal Osc. 200 MHz alt. ref for DAQ GTX and for I/O delays
		.TMB_CLK_N(TMB_CLK_N), .TMB_CLK_P(TMB_CLK_P),                            // From TMB Skewclear connector
		.GC0N(GC0N), .GC0P(GC0P), .GC1N(GC1N), .GC1P(GC1P), .GC2N(GC2N), .GC2P(GC2P), // Spare global clock inputs
		.TP_B35_0N(TP_B35_0N), .TP_B35_0P(TP_B35_0P),                                  // Test point clock output
	   // Internal outputs
		.CMS80(cms80),
		.DAQ_TX_125_REFCLK(daq_tx_125_refclk),
		.TRG_TX_160_REFCLK(trg_tx_160_refclk),
		.DAQ_TX_200_REFCLK(daq_tx_200_refclk),
		.TMB_CLK(tmb_clk),
		.DAQ_TXOUTCLK(daq_txoutclk),      // from DAQ GTX tx
		.DAQ_DATA_CLK(daq_data_clk),      // to DAQ GTX and fabric
		.TRG_TXOUTCLK(trg_txoutclk),      // from TRG GTX tx
		.TRG_TX_PLL_LOCK(trg_tx_pll_lock),// from TRG GTX tx
		.TRG_DATA_CLK(trg_data_clk),      // to DAQ GTX and fabric
		.TRG_TXUSRCLK(trg_txusrclk),      // to DAQ GTX
		.TRG_MMCM_LOCK(trg_mmcm_lock),
		.CLK200(clk200),
		.CLK160(clk160),
		.CLK120(clk120),
		.CLK80(clk80),
		.CLK40(clk40),
		.CLK20(clk20),
		.CLK20_180(clk20_180),    // 20 MHz clock phase shifted 180 degrees
		.CLK10(clk10),
		.ADC_CLK(adc_clk),
		.DAQ_MMCM_RST(mmcm_rst),
		.DAQ_MMCM_LOCK(daq_mmcm_lock),
		.STRTUP_CLK(strtup_clk),           // internal config clock for power on state machines in reset manager
		.EOS(eos)                         // End Of Startup
	);
  
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Optical Transceiver signals and GTX signals                            //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////


	transceiver_io
	xcvr_io1 (
		// External signals
		.DAQ_SIGDET(1'b0),                 // receiver signal detected
		.DAQ_RX_N(DAQ_RX_N),.DAQ_RX_P(DAQ_RX_P), // high speed serial input
		.DAQ_TDIS(DAQ_TDIS),                     // disable optical transmission
		.DAQ_TX_N(DAQ_TX_N),.DAQ_TX_P(DAQ_TX_P), // high speed serial output
		.TRG_SIGDET(1'b0),                 // receiver signal detected
		.TRG_RX_N(TRG_RX_N),.TRG_RX_P(TRG_RX_P), // high speed serial input
		.TRG_TDIS(TRG_TDIS),                     // disable optical transmission
		.TRG_TX_N(TRG_TX_N),.TRG_TX_P(TRG_TX_P), // high speed serial output
		// Internal signals
		.DAQ_TX_REFCLK(daq_tx_125_refclk),       // 125 MHz for GbE
		.DAQ_DATA_CLK(daq_data_clk),
		.DAQ_TXRESET(1'b0),
		.DAQ_PLL_TXRESET(1'b0),
		.DAQ_GTXTXRESET(RST),
		.DAQ_SD(daq_rx_sd),
		.DAQ_TX_PLL_LOCK(daq_tx_pll_lock),
		.DAQ_TXRESETDONE(daq_txresetdone),
		.DAQ_TXOUTCLK(daq_txoutclk),
		
		.TRG_TX_REFCLK(trg_tx_160_refclk),       // 160 MHz for comparator data
		.TRG_TXUSRCLK(trg_txusrclk),
		.TRG_DATA_CLK(trg_data_clk),
		.TRG_GTXTXRESET(RST),
		.TRG_SD(trg_rx_sd),
		.TRG_TX_PLL_LOCK(trg_tx_pll_lock),
		.TRG_TXRESETDONE(trg_txresetdone),
		.TRG_TXOUTCLK(trg_txoutclk)
  );
 
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  ADC Serial data input signals and bit clock/ frame clock inputs        //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
 
  wire bit_slip_odd;
  wire bit_slip_evn;
	wire [191:0] g1daq16ch,g2daq16ch,g3daq16ch,g4daq16ch,g5daq16ch,g6daq16ch;

	adc_data_input
	adc_data_in1(
		// Differential Serial Data Inputs
		.G1AD_N(G1AD_N),.G1AD_P(G1AD_P),
		.G2AD_N(G2AD_N),.G2AD_P(G2AD_P),
		.G3AD_N(G3AD_N),.G3AD_P(G3AD_P),
		.G4AD_N(G4AD_N),.G4AD_P(G4AD_P),
		.G5AD_N(G5AD_N),.G5AD_P(G5AD_P),
		.G6AD_N(G6AD_N),.G6AD_P(G6AD_P),
		// Differential Frame Clock Inputs
		.G1ADCLK0N(G1ADCLK0N),.G1ADCLK0P(G1ADCLK0P),
		.G1ADCLK1N(G1ADCLK1N),.G1ADCLK1P(G1ADCLK1P),
		.G2ADCLK0N(G2ADCLK0N),.G2ADCLK0P(G2ADCLK0P),
		.G2ADCLK1N(G2ADCLK1N),.G2ADCLK1P(G2ADCLK1P),
		.G3ADCLK0N(G3ADCLK0N),.G3ADCLK0P(G3ADCLK0P),
		.G3ADCLK1N(G3ADCLK1N),.G3ADCLK1P(G3ADCLK1P),
		.G4ADCLK0N(G4ADCLK0N),.G4ADCLK0P(G4ADCLK0P),
		.G4ADCLK1N(G4ADCLK1N),.G4ADCLK1P(G4ADCLK1P),
		.G5ADCLK0N(G5ADCLK0N),.G5ADCLK0P(G5ADCLK0P),
		.G5ADCLK1N(G5ADCLK1N),.G5ADCLK1P(G5ADCLK1P),
		.G6ADCLK0N(G6ADCLK0N),.G6ADCLK0P(G6ADCLK0P),
		.G6ADCLK1N(G6ADCLK1N),.G6ADCLK1P(G6ADCLK1P),
		// Differential Bit Clock Inputs
		.G1LCLK0N(G1LCLK0N),.G1LCLK0P(G1LCLK0P),
		.G1LCLK1N(G1LCLK1N),.G1LCLK1P(G1LCLK1P),
		.G2LCLK0N(G2LCLK0N),.G2LCLK0P(G2LCLK0P),
		.G2LCLK1N(G2LCLK1N),.G2LCLK1P(G2LCLK1P),
		.G3LCLK0N(G3LCLK0N),.G3LCLK0P(G3LCLK0P),
		.G3LCLK1N(G3LCLK1N),.G3LCLK1P(G3LCLK1P),
		.G4LCLK0N(G4LCLK0N),.G4LCLK0P(G4LCLK0P),
		.G4LCLK1N(G4LCLK1N),.G4LCLK1P(G4LCLK1P),
		.G5LCLK0N(G5LCLK0N),.G5LCLK0P(G5LCLK0P),
		.G5LCLK1N(G5LCLK1N),.G5LCLK1P(G5LCLK1P),
		.G6LCLK0N(G6LCLK0N),.G6LCLK0P(G6LCLK0P),
		.G6LCLK1N(G6LCLK1N),.G6LCLK1P(G6LCLK1P),
	   // Clocks and Resets
		.RST(RST || ~daq_mmcm_lock),
	   .BIT_SLIP_ODD(bit_slip_odd),                // Bit Slip operation for deserializers
	   .BIT_SLIP_EVN(bit_slip_evn),                // Bit Slip operation for deserializers
	   .DELAY_REF_CLK(clk200),             // Reference clock for I/O delay control (200MHz)
		.G1FRM_CLK0(g1_frm_clk0),    // Frame Clock for G1 ADC0 data
		.G1FRM_CLK1(g1_frm_clk1),    // Frame Clock for G1 ADC1 data
		.G2FRM_CLK0(g2_frm_clk0),    // Frame Clock for G2 ADC0 data
		.G2FRM_CLK1(g2_frm_clk1),    // Frame Clock for G2 ADC1 data
		.G3FRM_CLK0(g3_frm_clk0),    // Frame Clock for G3 ADC0 data
		.G3FRM_CLK1(g3_frm_clk1),    // Frame Clock for G3 ADC1 data
		.G4FRM_CLK0(g4_frm_clk0),    // Frame Clock for G4 ADC0 data
		.G4FRM_CLK1(g4_frm_clk1),    // Frame Clock for G4 ADC1 data
		.G5FRM_CLK0(g5_frm_clk0),    // Frame Clock for G5 ADC0 data
		.G5FRM_CLK1(g5_frm_clk1),    // Frame Clock for G5 ADC1 data
		.G6FRM_CLK0(g6_frm_clk0),    // Frame Clock for G6 ADC0 data
		.G6FRM_CLK1(g6_frm_clk1),    // Frame Clock for G6 ADC1 data
		// Deserialized outputs - 16 channels of 12 bits flattend into single vectors (channel 15 in high order bits, 0 in low)
		.G1DAQ16CH(g1daq16ch),
		.G2DAQ16CH(g2daq16ch),
		.G3DAQ16CH(g3daq16ch),
		.G4DAQ16CH(g4daq16ch),
		.G5DAQ16CH(g5daq16ch),
		.G6DAQ16CH(g6daq16ch)
	);
	
	
   wire rstrt_pipe;
	wire [8:0] pdepth;
	wire [191:0] g1pipout,g2pipout,g3pipout,g4pipout,g5pipout,g6pipout;
	
pipeline
pipeline1(
    .G1_WRCLK0(g1_frm_clk0),   //Frame clock from adc's
    .G1_WRCLK1(g1_frm_clk1),   //Frame clock from adc's
    .G2_WRCLK0(g2_frm_clk0),   //Frame clock from adc's
    .G2_WRCLK1(g2_frm_clk1),   //Frame clock from adc's
    .G3_WRCLK0(g3_frm_clk0),   //Frame clock from adc's
    .G3_WRCLK1(g3_frm_clk1),   //Frame clock from adc's
    .G4_WRCLK0(g4_frm_clk0),   //Frame clock from adc's
    .G4_WRCLK1(g4_frm_clk1),   //Frame clock from adc's
    .G5_WRCLK0(g5_frm_clk0),   //Frame clock from adc's
    .G5_WRCLK1(g5_frm_clk1),   //Frame clock from adc's
    .G6_WRCLK0(g6_frm_clk0),   //Frame clock from adc's
    .G6_WRCLK1(g6_frm_clk1),   //Frame clock from adc's
	 .RDCLK(clk20),             // 20 MHz clock in phase with CMS clock 
    .RST(RST | ~daq_mmcm_lock),  //Make sure pipeline is not started until valid clocks
    .RESTART(rstrt_pipe),        //Restart pipeline from JTAG command
    .PDEPTH(pdepth),             //Pipeline depth from JTAG Reg
    .G1DAQ16CH(g1daq16ch),       //Deserialized data from group 1 amp channels
    .G2DAQ16CH(g2daq16ch),
    .G3DAQ16CH(g3daq16ch),
    .G4DAQ16CH(g4daq16ch),
    .G5DAQ16CH(g5daq16ch),
    .G6DAQ16CH(g6daq16ch),
    .G1PIPOUT(g1pipout),
    .G2PIPOUT(g2pipout),
    .G3PIPOUT(g3pipout),
    .G4PIPOUT(g4pipout),
    .G5PIPOUT(g5pipout),
    .G6PIPOUT(g6pipout)
    );

 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  FIFO 16 channels (x12 bits) wide.                                      //
 //  Group G1 to G6 in sequence for sample 1,                               //
 //  then same for sample 2 and so on.                                      //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

wire rdfifo;
wire [191:0] doutfifo;
reg sync_l1a;

always @(posedge clk40) sync_l1a <= L1A;

fifo16ch_wide
fifo1 (
    .CLK40(clk40),
	 .SMPCLK(clk20),
    .WRCLK(clk120),
    .RST(RST | ~daq_mmcm_lock),
    .L1A(sync_l1a),
    .G1IN(g1pipout),
    .G2IN(g2pipout),
    .G3IN(g3pipout),
    .G4IN(g4pipout),
    .G5IN(g5pipout),
    .G6IN(g6pipout),
    .RDEN(rdfifo),
    .DOUT(doutfifo)
    );

 
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  JTAG Accessible User Registers                                         //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
 
	wire [1:0] xl1dlyset;
	wire [3:0] loadpblk;
	wire [1:0] comp_mode;
	wire [2:0] comp_time;
	wire cdac_enb;
	wire cdac_dat;
	wire [6:1] to_bky;
	wire [6:1] bky_clk;
	wire [6:1] bky_rtn = 6'h00;
	wire [15:0] status;
	wire [25:0] adc_mem;
	wire [11:0] adc_mask;

   wire all;
	wire shclk, shin;
	wire [6:1] msel;
   wire [7:1] mout;
   wire drck1;
   wire jsel1;
   wire jshift1;
   wire capture1;
   wire update1;
   wire tck1;
   wire tdi1;
   wire tms1;
   wire tdo1;
   wire drck2;
   wire jsel2;
   wire jshift2;
   wire capture2;
   wire update2;
   wire tck2;
   wire tdi2;
   wire tms2;
   wire tdo2;
	wire tdofb;
	wire [23:0] f;
	wire dshift;
   wire [6:1] bky_mask;
	
	
	jtag_access
	jtag_acc1(
      .CLK20(clk20),      // 20 MHz Clock
      .CLK40(clk40),      // 40 MHz Clock
      .FSTCLK(clk160),    // 160 MHz Clock
      .RST(RST),      // Reset default state
		.BKY_RTN(bky_rtn),  // Serial data returned from amplifiers
		.STATUS(status),    // Status word
		.ADCDATA(doutfifo),    // Data out of pipeline
		
		.RDFIFO(rdfifo),            // Advance fifo to next word
      .XL1DLYSET(xl1dlyset),      // Extra L1A delay setting [1:0]
      .LOADPBLK(loadpblk),        // Pre-blockend bits [3:0] not used in DCFEB
		.COMP_MODE(comp_mode),      // comparator mode bits [1:0]
		.COMP_TIME(comp_time),      // comparator timing bits [2:0]
		.CDAC_ENB(cdac_enb),        // Comparator DAC enable_bar (active low)
		.CDAC_CK(cdac_ck),          // Comparator DAC clock
		.CDAC_DAT(cdac_dat),        // Comparator DAC data
		.TO_BKY(to_bky),            // Serial data sent to amplifiers
		.BKY_CLK(bky_clk),          // Shift clock for amplifiers
		.ADC_WE(adc_we),            // Write enable for ADC configuration memory
		.ADC_MEM(adc_mem),          // Data word for ADC configuration memory
		.ADC_MASK(adc_mask),        // Mask for ADCs to configure
		.ADC_INIT(jtag_adc_init),   // ADC initialization signal
      .RSTRT_PIPE(rstrt_pipe),    // Restart pipeline on JTAG command
      .PDEPTH(pdepth),            // Pipeline Depth register (9 bits)
	   .BIT_SLIP_ODD(bit_slip_odd),        // Bit Slip operation for deserializers
	   .BIT_SLIP_EVN(bit_slip_evn),        // Bit Slip operation for deserializers
      .all(all),
      .shclk(shclk),
      .shin(shin),
      .msel(msel),
      .mout(mout),
      .drck1(drck1),
      .jsel1(jsel1),
      .jshift1(jshift1),
      .capture1(capture1),
      .update1(update1),
      .tck1(tck1),
      .tdi1(tdi1),
      .tms1(tms1),
      .tdo1(tdo1),
      .drck2(drck2),
      .jsel2(jsel2),
      .jshift2(jshift2),
      .capture2(capture2),
      .update2(update2),
      .tck2(tck2),
      .tdi2(tdi2),
      .tms2(tms2),
      .tdo2(tdo2),
	   .tdofb(tdofb),
	   .f(f),
		.dshift(dshift),
		.bky_mask(bky_mask)
   );
	
 

endmodule
