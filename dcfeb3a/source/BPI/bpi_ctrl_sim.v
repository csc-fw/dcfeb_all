`timescale 1ns / 1ps

module bpi_ctrl_sim (
	input CLK,
	input CLK6M,
	input RST,
	output [1:0]RD_MODE,
	// JTag inputs
	input [15:0] BPI_JWRT_FIFO,
	input BPI_JWE,
	input BPI_JRE,
	input BPI_JRST,
   //PROM Configuration signals
   inout  [20:0] BPI_AD,
   inout  [15:0] CFG_DAT,
   output RS0, RS1, FPGA_A21, FPGA_A22,
   output FCS_B, FOE_B, FWE_B, FLATCH_B
	);

wire clk40;
wire clk6;
wire sys_rst;
 	 
/////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  BPI controller for XCF128 flash PROM                                   //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
 wire bpi_busy;
 wire [1:0] bpi_op;
 wire [22:0] bpi_addr;
 wire [15:0] bpi_data_to;
 wire [15:0] bpi_data_from;
 wire bpi_load_data;
 wire bpi_execute;
  // Jtag interface signals
 	wire [15:0] bpi_rbk_fifo;
	wire [15:0] bpi_wrt_fifo;
	wire [15:0] bpi_status;
	wire [31:0] bpi_timer;
	wire bpi_jwe;
	wire bpi_jre;
	wire bpi_jrst;

assign clk40 = CLK;
assign clk6 = CLK6M;
assign sys_rst = RST;
assign bpi_wrt_fifo = BPI_JWRT_FIFO;
assign bpi_jwe = BPI_JWE;
assign bpi_jre = BPI_JRE;
assign bpi_jrst = BPI_JRST;

	BPI_ctrl #(.USE_CHIPSCOPE(0))
	BPI_ctrl_i(
//	 .BPI_VIO_CNTRL(bpi_vio_ctrl),
//	 .BPI_LA_CNTRL(bpi_la_ctrl),
	// added for sim of external PROM
	.RD_MODE(RD_MODE),
    .CLK(clk40),
    .CLK6M(clk6),
    .RST(sys_rst),
	 // Signals to/from JTAG interface
	 .BPI_JWRT_FIFO(bpi_wrt_fifo),
	 .BPI_JWE(bpi_jwe),
	 .BPI_JRE(bpi_jre),
	 .BPI_JRST(bpi_jrst),
	 .BPI_JRBK_FIFO(bpi_rbk_fifo),
	 .BPI_STATUS(bpi_status),
	 .BPI_TIMER(bpi_timer),    // stop watch timer for BPI commands
	 // Signals to/from BPI interface
	 .BPI_BUSY(bpi_busy),
	 .BPI_DATA_FROM(bpi_data_from),
	 .BPI_LOAD_DATA(bpi_load_data),
	 .BPI_OP(bpi_op),
	 .BPI_ADDR(bpi_addr),
	 .BPI_DATA_TO(bpi_data_to),
	 .BPI_EXECUTE(bpi_execute)
    );

 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  BPI interface to XCF128 flash PROM                                     //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
    wire [3:0] switch =4'hB;
	 
   bpi_interface 
	bpi_intf1 (
		.CLK(clk40),
		.RST(sys_rst),
	   .ADDR(bpi_addr),         //Bank/Array Address 
	   .CMD_DATA_OUT(bpi_data_to), //Data being written to FLASH device
	   .OP(bpi_op),           //Operation: 00-standby, 01-write, 10-read, 11-not allowed(standby)
	   .SWITCH(switch),
		.EXECUTE(bpi_execute),
		.DATA_IN(bpi_data_from),  //Data read from FLASH device
		.LOAD_DATA(bpi_load_data),           //Clock enable signal for capturing Data read from FLASH device
		.BUSY(bpi_busy),            //Operation in progress signal (not ready)
	 // external connections
      .BPI_AD(BPI_AD),     // Address bus to/from BPI prom
      .CFG_DAT(CFG_DAT),   // Data bus to/from BPI prom
      .RS0(RS0),.RS1(RS1),.FPGA_A21(FPGA_A21),.FPGA_A22(FPGA_A22),
      .FCS_B(FCS_B),.FOE_B(FOE_B),.FWE_B(FWE_B),.FLATCH_B(FLATCH_B)
	);
 

endmodule

