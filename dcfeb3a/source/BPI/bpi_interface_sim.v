`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:57 09/15/2011
// Design Name:   bpi_interface
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f1.0/bpi_interface_sim.v
// Project Name:  dcfeb_f1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bpi_interface
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bpi_interface_sim;

	// Inputs
	reg CLK;
	reg RST;
	reg [22:0] ADDR;
	reg [15:0] CMD_DATA_OUT;
	reg [1:0] OP;
	reg [3:0] SWITCH;
	reg EXECUTE;

	// Outputs
	wire [15:0] DATA_IN;
	wire LOAD_DATA;
	wire BUSY;
	wire RS0;
	wire RS1;
	wire FPGA_A21;
	wire FPGA_A22;
	wire FCS_B;
	wire FOE_B;
	wire FWE_B;
	wire FLATCH_B;

	// Bidirs
	wire [20:0] BPI_AD;
	wire [15:0] CFG_DAT;

	// user added
	reg [15:0] cap_data;
	reg [15:0] stored_data;
	reg [15:0] out_value;

	// Instantiate the Unit Under Test (UUT)
	bpi_interface uut (
		.CLK(CLK), 
		.RST(RST), 
		.ADDR(ADDR), 
		.CMD_DATA_OUT(CMD_DATA_OUT), 
		.OP(OP), 
		.SWITCH(SWITCH), 
		.EXECUTE(EXECUTE), 
		.DATA_IN(DATA_IN), 
		.LOAD_DATA(LOAD_DATA), 
		.BUSY(BUSY), 
		.BPI_AD(BPI_AD), 
		.CFG_DAT(CFG_DAT), 
		.RS0(RS0), 
		.RS1(RS1), 
		.FPGA_A21(FPGA_A21), 
		.FPGA_A22(FPGA_A22), 
		.FCS_B(FCS_B), 
		.FOE_B(FOE_B), 
		.FWE_B(FWE_B), 
		.FLATCH_B(FLATCH_B)
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
		ADDR = 0;
		CMD_DATA_OUT = 0;
		OP = 0;
		SWITCH = 4'hB;
		EXECUTE = 0;
		stored_data = 0;

		// Wait 100 ns for global reset to finish
		#1 // offset transitions
		#(5*CMS_PERIOD);
		RST = 0;
		#(5*CMS_PERIOD);
		ADDR = 23'h143216;
		CMD_DATA_OUT = 16'h55A4;
		OP = 1;
		EXECUTE = 1;
		#(1*CMS_PERIOD);
		EXECUTE = 0;
		#(6*CMS_PERIOD);
		OP = 2;
		EXECUTE = 1;
		#(1*CMS_PERIOD);
		EXECUTE = 0;
		#(10*CMS_PERIOD);
		ADDR = 23'h000245;
		CMD_DATA_OUT = 16'h3333;
		OP = 1;
		EXECUTE = 1;
		#(1*CMS_PERIOD);
		EXECUTE = 0;
		#(6*CMS_PERIOD);
		OP = 2;
		EXECUTE = 1;
		#(1*CMS_PERIOD);
		EXECUTE = 0;
		#(10*CMS_PERIOD);
		
  		// Add stimulus here

	end

always @(posedge CLK)
begin
	if(LOAD_DATA)	cap_data <= DATA_IN;
end
always @(posedge CLK)
begin
	if(!FCS_B && !FWE_B)	stored_data <= CFG_DAT;
end

assign CFG_DAT = !FOE_B ? out_value : 16'hZZZZ;
always @(negedge FCS_B)
begin
	out_value <= #85 stored_data;
end

endmodule

