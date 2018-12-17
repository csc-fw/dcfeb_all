`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:24 08/26/2011
// Design Name:   daq_op_sim_top
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f1.0/daq_op_sim_top_tf.v
// Project Name:  dcfeb_f1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: daq_op_sim_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module daq_op_sim_top_tf;

	// Inputs
	reg SYS_RST;
	reg CMS_CLK;
	reg DAQ_TX_125_REFCLK;
	reg DAQ_TX_125_REFCLK_DV2;
	reg TRG_TX_160_REFCLK;
	reg L1A;
	reg L1A_MATCH;
	reg L1A_PHASE;
	reg RESYNC;
	reg REFILL;
	reg JDAQ_RATE;

	// Instantiate the Unit Under Test (UUT)
	daq_op_sim_top uut (
		.SYS_RST(SYS_RST), 
		.CMS_CLK(CMS_CLK), 
		.DAQ_TX_125_REFCLK(DAQ_TX_125_REFCLK), 
		.DAQ_TX_125_REFCLK_DV2(DAQ_TX_125_REFCLK_DV2), 
		.TRG_TX_160_REFCLK(TRG_TX_160_REFCLK), 
		.L1A(L1A), 
		.L1A_MATCH(L1A_MATCH), 
		.L1A_PHASE(L1A_PHASE),
		.RESYNC(RESYNC),
		.REFILL(REFILL),
		.JDAQ_RATE(JDAQ_RATE)
	);
	
   parameter CMS_PERIOD = 24;
   parameter REF_125_PERIOD = 8;
   parameter REF_62P5_PERIOD = 16;
   parameter REF_160_PERIOD = 6;

	initial begin
		// Initialize Inputs
      CMS_CLK = 1'b1;
      forever
         #(CMS_PERIOD/2) CMS_CLK = ~CMS_CLK;
	end
	initial begin
		// Initialize Inputs
      DAQ_TX_125_REFCLK = 1'b1;
      forever
         #(REF_125_PERIOD/2) DAQ_TX_125_REFCLK = ~DAQ_TX_125_REFCLK;
	end
	initial begin
		// Initialize Inputs
      DAQ_TX_125_REFCLK_DV2 = 1'b1;
      forever
         #(REF_62P5_PERIOD/2) DAQ_TX_125_REFCLK_DV2 = ~DAQ_TX_125_REFCLK_DV2;
	end
	initial begin
		// Initialize Inputs
      TRG_TX_160_REFCLK = 1'b1;
      forever
         #(REF_160_PERIOD/2) TRG_TX_160_REFCLK = ~TRG_TX_160_REFCLK;
	end

	initial begin
		// Initialize Inputs
		SYS_RST = 1;
		L1A = 0;
		L1A_MATCH = 0;
		L1A_PHASE = 0;
		RESYNC = 0;
		REFILL = 0;
		JDAQ_RATE = 1;

		#1 // offset transitions
		#(5*CMS_PERIOD);
		#(625*CMS_PERIOD);
		SYS_RST = 0;
		#(1200*CMS_PERIOD);
		L1A = 1;
		L1A_MATCH = 1;
		L1A_PHASE = 0;
		#(CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
		#(1000*CMS_PERIOD);
        
		L1A = 1;
		L1A_MATCH = 0;
		L1A_PHASE = 0;
		#(CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
		#(50*CMS_PERIOD);

		L1A = 1;
		L1A_MATCH = 0;
		L1A_PHASE = 0;
		#(CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
		#(50*CMS_PERIOD);
		
		L1A = 1;
		L1A_MATCH = 0;
		L1A_PHASE = 0;
		REFILL = 1;
		#(CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
		REFILL = 0;
		#(1200*CMS_PERIOD);

		L1A = 1;
		L1A_MATCH = 0;
		L1A_PHASE = 0;
		#(CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
		#(50*CMS_PERIOD);

		L1A = 1;
		L1A_MATCH = 1;
		L1A_PHASE = 0;
		#(CMS_PERIOD);
		L1A = 0;
		L1A_MATCH = 0;
		#(1200*CMS_PERIOD);

		JDAQ_RATE = 0;
		#(1200*CMS_PERIOD);
	end
      
endmodule

