`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:52:55 07/15/2014
// Design Name:   xfer2ringbuf
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/DAQ/xfer2ringbuf_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: xfer2ringbuf
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module xfer2ringbuf_sim_tf;

	// Inputs
	reg CLK;
	reg RST;
	reg JTAG_MODE;
	reg J_RD_FIFO;
	reg [191:0] DIN_16CH;
	reg RDY;
	reg [15:0] F16_MT;
	reg TRIG_IN;

	// Outputs
	wire TRIG_OUT;
	wire [15:0] RD_ENA;
	wire L1A_RD_EN;
	wire WREN;
	wire [11:0] DMUX;

	// Bidirs
	wire [35:0] LA_CNTRL;

	// Instantiate the Unit Under Test (UUT)
	xfer2ringbuf uut (
		.LA_CNTRL(LA_CNTRL), 
		.CLK(CLK), 
		.RST(RST), 
		.JTAG_MODE(JTAG_MODE), 
		.J_RD_FIFO(J_RD_FIFO), 
		.DIN_16CH(DIN_16CH), 
		.RDY(RDY), 
		.F16_MT(F16_MT), 
		.TRIG_IN(TRIG_IN), 
		.TRIG_OUT(TRIG_OUT), 
		.RD_ENA(RD_ENA), 
		.L1A_RD_EN(L1A_RD_EN), 
		.WREN(WREN), 
		.DMUX(DMUX)
	);


   parameter CMS_PERIOD = 24;

	initial begin
		// Initialize Inputs
      CLK = 1'b1;
      forever
         #(CMS_PERIOD/8) CLK = ~CLK;
	end

	initial begin
		// Initialize Inputs
		RST = 1;
		JTAG_MODE = 0;
		J_RD_FIFO = 0;
		DIN_16CH = 0;
		RDY = 0;
		F16_MT = 0;
		TRIG_IN = 0;

		// Wait 100 ns for global reset to finish
		#(5*CMS_PERIOD);
		#1;
		#(5*CMS_PERIOD);
		RST = 0;
		#(5*CMS_PERIOD);
		RDY = 1;
		#(36*CMS_PERIOD);
		RDY = 0;
        
		// Add stimulus here

	end
      
endmodule

