`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:19 06/19/2014
// Design Name:   dcfeb3a_sim_top
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/dcfeb3a_sim_top_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dcfeb3a_sim_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dcfeb3a_sim_top_tf;

	// Inputs
	reg CMS_CLK_N;
	reg CMS_CLK_P;
	reg CMS80_N;
	reg CMS80_P;
	reg QPLL_CLK_AC_P;
	reg QPLL_CLK_AC_N;
	reg XO_CLK_AC_P;
	reg XO_CLK_AC_N;
	reg \FEM_CLK320- ;
	reg \FEM_CLK320+ ;
	reg GC0N;
	reg GC0P;
	reg GC1N;
	reg GC1P;
	reg CLK320_SIGDET;
	reg \FEM_RX_DAT- ;
	reg \FEM_RX_DAT+ ;
	reg CTRL_SIGDET;
	reg FMU_TOKEN;
	reg FMU_L1A;
	reg FMU_RESYNC;
	reg FMU_SPI_CS0;
	reg FMU_SPI_CS1;
	reg FMU_SPI_CLK;
	reg FMU_SPI_DAT;
	reg FMU_INJPLS;
	reg FMU_EXTPLS;
	reg \SKW_EXTPLS- ;
	reg \SKW_EXTPLS+ ;
	reg \SKW_INJPLS- ;
	reg \SKW_INJPLS+ ;
	wire INJPLS_LV;
	wire EXTPLS_LV;
	reg SPI_RTN_LV;
	wire G1SHOUTLV;
	wire G2SHOUTLV;
	wire G3SHOUTLV;
	wire G4SHOUTLV;
	wire G5SHOUTLV;
	wire G6SHOUTLV;
	reg [15:0] G1AD_N;
	reg [15:0] G1AD_P;
	reg [15:0] G2AD_N;
	reg [15:0] G2AD_P;
	reg [15:0] G3AD_N;
	reg [15:0] G3AD_P;
	reg [15:0] G4AD_N;
	reg [15:0] G4AD_P;
	reg [15:0] G5AD_N;
	reg [15:0] G5AD_P;
	reg [15:0] G6AD_N;
	reg [15:0] G6AD_P;
	reg G1ADCLK0N;
	reg G1ADCLK0P;
	wire G1ADCLK1N;
	wire G1ADCLK1P;
	reg G1LCLK0N;
	reg G1LCLK0P;
	wire G1LCLK1N;
	wire G1LCLK1P;
	wire G2ADCLK0N;
	wire G2ADCLK0P;
	wire G2ADCLK1N;
	wire G2ADCLK1P;
	wire G2LCLK0N;
	wire G2LCLK0P;
	wire G2LCLK1N;
	wire G2LCLK1P;
	wire G3ADCLK0N;
	wire G3ADCLK0P;
	wire G3ADCLK1N;
	wire G3ADCLK1P;
	wire G3LCLK0N;
	wire G3LCLK0P;
	wire G3LCLK1N;
	wire G3LCLK1P;
	wire G4ADCLK0N;
	wire G4ADCLK0P;
	wire G4ADCLK1N;
	wire G4ADCLK1P;
	wire G4LCLK0N;
	wire G4LCLK0P;
	wire G4LCLK1N;
	wire G4LCLK1P;
	wire G5ADCLK0N;
	wire G5ADCLK0P;
	wire G5ADCLK1N;
	wire G5ADCLK1P;
	wire G5LCLK0N;
	wire G5LCLK0P;
	wire G5LCLK1N;
	wire G5LCLK1P;
	wire G6ADCLK0N;
	wire G6ADCLK0P;
	wire G6ADCLK1N;
	wire G6ADCLK1P;
	wire G6LCLK0N;
	wire G6LCLK0P;
	wire G6LCLK1N;
	wire G6LCLK1P;
	reg [7:0] G1C_LV;
	reg [7:0] G2C_LV;
	reg [7:0] G3C_LV;
	reg [7:0] G4C_LV;
	reg [7:0] G5C_LV;
	reg [7:0] G6C_LV;
	reg \SKW_L1A- ;
	reg \SKW_L1A+ ;
	reg \SKW_L1A_MATCH- ;
	reg \SKW_L1A_MATCH+ ;
	reg \SKW_RESYNC- ;
	reg \SKW_RESYNC+ ;
	reg \SKW_BC0- ;
	reg \SKW_BC0+ ;
	reg DAQ_RX_P;
	reg DAQ_RX_N;
	reg ALT_SIGDET;
	reg TRG_RX_P;
	reg TRG_RX_N;
	reg QP_ERROR;
	reg QP_LOCKED;
	reg DV4P_3_CUR_P;
	reg DV4P_3_CUR_N;
	reg DV3P_2_CUR_N;
	reg DV3P_2_CUR_P;
	reg DV3P_25_CUR_N;
	reg DV3P_25_CUR_P;
	reg V3PDCOMP_MONN;
	reg V3PDCOMP_MONP;
	reg V3PIO_MONN;
	reg V3PIO_MONP;
	reg V25IO_MONN;
	reg V25IO_MONP;
	reg V5PACOMP_MONN;
	reg V5PACOMP_MONP;
	reg V5PSUB_MONN;
	reg V5PSUB_MONP;
	reg V5PPA_MONP;
	reg V5PPA_MONN;
	reg V33PAADC_MONP;
	reg V33PAADC_MONN;
	reg V18PDADC_MONP;
	reg V18PDADC_MONN;
	reg V5PAMP_MONP;
	reg V5PAMP_MONN;
	reg AV54P_3_CUR_N;
	reg AV54P_3_CUR_P;
	reg AV54P_5_CUR_N;
	reg AV54P_5_CUR_P;
	reg SEL_SKW_B;
	reg SEL_CON_B;

	// Outputs
	wire TP_B35_0N;
	wire TP_B35_0P;
	wire FEM_REPROGRAM;
	wire FEM_TCK;
	wire FEM_TDI;
	wire FEM_TMS;
	wire \FEM_TX_DAT- ;
	wire \FEM_TX_DAT+ ;
	wire CTRL_TDIS;
	wire FMU_SPI_BUSY;
	wire FMU_SPI_RTN_CLK;
	wire FMU_SPI_RTN_DAT;
	wire FMU_UL_TCK;
	wire FMU_UL_TDI;
	wire FMU_UL_TMS;
	wire FMU_FLF_E1;
	wire FMU_FLF_P1;
	wire FMU_FLF_P2;
	wire FMU_VLF_E2;
	wire \FMU_CLK40_UL- ;
	wire \FMU_CLK40_UL+ ;
	wire RST_FFEMU;
	wire \INJPULSE- ;
	wire \INJPULSE+ ;
	wire \EXTPULSE- ;
	wire \EXTPULSE+ ;
	wire SPI_CK_LV;
	wire SPI_DAT_LV;
	wire ADC_CS_LV_B;
	wire CAL_DAC_CS_LV_B;
	wire COMP_DAC_CS_LV_B;
	wire BPI_AD21_RS0;
	wire BPI_AD22_RS1;
	wire FCS_B;
	wire FOE_B;
	wire FWE_B;
	wire FLATCH_B;
	wire G1SHINLV;
	wire G2SHINLV;
	wire G3SHINLV;
	wire G4SHINLV;
	wire G5SHINLV;
	wire G6SHINLV;
	wire G1SHCKLV;
	wire G2SHCKLV;
	wire G3SHCKLV;
	wire G4SHCKLV;
	wire G5SHCKLV;
	wire G6SHCKLV;
	wire G1ADC_CS0_B_25;
	wire G1ADC_CS1_B_25;
	wire G2ADC_CS0_B_25;
	wire G2ADC_CS1_B_25;
	wire G3ADC_CS0_B_25;
	wire G3ADC_CS1_B_25;
	wire G4ADC_CS0_B_25;
	wire G4ADC_CS1_B_25;
	wire G5ADC_CS0_B_25;
	wire G5ADC_CS1_B_25;
	wire G6ADC_CS0_B_25;
	wire G6ADC_CS1_B_25;
	wire ADC_RST_B_25;
	wire ADC_SCLK_25;
	wire ADC_SDATA_25;
	wire GA1ADCCLK_FN;
	wire GA1ADCCLK_FP;
	wire GA2ADCCLK_FN;
	wire GA2ADCCLK_FP;
	wire GA3ADCCLK_FN;
	wire GA3ADCCLK_FP;
	wire [1:0] CMODE;
	wire [2:0] CTIME;
	wire LCTCLK;
	wire LCTRST;
	wire [15:0] DATAOUT;
	wire CHAN_LNK_CLK;
	wire MB_FIFO_PUSH_B;
	wire MOVLP;
	wire OVLPMUX;
	wire DATAAVAIL;
	wire ENDWORD;
	wire DAQ_TDIS;
	wire DAQ_TX_P;
	wire DAQ_TX_N;
	wire TRG_TDIS;
	wire TRG_TX_P;
	wire TRG_TX_N;
	wire QP_RST_B;

	// Bidirs
	wire [22:0] BPI_AD;
	wire [15:0] CFG_DAT;
	wire [2:0] TP_B24_;
	wire [15:0] TP_B25_;
	wire [1:0] TP_B26_;
	wire [14:1] TP_B35_;

	// Instantiate the Unit Under Test (UUT)

	dcfeb3a #(
	.USE_CHAN_LINK_CHIPSCOPE(0),
	.USE_DESER_CHIPSCOPE(0),
	.USE_CMP_CHIPSCOPE(0),
	.USE_DAQ_CHIPSCOPE(0),
	.USE_RINGBUF_CHIPSCOPE(0),
	.USE_FF_EMU_CHIPSCOPE(0),
	.USE_SPI_CHIPSCOPE(0),
	.USE_PIPE_CHIPSCOPE(0),
	.USE_SEM_CHIPSCOPE(0),
	.Simulation(1),
	.Strt_dly(20'h00004),
	.POR_tmo(7'd10),
	.ADC_Init_tmo(12'd9),
	.TDIS_pulse_duration(12'd0040), // 1us for simulation 
	.TDIS_on_Startup(1),
	.TMR(0),
	.TMR_Err_Det(0)
	)
	uut (
		.CMS_CLK_N(CMS_CLK_N), 
		.CMS_CLK_P(CMS_CLK_P), 
		.CMS80_N(CMS80_N), 
		.CMS80_P(CMS80_P), 
		.QPLL_CLK_AC_P(QPLL_CLK_AC_P), 
		.QPLL_CLK_AC_N(QPLL_CLK_AC_N), 
		.XO_CLK_AC_P(XO_CLK_AC_P), 
		.XO_CLK_AC_N(XO_CLK_AC_N), 
		.\FEM_CLK320- (\FEM_CLK320- ), 
		.\FEM_CLK320+ (\FEM_CLK320+ ), 
		.GC0N(GC0N), 
		.GC0P(GC0P), 
		.GC1N(GC1N), 
		.GC1P(GC1P), 
		.TP_B35_0N(TP_B35_0N), 
		.TP_B35_0P(TP_B35_0P), 
		.CLK320_SIGDET(CLK320_SIGDET), 
		.\FEM_RX_DAT- (\FEM_RX_DAT- ), 
		.\FEM_RX_DAT+ (\FEM_RX_DAT+ ), 
		.FEM_REPROGRAM(FEM_REPROGRAM), 
		.FEM_TCK(FEM_TCK), 
		.FEM_TDI(FEM_TDI), 
		.FEM_TMS(FEM_TMS), 
		.\FEM_TX_DAT- (\FEM_TX_DAT- ), 
		.\FEM_TX_DAT+ (\FEM_TX_DAT+ ), 
		.CTRL_SIGDET(CTRL_SIGDET), 
		.CTRL_TDIS(CTRL_TDIS), 
		.FMU_TOKEN(FMU_TOKEN), 
		.FMU_L1A(FMU_L1A), 
		.FMU_RESYNC(FMU_RESYNC), 
		.FMU_SPI_CS0(FMU_SPI_CS0), 
		.FMU_SPI_CS1(FMU_SPI_CS1), 
		.FMU_SPI_CLK(FMU_SPI_CLK), 
		.FMU_SPI_DAT(FMU_SPI_DAT), 
		.FMU_SPI_BUSY(FMU_SPI_BUSY), 
		.FMU_SPI_RTN_CLK(FMU_SPI_RTN_CLK), 
		.FMU_SPI_RTN_DAT(FMU_SPI_RTN_DAT), 
		.FMU_UL_TCK(FMU_UL_TCK), 
		.FMU_UL_TDI(FMU_UL_TDI), 
		.FMU_UL_TMS(FMU_UL_TMS), 
		.FMU_FLF_E1(FMU_FLF_E1), 
		.FMU_FLF_P1(FMU_FLF_P1), 
		.FMU_FLF_P2(FMU_FLF_P2), 
		.FMU_VLF_E2(FMU_VLF_E2), 
		.\FMU_CLK40_UL- (\FMU_CLK40_UL- ), 
		.\FMU_CLK40_UL+ (\FMU_CLK40_UL+ ), 
		.RST_FFEMU(RST_FFEMU), 
		.FMU_INJPLS(FMU_INJPLS), 
		.FMU_EXTPLS(FMU_EXTPLS), 
		.\SKW_EXTPLS- (\SKW_EXTPLS- ), 
		.\SKW_EXTPLS+ (\SKW_EXTPLS+ ), 
		.\SKW_INJPLS- (\SKW_INJPLS- ), 
		.\SKW_INJPLS+ (\SKW_INJPLS+ ), 
		.INJPLS_LV(INJPLS_LV), 
		.EXTPLS_LV(EXTPLS_LV), 
		.\INJPULSE- (\INJPULSE- ), 
		.\INJPULSE+ (\INJPULSE+ ), 
		.\EXTPULSE- (\EXTPULSE- ), 
		.\EXTPULSE+ (\EXTPULSE+ ), 
		.SPI_RTN_LV(SPI_RTN_LV), 
		.SPI_CK_LV(SPI_CK_LV), 
		.SPI_DAT_LV(SPI_DAT_LV), 
		.ADC_CS_LV_B(ADC_CS_LV_B), 
		.CAL_DAC_CS_LV_B(CAL_DAC_CS_LV_B), 
		.COMP_DAC_CS_LV_B(COMP_DAC_CS_LV_B), 
		.BPI_AD(BPI_AD), 
		.CFG_DAT(CFG_DAT), 
		.BPI_AD21_RS0(BPI_AD21_RS0), 
		.BPI_AD22_RS1(BPI_AD22_RS1), 
		.FCS_B(FCS_B), 
		.FOE_B(FOE_B), 
		.FWE_B(FWE_B), 
		.FLATCH_B(FLATCH_B), 
		.G1SHOUTLV(G1SHOUTLV), 
		.G2SHOUTLV(G2SHOUTLV), 
		.G3SHOUTLV(G3SHOUTLV), 
		.G4SHOUTLV(G4SHOUTLV), 
		.G5SHOUTLV(G5SHOUTLV), 
		.G6SHOUTLV(G6SHOUTLV), 
		.G1SHINLV(G1SHINLV), 
		.G2SHINLV(G2SHINLV), 
		.G3SHINLV(G3SHINLV), 
		.G4SHINLV(G4SHINLV), 
		.G5SHINLV(G5SHINLV), 
		.G6SHINLV(G6SHINLV), 
		.G1SHCKLV(G1SHCKLV), 
		.G2SHCKLV(G2SHCKLV), 
		.G3SHCKLV(G3SHCKLV), 
		.G4SHCKLV(G4SHCKLV), 
		.G5SHCKLV(G5SHCKLV), 
		.G6SHCKLV(G6SHCKLV), 
		.G1AD_N(G1AD_N), 
		.G1AD_P(G1AD_P), 
		.G2AD_N(G2AD_N), 
		.G2AD_P(G2AD_P), 
		.G3AD_N(G3AD_N), 
		.G3AD_P(G3AD_P), 
		.G4AD_N(G4AD_N), 
		.G4AD_P(G4AD_P), 
		.G5AD_N(G5AD_N), 
		.G5AD_P(G5AD_P), 
		.G6AD_N(G6AD_N), 
		.G6AD_P(G6AD_P), 
		.G1ADCLK0N(G1ADCLK0N), 
		.G1ADCLK0P(G1ADCLK0P), 
		.G1ADCLK1N(G1ADCLK1N), 
		.G1ADCLK1P(G1ADCLK1P), 
		.G1LCLK0N(G1LCLK0N), 
		.G1LCLK0P(G1LCLK0P), 
		.G1LCLK1N(G1LCLK1N), 
		.G1LCLK1P(G1LCLK1P), 
		.G2ADCLK0N(G2ADCLK0N), 
		.G2ADCLK0P(G2ADCLK0P), 
		.G2ADCLK1N(G2ADCLK1N), 
		.G2ADCLK1P(G2ADCLK1P), 
		.G2LCLK0N(G2LCLK0N), 
		.G2LCLK0P(G2LCLK0P), 
		.G2LCLK1N(G2LCLK1N), 
		.G2LCLK1P(G2LCLK1P), 
		.G3ADCLK0N(G3ADCLK0N), 
		.G3ADCLK0P(G3ADCLK0P), 
		.G3ADCLK1N(G3ADCLK1N), 
		.G3ADCLK1P(G3ADCLK1P), 
		.G3LCLK0N(G3LCLK0N), 
		.G3LCLK0P(G3LCLK0P), 
		.G3LCLK1N(G3LCLK1N), 
		.G3LCLK1P(G3LCLK1P), 
		.G4ADCLK0N(G4ADCLK0N), 
		.G4ADCLK0P(G4ADCLK0P), 
		.G4ADCLK1N(G4ADCLK1N), 
		.G4ADCLK1P(G4ADCLK1P), 
		.G4LCLK0N(G4LCLK0N), 
		.G4LCLK0P(G4LCLK0P), 
		.G4LCLK1N(G4LCLK1N), 
		.G4LCLK1P(G4LCLK1P), 
		.G5ADCLK0N(G5ADCLK0N), 
		.G5ADCLK0P(G5ADCLK0P), 
		.G5ADCLK1N(G5ADCLK1N), 
		.G5ADCLK1P(G5ADCLK1P), 
		.G5LCLK0N(G5LCLK0N), 
		.G5LCLK0P(G5LCLK0P), 
		.G5LCLK1N(G5LCLK1N), 
		.G5LCLK1P(G5LCLK1P), 
		.G6ADCLK0N(G6ADCLK0N), 
		.G6ADCLK0P(G6ADCLK0P), 
		.G6ADCLK1N(G6ADCLK1N), 
		.G6ADCLK1P(G6ADCLK1P), 
		.G6LCLK0N(G6LCLK0N), 
		.G6LCLK0P(G6LCLK0P), 
		.G6LCLK1N(G6LCLK1N), 
		.G6LCLK1P(G6LCLK1P), 
		.G1ADC_CS0_B_25(G1ADC_CS0_B_25), 
		.G1ADC_CS1_B_25(G1ADC_CS1_B_25), 
		.G2ADC_CS0_B_25(G2ADC_CS0_B_25), 
		.G2ADC_CS1_B_25(G2ADC_CS1_B_25), 
		.G3ADC_CS0_B_25(G3ADC_CS0_B_25), 
		.G3ADC_CS1_B_25(G3ADC_CS1_B_25), 
		.G4ADC_CS0_B_25(G4ADC_CS0_B_25), 
		.G4ADC_CS1_B_25(G4ADC_CS1_B_25), 
		.G5ADC_CS0_B_25(G5ADC_CS0_B_25), 
		.G5ADC_CS1_B_25(G5ADC_CS1_B_25), 
		.G6ADC_CS0_B_25(G6ADC_CS0_B_25), 
		.G6ADC_CS1_B_25(G6ADC_CS1_B_25), 
		.ADC_RST_B_25(ADC_RST_B_25), 
		.ADC_SCLK_25(ADC_SCLK_25), 
		.ADC_SDATA_25(ADC_SDATA_25), 
		.GA1ADCCLK_FN(GA1ADCCLK_FN), 
		.GA1ADCCLK_FP(GA1ADCCLK_FP), 
		.GA2ADCCLK_FN(GA2ADCCLK_FN), 
		.GA2ADCCLK_FP(GA2ADCCLK_FP), 
		.GA3ADCCLK_FN(GA3ADCCLK_FN), 
		.GA3ADCCLK_FP(GA3ADCCLK_FP), 
		.G1C_LV(G1C_LV), 
		.G2C_LV(G2C_LV), 
		.G3C_LV(G3C_LV), 
		.G4C_LV(G4C_LV), 
		.G5C_LV(G5C_LV), 
		.G6C_LV(G6C_LV), 
		.CMODE(CMODE), 
		.CTIME(CTIME), 
		.LCTCLK(LCTCLK), 
		.LCTRST(LCTRST), 
		.DATAOUT(DATAOUT), 
		.CHAN_LNK_CLK(CHAN_LNK_CLK), 
		.MB_FIFO_PUSH_B(MB_FIFO_PUSH_B), 
		.MOVLP(MOVLP), 
		.OVLPMUX(OVLPMUX), 
		.DATAAVAIL(DATAAVAIL), 
		.ENDWORD(ENDWORD), 
		.\SKW_L1A- (\SKW_L1A- ), 
		.\SKW_L1A+ (\SKW_L1A+ ), 
		.\SKW_L1A_MATCH- (\SKW_L1A_MATCH- ), 
		.\SKW_L1A_MATCH+ (\SKW_L1A_MATCH+ ), 
		.\SKW_RESYNC- (\SKW_RESYNC- ), 
		.\SKW_RESYNC+ (\SKW_RESYNC+ ), 
		.\SKW_BC0- (\SKW_BC0- ), 
		.\SKW_BC0+ (\SKW_BC0+ ), 
		.DAQ_RX_P(DAQ_RX_P), 
		.DAQ_RX_N(DAQ_RX_N), 
		.DAQ_TDIS(DAQ_TDIS), 
		.DAQ_TX_P(DAQ_TX_P), 
		.DAQ_TX_N(DAQ_TX_N), 
		.ALT_SIGDET(ALT_SIGDET), 
		.TRG_RX_P(TRG_RX_P), 
		.TRG_RX_N(TRG_RX_N), 
		.TRG_TDIS(TRG_TDIS), 
		.TRG_TX_P(TRG_TX_P), 
		.TRG_TX_N(TRG_TX_N), 
		.QP_ERROR(QP_ERROR), 
		.QP_LOCKED(QP_LOCKED), 
		.QP_RST_B(QP_RST_B), 
		.DV4P_3_CUR_P(DV4P_3_CUR_P), 
		.DV4P_3_CUR_N(DV4P_3_CUR_N), 
		.DV3P_2_CUR_N(DV3P_2_CUR_N), 
		.DV3P_2_CUR_P(DV3P_2_CUR_P), 
		.DV3P_25_CUR_N(DV3P_25_CUR_N), 
		.DV3P_25_CUR_P(DV3P_25_CUR_P), 
		.V3PDCOMP_MONN(V3PDCOMP_MONN), 
		.V3PDCOMP_MONP(V3PDCOMP_MONP), 
		.V3PIO_MONN(V3PIO_MONN), 
		.V3PIO_MONP(V3PIO_MONP), 
		.V25IO_MONN(V25IO_MONN), 
		.V25IO_MONP(V25IO_MONP), 
		.V5PACOMP_MONN(V5PACOMP_MONN), 
		.V5PACOMP_MONP(V5PACOMP_MONP), 
		.V5PSUB_MONN(V5PSUB_MONN), 
		.V5PSUB_MONP(V5PSUB_MONP), 
		.V5PPA_MONP(V5PPA_MONP), 
		.V5PPA_MONN(V5PPA_MONN), 
		.V33PAADC_MONP(V33PAADC_MONP), 
		.V33PAADC_MONN(V33PAADC_MONN), 
		.V18PDADC_MONP(V18PDADC_MONP), 
		.V18PDADC_MONN(V18PDADC_MONN), 
		.V5PAMP_MONP(V5PAMP_MONP), 
		.V5PAMP_MONN(V5PAMP_MONN), 
		.AV54P_3_CUR_N(AV54P_3_CUR_N), 
		.AV54P_3_CUR_P(AV54P_3_CUR_P), 
		.AV54P_5_CUR_N(AV54P_5_CUR_N), 
		.AV54P_5_CUR_P(AV54P_5_CUR_P), 
		.SEL_SKW_B(SEL_SKW_B), 
		.SEL_CON_B(SEL_CON_B), 
		.TP_B24_(TP_B24_), 
		.TP_B25_(TP_B25_), 
		.TP_B26_(TP_B26_), 
		.TP_B35_(TP_B35_)
	);

   parameter PERIOD = 24;  // CMS clock period (40MHz)
   parameter GbE_PERIOD = 8;  // 125 MHz oscillator for GbE
	parameter JPERIOD = 100;
	parameter ir_width = 10;
	parameter max_width = 300;
	integer i,j1,j2,j3,j4,j5,j6,ch1,ch2,ch3,ch4,ch5,ch6;

// ADCs
	reg[11:0] g1adcdata[127:0];
	reg[11:0] g2adcdata[127:0];
	reg[11:0] g3adcdata[127:0];
	reg[11:0] g4adcdata[127:0];
	reg[11:0] g5adcdata[127:0];
	reg[11:0] g6adcdata[127:0];
	
	initial begin
	   $readmemh ("G1ADC_data_stream", g1adcdata, 0, 127);
	   $readmemh ("G2ADC_data_stream", g2adcdata, 0, 127);
	   $readmemh ("G3ADC_data_stream", g3adcdata, 0, 127);
	   $readmemh ("G4ADC_data_stream", g4adcdata, 0, 127);
	   $readmemh ("G5ADC_data_stream", g5adcdata, 0, 127);
	   $readmemh ("G6ADC_data_stream", g6adcdata, 0, 127);
	end

// PROM
//   reg  [15:0] bpi_prom [8388607:8372224];// highest order parameter block 7FC000 to 7FFFFF
   reg  [15:0] bpi_prom [23'h7FFFFF:23'h7FC000];// highest order parameter block 7FC000 to 7FFFFF
	reg  [22:0] addr;
   wire [15:0] stored_data;
   reg  [15:0] out_value;
	
	initial begin
//	   $readmemh ("AL_sim_data", bpi_prom, 8372224, 8372257);
	   $readmemh ("AL_sim_data", bpi_prom, 23'h7FC000, 23'h7FC021);
	end
	
//JTAG
	reg TMS,TDI,TCK;
	reg [7:0] jrst;
	reg [3:0] sir_hdr;
	reg [3:0] sdr_hdr;
	reg [2:0] trl;
	reg [ir_width-1:0] usr1;
	reg [ir_width-1:0] usr2;
	reg [ir_width-1:0] usr3;
	reg [ir_width-1:0] usr4;
	
// buckeyes
	reg [47:0] g1bckshftreg;
	reg [47:0] g2bckshftreg;
	reg [47:0] g3bckshftreg;
	reg [47:0] g4bckshftreg;
	reg [47:0] g5bckshftreg;
	reg [47:0] g6bckshftreg;
	
// GSR
//    reg             gsr_r;
//    reg             gts_r;
	
    //Simultate the global reset that occurs after configuration at the beginning
    //of the simulation. 
//    assign glbl.GSR = gsr_r;
//    assign glbl.GTS = gts_r;

	assign INJPLS_LV = \INJPULSE+ ;
	assign EXTPLS_LV = \EXTPULSE+ ;

//    initial
//        begin
//            gts_r = 1'b0;        
//            gsr_r = 1'b1;
//            #(16*GbE_PERIOD);
//            gsr_r = 1'b0;
//    end
	initial begin  // CMS clock from QPLL 40 MHz
		CMS_CLK_P = 1;  // start high
		CMS_CLK_N = 0;
      forever begin
         #(PERIOD/2) begin
				CMS_CLK_P = ~CMS_CLK_P;  //Toggle
				CMS_CLK_N = ~CMS_CLK_N;
			end
		end
	end
	initial begin  //  80 MHz clock from QPLL
		CMS80_P = 1;  // start high
		CMS80_N = 0;
      forever begin
         #(PERIOD/4) begin
				CMS80_P = ~CMS80_P;  //Toggle
				CMS80_N = ~CMS80_N;
			end
		end
	end
	initial begin  //  160 MHz clock from QPLL
		QPLL_CLK_AC_P = 1;  // start high
		QPLL_CLK_AC_N = 0;
      forever begin
         #(PERIOD/8) begin
				QPLL_CLK_AC_P = ~QPLL_CLK_AC_P;  //Toggle
				QPLL_CLK_AC_N = ~QPLL_CLK_AC_N;
			end
		end
	end
	initial begin  //  125 MHz clock from crystal oscillator for GbE
		XO_CLK_AC_P = 1;  // start high
		XO_CLK_AC_N = 0;
      forever begin
         #(GbE_PERIOD/2) begin
				XO_CLK_AC_P = ~XO_CLK_AC_P;  //Toggle
				XO_CLK_AC_N = ~XO_CLK_AC_N;
			end
		end
	end
	initial begin  // Differential Frame clock
		G1ADCLK0P = 1;  // start high
		G1ADCLK0N = 0;
      forever
         #(PERIOD) begin  // 50 ns sampling clock (20 MHz)
			   G1ADCLK0P = ~G1ADCLK0P;
			   G1ADCLK0N = ~G1ADCLK0N;
			end
	end
	initial begin  // Differential Bit clock (6X sampling frequency)
      G1LCLK0P = 1'b0; // start low
      G1LCLK0N = 1'b1;
		#(PERIOD/12);     //Offset bit clock 1/2 a cycle
      G1LCLK0P = 1'b1; // go high
      G1LCLK0N = 1'b0;
      forever
         #(PERIOD/6) begin
			   G1LCLK0P = ~G1LCLK0P;
			   G1LCLK0N = ~G1LCLK0N;
		   end
	end
	
	assign G1ADCLK1P = G1ADCLK0P;
	assign G1ADCLK1N = G1ADCLK0N;
	assign G2ADCLK0P = G1ADCLK0P;
	assign G2ADCLK0N = G1ADCLK0N;
	assign G2ADCLK1P = G1ADCLK0P;
	assign G2ADCLK1N = G1ADCLK0N;
	assign G3ADCLK0P = G1ADCLK0P;
	assign G3ADCLK0N = G1ADCLK0N;
	assign G3ADCLK1P = G1ADCLK0P;
	assign G3ADCLK1N = G1ADCLK0N;
	assign G4ADCLK0P = G1ADCLK0P;
	assign G4ADCLK0N = G1ADCLK0N;
	assign G4ADCLK1P = G1ADCLK0P;
	assign G4ADCLK1N = G1ADCLK0N;
	assign G5ADCLK0P = G1ADCLK0P;
	assign G5ADCLK0N = G1ADCLK0N;
	assign G5ADCLK1P = G1ADCLK0P;
	assign G5ADCLK1N = G1ADCLK0N;
	assign G6ADCLK0P = G1ADCLK0P;
	assign G6ADCLK0N = G1ADCLK0N;
	assign G6ADCLK1P = G1ADCLK0P;
	assign G6ADCLK1N = G1ADCLK0N;

	assign G1LCLK1P = G1LCLK0P;
	assign G1LCLK1N = G1LCLK0N;
	assign G2LCLK0P = G1LCLK0P;
	assign G2LCLK0N = G1LCLK0N;
	assign G2LCLK1P = G1LCLK0P;
	assign G2LCLK1N = G1LCLK0N;
	assign G3LCLK0P = G1LCLK0P;
	assign G3LCLK0N = G1LCLK0N;
	assign G3LCLK1P = G1LCLK0P;
	assign G3LCLK1N = G1LCLK0N;
	assign G4LCLK0P = G1LCLK0P;
	assign G4LCLK0N = G1LCLK0N;
	assign G4LCLK1P = G1LCLK0P;
	assign G4LCLK1N = G1LCLK0N;
	assign G5LCLK0P = G1LCLK0P;
	assign G5LCLK0N = G1LCLK0N;
	assign G5LCLK1P = G1LCLK0P;
	assign G5LCLK1N = G1LCLK0N;
	assign G6LCLK0P = G1LCLK0P;
	assign G6LCLK0N = G1LCLK0N;
	assign G6LCLK1P = G1LCLK0P;
	assign G6LCLK1N = G1LCLK0N;

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[2*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[2*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[3*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[3*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[4*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[4*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[5*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[5*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[6*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[6*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[7*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[7*16+ch1][j1];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[2*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[2*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[3*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[3*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[4*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[4*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[5*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[5*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[6*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[6*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[7*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[7*16+ch2][j2];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[2*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[2*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[3*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[3*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[4*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[4*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[5*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[5*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[6*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[6*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[7*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[7*16+ch3][j3];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[2*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[2*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[3*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[3*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[4*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[4*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[5*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[5*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[6*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[6*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[7*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[7*16+ch4][j4];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[2*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[2*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[3*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[3*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[4*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[4*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[5*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[5*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[6*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[6*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[7*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[7*16+ch5][j5];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[2*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[2*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[3*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[3*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[4*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[4*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[5*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[5*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[6*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[6*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[7*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[7*16+ch6][j6];
				end
				#(PERIOD/6);
			end
		end
	end


	initial begin
		// Initialize Inputs
		\FEM_CLK320-  = 0;
		\FEM_CLK320+  = 0;
		GC0N = 0;
		GC0P = 0;
		GC1N = 0;
		GC1P = 0;
		CLK320_SIGDET = 0;
		\FEM_RX_DAT-  = 0;
		\FEM_RX_DAT+  = 0;
		CTRL_SIGDET = 0;
		FMU_TOKEN = 0;
		FMU_L1A = 0;
		FMU_RESYNC = 0;
		FMU_SPI_CS0 = 0;
		FMU_SPI_CS1 = 0;
		FMU_SPI_CLK = 0;
		FMU_SPI_DAT = 0;
		FMU_INJPLS = 0;
		FMU_EXTPLS = 0;
		\SKW_EXTPLS-  = 1;
		\SKW_EXTPLS+  = 0;
		\SKW_INJPLS-  = 1;
		\SKW_INJPLS+  = 0;
		SPI_RTN_LV = 0;
		G1C_LV = 0;
		G2C_LV = 0;
		G3C_LV = 0;
		G4C_LV = 0;
		G5C_LV = 0;
		G6C_LV = 0;
		\SKW_L1A-  = 1;
		\SKW_L1A+  = 0;
		\SKW_L1A_MATCH-  = 1;
		\SKW_L1A_MATCH+  = 0;
		\SKW_RESYNC-  = 1;
		\SKW_RESYNC+  = 0;
		\SKW_BC0-  = 1;
		\SKW_BC0+  = 0;
		DAQ_RX_P = 0;
		DAQ_RX_N = 1;
		ALT_SIGDET = 0;
		TRG_RX_P = 0;
		TRG_RX_N = 1;
		QP_ERROR = 0;
		QP_LOCKED = 1;
		DV4P_3_CUR_P = 0;
		DV4P_3_CUR_N = 0;
		DV3P_2_CUR_N = 0;
		DV3P_2_CUR_P = 0;
		DV3P_25_CUR_N = 0;
		DV3P_25_CUR_P = 0;
		V3PDCOMP_MONN = 0;
		V3PDCOMP_MONP = 0;
		V3PIO_MONN = 0;
		V3PIO_MONP = 0;
		V25IO_MONN = 0;
		V25IO_MONP = 0;
		V5PACOMP_MONN = 0;
		V5PACOMP_MONP = 0;
		V5PSUB_MONN = 0;
		V5PSUB_MONP = 0;
		V5PPA_MONP = 0;
		V5PPA_MONN = 0;
		V33PAADC_MONP = 0;
		V33PAADC_MONN = 0;
		V18PDADC_MONP = 0;
		V18PDADC_MONN = 0;
		V5PAMP_MONP = 0;
		V5PAMP_MONN = 0;
		AV54P_3_CUR_N = 0;
		AV54P_3_CUR_P = 0;
		AV54P_5_CUR_N = 0;
		AV54P_5_CUR_P = 0;
		SEL_SKW_B = 0;
		SEL_CON_B = 1;
		
		TMS = 1'b1;
		TDI = 1'b0;
		TCK = 1'b0;
      jrst = 8'b00111111;
      sir_hdr = 4'b0011;
      sdr_hdr = 4'b0010;
		trl = 3'b001;
		usr1 = 10'h3c2; // usr1 instruction
		usr2 = 10'h3c3; // usr2 instruction
		usr3 = 10'h3e2; // usr3 instruction
		usr4 = 10'h3e3; // usr4 instruction

		// Wait 100 ns for global reset to finish
		#1;
		#(5*PERIOD);
		JTAG_reset;
		Set_Func(8'h00);           // Set NoOp
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(9,9'd0);       // shift zeros
		#(5*PERIOD);
		Set_Func(8'd42);           // Disable L1A headers.
		#(5*PERIOD);
		JTAG_reset;
		#(17500*PERIOD);
		#(600*PERIOD);
//		Send_L1A_L1A_Match;
//		#(5*PERIOD);
//		Send_L1A_L1A_Match;
		// Add stimulus here
		Set_Func(8'd63);           // DAQ_OPLINK_RST
		#(600*PERIOD);
		Set_Func(8'd64);           // TRG_OPLINK_RST
		#(600*PERIOD);

	end
reg rd_mode;
localparam // Read modes
   Rd_Array        = 2'd0,
   Rd_SR           = 2'd1,
   Rd_ESig         = 2'd2,
   Rd_CFIQ         = 2'd3;

always @* begin
	if(!FLATCH_B) addr = BPI_AD;
end
initial begin
	rd_mode = Rd_Array;
end

always @(posedge CMS_CLK_P) begin
	if (!FCS_B && !FWE_B)
		case(CFG_DAT)
			16'h00FF: rd_mode <= Rd_Array;
			16'h0070: rd_mode <= Rd_SR;
			16'h0090: rd_mode <= Rd_ESig;
			16'h0098: rd_mode <= Rd_CFIQ;
			default:  rd_mode <= rd_mode;
		endcase
end

assign stored_data = bpi_prom[addr];   

always @(negedge FCS_B)
begin
	case(rd_mode)
		Rd_Array:	#85 out_value <= stored_data;
		Rd_SR:		#85 out_value <= 16'h0080;
		Rd_ESig:		#85 out_value <= 16'h0000;//16'hBCDF for Control Register
		Rd_CFIQ:		#85 out_value <= 16'h506B;
		default:		#85 out_value <= stored_data;
	endcase
end

assign CFG_DAT = !FOE_B ? out_value : 16'hZZZZ;

// buckeye shift registers
always @(posedge G1SHCKLV) begin
	g1bckshftreg <= {g1bckshftreg[46:0],G1SHINLV};
end
assign G1SHOUTLV = g1bckshftreg[47];
always @(posedge G2SHCKLV) begin
	g2bckshftreg <= {g2bckshftreg[46:0],G2SHINLV};
end
assign G2SHOUTLV = g2bckshftreg[47];
always @(posedge G3SHCKLV) begin
	g3bckshftreg <= {g3bckshftreg[46:0],G3SHINLV};
end
assign G3SHOUTLV = g3bckshftreg[47];
always @(posedge G4SHCKLV) begin
	g4bckshftreg <= {g4bckshftreg[46:0],G4SHINLV};
end
assign G4SHOUTLV = g4bckshftreg[47];
always @(posedge G5SHCKLV) begin
	g5bckshftreg <= {g5bckshftreg[46:0],G5SHINLV};
end
assign G5SHOUTLV = g5bckshftreg[47];
always @(posedge G6SHCKLV) begin
	g6bckshftreg <= {g6bckshftreg[46:0],G6SHINLV};
end
assign G6SHOUTLV = g6bckshftreg[47];

   // JTAG_SIM_VIRTEX6: JTAG Interface Simulation Model
   //                   Virtex-6
   // Xilinx HDL Language Template, version 12.4
   
   JTAG_SIM_VIRTEX6 #(
      .PART_NAME("LX130T") // Specify target V6 device.  Possible values are:
                          // "CX130T","CX195T","CX240T","CX75T","HX250T","HX255T","HX380T","HX45T","HX565T",
                          // "LX115T","LX130T","LX130TL","LX195T","LX195TL","LX240T","LX240TL","LX365T","LX365TL",
                          // "LX40T","LX550T","LX550TL","LX75T","LX760","SX315T","SX475T" 
   ) JTAG_SIM_VIRTEX6_inst (
      .TDO(TDO), // 1-bit JTAG data output
      .TCK(TCK), // 1-bit Clock input
      .TDI(TDI), // 1-bit JTAG data input
      .TMS(TMS)  // 1-bit JTAG command input
   );
	
task JTAG_reset;
begin
	// JTAG reset
	TMS = 1'b1;
	TDI = 1'b0;
	for(i=0;i<8;i=i+1) begin
		TMS = jrst[i];
		TCK = 1'b0;
		#(JPERIOD/2) TCK = 1'b1;
		#(JPERIOD/2);
	end
end
endtask

task Set_Func;
input [7:0] func;
begin
	Set_User(usr1);       // User 1 for instruction decode
	Shift_Data(8,func);   // Shift function code
end
endtask


task Set_User;
input [ir_width-1:0] usr;
begin
	// go to sir
	TDI = 1'b0;
	for(i=0;i<4;i=i+1) begin
		TMS = sir_hdr[i];
		TCK = 1'b0;
		#(JPERIOD/2) TCK = 1'b1;
		#(JPERIOD/2);
	end
	// shift instruction
	TMS = 1'b0;
	for(i=0;i<ir_width;i=i+1) begin
		if(i==ir_width-1)TMS = 1'b1;
		TDI = usr[i];       // User 1, 2, 3, or 4 instruction
		TCK = 1'b0;
		#(JPERIOD/2) TCK = 1'b1;
		#(JPERIOD/2);
	end
	// go to rti
	TDI = 1'b0;
	for(i=0;i<3;i=i+1) begin
		TMS = trl[i];
		TCK = 1'b0;
		#(JPERIOD/2) TCK = 1'b1;
		#(JPERIOD/2);
	end
end
endtask


task Shift_Data;
input integer width;
input [max_width-1:0] d;
begin
		// go to sdr
		TDI = 1'b0;
		for(i=0;i<4;i=i+1) begin
		   TMS = sdr_hdr[i];
			TCK = 1'b0;
			#(JPERIOD/2) TCK = 1'b1;
			#(JPERIOD/2);
		end
		// shift function data 
		TMS = 1'b0;
		for(i=0;i<width;i=i+1) begin
		   if(i==(width-1))TMS = 1'b1;
			TDI = d[i];
			TCK = 1'b0;
			#(JPERIOD/2) TCK = 1'b1;
			#(JPERIOD/2);
		end
		// go to rti
		TDI = 1'b0;
		for(i=0;i<3;i=i+1) begin
		   TMS = trl[i];
			TCK = 1'b0;
			#(JPERIOD/2) TCK = 1'b1;
			#(JPERIOD/2);
		end
end
endtask

task Send_L1A;
begin
	@(posedge CMS_CLK_P) begin
		\SKW_L1A- = 1'b0;
		\SKW_L1A+ = 1'b1;
	end
	#(PERIOD);
	\SKW_L1A- = 1'b1;
	\SKW_L1A+ = 1'b0;
end
endtask

task Send_L1A_L1A_Match;
begin
	@(posedge CMS_CLK_P) begin
		\SKW_L1A- = 1'b0;
		\SKW_L1A+ = 1'b1;
		\SKW_L1A_MATCH- = 1'b0;
		\SKW_L1A_MATCH+ = 1'b1;
	end
	#(PERIOD);
	\SKW_L1A- = 1'b1;
	\SKW_L1A+ = 1'b0;
	\SKW_L1A_MATCH- = 1'b1;
	\SKW_L1A_MATCH+ = 1'b0;
end
endtask

task Send_ReSync;
begin
	@(posedge CMS_CLK_P) begin
		\SKW_RESYNC- = 1'b0;
		\SKW_RESYNC+ = 1'b1;
	end
	#(PERIOD);
	\SKW_RESYNC- = 1'b1;
	\SKW_RESYNC+ = 1'b0;
end
endtask

task Send_BC0;
begin
	@(posedge CMS_CLK_P) begin
		\SKW_BC0- = 1'b0;
		\SKW_BC0+ = 1'b1;
	end
	#(PERIOD);
	\SKW_BC0- = 1'b1;
	\SKW_BC0+ = 1'b0;
end
endtask
      
endmodule
