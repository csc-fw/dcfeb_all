///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2014 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : ring_buf_la.v
// /___/   /\     Timestamp  : Tue May 06 10:46:32 Eastern Daylight Time 2014
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module ring_buf_la(
    CONTROL,
    CLK,
    DATA,
    TRIG0,
    TRIG1,
    TRIG2,
    TRIG_OUT) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [171 : 0] DATA;
input [5 : 0] TRIG0;
input [3 : 0] TRIG1;
input [3 : 0] TRIG2;
output TRIG_OUT;

endmodule
