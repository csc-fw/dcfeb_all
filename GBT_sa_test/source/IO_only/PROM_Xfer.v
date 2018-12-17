`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:13 04/27/2018 
// Design Name: 
// Module Name:    PROM_Xfer 
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
module PROM_Xfer (
	//
	input CLK20,
	input [7:0] PARAM_DAT,
	//
	output PARAM_CLK,
	output PARAM_CE_B,
	output PARAM_OE
);

// Data
wire [7:0] data_in;


// PROM control signals
wire ce;
wire oe;

assign ce = 1'b0;
assign oe = 1'b0;


   IBUF IBUF_PARAM_DAT[7:0] (.O(data_in),.I(PARAM_DAT));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_PARAM_CLK  (.O(PARAM_CLK),.I(CLK20));  // 20 MHz clock to PROM
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_PARAM_CE_B (.O(PARAM_CE_B),.I(~ce)); // Chip Enable for PROM
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_PARAM_OE   (.O(PARAM_OE),.I(oe));    // Output Enable for PROM
	

endmodule
