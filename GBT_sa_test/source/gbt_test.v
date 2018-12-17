`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    Thur Oct. 26 2017
// Design Name: 
// Module Name:    xdcfeb3a
//     Version: 1.00 10/26/17 Copied from dcfeb3a project version 4.0c as the starting point
//////////////////////////////////////////////////////////////////////////////////
(* syn_encoding = "safe original" *)
module gbt_test #(
	parameter USE_GBTX_CHIPSCOPE = 1,
	parameter Strt_dly = 20'h7FFFF,
	parameter POR_tmo = 7'd120
	)(

	//Clocks
	input CMS_CLK_N,CMS_CLK_P,CMS80_N,CMS80_P,
	input QPLL_CLK_AC_P,QPLL_CLK_AC_N,XO_CLK_AC_P,XO_CLK_AC_N,
	input GC0N,GC0P,GC1N,GC1P,
	input GBT_DSKW_CLK0N,GBT_DSKW_CLK0P, //new for xdcfeb_v3b
	
	//GBTX ASIC signals
	input  GBT_RXRDY_FPGA,	      //new for xdcfeb_v3a
	input  GBT_RXDATAVALID_FPGA,	//new for xdcfeb_v3a
	output GBT_TXVD,	            //new for xdcfeb
	output GBT_TEST_MODE,	      //new for xdcfeb_v3a
	output [0:15] GBT_RTN_DATA_P, //new for xdcfeb_v3a
	output [0:15] GBT_RTN_DATA_N, //new for xdcfeb_v3a

	//Calibration signals
	input \SKW_EXTPLS- ,\SKW_EXTPLS+ ,
	input \SKW_INJPLS- ,\SKW_INJPLS+ ,
	input INJPLS_LV,
	input EXTPLS_LV,
	output \INJPULSE- ,\INJPULSE+ ,
	output \EXTPULSE- ,\EXTPULSE+ ,
	
	//SPI signals
	input SPI_RTN_LV,
	output SPI_CK_LV, SPI_DAT_LV,
	output ADC_CS_LV_B,
	output CAL_DAC_CS_LV_B,
	output COMP_DAC_CS_LV_B,
	
	//I2C signals
	inout DAQ_LDSDA,	   //new for xdcfeb
	input DAQ_LDSDA_RTN,	//new for xdcfeb_v3a
	inout TRG_LDSDA,	   //new for xdcfeb
	input TRG_LDSDA_RTN, //new for xdcfeb_v3a
	inout NVIO_SDA_25,	//new for xdcfeb
	output NVIO_I2C_EN,	//new for xdcfeb
	output NVIO_SCL_25,	//new for xdcfeb
	output DAQ_LDSCL,   	//new for xdcfeb
	output TRG_LDSCL,  	//new for xdcfeb
	
   //PROM Configuration signals
   inout [15:0] CFG_DAT,
	input [7:0] PARAM_DAT,	//new for xdcfeb
	output PARAM_CLK,	//new for xdcfeb
	output PARAM_CE_B,	//new for xdcfeb
	output PARAM_OE,	//new for xdcfeb
	
   //Buckeye slow control signals
   input  G1SHOUTLV,G2SHOUTLV,G3SHOUTLV,G4SHOUTLV,G5SHOUTLV,G6SHOUTLV,
   output G1SHINLV,G2SHINLV,G3SHINLV,G4SHINLV,G5SHINLV,G6SHINLV,
   output G1SHCKLV,G2SHCKLV,G3SHCKLV,G4SHCKLV,G5SHCKLV,G6SHCKLV,
	
   //ADC differential serial datat inputs
   input [15:0] G1AD_N,G1AD_P,G2AD_N,G2AD_P,G3AD_N,G3AD_P,G4AD_N,G4AD_P,G5AD_N,G5AD_P,G6AD_N,G6AD_P,
	
   //ADC clock inputs
   input G1ADCLK0N,G1ADCLK0P,G1ADCLK1N,G1ADCLK1P,G1LCLK0N,G1LCLK0P,G1LCLK1N,G1LCLK1P,
   input G2ADCLK0N,G2ADCLK0P,G2ADCLK1N,G2ADCLK1P,G2LCLK0N,G2LCLK0P,G2LCLK1N,G2LCLK1P,
   input G3ADCLK0N,G3ADCLK0P,G3ADCLK1N,G3ADCLK1P,G3LCLK0N,G3LCLK0P,G3LCLK1N,G3LCLK1P,
   input G4ADCLK0N,G4ADCLK0P,G4ADCLK1N,G4ADCLK1P,G4LCLK0N,G4LCLK0P,G4LCLK1N,G4LCLK1P,
   input G5ADCLK0N,G5ADCLK0P,G5ADCLK1N,G5ADCLK1P,G5LCLK0N,G5LCLK0P,G5LCLK1N,G5LCLK1P,
   input G6ADCLK0N,G6ADCLK0P,G6ADCLK1N,G6ADCLK1P,G6LCLK0N,G6LCLK0P,G6LCLK1N,G6LCLK1P,
	
   //ADC control outputs
   output G1ADC_CS0_B_25,G1ADC_CS1_B_25,G2ADC_CS0_B_25,G2ADC_CS1_B_25,G3ADC_CS0_B_25,G3ADC_CS1_B_25,
   output G4ADC_CS0_B_25,G4ADC_CS1_B_25,G5ADC_CS0_B_25,G5ADC_CS1_B_25,G6ADC_CS0_B_25,G6ADC_CS1_B_25,
   output ADC_RST_B_25,
   output ADC_SCLK_25,
   output ADC_SDATA_25,
   output GA1ADCCLK_FN,GA1ADCCLK_FP,
   output GA2ADCCLK_FN,GA2ADCCLK_FP,
   output GA3ADCCLK_FN,GA3ADCCLK_FP,
	
	//Comparator signals
	input [7:0] G1C_LV, G2C_LV, G3C_LV, G4C_LV, G5C_LV, G6C_LV,  //Comparator data inputs
	output [1:0] CMODE,
	output [2:0] CTIME,
	output LCTCLK, LCTRST,
	
	
	//Channel Link signals
	output [15:0] DATAOUT,
	output CHAN_LNK_CLK,MB_FIFO_PUSH_B,MOVLP,OVLPMUX,DATAAVAIL,ENDWORD,
	
	//Trigger and sync signals
	input \SKW_L1A- ,\SKW_L1A+ ,
//	input \SKW_LCT- ,\SKW_LCT+ , // Names used on DCFEB Rev. 2a boards and in firmware version dcfeb_f2.0
	input \SKW_L1A_MATCH- ,\SKW_L1A_MATCH+ , // Names used on DCFEB Rev. 3b boards and in firmware version dcfeb_f3.0
	input \SKW_RESYNC- ,\SKW_RESYNC+ ,
	input \SKW_BC0- ,\SKW_BC0+ , // Only used on DCFEB Rev. 3b boards and in firmware version dcfeb_f3.0
	
	//Optical Transceiver signals
	input  DAQ_RX_P,DAQ_RX_N,	//not used, grounded
	output DAQ_TX_P,DAQ_TX_N,
//	input  ALT_SIGDET,  //not used in xdcfeb
	input  TRG_RX_P,TRG_RX_N,	//not used in xdcfeb (not connected on prototype, should be grounded in production version)
	output DAQ_TRG_TDIS,  //name change in xdcfeb
	output TRG_TX_P,TRG_TX_N,
	
	//QPLL signals
	input QP_ERROR,QP_LOCKED,  // These I/O buffs are found in rsm1 reset_manager
	output QP_RST_B,
	
	//System monitor signals
	input DV4P_3_CUR_P, DV4P_3_CUR_N, DV3P_2_CUR_N, DV3P_2_CUR_P, DV3P_18_CUR_N, DV3P_18_CUR_P, //Name change in xdcfeb DV3P_25_CUR_x goes to DV3P_18_CUR_x
	input V3PDCOMP_MONN, V3PDCOMP_MONP, V3PIO_MONN, V3PIO_MONP, V25IO_MONN, V25IO_MONP,
	input V5PACOMP_MONN, V5PACOMP_MONP, V5PSUB_MONN, V5PSUB_MONP, V5PPA_MONP, V5PPA_MONN,
	input V33PAADC_MONP, V33PAADC_MONN, V18PDADC_MONP, V18PDADC_MONN, V5PAMP_MONP, V5PAMP_MONN,
//	input AV55P_3_CUR_N, AV55P_3_CUR_P,  // Names used on DCFEB Rev. 2a boards and in firmware version dcfeb_f2.0
//	input AV55P_5_CUR_N, AV55P_5_CUR_P,  // Names used on DCFEB Rev. 2a boards and in firmware version dcfeb_f2.0
	input AV54P_3_CUR_N, AV54P_3_CUR_P,  // Names used on DCFEB Rev. 3b boards and in firmware version dcfeb_f3.0
	input AV54P_5_CUR_N, AV54P_5_CUR_P,  // Names used on DCFEB Rev. 3b boards and in firmware version dcfeb_f3.0
	
	//Diagnostic & misc. signals: Logic analyzer and test piont ports
	output V15GBT_ENA,
	inout [2:0] TP_B24_,
	inout [15:0] TP_B25_,
	inout [1:0] TP_B26_,
	inout [14:1] TP_B35_ // bits 9 and 10 are skipped.
);

/////////////////////////////////////////////////////////////////////////////
//                                                                         //
//  Chip Scope Pro Control module                                          //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////
	wire [35:0] gbtx_loopback_la_c0;


generate
if(USE_GBTX_CHIPSCOPE==1) 
begin : chipscope_with_gbtx_loopback
CSP_gbtx_loopback_cntrl CSP_gbtx_loopback_cntrl_i (
    .CONTROL0(gbtx_loopback_la_c0) // INOUT BUS [35:0]
);
end
else
begin : no_chipscope
	assign gbtx_loopback_la_c0 = 36'h000000000;
end
endgenerate



 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Clock source and management                                            //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

   wire sys_rst;
	wire daq_tx_125_refclk,daq_tx_125_refclk_dv2;
	wire trg_tx_160_refclk;
	wire clk40,clk20,clk1mhz;
	wire strtup_clk, eos;
	wire gbt_dskw_clk;
	wire mmcm_rst;
	wire daq_mmcm_lock;

	Clock_sources 
	Clk_src1(
	   // External inputs
		.CMS_CLK_N(CMS_CLK_N), .CMS_CLK_P(CMS_CLK_P),                      // from QPLL
		.CMS80_N(CMS80_N), .CMS80_P(CMS80_P),                              // from QPLL
		.QPLL_CLK_AC_N(QPLL_CLK_AC_N), .QPLL_CLK_AC_P(QPLL_CLK_AC_P),      // alternate clock 160 MHz Ref for TRG GTX (from QPLL)
		.XO_CLK_AC_N(XO_CLK_AC_N), .XO_CLK_AC_P(XO_CLK_AC_P),              // Crystal Osc. 125 MHz    Ref for DAQ GTX for GbE
		.GC0N(GC0N), .GC0P(GC0P), .GC1N(GC1N), .GC1P(GC1P),                // Spare global clock inputs
		.GBT_DSKW_CLK0N(GBT_DSKW_CLK0N), .GBT_DSKW_CLK0P(GBT_DSKW_CLK0P),                                  // Test point clock output
	   // Internal inputs
		.RST(sys_rst),
		.DAQ_MMCM_RST(mmcm_rst),
	   // Internal outputs
		.DAQ_TX_125_REFCLK(daq_tx_125_refclk),
		.DAQ_TX_125_REFCLK_DV2(daq_tx_125_refclk_dv2),
		.TRG_TX_160_REFCLK(trg_tx_160_refclk),
		.DAQ_MMCM_LOCK(daq_mmcm_lock),
		.CLK40(clk40),
		.CLK20(clk20),
		.CLK1MHZ(clk1mhz),
		.STRTUP_CLK(strtup_clk),           // internal config clock for power on state machines in reset manager
		.GBT_DSKW_CLK(gbt_dskw_clk),
		.EOS(eos)                          // End Of Startup
	);
  

 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  DCFEB Status word                                                      //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
 wire [15:0] dcfeb_status;
 wire [3:0] por_state;
 wire run;

 assign dcfeb_status = 16'h0000;
 
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Transfer parameters from flash PROM xcf08p                             //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

   PROM_Xfer  
	PROM_Xfer1 (
		//inputs
		.CLK20(clk20),
		.PARAM_DAT(PARAM_DAT),
		//outputs
		.PARAM_CLK(PARAM_CLK),
		.PARAM_CE_B(PARAM_CE_B),
		.PARAM_OE(PARAM_OE)
	);


 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Startup Display for LEDs                                               //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
wire gbt_ena_test;
wire [15:0] gbt_data_in;
wire display;

assign gbt_ena_test = !display;
	 
   startup_display 
	startup_display_xdcfeb1 (
		.CLK(clk40),
		.CLK1MHZ(clk1mhz), 
		.RST(sys_rst),
	// signals for LED'S after programing
		.RUN(run),
		.DCFEB_STATUS(dcfeb_status),
		.GBT_ENA_TEST(gbt_ena_test),
		 // internal outputs
		.DATA_IN(gbt_data_in),
		.DISPLAY(display),
	 // external connections
      .CFG_DAT(CFG_DAT)   // Data bus to/from BPI prom
	);
 
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  GBTX interface                                                         //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

wire gbt_rcv_rdy;
wire gbt_rcv_data_vld;
wire [15:0] gbt_rcv_data;
wire [15:0] gbt_trns_data;
wire gbt_rcv_vld;
wire gbt_trns_vld;
wire gbt_read_ena;

	GBT_interface #(
		.USE_CHIPSCOPE(USE_GBTX_CHIPSCOPE)
)	GBT_intf1 (
	// ChipScope Pro signlas
		.LA_CNTRL(gbtx_loopback_la_c0),
		//internal inputs
		.GBT_CLK(gbt_dskw_clk),
		.CLK40(clk40),
		.RST(sys_rst),
		.GBT_ENA_TEST(gbt_ena_test),
		.GBT_DATA_IN(gbt_data_in),
		//external inputs
		.GBT_RXRDY_FPGA(GBT_RXRDY_FPGA),
		.GBT_RXDATAVALID_FPGA(GBT_RXDATAVALID_FPGA),
		//external oputputs
		.GBT_TXVD(GBT_TXVD),
		.GBT_TEST_MODE(GBT_TEST_MODE),
		.GBT_RTN_DATA_P(GBT_RTN_DATA_P),
		.GBT_RTN_DATA_N(GBT_RTN_DATA_N),
	//test point outputs
		.RCV_RDY(gbt_rcv_rdy),
		.RCV_DATA_VLD(gbt_rcv_data_vld),
		.RCV_DATA(gbt_rcv_data),
		.TRNS_DATA(gbt_trns_data),
		.RCV_VLD(gbt_rcv_vld),
		.TRNS_VLD(gbt_trns_vld),
		.READ_ENA(gbt_read_ena)
	);

 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Buckeye slow control signals  (LV - low voltage side of translators)   //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

   wire [6:1] to_bky;
   wire [6:1] bky_rtn;
   wire [6:1] bky_clk;
	assign to_bky = 6'b000000;
	assign bky_clk = 6'b000000;

   buckeye_interface
	bky_intf1 (
      .G1SHOUTLV(G1SHOUTLV),.G2SHOUTLV(G2SHOUTLV),.G3SHOUTLV(G3SHOUTLV),.G4SHOUTLV(G4SHOUTLV),.G5SHOUTLV(G5SHOUTLV),.G6SHOUTLV(G6SHOUTLV),
      .G1SHINLV(G1SHINLV),  .G2SHINLV(G2SHINLV),  .G3SHINLV(G3SHINLV),  .G4SHINLV(G4SHINLV),  .G5SHINLV(G5SHINLV),  .G6SHINLV(G6SHINLV),
      .G1SHCKLV(G1SHCKLV),  .G2SHCKLV(G2SHCKLV),  .G3SHCKLV(G3SHCKLV),  .G4SHCKLV(G4SHCKLV),  .G5SHCKLV(G5SHCKLV),  .G6SHCKLV(G6SHCKLV),
		.TO_BKY(to_bky), .BKY_RTN(bky_rtn), .BKY_CLK(bky_clk)
  );
 
 
 
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  ADC Serial data input signals and bit clock/ frame clock inputs        //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

	
	adc_data_input 
	adc_data_in1(
		
		// Differential Serial Data Inputs
		.G1AD_N(G1AD_N),.G1AD_P(G1AD_P),.G2AD_N(G2AD_N),.G2AD_P(G2AD_P),.G3AD_N(G3AD_N),.G3AD_P(G3AD_P),
		.G4AD_N(G4AD_N),.G4AD_P(G4AD_P),.G5AD_N(G5AD_N),.G5AD_P(G5AD_P),.G6AD_N(G6AD_N),.G6AD_P(G6AD_P),
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
		.G6LCLK1N(G6LCLK1N),.G6LCLK1P(G6LCLK1P)
	);
	
  
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  ADC control output signals and differential sampling clock             //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

	wire [11:0] adc_cs;
	wire adc_rst,adc_sclk,adc_sdata;
	assign adc_cs = 12'h000;
	assign adc_rst = 1'b1;
	assign adc_sclk = 1'b0;
	assign adc_sdata = 1'b0;

	adc_control_out
	adc_cntrl1 (
	   // External control signals to ADCs
		.G1ADC_CS0_B_25(G1ADC_CS0_B_25), .G1ADC_CS1_B_25(G1ADC_CS1_B_25),
		.G2ADC_CS0_B_25(G2ADC_CS0_B_25), .G2ADC_CS1_B_25(G2ADC_CS1_B_25),
		.G3ADC_CS0_B_25(G3ADC_CS0_B_25), .G3ADC_CS1_B_25(G3ADC_CS1_B_25),
		.G4ADC_CS0_B_25(G4ADC_CS0_B_25), .G4ADC_CS1_B_25(G4ADC_CS1_B_25),
		.G5ADC_CS0_B_25(G5ADC_CS0_B_25), .G5ADC_CS1_B_25(G5ADC_CS1_B_25),
		.G6ADC_CS0_B_25(G6ADC_CS0_B_25), .G6ADC_CS1_B_25(G6ADC_CS1_B_25),
		.ADC_RST_B_25(ADC_RST_B_25),
		.ADC_SCLK_25(ADC_SCLK_25),
		.ADC_SDATA_25(ADC_SDATA_25),
		// Sampling clock to all ADCs
		.GA1ADCCLK_FN(GA1ADCCLK_FN),
		.GA1ADCCLK_FP(GA1ADCCLK_FP),
		.GA2ADCCLK_FN(GA2ADCCLK_FN),
		.GA2ADCCLK_FP(GA2ADCCLK_FP),
		.GA3ADCCLK_FN(GA3ADCCLK_FN),
		.GA3ADCCLK_FP(GA3ADCCLK_FP),
		// Internal control signals
      .ADC_CS(adc_cs),
      .ADC_RST(adc_rst),
      .ADC_SCLK(adc_sclk),
      .ADC_SDATA(adc_sdata),
      .ADC_CLK(adc_clk)
	);

 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  DAQ Path Optical Transceiver signals and GTX signals                   //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_DAQ_TRG_TDIS (.O(DAQ_TRG_TDIS),.I(1'b1));

	channel_link_out
	ch_link1 (
	   // External output
		.DATAOUT(DATAOUT),
		.CHAN_LNK_CLK(CHAN_LNK_CLK),
		.MB_FIFO_PUSH_B(MB_FIFO_PUSH_B),
		.MOVLP(MOVLP),
		.OVLPMUX(OVLPMUX),
		.DATAAVAIL(DATAAVAIL),
		.ENDWORD(ENDWORD)
    );

	
  //
  //Trigger and sync signals
  //

	trigger
	trig_in1(      // provides synchronus trigger inputs
	 // external connections
		.SKW_L1A_P(\SKW_L1A+ ),.SKW_L1A_N(\SKW_L1A- ),
		.SKW_L1A_MATCH_P(\SKW_L1A_MATCH+ ),.SKW_L1A_MATCH_N(\SKW_L1A_MATCH- ),
		.SKW_RESYNC_P(\SKW_RESYNC+ ),.SKW_RESYNC_N(\SKW_RESYNC- ),
		.SKW_BC0_P(\SKW_BC0+ ),.SKW_BC0_N(\SKW_BC0- )
	);
	 
	
  //
  //Calibration signals
  //

	calib_intf 
	calib_intf_i(    // provides multiplexing for calibration i/o
	 // external connections
		.SKW_EXTPLS_P(\SKW_EXTPLS+ ),.SKW_EXTPLS_N(\SKW_EXTPLS- ),
		.SKW_INJPLS_P(\SKW_INJPLS+ ),.SKW_INJPLS_N(\SKW_INJPLS- ),
		.INJPLS_LV(INJPLS_LV),
		.EXTPLS_LV(EXTPLS_LV),
	 // common output signals
		.INJPULSE_P(\INJPULSE+ ),.INJPULSE_N(\INJPULSE- ),
		.EXTPULSE_P(\EXTPULSE+ ),.EXTPULSE_N(\EXTPULSE- )
	);


	//
	//Comparator signals
	//

 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Comparator I/O and Comparator DAC control signals                      //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

	wire [7:0]g1c,g2c,g3c,g4c,g5c,g6c;
	wire [1:0]comp_mode;
	wire [2:0]comp_time;
	wire comp_rst;
	
	assign comp_mode = 2'd2;
	assign comp_mode = 3'd2;
	assign comp_rst = 1'b0;
	
	comparator_io
	comp_io1 (
	   // External I/O
		.G1C_LV(G1C_LV), .G2C_LV(G2C_LV), .G3C_LV(G3C_LV), .G4C_LV(G4C_LV), .G5C_LV(G5C_LV), .G6C_LV(G6C_LV), // Comparator inputs
		.CMODE(CMODE),  // Comparator Mode output
		.CTIME(CTIME),  // Comparator Timing output
		.LCTCLK(LCTCLK), .LCTRST(LCTRST), //Comparator clock and reset
		// Internal signals
		.G1C(g1c), .G2C(g2c), .G3C(g3c), .G4C(g4c), .G5C(g5c), .G6C(g6c), // Encoded Di-Strip signals from Comparator
		.COMP_MODE(comp_mode),
		.COMP_TIME(comp_time),
		.LCT_CLK(comp_clk),
		.LCT_RST(comp_rst)
	);

  
/////////////////////////////////////////////////////////////////////////////
//                                                                         //
//  SPI Interface to DACs                                                  //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////

wire cdac_enb,caldac_enb,caladc_enb;
wire spi_ck;
wire spi_dat;
wire spi_rtn;

assign cdac_enb = 1'b0;
assign caldac_enb = 1'b0;
assign caladc_enb = 1'b0;
assign spi_ck = 1'b0;
assign spi_dat = 1'b0;

spi_port 		
SPI_PORT_i  (
	//SPI input signals
	.SPI_RTN_LV(SPI_RTN_LV),
	//SPI output signals
	.SPI_CK_LV(SPI_CK_LV),
	.SPI_DAT_LV(SPI_DAT_LV),
	.ADC_CS_LV_B(ADC_CS_LV_B),
	.CAL_DAC_CS_LV_B(CAL_DAC_CS_LV_B),
	.COMP_DAC_CS_LV_B(COMP_DAC_CS_LV_B),
	// internal signals
	.SPI_RTN(spi_rtn),
   .CDAC_ENB(cdac_enb),
   .CALDAC_ENB(caldac_enb),
   .CALADC_ENB(caladc_enb),
	.SPI_CK(spi_ck),
	.SPI_DAT(spi_dat)
);

  
/////////////////////////////////////////////////////////////////////////////
//                                                                         //
//  I2C Interface to Optical transmitters and non-volatile I/O             //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////
wire [7:0] I2C_wrt_fifo_data;
wire I2C_we;
wire I2C_rdena;
wire I2C_reset;
wire I2C_start;
wire I2C_clr_start;
wire [7:0] I2C_rbk_fifo_data;
wire [7:0] I2C_status;

	I2C_interfaces  
	I2C_intf1 (
		
		.DAQ_LDSDA(DAQ_LDSDA),
		.DAQ_LDSDA_RTN(DAQ_LDSDA_RTN),
		.DAQ_LDSCL(DAQ_LDSCL),
		
		.TRG_LDSDA(TRG_LDSDA),
		.TRG_LDSDA_RTN(TRG_LDSDA_RTN),
		.TRG_LDSCL(TRG_LDSCL),
		
		.NVIO_I2C_EN(NVIO_I2C_EN),
		.NVIO_SDA_25(NVIO_SDA_25),
		.NVIO_SCL_25(NVIO_SCL_25)	
	);


 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Power on startup proceedure for resets                                 //
 //  and control signals for the QPLL                                       //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////


	reset_manager  #(
		.Strt_dly(Strt_dly),
		.POR_tmo(POR_tmo)
	)
	rsm_xdcfeb1(
		.STUP_CLK(strtup_clk),
		.CLK(clk40),
		.EOS(eos),
		.DAQ_MMCM_LOCK(daq_mmcm_lock),
		.QP_ERROR(QP_ERROR),
		.QP_LOCKED(QP_LOCKED),
		
		.MMCM_RST(mmcm_rst),
		.SYS_RST(sys_rst),
		.RUN(run),
		.V15GBT_ENA(V15GBT_ENA)
	);

	
wire rst_qpll;
assign rst_qpll = 1'b0;

OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_QP_RST (.O(QP_RST_B),.I(~rst_qpll));
	
/////////////////////////////////////////////////////////////////////////////
//                                                                         //
//  Instantiate module for managing test points                            //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////


	test_points
	tp_io_xdcfeb1 (
		.CLK40(clk40),
		.GBT_DSKW_CLK(gbt_dskw_clk),
		.GBT_RCV_RDY(gbt_rcv_rdy),
		.GBT_RCV_DATA_VLD(gbt_rcv_data_vld),
		.GBT_RCV_DATA(gbt_rcv_data),
		.GBT_TRNS_DATA(gbt_trns_data),
		.GBT_RCV_VLD(gbt_rcv_vld),
		.GBT_TRNS_VLD(gbt_trns_vld),
		.GBT_READ_ENA(gbt_read_ena),
		//
		//
		.TP_B24_(TP_B24_),
		.TP_B25_(TP_B25_),
		.TP_B26_(TP_B26_),
		.TP_B35_(TP_B35_) // bits 9 and 10 are skipped.
	);


endmodule
