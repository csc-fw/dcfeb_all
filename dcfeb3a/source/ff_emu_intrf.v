`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:28 07/30/2012 
// Design Name: 
// Module Name:    ff_emu_intrf 
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
module ff_emu_intrf #(
	parameter USE_CHIPSCOPE = 0
)(
	//External input signals
    input CTRL_SIGDET,
    input FMU_TOKEN,
    input FMU_SPI_CS0,
    input FMU_SPI_CS1,
    input FMU_SPI_CLK,
    input FMU_SPI_DAT,
	//External output signals
    output CTRL_TDIS,
    output FMU_SPI_BUSY,
    output FMU_SPI_RTN_CLK,
    output FMU_SPI_RTN_DAT,
    output FMU_UL_TCK,
    output FMU_UL_TDI,
    output FMU_UL_TMS,
    output FMU_FLF_E1,
    output FMU_FLF_P1,
    output FMU_FLF_P2,
    output FMU_VLF_E2,
    output FMU_CLK40_UL_N,
    output FMU_CLK40_UL_P,
    output RST_FFEMU,
	 // Internal signals
	 output CTRL_FIBER_DET
    );
wire token;
wire spi_cs0;
wire spi_cs1;
wire spi_clk;
wire spi_dat;
wire tdis;
wire spi_busy;
wire spi_rtn_clk;
wire spi_rtn_dat;
wire ul_tck;
wire ul_tdi;
wire ul_tms;
wire flf_e1;
wire flf_p1;
wire flf_p2;
wire vlf_e2;
wire rst_ff_emu;
wire clk40_ul;

assign tdis = CTRL_FIBER_DET ? 1'b0 : 1'b1;
assign spi_busy = 1'b1;
assign spi_rtn_clk = 1'b0;
assign spi_rtn_dat = 1'b0;
assign ul_tck = 1'b0;
assign ul_tdi = 1'b0;
assign ul_tms = 1'b0;
assign flf_e1 = 1'b0;
assign flf_p1 = 1'b0;
assign flf_p2 = 1'b0;
assign vlf_e2 = 1'b0;
assign rst_ff_emu = 1'b0;
assign clk40_ul = 1'b0;

	IBUF IBUF_CTRL_SD (.O(CTRL_FIBER_DET),.I(CTRL_SIGDET));
	IBUF IBUF_FMU_TOKEN (.O(token),.I(FMU_TOKEN));
	IBUF IBUF_FMU_SPI_CS0 (.O(spi_cs0),.I(FMU_SPI_CS0));
	IBUF IBUF_FMU_SPI_CS1 (.O(spi_cs1),.I(FMU_SPI_CS1));
	IBUF IBUF_FMU_SPI_CLK (.O(spi_clk),.I(FMU_SPI_CLK));
	IBUF IBUF_FMU_SPI_DAT (.O(spi_dat),.I(FMU_SPI_DAT));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_CTRL_TDIS (.O(CTRL_TDIS),.I(tdis));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_SPI_BUSY (.O(FMU_SPI_BUSY),.I(spi_busy));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_SPI_RTN_CLK (.O(FMU_SPI_RTN_CLK),.I(spi_rtn_clk));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_SPI_RTN_DAT (.O(FMU_SPI_RTN_DAT),.I(spi_rtn_dat));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_UL_TCK (.O(FMU_UL_TCK),.I(ul_tck));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_UL_TDI (.O(FMU_UL_TDI),.I(ul_tdi));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_UL_TMS (.O(FMU_UL_TMS),.I(ul_tms));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_FLF_E1 (.O(FMU_FLF_E1),.I(flf_e1));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_FLF_P1 (.O(FMU_FLF_P1),.I(flf_p1));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_FLF_P2 (.O(FMU_FLF_P2),.I(flf_p2));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_FMU_VLF_E2 (.O(FMU_VLF_E2),.I(vlf_e2));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_RST_FFEMU (.O(RST_FFEMU),.I(rst_ff_emu));
	OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_CLK40_UL_0 (.O(FMU_CLK40_UL_P),.OB(FMU_CLK40_UL_N),.I(clk40_ul));


endmodule
