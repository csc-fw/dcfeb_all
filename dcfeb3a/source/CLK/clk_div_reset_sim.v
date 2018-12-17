`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:30:30 11/09/2012
// Design Name:   clk_div_reset
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f2.0/clk_div_reset_sim.v
// Project Name:  dcfeb_f2.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_div_reset
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_div_reset_sim;

	// Inputs
	reg CLK;
	reg PLLLKDET;
	reg TX_RATE;
	reg ENA;

	// Outputs
	wire GTXTEST_DONE;
	wire GTXTEST_BIT1;

	// Instantiate the Unit Under Test (UUT)
	clk_div_reset uut (
		.CLK(CLK), 
		.PLLLKDET(PLLLKDET), 
		.TX_RATE(TX_RATE), 
		.ENA(ENA), 
		.GTXTEST_DONE(GTXTEST_DONE), 
		.GTXTEST_BIT1(GTXTEST_BIT1)
	);

   parameter PERIOD = 24;

	initial begin
		// Initialize Inputs
      CLK = 1'b0;
      forever
         #(PERIOD/2) CLK = ~CLK;
	end
	initial begin
		// Initialize Inputs
		PLLLKDET = 0;
		TX_RATE = 1;
		ENA = 0;

		// Wait 100 ns for global reset to finish
		#120;
        
		// Add stimulus here
		PLLLKDET = 1;
		#384;
		ENA = 1;
		#49152; //2048 CLKs
		PLLLKDET = 0;
		ENA = 0;
		#96;
		TX_RATE = 0;
		#96;
		PLLLKDET = 1;
		#384;
		ENA = 1;
		#50400; //2100 CLKs
		PLLLKDET = 0;
		ENA = 0;
		#96;
		TX_RATE = 1;
		#96;
		PLLLKDET = 1;
		#768;
		ENA = 1;
		#49152; //2048 CLKs
		
	end
      
endmodule

