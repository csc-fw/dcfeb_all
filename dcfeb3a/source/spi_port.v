`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:13 07/30/2012 
// Design Name: 
// Module Name:    spi_port 
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
module spi_port #(
	parameter USE_CHIPSCOPE = 0
)(
    input SPI_RTN_LV,
    output SPI_CK_LV,
    output SPI_DAT_LV,
    output ADC_CS_LV_B,
    output CAL_DAC_CS_LV_B,
    output COMP_DAC_CS_LV_B,
    output SPI_RTN,
    input CDAC_ENB,
    input CALDAC_ENB,
    input CALADC_ENB,
    input SPI_CK,
    input SPI_DAT
    );


  IBUF IBUF_SPI_RTN (.O(SPI_RTN),.I(SPI_RTN_LV));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_ADC_ENB (.O(ADC_CS_LV_B),.I(~CALADC_ENB));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_CAL_DAC_ENB (.O(CAL_DAC_CS_LV_B),.I(~CALDAC_ENB));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_COMP_DAC_ENB (.O(COMP_DAC_CS_LV_B),.I(~CDAC_ENB));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_SPI_CK (.O(SPI_CK_LV),.I(SPI_CK));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_SPI_DAT (.O(SPI_DAT_LV),.I(SPI_DAT));


endmodule
