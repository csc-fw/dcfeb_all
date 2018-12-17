`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:29:52 07/11/2011
// Design Name:   PRBS_tx
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f1.0/PRBS_sim_tf.v
// Project Name:  dcfeb_f1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PRBS_tx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PRBS_sim_tf;

	// Inputs
	reg OUT_CLK;
	reg GEN_CLK;
	reg RST;

	// Outputs
	wire [47:0] PRBS;

	// Instantiate the Unit Under Test (UUT)
	PRBS_tx uut (
		.OUT_CLK(OUT_CLK), 
		.GEN_CLK(GEN_CLK), 
		.RST(RST), 
		.PRBS(PRBS)
	);

   parameter PERIOD = 24;

	initial begin
		// Initialize Inputs
      OUT_CLK = 1'b1;
      forever
         #(PERIOD/2) OUT_CLK = ~OUT_CLK;
	end
	initial begin
		// Initialize Inputs
      GEN_CLK = 1'b1;
      forever
         #(PERIOD/4) GEN_CLK = ~GEN_CLK;
	end
	initial begin
		RST = 1;

		// Wait 100 ns for global reset to finish
		#125;
        
		// Add stimulus here
      RST = 0;
	end
      
		
endmodule

