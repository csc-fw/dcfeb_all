///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2013 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : adc_cnfg_mem_la.v
// /___/   /\     Timestamp  : Tue Nov 05 17:12:14 Eastern Standard Time 2013
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module adc_cnfg_mem_la(
    CONTROL,
    CLK,
    DATA,
    TRIG0,
    TRIG_OUT) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [95 : 0] DATA;
input [23 : 0] TRIG0;
output TRIG_OUT;

endmodule
