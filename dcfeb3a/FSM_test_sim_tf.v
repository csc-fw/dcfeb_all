`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:44 07/10/2014
// Design Name:   FSM_test_sim
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/FSM_test_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM_test_sim
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_test_sim_tf;

	// Inputs
	reg CLK;
	reg RST;
	reg AL_START;
	reg AL_DONE;

	// Outputs
	wire [22:0] AL_ADDR;
	wire [15:0] AL_CMD_DATA_OUT;
	wire [1:0] AL_OP;
	wire AL_EXECUTE;
	wire AUTO_LOAD_ENA;
	wire CLR_AL_DONE;
	wire [5:0] AL_CNT;
	wire [2:0] AL_STATUS;

	// Instantiate the Unit Under Test (UUT)
	FSM_test_sim uut (
		.CLK(CLK), 
		.RST(RST), 
		.AL_START(AL_START), 
		.AL_DONE(AL_DONE), 
		.AL_ADDR(AL_ADDR), 
		.AL_CMD_DATA_OUT(AL_CMD_DATA_OUT), 
		.AL_OP(AL_OP), 
		.AL_EXECUTE(AL_EXECUTE), 
		.AUTO_LOAD_ENA(AUTO_LOAD_ENA), 
		.CLR_AL_DONE(CLR_AL_DONE), 
		.AL_CNT(AL_CNT), 
		.AL_STATUS(AL_STATUS)
	);


   parameter CMS_PERIOD = 24;

	initial begin
		// Initialize Inputs
      CLK = 1'b1;
      forever
         #(CMS_PERIOD/2) CLK = ~CLK;
	end

	initial begin
		// Initialize Inputs
		RST = 1;
		AL_START = 0;
		AL_DONE = 0;

		// Wait 100 ns for global reset to finish
		#120;
		#1 // offset transitions
		#(5*CMS_PERIOD);
		RST = 0;
		#(5*CMS_PERIOD);
		AL_START = 1;
		#(5*CMS_PERIOD);
		AL_START = 0;
		#(416*CMS_PERIOD);
		AL_DONE = 1;
        
		// Add stimulus here

	end
      
endmodule

