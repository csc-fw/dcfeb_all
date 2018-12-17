`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:31 03/10/2011 
// Design Name: 
// Module Name:    Clock_sources 
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
module Clock_sources (
    input CMS_CLK_N,
    input CMS_CLK_P,
    input CMS80_N,
    input CMS80_P,
    input QPLL_CLK_AC_N,
    input QPLL_CLK_AC_P,
    input XO_CLK_AC_N,
    input XO_CLK_AC_P,
    input GC0N,
    input GC0P,
    input GC1N,
    input GC1P,
    input GBT_DSKW_CLK0N,
    input GBT_DSKW_CLK0P,
	   // Internal inputs
	 input RST,
    input DAQ_MMCM_RST,
	   // Internal outputs
    output DAQ_TX_125_REFCLK,
    output DAQ_TX_125_REFCLK_DV2,
    output TRG_TX_160_REFCLK,
    output DAQ_MMCM_LOCK,
    output CLK40,
    output CLK20,
    output CLK1MHZ,
    output STRTUP_CLK,
	 output GBT_DSKW_CLK,
    output EOS
    );
    
  wire trg_tx_160_refclk_dv2;
  
  wire cms_clk;
  wire clk100k;
  wire q15;
  
  wire gc0,gc1;
  wire dmy_cclk, dmy_din, dmy_tck, preq;
  
wire pre_clk40;
wire pre_clk20, pre_clk20_b;
wire gbt_deskew_clk_0;

wire raw_startup_clk;



  
  
	IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_CMS_CLK (.O(cms_clk),.I(CMS_CLK_P),.IB(CMS_CLK_N));
	IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_CMS80 (.O(CMS80),.I(CMS80_P),.IB(CMS80_N));
	IBUFDS_GTXE1 q3_clk0_refclk_ibufds_i (.O(DAQ_TX_125_REFCLK),.ODIV2(DAQ_TX_125_REFCLK_DV2),.CEB(1'b0),.I(XO_CLK_AC_P),.IB(XO_CLK_AC_N));
	IBUFDS_GTXE1 q3_clk1_refclk_ibufds_i (.O(TRG_TX_160_REFCLK),.ODIV2(trg_tx_160_refclk_dv2),.CEB(1'b0),.I(QPLL_CLK_AC_P),.IB(QPLL_CLK_AC_N));
	IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_GC0 (.O(gc0),.I(GC0P),.IB(GC0N));
	IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_GC1 (.O(gc1),.I(GC1P),.IB(GC1N));
	IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_DSKW_CLK (.O(gbt_deskew_clk_0),.I(GBT_DSKW_CLK0P),.IB(GBT_DSKW_CLK0N));



//
//----------------------------------------------------------------------------
// "Output    Output      Phase     Duty      Pk-to-Pk        Phase"
// "Clock    Freq (MHz) (degrees) Cycle (%) Jitter (ps)  Error (ps)"
//----------------------------------------------------------------------------
// CLK_OUT1____40.000______0.000______50.0______247.096____196.976
// CLK_OUT2___160.000______0.000______50.0______169.112____196.976
// CLK_OUT3___120.000______0.000______50.0______180.794____196.976
// CLK_OUT4____20.000______0.000______50.0______298.160____196.976
// CLK_OUT5_____1.000______0.000______50.0______357.000____196.976
//
//----------------------------------------------------------------------------
// "Input Clock   Freq (MHz)    Input Jitter (UI)"
//----------------------------------------------------------------------------
// __primary__________40.000____________0.010


daq_mmcm_custom daq_mmc1(.CLK_IN1(cms_clk),
	.CLK_OUT1_RAW(pre_clk40),
	.CLK_OUT2(CLK160),
	.CLK_OUT3(CLK120),
	.CLK_OUT4_RAW(pre_clk20),.CLK_OUT4_B_RAW(pre_clk20_b),
	.CLK_OUT5(CLK1MHZ),
	.RESET(DAQ_MMCM_RST),
	.LOCKED(DAQ_MMCM_LOCK));

  BUFG clk40_buf (
	.O   (CLK40),
	.I   (pre_clk40)
	);

  BUFG clk20_buf (
	.O   (CLK20),
	.I   (pre_clk20)
	);

   STARTUP_VIRTEX6 #(
      .PROG_USR("FALSE")  // Activate program event security feature
   )
   strt_up_v6 (
      .CFGCLK(dmy_cclk),       // 1-bit output Configuration main clock output
      .CFGMCLK(raw_startup_clk),     // 1-bit output Configuration internal oscillator clock output
      .DINSPI(dmy_din),       // 1-bit output DIN SPI PROM access output
      .EOS(EOS),             // 1-bit output Active high output signal indicating the End Of Configuration.
      .PREQ(preq),           // 1-bit output PROGRAM request to fabric output
      .TCKSPI(dmy_tck),       // 1-bit output TCK configuration pin access output
      .CLK(1'b0),             // 1-bit input User start-up clock input
      .GSR(1'b0),             // 1-bit input Global Set/Reset input (GSR cannot be used for the port name)
      .GTS(1'b0),             // 1-bit input Global 3-state input (GTS cannot be used for the port name)
      .KEYCLEARB(1'b0), // 1-bit input Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
      .PACK(1'b0),           // 1-bit input PROGRAM acknowledge input
      .USRCCLKO(CLK40),   // 1-bit input User CCLK input
      .USRCCLKTS(1'b1), // 1-bit input User CCLK 3-state enable input
      .USRDONEO(1'b1),   // 1-bit input User DONE pin output control
      .USRDONETS(1'b0)  // 1-bit input User DONE 3-state enable output
   );

  BUFG startup_clk_buf (
	.O   (STRTUP_CLK),
	.I   (raw_startup_clk)
	);
	 

  BUFG gbt_dskw_clk_buf (
	.O   (GBT_DSKW_CLK),
	.I   (gbt_deskew_clk_0)
	);


endmodule
