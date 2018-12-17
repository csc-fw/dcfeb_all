`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:55:01 07/15/2014
// Design Name:   ringbuf
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/DAQ/ringbuf_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ringbuf
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ringbuf_sim_tf;

	// Inputs
	reg CLK;
	reg RST_RESYNC;
	reg FIFO_RST;
	reg [6:0] SAMP_MAX;
	reg [11:0] WDATA;
	reg WREN;
	reg [43:0] L1A_SMP_DATA;
	reg L1A_WRT_EN;
	reg EVT_BUF_AMT;
	reg EVT_BUF_AFL;
	reg TRIG_IN;

	// Outputs
	wire TRIG_OUT;
	wire [36:0] L1A_EVT_DATA;
	wire L1A_EVT_PUSH;
	wire [17:0] RDATA;
	wire DATA_PUSH;
	wire WARN;

	// Bidirs
	wire [35:0] LA_CNTRL;

	// Instantiate the Unit Under Test (UUT)
	ringbuf uut (
		.LA_CNTRL(LA_CNTRL), 
		.CLK(CLK), 
		.RST_RESYNC(RST_RESYNC), 
		.FIFO_RST(FIFO_RST), 
		.SAMP_MAX(SAMP_MAX), 
		.WDATA(WDATA), 
		.WREN(WREN), 
		.L1A_SMP_DATA(L1A_SMP_DATA), 
		.L1A_WRT_EN(L1A_WRT_EN), 
		.EVT_BUF_AMT(EVT_BUF_AMT), 
		.EVT_BUF_AFL(EVT_BUF_AFL), 
		.TRIG_IN(TRIG_IN), 
		.TRIG_OUT(TRIG_OUT), 
		.L1A_EVT_DATA(L1A_EVT_DATA), 
		.L1A_EVT_PUSH(L1A_EVT_PUSH), 
		.RDATA(RDATA), 
		.DATA_PUSH(DATA_PUSH), 
		.WARN(WARN)
	);


   parameter CMS_PERIOD = 24;
   parameter C160_PERIOD = 6;

	initial begin
		// Initialize Inputs
      CLK = 1'b1;
      forever
         #(CMS_PERIOD/8) CLK = ~CLK;
	end

	initial begin
		// Initialize Inputs
		RST_RESYNC = 1;
		FIFO_RST = 1;
		SAMP_MAX = 7;
		WDATA = 12'h27b;
		WREN = 0;
		L1A_SMP_DATA = {3'b0,1'b1,40'h0000000000};
		L1A_WRT_EN = 0;
		EVT_BUF_AMT = 1;
		EVT_BUF_AFL = 0;
		TRIG_IN = 0;

		// Wait 100 ns for global reset to finish
		#(5*CMS_PERIOD);
		#1;
		#(5*CMS_PERIOD);
		RST_RESYNC = 0;
		FIFO_RST = 0;
		#(5*CMS_PERIOD);
		FIFO_RST = 1;
		#(5*CMS_PERIOD);
		FIFO_RST = 0;
		#(5*CMS_PERIOD);
		L1A_WRT_EN = 1;
		#(3*C160_PERIOD);
		L1A_WRT_EN = 0;
		#(1*C160_PERIOD);
		#(5*CMS_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		EVT_BUF_AMT = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		
		#(10*CMS_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		
		#(1*CMS_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		EVT_BUF_AFL = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		#(6*C160_PERIOD);
		WREN = 1;
		#(96*C160_PERIOD);
		WREN = 0;
		
		#(100*CMS_PERIOD);
		EVT_BUF_AFL = 0;
		#(100*CMS_PERIOD);
		EVT_BUF_AMT = 1;
        
		// Add stimulus here

	end
      
endmodule

