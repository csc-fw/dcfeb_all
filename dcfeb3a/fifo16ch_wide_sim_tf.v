`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:48 07/14/2014
// Design Name:   fifo16ch_wide
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/fifo16ch_wide_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fifo16ch_wide
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fifo16ch_wide_sim_tf;

	// Inputs
	reg CLK40;
	reg RDCLK;
	reg SMPCLK;
	reg WRCLK;
	reg RST;
	reg RST_RESYNC;
	reg FIFO_RST;
	reg L1A;
	reg L1A_MATCH;
	reg [191:0] G1IN;
	reg [191:0] G2IN;
	reg [191:0] G3IN;
	reg [191:0] G4IN;
	reg [191:0] G5IN;
	reg [191:0] G6IN;
	reg [15:0] RD_ENA;
	reg L1A_RD_EN;
	reg [6:0] SAMP_MAX;
	reg TRIG_IN;

	// Outputs
	wire TRIG_OUT;
	wire RDY;
	wire [43:0] L1A_SMP_OUT;
	wire [191:0] DOUT_16CH;
	wire [23:0] L1A_CNT;
	wire [11:0] L1A_MTCH_CNT;
	wire [15:0] fmt;

	// Bidirs
	wire [35:0] LA_CNTRL;

	// Instantiate the Unit Under Test (UUT)
	fifo16ch_wide uut (
		.LA_CNTRL(LA_CNTRL), 
		.CLK40(CLK40), 
		.RDCLK(RDCLK), 
		.SMPCLK(SMPCLK), 
		.WRCLK(WRCLK), 
		.RST(RST), 
		.RST_RESYNC(RST_RESYNC), 
		.FIFO_RST(FIFO_RST), 
		.L1A(L1A), 
		.L1A_MATCH(L1A_MATCH), 
		.G1IN(G1IN), 
		.G2IN(G2IN), 
		.G3IN(G3IN), 
		.G4IN(G4IN), 
		.G5IN(G5IN), 
		.G6IN(G6IN), 
		.RD_ENA(RD_ENA), 
		.L1A_RD_EN(L1A_RD_EN), 
		.SAMP_MAX(SAMP_MAX), 
		.TRIG_IN(TRIG_IN), 
		.TRIG_OUT(TRIG_OUT), 
		.RDY(RDY), 
		.L1A_SMP_OUT(L1A_SMP_OUT), 
		.DOUT_16CH(DOUT_16CH), 
		.L1A_CNT(L1A_CNT), 
		.L1A_MTCH_CNT(L1A_MTCH_CNT), 
		.fmt(fmt)
	);


   parameter CMS_PERIOD = 24;

	initial begin
		// Initialize Inputs
      CLK40 = 1'b1;
      forever
         #(CMS_PERIOD/2) CLK40 = ~CLK40;
	end
	initial begin
		// Initialize Inputs
      RDCLK = 1'b1;
      forever
         #(CMS_PERIOD/8) RDCLK = ~RDCLK;
	end
	initial begin
		// Initialize Inputs
      SMPCLK = 1'b1;
      forever
         #(CMS_PERIOD) SMPCLK = ~SMPCLK;
	end
	initial begin
		// Initialize Inputs
      WRCLK = 1'b1;
      forever
         #(CMS_PERIOD/6) WRCLK = ~WRCLK;
	end
	
	initial begin
		// Initialize Inputs
		RST = 1;
		RST_RESYNC = 1;
		FIFO_RST = 1;
		L1A = 0;
		L1A_MATCH = 0;
		G1IN = {12'hff1,12'hee1,12'hdd1,12'hcc1,12'hbb1,12'haa1,12'h991,12'h881,12'h771,12'h661,12'h551,12'h441,12'h331,12'h221,12'h111,12'h001};
		G2IN = {12'hff2,12'hee2,12'hdd2,12'hcc2,12'hbb2,12'haa2,12'h992,12'h882,12'h772,12'h662,12'h552,12'h442,12'h332,12'h222,12'h112,12'h002};
		G3IN = {12'hff3,12'hee3,12'hdd3,12'hcc3,12'hbb3,12'haa3,12'h993,12'h883,12'h773,12'h663,12'h553,12'h443,12'h333,12'h223,12'h113,12'h003};
		G4IN = {12'hff4,12'hee4,12'hdd4,12'hcc4,12'hbb4,12'haa4,12'h994,12'h884,12'h774,12'h664,12'h554,12'h444,12'h334,12'h224,12'h114,12'h004};
		G5IN = {12'hff5,12'hee5,12'hdd5,12'hcc5,12'hbb5,12'haa5,12'h995,12'h885,12'h775,12'h665,12'h555,12'h445,12'h335,12'h225,12'h115,12'h005};
		G6IN = {12'hff6,12'hee6,12'hdd6,12'hcc6,12'hbb6,12'haa6,12'h996,12'h886,12'h776,12'h666,12'h556,12'h446,12'h336,12'h226,12'h116,12'h006};
		RD_ENA = 0;
		L1A_RD_EN = 0;
		SAMP_MAX = 7'h7;
		TRIG_IN = 0;

		// Wait 100 ns for global reset to finish
		#(5*CMS_PERIOD);
		#1;
		#(5*CMS_PERIOD);
		RST = 0;
		RST_RESYNC = 0;
		FIFO_RST = 0;
		#(5*CMS_PERIOD);
		FIFO_RST = 1;
		#(5*CMS_PERIOD);
		FIFO_RST = 0;
		#(5*CMS_PERIOD);
		#(15*CMS_PERIOD);
		L1A = 1;
		L1A_MATCH = 1;
		#(1*CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
		#(5*CMS_PERIOD);
		L1A = 1;
		L1A_MATCH = 1;
		#(1*CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
		#(5*CMS_PERIOD);
		L1A = 1;
		L1A_MATCH = 1;
		#(1*CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
		#(9*CMS_PERIOD);
		L1A = 1;
		L1A_MATCH = 1;
		#(1*CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
        
		// Add stimulus here

	end
      
endmodule

