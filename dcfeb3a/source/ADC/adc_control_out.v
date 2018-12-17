`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:51 03/09/2011 
// Design Name: 
// Module Name:    adc_control_out 
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
module adc_control_out(
    output G1ADC_CS0_B_25,
    output G1ADC_CS1_B_25,
    output G2ADC_CS0_B_25,
    output G2ADC_CS1_B_25,
    output G3ADC_CS0_B_25,
    output G3ADC_CS1_B_25,
    output G4ADC_CS0_B_25,
    output G4ADC_CS1_B_25,
    output G5ADC_CS0_B_25,
    output G5ADC_CS1_B_25,
    output G6ADC_CS0_B_25,
    output G6ADC_CS1_B_25,
    output ADC_RST_B_25,
    output ADC_SCLK_25,
    output ADC_SDATA_25,
    output GA1ADCCLK_FN,
    output GA1ADCCLK_FP,
    output GA2ADCCLK_FN,
    output GA2ADCCLK_FP,
    output GA3ADCCLK_FN,
    output GA3ADCCLK_FP,
    input [11:0] ADC_CS,
    input ADC_RST,
    input ADC_SCLK,
    input ADC_SDATA,
    input ADC_CLK
    );
	 
	 
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G1ADC_CS0 (.O(G1ADC_CS0_B_25),.I(~ADC_CS[0]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G1ADC_CS1 (.O(G1ADC_CS1_B_25),.I(~ADC_CS[1]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G2ADC_CS0 (.O(G2ADC_CS0_B_25),.I(~ADC_CS[2]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G2ADC_CS1 (.O(G2ADC_CS1_B_25),.I(~ADC_CS[3]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G3ADC_CS0 (.O(G3ADC_CS0_B_25),.I(~ADC_CS[4]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G3ADC_CS1 (.O(G3ADC_CS1_B_25),.I(~ADC_CS[5]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G4ADC_CS0 (.O(G4ADC_CS0_B_25),.I(~ADC_CS[6]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G4ADC_CS1 (.O(G4ADC_CS1_B_25),.I(~ADC_CS[7]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G5ADC_CS0 (.O(G5ADC_CS0_B_25),.I(~ADC_CS[8]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G5ADC_CS1 (.O(G5ADC_CS1_B_25),.I(~ADC_CS[9]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G6ADC_CS0 (.O(G6ADC_CS0_B_25),.I(~ADC_CS[10]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G6ADC_CS1 (.O(G6ADC_CS1_B_25),.I(~ADC_CS[11]));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_ADC_RST (.O(ADC_RST_B_25),.I(~ADC_RST));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_ADC_SCLK (.O(ADC_SCLK_25),.I(ADC_SCLK));
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_ADC_SDATA (.O(ADC_SDATA_25),.I(ADC_SDATA));

	OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_GA1_ADCCLK (.O(GA1ADCCLK_FP),.OB(GA1ADCCLK_FN),.I(ADC_CLK));
	OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_GA2_ADCCLK (.O(GA2ADCCLK_FP),.OB(GA2ADCCLK_FN),.I(ADC_CLK));
	OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_GA3_ADCCLK (.O(GA3ADCCLK_FP),.OB(GA3ADCCLK_FN),.I(ADC_CLK));


endmodule
