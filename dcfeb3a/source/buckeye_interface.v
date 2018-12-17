`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:38:46 03/09/2011 
// Design Name: 
// Module Name:    buckeye_interface 
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
module buckeye_interface(
    input G1SHOUTLV,
    input G2SHOUTLV,
    input G3SHOUTLV,
    input G4SHOUTLV,
    input G5SHOUTLV,
    input G6SHOUTLV,
    output G1SHINLV,
    output G2SHINLV,
    output G3SHINLV,
    output G4SHINLV,
    output G5SHINLV,
    output G6SHINLV,
    output G1SHCKLV,
    output G2SHCKLV,
    output G3SHCKLV,
    output G4SHCKLV,
    output G5SHCKLV,
    output G6SHCKLV,
    input [6:1] TO_BKY,
    output [6:1] BKY_RTN,
    input [6:1] BKY_CLK
    );

  IBUF IBUF_G1SHOUT (.O(BKY_RTN[1]),.I(G1SHOUTLV));
  IBUF IBUF_G2SHOUT (.O(BKY_RTN[2]),.I(G2SHOUTLV));
  IBUF IBUF_G3SHOUT (.O(BKY_RTN[3]),.I(G3SHOUTLV));
  IBUF IBUF_G4SHOUT (.O(BKY_RTN[4]),.I(G4SHOUTLV));
  IBUF IBUF_G5SHOUT (.O(BKY_RTN[5]),.I(G5SHOUTLV));
  IBUF IBUF_G6SHOUT (.O(BKY_RTN[6]),.I(G6SHOUTLV));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G1SHIN (.O(G1SHINLV),.I(TO_BKY[1]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G2SHIN (.O(G2SHINLV),.I(TO_BKY[2]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G3SHIN (.O(G3SHINLV),.I(TO_BKY[3]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G4SHIN (.O(G4SHINLV),.I(TO_BKY[4]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G5SHIN (.O(G5SHINLV),.I(TO_BKY[5]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G6SHIN (.O(G6SHINLV),.I(TO_BKY[6]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G1SHCK (.O(G1SHCKLV),.I(BKY_CLK[1]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G2SHCK (.O(G2SHCKLV),.I(BKY_CLK[2]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G3SHCK (.O(G3SHCKLV),.I(BKY_CLK[3]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G4SHCK (.O(G4SHCKLV),.I(BKY_CLK[4]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G5SHCK (.O(G5SHCKLV),.I(BKY_CLK[5]));
  OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_G6SHCK (.O(G6SHCKLV),.I(BKY_CLK[6]));

endmodule
