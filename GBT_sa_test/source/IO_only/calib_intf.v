`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07/27/2012 
// Design Name: 
// Module Name:    calib_intf 
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
module calib_intf
(
	// external connections
	input SKW_EXTPLS_P,
	input SKW_EXTPLS_N,
	input SKW_INJPLS_P,
	input SKW_INJPLS_N,
	input INJPLS_LV,
	input EXTPLS_LV,
	// common signals
	output INJPULSE_P,
	output INJPULSE_N,
	output EXTPULSE_P,
	output EXTPULSE_N
	);

wire skw_rw_extpls;
wire skw_rw_injpls;
wire trg_extpls;
wire trg_injpls;

wire ext_pulse;
wire inj_pulse;

assign ext_pulse = 1'b0;
assign inj_pulse = 1'b0;

  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_EXP (.O(skw_rw_extpls),.I(SKW_EXTPLS_P),.IB(SKW_EXTPLS_N));
  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_IJP (.O(skw_rw_injpls),.I(SKW_INJPLS_P),.IB(SKW_INJPLS_N));
  IBUF IBUF_TRG_EXP (.O(trg_extpls),.I(EXTPLS_LV));
  IBUF IBUF_TRG_IJP (.O(trg_injpls),.I(INJPLS_LV));
  OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_EXP (.O(EXTPULSE_P),.OB(EXTPULSE_N),.I(ext_pulse));
  OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_IJP (.O(INJPULSE_P),.OB(INJPULSE_N),.I(inj_pulse));

endmodule
