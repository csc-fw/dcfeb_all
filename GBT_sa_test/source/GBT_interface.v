`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:05 10/30/2017 
// Design Name: 
// Module Name:    GBT_intrf 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GBT_interface #(
	parameter USE_CHIPSCOPE = 0
)(
	// ChipScope Pro signlas
	inout [35:0] LA_CNTRL,
	//
	//internal inputs
	input GBT_CLK,
	input CLK40,
	input RST,
	input GBT_ENA_TEST,
	input [15:0] GBT_DATA_IN,
	//external inputs
	input  GBT_RXRDY_FPGA,
	input  GBT_RXDATAVALID_FPGA,
	//external oputputs
	output GBT_TXVD,
	output GBT_TEST_MODE,
	output [15:0] GBT_RTN_DATA_P,
	output [15:0] GBT_RTN_DATA_N,
	//test point outputs
	output RCV_RDY,
	output RCV_DATA_VLD,
	output [15:0] RCV_DATA,
	output [15:0] TRNS_DATA,
	output RCV_VLD,
	output TRNS_VLD,
	output READ_ENA
);

reg [15:0] rx_data;
reg [15:0] to_gbtx;
wire [15:0] fifo_out;
wire full;
wire empty;
wire almost_empty;
wire fifo_rdy;
wire rd_en;
wire rx_rdy;
wire rxdatavalid;
wire txdatavalid;
reg txvd;
reg rxvd;

assign RCV_RDY   = rx_rdy;
assign RCV_DATA_VLD   = rxdatavalid;
assign RCV_DATA  = rx_data;
assign RCV_VLD   = rxvd;
assign TRNS_DATA = to_gbtx;
assign TRNS_VLD  = txvd;
assign READ_ENA = rd_en;

	IBUF  #(.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))    IBUF_GBT_RXRDY_FPGA  (.O(rx_rdy),.I(GBT_RXRDY_FPGA));
	IBUF  #(.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))    IBUF_GBT_RXDATAVALID_FPGA (.O(rxdatavalid),.I(GBT_RXDATAVALID_FPGA));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_GBT_TX_VALID (.O(GBT_TXVD),.I(txdatavalid));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_GBT_TEST_MODE (.O(GBT_TEST_MODE),.I(GBT_ENA_TEST));
	OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_GBT_RTN_DATA[15:0] (.O(GBT_RTN_DATA_P),.OB(GBT_RTN_DATA_N),.I(to_gbtx));

assign txdatavalid = GBT_ENA_TEST ? txvd : 1'b0;
assign fifo_rdy = !almost_empty;

always @(posedge GBT_CLK) begin
	rx_data <= GBT_DATA_IN;
end

always @(posedge GBT_CLK) begin
	rxvd <= rxdatavalid && rx_rdy;
end

GBT_FIFO GBT_FIFO_i (
	.rst(RST),            // input rst
	.wr_clk(GBT_CLK),     // input wr_clk
	.rd_clk(CLK40),       // input rd_clk
	.din(rx_data),        // input [15 : 0] din
	.wr_en(rxvd),         // input wr_en
	.rd_en(rd_en),        // input rd_en
	.dout(fifo_out),      // output [15 : 0] dout
	.full(full),          // output full
	.empty(empty),        // output empty
	.prog_empty(almost_empty) // output prog_empty
);


always @(posedge CLK40) begin
	to_gbtx <= fifo_out;
end
always @(posedge CLK40) begin
	txvd <= rd_en;
end

GBT_FIFO_readout_FSM GBT_FIFO_readout_FSM_i (
	.RD_EN(rd_en),
	.CLK(CLK40),
	.MT(empty),
	.READY(fifo_rdy),
	.RST(RST)
);

generate
if(USE_CHIPSCOPE==1) 
begin : chipscope_gbtx_lpbk
// Logic analyzer and i/o for parameter transfer from PROM to FIFO
//
wire [63:0] gbtx_la_data;
wire [7:0] gbtx_la_trig;

	gbtx_lpbk_la gbtx_lpbk_la_i (
		 .CONTROL(LA_CNTRL),
		 .CLK(CLK40),
		 .DATA(gbtx_la_data),  // IN BUS [63:0]
		 .TRIG0(gbtx_la_trig)  // IN BUS [7:0]
	);

// LA Data [205:0]
	assign gbtx_la_data[15:0]   = rx_data[15:0];
	assign gbtx_la_data[31:16]  = fifo_out[15:0];
	assign gbtx_la_data[47:32]  = to_gbtx[15:0];
	assign gbtx_la_data[48]     = rx_rdy;
	assign gbtx_la_data[49]     = rxdatavalid;
	assign gbtx_la_data[50]     = rxvd;
	assign gbtx_la_data[51]     = full;
	assign gbtx_la_data[52]     = empty;
	assign gbtx_la_data[53]     = almost_empty;
	assign gbtx_la_data[54]     = fifo_rdy;
	assign gbtx_la_data[55]     = rd_en;
	assign gbtx_la_data[56]     = txvd;
	assign gbtx_la_data[57]     = txdatavalid;
	assign gbtx_la_data[63:58]  = 6'b000000;

// LA Trigger [7:0]
	assign gbtx_la_trig[0]      = rx_rdy;
	assign gbtx_la_trig[1]      = rxdatavalid;
	assign gbtx_la_trig[2]      = rxvd;
	assign gbtx_la_trig[3]      = empty;
	assign gbtx_la_trig[4]      = almost_empty;
	assign gbtx_la_trig[5]      = fifo_rdy;
	assign gbtx_la_trig[6]      = rd_en;
	assign gbtx_la_trig[7]      = txvd;
	
end
endgenerate

endmodule
