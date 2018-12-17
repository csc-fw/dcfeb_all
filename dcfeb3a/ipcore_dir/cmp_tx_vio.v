///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2013 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : cmp_tx_vio.v
// /___/   /\     Timestamp  : Tue Nov 05 17:25:00 Eastern Standard Time 2013
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module cmp_tx_vio(
    CONTROL,
    CLK,
    ASYNC_IN,
    ASYNC_OUT,
    SYNC_OUT) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [31 : 0] ASYNC_IN;
output [7 : 0] ASYNC_OUT;
output [3 : 0] SYNC_OUT;

endmodule
