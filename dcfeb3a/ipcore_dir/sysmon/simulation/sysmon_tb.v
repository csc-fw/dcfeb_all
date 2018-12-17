// file: sysmon_tb.v
// (c) Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
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

//----------------------------------------------------------------------------
// System Monitor wizard demonstration testbench
//----------------------------------------------------------------------------
// This demonstration testbench instantiates the example design for the 
//   System Monitor wizard. Input clock is generated in this testbench.
//----------------------------------------------------------------------------

// This testbench does not implement  checking of averaging and calibration
// Bipolar signals are applied with Vn = 0

`timescale 1ps/1ps

module sysmon_tb ();

  // timescale is 1ps/1ps
  localparam  ONE_NS      = 1000;

  localparam time PER1    = 20*ONE_NS;
  // Declare the input clock signals
  reg         DCLK_TB     = 1;


  wire [15:0] DO_unused;
  wire DRDY_unused;

  wire RESET_TB;


  wire VCCAUX_ALARM_TB;

  wire VCCINT_ALARM_TB;

  wire USER_TEMP_ALARM_TB;










  wire OT_TB;


// Input clock generation

always begin
  DCLK_TB = #(PER1/2) ~DCLK_TB;
end


  assign RESET_TB = 1'b0;

// Start of the testbench

initial
  begin
    $display ("The core is configured for averaging") ;
    $display ("Edit the simulation script to change the time of simulation");
  end

  // Instantiation of the example design
  //---------------------------------------------------------
  sysmon_exdes dut (
      .DCLK_IN(DCLK_TB),
      .RESET_IN(RESET_TB),
      .VAUXP0(1'b0),      // Stimulus for Channels is applied from the SIM_MONITOR_FILE
      .VAUXN0(1'b0),
      .VAUXP1(1'b0),
      .VAUXN1(1'b0),
      .VAUXP2(1'b0),
      .VAUXN2(1'b0),
      .VAUXP3(1'b0),
      .VAUXN3(1'b0),
      .VAUXP4(1'b0),
      .VAUXN4(1'b0),
      .VAUXP5(1'b0),
      .VAUXN5(1'b0),
      .VAUXP6(1'b0),
      .VAUXN6(1'b0),
      .VAUXP8(1'b0),
      .VAUXN8(1'b0),
      .VAUXP9(1'b0),
      .VAUXN9(1'b0),
      .VAUXP10(1'b0),
      .VAUXN10(1'b0),
      .VAUXP11(1'b0),
      .VAUXN11(1'b0),
      .VAUXP13(1'b0),
      .VAUXN13(1'b0),
      .VAUXP14(1'b0),
      .VAUXN14(1'b0),
      .VAUXP15(1'b0),
      .VAUXN15(1'b0),
      .VCCAUX_ALARM_OUT(VCCAUX_ALARM_TB),
      .VCCINT_ALARM_OUT(VCCINT_ALARM_TB),
      .USER_TEMP_ALARM_OUT(USER_TEMP_ALARM_TB),
      .OT_OUT(OT_TB),
      .VP_IN(1'b0),
      .VN_IN(1'b0)

         );

endmodule



