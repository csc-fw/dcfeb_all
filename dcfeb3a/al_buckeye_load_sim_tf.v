`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:12:59 07/11/2014
// Design Name:   al_buckeye_load
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/al_buckeye_load_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: al_buckeye_load
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module al_buckeye_load_sim_tf;

	// Inputs
	reg CLK40;
	reg CLK1MHZ;
	reg RST;
	reg CLR_AL_DONE;
	reg CAPTURE;
	reg [15:0] BPI_AL_REG;

	// Outputs
	wire AL_BKY_ENA;
	wire SHCK_ENA;
	wire SDATA;
	wire DONE;

	// Instantiate the Unit Under Test (UUT)
	al_buckeye_load uut (
		.CLK40(CLK40), 
		.CLK1MHZ(CLK1MHZ), 
		.RST(RST), 
		.CLR_AL_DONE(CLR_AL_DONE), 
		.CAPTURE(CAPTURE), 
		.BPI_AL_REG(BPI_AL_REG), 
		.AL_BKY_ENA(AL_BKY_ENA), 
		.SHCK_ENA(SHCK_ENA), 
		.SDATA(SDATA), 
		.DONE(DONE)
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
      CLK1MHZ = 1'b1;
      forever
         #(20*CMS_PERIOD) CLK1MHZ = ~CLK1MHZ;
	end

	initial begin
		// Initialize Inputs
		RST = 1;
		CLR_AL_DONE = 0;
		CAPTURE = 0;
		BPI_AL_REG = 16'h8001;

		// Wait 100 ns for global reset to finish
		#120;
		#1 // offset transitions
		#(5*CMS_PERIOD);
		RST = 0;
		#(40*5*CMS_PERIOD);
		RST = 1;
		#(40*5*CMS_PERIOD);
		RST = 0;
		#(40*5*CMS_PERIOD);
		CLR_AL_DONE = 1;
		#(1*CMS_PERIOD);
		CLR_AL_DONE = 0;
		#(5*CMS_PERIOD);
		CAPTURE = 1;
		#(34*CMS_PERIOD);
		CAPTURE = 0;
		
        
		// Add stimulus here

	end
      
endmodule

