///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2014 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : CSP_rngbuf_daq.v
// /___/   /\     Timestamp  : Thu Nov 13 17:32:36 Eastern Standard Time 2014
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module CSP_rngbuf_daq(
    CONTROL0,
    CONTROL1,
    CONTROL2,
    CONTROL3,
    CONTROL4,
    CONTROL5) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL0;
inout [35 : 0] CONTROL1;
inout [35 : 0] CONTROL2;
inout [35 : 0] CONTROL3;
inout [35 : 0] CONTROL4;
inout [35 : 0] CONTROL5;

endmodule
