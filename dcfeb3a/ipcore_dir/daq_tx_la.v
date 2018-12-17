///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2014 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : daq_tx_la.v
// /___/   /\     Timestamp  : Fri Nov 14 11:19:29 Eastern Standard Time 2014
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module daq_tx_la(
    CONTROL,
    CLK,
    DATA,
    TRIG0,
    TRIG1,
    TRIG2,
    TRIG_OUT) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [129 : 0] DATA;
input [7 : 0] TRIG0;
input [9 : 0] TRIG1;
input [9 : 0] TRIG2;
output TRIG_OUT;

endmodule
