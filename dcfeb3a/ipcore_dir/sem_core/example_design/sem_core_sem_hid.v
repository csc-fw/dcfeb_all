/////////////////////////////////////////////////////////////////////////////
//
//
//
/////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /
// \   \   \/    Core:          sem
//  \   \        Module:        sem_core_sem_hid
//  /   /        Filename:      sem_core_sem_hid.v
// /___/   /\    Purpose:       HID Shim using ChipScope components.
// \   \  /  \
//  \___\/\___\
//
/////////////////////////////////////////////////////////////////////////////
//
// (c) Copyright 2010 - 2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
/////////////////////////////////////////////////////////////////////////////
//
// Module Description:
//
// This module contains instances of ChipScope cores to enable interactive
// injection of errors and observation of status.
//
/////////////////////////////////////////////////////////////////////////////
//
// Port Definition:
//
// Name                          Type   Description
// ============================= ====== ====================================
// icap_clk                      input  The system clock signal.
//
// status_heartbeat              input  Heartbeat signal for external watch
//                                      dog timer implementation; pulses
//                                      when readback runs.  Synchronous to
//                                      icap_clk.
//
// status_initialization         input  Indicates initialization is taking
//                                      place.  Synchronous to icap_clk.
//
// status_observation            input  Indicates observation is taking
//                                      place.  Synchronous to icap_clk.
//
// status_correction             input  Indicates correction is taking
//                                      place.  Synchronous to icap_clk.
//
// status_classification         input  Indicates classification is taking
//                                      place.  Synchronous to icap_clk.
//
// status_injection              input  Indicates injection is taking
//                                      place.  Synchronous to icap_clk.
//
// status_essential              input  Indicates essential error condition.
//                                      Qualified by de-assertion of the
//                                      status_classification signal, and
//                                      is synchronous to icap_clk.
//
// status_uncorrectable          input  Indicates uncorrectable error
//                                      condition. Qualified by de-assertion
//                                      of the status_correction signal, and
//                                      is synchronous to icap_clk.
//
// inject_strobe                 output Error injection port strobe used
//                                      by the controller to enable capture
//                                      of the error injection address.
//                                      Synchronous to icap_clk.
//
// inject_address[35:0]          output Error injection port address used
//                                      to specify the location of a bit
//                                      to be corrupted.  Synchronous to
//                                      icap_clk.
//
/////////////////////////////////////////////////////////////////////////////
//
// Parameter and Localparam Definition:
//
// Name                          Type   Description
// ============================= ====== ====================================
// TCQ                           int    Sets the clock-to-out for behavioral
//                                      descriptions of sequential logic.
//
/////////////////////////////////////////////////////////////////////////////
//
// Module Dependencies:
//
// sem_core_sem_hid
// |
// +- chipscope_icon (netlist)
// |
// \- chipscope_vio (netlist)
//
/////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

/////////////////////////////////////////////////////////////////////////////
// Module
/////////////////////////////////////////////////////////////////////////////

module sem_core_sem_hid (
  input  wire        icap_clk,
  input  wire        status_heartbeat,
  input  wire        status_initialization,
  input  wire        status_observation,
  input  wire        status_correction,
  input  wire        status_classification,
  input  wire        status_injection,
  input  wire        status_essential,
  input  wire        status_uncorrectable,
  output wire        inject_strobe,
  output wire [35:0] inject_address
  );

  ///////////////////////////////////////////////////////////////////////////
  // Define local constants.
  ///////////////////////////////////////////////////////////////////////////

  localparam TCQ = 1;

  ///////////////////////////////////////////////////////////////////////////
  // Declare signals.
  ///////////////////////////////////////////////////////////////////////////

  wire [35:0] hidcontrol;
  wire  [8:0] sync_in;
  wire [36:0] sync_out;
  wire        reserved;

  ///////////////////////////////////////////////////////////////////////////
  // Wire declaration and bus break-outs.
  ///////////////////////////////////////////////////////////////////////////

  assign reserved = 1'b0;
  assign sync_in = {
                   reserved,
                   status_heartbeat,
                   status_uncorrectable,
                   status_essential,
                   status_injection,
                   status_classification,
                   status_correction,
                   status_observation,
                   status_initialization
                   };

  assign inject_strobe = sync_out[36];
  assign inject_address = sync_out[35:0];

  ///////////////////////////////////////////////////////////////////////////
  // Instantiate the ChipScope ICON and VIO cores.
  ///////////////////////////////////////////////////////////////////////////

  chipscope_icon example_chipscope_icon (
    .CONTROL0(hidcontrol)
    );

  chipscope_vio example_chipscope_vio (
    .CONTROL(hidcontrol),
    .CLK(icap_clk),
    .SYNC_IN(sync_in),
    .SYNC_OUT(sync_out)
    );

  ///////////////////////////////////////////////////////////////////////////
  //
  ///////////////////////////////////////////////////////////////////////////

endmodule

/////////////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////////////
