`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:00:30 07/03/2013
// Design Name:   crc_gen
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f3.0/crc_test_tf.v
// Project Name:  dcfeb_f3.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: crc_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module crc_test_tf;

	// Inputs
	reg [15:0] d;
	reg calc;
	reg init;
	reg d_valid;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] crc_reg;
	wire [15:0] crc;

	// Instantiate the Unit Under Test (UUT)
	crc_gen uut (
		.crc_reg(crc_reg), 
		.crc(crc), 
		.d(d), 
		.calc(calc), 
		.init(init), 
		.d_valid(d_valid), 
		.clk(clk), 
		.reset(reset)
	);

   parameter CMS_PERIOD = 24;

	initial begin
		// Initialize Inputs
      clk = 1'b1;
      forever
         #(CMS_PERIOD/2) clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		d = 0;
		calc = 0;
		init = 0;
		d_valid = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		#1 // offset transitions
		#(5*CMS_PERIOD);
		reset = 0;
		#(5*CMS_PERIOD);
		init = 1;
 		#(CMS_PERIOD);
		init =0;
		calc = 1;
		d_valid = 1;
		d = 16'h9001;
 		#(CMS_PERIOD);
		d = 16'h9000;
 		#(CMS_PERIOD);
		d = 16'h907F;
 		#(CMS_PERIOD);
		d = 16'h9000;
 		#(CMS_PERIOD);
		d = 16'hA07F;
 		#(CMS_PERIOD);
		d = 16'hA010;
 		#(CMS_PERIOD);
		d = 16'hA000;
 		#(CMS_PERIOD);
		d = 16'hA001;
 		#(CMS_PERIOD);
		d = 16'h6001;
 		#(CMS_PERIOD);
		d = 16'h6002;
 		#(CMS_PERIOD);
		d = 16'h6003;
 		#(CMS_PERIOD);
		d = 16'h6004;
 		#(CMS_PERIOD);
		d = 16'h6005;
 		#(CMS_PERIOD);
		d = 16'h6006;
 		#(CMS_PERIOD);
		d = 16'h6007;
 		#(CMS_PERIOD);
		d = 16'h6008;
 		#(CMS_PERIOD);
		d = 16'h7001;
 		#(CMS_PERIOD);
		d = 16'h7002;
 		#(CMS_PERIOD);
		d = 16'h7003;
 		#(CMS_PERIOD);
		d = 16'h7004;
 		#(CMS_PERIOD);
		d = 16'h7005;
 		#(CMS_PERIOD);
		d = 16'h7006;
 		#(CMS_PERIOD);
		d = 16'h7007;
 		#(CMS_PERIOD);
		d = 16'h7008;
 		#(CMS_PERIOD);
		d = 16'hF001;
 		#(CMS_PERIOD);
		d = 16'hF000;
 		#(CMS_PERIOD);
		d = 16'hF000;
 		#(CMS_PERIOD);
		d = 16'hF000;
 		#(CMS_PERIOD);
		d = 16'hE000;
 		#(CMS_PERIOD);
		d = 16'hE010;
 		#(CMS_PERIOD);
		d = 16'hE1CD;
 		#(CMS_PERIOD);
		d = 16'hEA3F;
 		#(CMS_PERIOD);
		d = 16'h0000;
		calc = 0;
 		#(CMS_PERIOD);
		d_valid =0;
		#(25*CMS_PERIOD);


       
		// Add stimulus here

	end
      
endmodule

