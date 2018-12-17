///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2014 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : ring_buf_la.veo
// /___/   /\     Timestamp  : Tue May 06 10:46:32 Eastern Daylight Time 2014
// \   \  /  \
//  \___\/\___\
//
// Design Name: ISE Instantiation template
///////////////////////////////////////////////////////////////////////////////

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
ring_buf_la YourInstanceName (
    .CONTROL(CONTROL), // INOUT BUS [35:0]
    .CLK(CLK), // IN
    .DATA(DATA), // IN BUS [171:0]
    .TRIG0(TRIG0), // IN BUS [5:0]
    .TRIG1(TRIG1), // IN BUS [3:0]
    .TRIG2(TRIG2), // IN BUS [3:0]
    .TRIG_OUT(TRIG_OUT) // OUT
);

// INST_TAG_END ------ End INSTANTIATION Template ---------

