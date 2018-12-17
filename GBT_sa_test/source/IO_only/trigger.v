`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:59 04/01/2011 
// Design Name: 
// Module Name:    trigger 
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
// Removed all FF EMU functionality 10/27/2017
//
//////////////////////////////////////////////////////////////////////////////////
module trigger 
(
	// external connections
	input SKW_L1A_P,
	input SKW_L1A_N,
	input SKW_L1A_MATCH_P,
	input SKW_L1A_MATCH_N,
	input SKW_RESYNC_P,
	input SKW_RESYNC_N,
	input SKW_BC0_P,
	input SKW_BC0_N
	);

wire skw_rw_l1a;
wire skw_rw_l1a_match;
wire skw_rw_resync;
wire skw_rw_bc0;


  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_L1A (.O(skw_rw_l1a),.I(SKW_L1A_P),.IB(SKW_L1A_N));
  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_L1A_MATCH (.O(skw_rw_l1a_match),.I(SKW_L1A_MATCH_P),.IB(SKW_L1A_MATCH_N));
  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_RESYNC (.O(skw_rw_resync),.I(SKW_RESYNC_P),.IB(SKW_RESYNC_N));
  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_BC0 (.O(skw_rw_bc0),.I(SKW_BC0_P),.IB(SKW_BC0_N));

endmodule
