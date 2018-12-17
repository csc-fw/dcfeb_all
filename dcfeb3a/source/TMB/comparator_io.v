`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:21 03/09/2011 
// Design Name: 
// Module Name:    comparator_io 
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
module comparator_io(
    input [7:0] G1C_LV,
    input [7:0] G2C_LV,
    input [7:0] G3C_LV,
    input [7:0] G4C_LV,
    input [7:0] G5C_LV,
    input [7:0] G6C_LV,
    output [1:0] CMODE,
    output [2:0] CTIME,
    output LCTCLK,
    output LCTRST,
    output [7:0] G1C,
    output [7:0] G2C,
    output [7:0] G3C,
    output [7:0] G4C,
    output [7:0] G5C,
    output [7:0] G6C,
    input [1:0] COMP_MODE,
    input [2:0] COMP_TIME,
    input LCT_CLK,
    input LCT_RST
    );


  IBUF IBUF_G1C[7:0] (.O(G1C),.I(G1C_LV));
  IBUF IBUF_G2C[7:0] (.O(G2C),.I(G2C_LV));
  IBUF IBUF_G3C[7:0] (.O(G3C),.I(G3C_LV));
  IBUF IBUF_G4C[7:0] (.O(G4C),.I(G4C_LV));
  IBUF IBUF_G5C[7:0] (.O(G5C),.I(G5C_LV));
  IBUF IBUF_G6C[7:0] (.O(G6C),.I(G6C_LV));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_CMODE[1:0] (.O(CMODE),.I(COMP_MODE));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_CTIME[2:0] (.O(CTIME),.I(COMP_TIME));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_LCTCLK (.O(LCTCLK),.I(LCT_CLK));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_LCTRST (.O(LCTRST),.I(LCT_RST));

endmodule
