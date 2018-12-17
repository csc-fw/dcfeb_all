`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:00 07/30/2012 
// Design Name: 
// Module Name:    ff_emulator_intrf 
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
module ff_emulator_intrf #(
	parameter USE_CHIPSCOPE = 0
)
(
	input HS_CLK,       // High speed clock for data reception.
	input CTRL_FIBER_DET,
	//External input signals
    input CLK320_SIGDET,
    input FEM_RX_DAT_N,
    input FEM_RX_DAT_P,
	//External output signals
    output FEM_RPRG,
    output FEM_TCK,
    output FEM_TDI,
    output FEM_TMS,
    output FEM_TX_DAT_N,
    output FEM_TX_DAT_P,
	 //Internal signals
	output FEM_L1A,
	output FEM_L1A_MATCH,
	output FEM_RESYNC,
	output FEM_INJPLS,
	output FEM_EXTPLS
    );

wire ck_sd;
wire rx_dat;
wire reprog;
wire fem_tck;
wire fem_tdi;
wire fem_tms;
wire tx_dat;

assign reprog = 1'b0;
assign fem_tck = 1'b0;
assign fem_tdi = 1'b0;
assign fem_tms = 1'b0;
assign tx_dat = 1'b0;


	IBUF IBUF_FEMCK_SIGDET (.O(ck_sd),.I(CLK320_SIGDET));
	IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_FEM_RX_DAT (.O(rx_dat),.I(FEM_RX_DAT_P),.IB(FEM_RX_DAT_N));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FEM_RPRG (.O(FEM_RPRG),.I(reprog));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FEM_TCK (.O(FEM_TCK),.I(fem_tck));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FEM_TDI (.O(FEM_TDI),.I(fem_tdi));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FEM_TMS (.O(FEM_TMS),.I(fem_tms));
	OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_FEM_TX_DAT (.O(FEM_TX_DAT_P),.OB(FEM_TX_DAT_N),.I(tx_dat));
	
assign FEM_L1A = 1'b0;
assign FEM_L1A_MATCH = 1'b0;
assign FEM_RESYNC = 1'b0;
assign FEM_INJPLS = 1'b0;
assign FEM_EXTPLS = 1'b0;

endmodule
