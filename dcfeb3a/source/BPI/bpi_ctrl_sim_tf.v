`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:04:46 09/30/2011
// Design Name:   bpi_ctrl_sim
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f1.0/bpi_ctrl_sim_tf.v
// Project Name:  dcfeb_f1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bpi_ctrl_sim
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bpi_ctrl_sim_tf;

	// Inputs
	reg CLK;
	reg CLK6M;
	reg RST;
	reg [15:0] BPI_JWRT_FIFO;
	reg BPI_JWE;
	reg BPI_JRE;
	reg BPI_JRST;

	// Outputs
	wire RS0;
	wire RS1;
	wire FPGA_A21;
	wire FPGA_A22;
	wire FCS_B;
	wire FOE_B;
	wire FWE_B;
	wire FLATCH_B;
	wire [1:0] RD_MODE;

	// Bidirs
	wire [20:0] BPI_AD;
	wire [15:0] CFG_DAT;
	
	// user
	reg  [22:0] addr;
   wire [15:0] stored_data;
   reg  [15:0] bpi_prom [8388607:8355840];
   reg  [15:0] out_value;
	
	integer i;
	reg[15:0] bpidata[63:0];
	
	initial begin
	   $readmemh ("BPI_sim_data", bpidata, 0, 63);
	end
	

	// Instantiate the Unit Under Test (UUT)
	bpi_ctrl_sim uut (
		.CLK(CLK), 
		.CLK6M(CLK6M), 
		.RST(RST), 
		.RD_MODE(RD_MODE),
		.BPI_JWRT_FIFO(BPI_JWRT_FIFO),
		.BPI_JWE(BPI_JWE),
		.BPI_JRE(BPI_JRE),
		.BPI_JRST(BPI_JRST),
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
      CLK6M = 1'b1;
      forever
         #(3*CMS_PERIOD) CLK6M = ~CLK6M;
	end
	
	initial begin
		// Initialize Inputs
		RST = 1;
		BPI_JWRT_FIFO = 16'h0000;
		BPI_JWE = 0;
		BPI_JRE = 0;
		BPI_JRST = 0;

		// Wait 100 ns for global reset to finish
		#1 // offset transitions
		#(5*CMS_PERIOD);
		RST = 0;
		#(30*CMS_PERIOD);
		BPI_JRST = 1;
		#(5*CMS_PERIOD);
		BPI_JRST = 0;
		BPI_JWE = 1;
		for(i=0;i<52;i=i+1) begin
			BPI_JWRT_FIFO = bpidata[i];
			#(1*CMS_PERIOD);
		end
		BPI_JWE = 0;
		#(820*CMS_PERIOD);
		BPI_JRE = 1;
		#(38*CMS_PERIOD);
		BPI_JRE = 0;
		#(8*CMS_PERIOD);
		
  		// Add stimulus here

	end
localparam // Read modes
   Rd_Array        = 2'd0,
   Rd_SR           = 2'd1,
   Rd_ESig         = 2'd2,
   Rd_CFIQ         = 2'd3;

always @(FLATCH_B or FPGA_A22 or FPGA_A21 or BPI_AD) begin
	if(!FLATCH_B) addr = {FPGA_A22,FPGA_A21,BPI_AD};
end

always @(posedge CLK) begin
	if (!FCS_B && !FWE_B)
		bpi_prom[addr] <= CFG_DAT;
end

assign stored_data = bpi_prom[addr];   

always @(negedge FCS_B)
begin
	case(RD_MODE)
		Rd_Array:	#85 out_value <= stored_data;
		Rd_SR:		#85 out_value <= 16'h0080;
		Rd_ESig:		#85 out_value <= 16'h0000;//16'hBCDF for Control Register
		Rd_CFIQ:		#85 out_value <= 16'h506B;
		default:		#85 out_value <= stored_data;
	endcase
end

assign CFG_DAT = !FOE_B ? out_value : 16'hZZZZ;

endmodule

