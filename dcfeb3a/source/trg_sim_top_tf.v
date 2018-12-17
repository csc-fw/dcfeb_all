`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:46:54 07/15/2011
// Design Name:   trg_sim_top
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f1.0/trg_sim_top_tf.v
// Project Name:  dcfeb_f1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: trg_sim_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module trg_sim_top_tf;

	// Inputs
	reg SYS_RST;
	reg QPLL_CLK_AC_P;
	reg QPLL_CLK_AC_N;

	// Instantiate the Unit Under Test (UUT)
	trg_sim_top uut (
		.SYS_RST(SYS_RST),
		.QPLL_CLK_AC_P(QPLL_CLK_AC_P), 
		.QPLL_CLK_AC_N(QPLL_CLK_AC_N)
	);
   parameter PERIOD = 24;  // CMS clock period (40MHz)

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
	initial begin
		// Initialize Inputs
		SYS_RST = 1;
		// Wait 100 ns for global reset to finish
		#(5*PERIOD);
//		#(625*PERIOD);
		#(3000*PERIOD);
		SYS_RST = 0;
		#(150*PERIOD);
		#(150*PERIOD);
		#(400*PERIOD);
		
	end
      
endmodule

