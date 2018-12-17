///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2013 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : bpi_vio.v
// /___/   /\     Timestamp  : Tue Nov 05 17:18:10 Eastern Standard Time 2013
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module bpi_vio(
    CONTROL,
    CLK,
    ASYNC_IN,
    ASYNC_OUT,
    SYNC_IN,
    SYNC_OUT) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [127 : 0] ASYNC_IN;
output [59 : 0] ASYNC_OUT;
input [79 : 0] SYNC_IN;
output [12 : 0] SYNC_OUT;

endmodule
