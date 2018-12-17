`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:38:14 07/18/2014
// Design Name:   adc_config
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/ADC/adc_config_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adc_config
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adc_config_sim_tf;

	// Inputs
	reg CLK;
	reg RST;
	reg INIT;
	reg JCTRL;
	reg JWE;
	reg [25:0] JDATA;
	reg [3:0] CSP_WE;
	reg [23:0] CSP_WR_DATA;
	reg [4:0] CSP_WR_ADDR;
	reg CSP_RD_CTRL;
	reg [4:0] CSP_RD_ADDR;
	reg [1:0] CSP_MSEL;
	reg [11:0] MASK;

	// Outputs
	wire [23:0] CSP_RD_DATA;
	wire [11:0] CS;
	wire SCLK;
	wire SDATA;
	wire DONE;
	wire [1:0] la_msel;
	wire [23:0] la_mem_out;
	wire [4:0] la_rd_addr;
	wire [4:0] la_wr_addr;

	// Instantiate the Unit Under Test (UUT)
	adc_config uut (
		.CLK(CLK), 
		.RST(RST), 
		.INIT(INIT), 
		.JCTRL(JCTRL), 
		.JWE(JWE), 
		.JDATA(JDATA), 
		.CSP_WE(CSP_WE), 
		.CSP_WR_DATA(CSP_WR_DATA), 
		.CSP_WR_ADDR(CSP_WR_ADDR), 
		.CSP_RD_CTRL(CSP_RD_CTRL), 
		.CSP_RD_DATA(CSP_RD_DATA), 
		.CSP_RD_ADDR(CSP_RD_ADDR), 
		.CSP_MSEL(CSP_MSEL), 
		.MASK(MASK), 
		.CS(CS), 
		.SCLK(SCLK), 
		.SDATA(SDATA), 
		.DONE(DONE), 
		.la_msel(la_msel), 
		.la_mem_out(la_mem_out), 
		.la_rd_addr(la_rd_addr), 
		.la_wr_addr(la_wr_addr)
	);

   parameter CMS_PERIOD = 24;
   parameter SMP_PERIOD = 48;

	initial begin
		// Initialize Inputs
      CLK = 1'b1;
      forever
         #(SMP_PERIOD/2) CLK = ~CLK;
	end
	
	initial begin
		// Initialize Inputs
		RST = 1;
		INIT = 0;
		JCTRL = 0;
		JWE = 0;
		JDATA = 0;
		CSP_WE = 0;
		CSP_WR_DATA = 0;
		CSP_WR_ADDR = 0;
		CSP_RD_CTRL = 0;
		CSP_RD_ADDR = 0;
		CSP_MSEL = 0;
		MASK = 12'hFFF;

		// Wait 100 ns for global reset to finish
		#(5*CMS_PERIOD);
		#1;
		RST = 0;
		#(5*CMS_PERIOD);
		INIT = 1;
		#(1650*CMS_PERIOD);
		INIT = 0;
        
		// Add stimulus here

	end
      
endmodule

