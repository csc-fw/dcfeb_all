// file: sysmon_exdes.v
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
// Clocking wizard example design
//----------------------------------------------------------------------------
// This example design instantiates the generated VHDL file containing the
// System Monitor instantiation.
//----------------------------------------------------------------------------

`timescale 1ns / 1 ps


module sysmon_exdes(
          DCLK_IN,             // Clock input for the dynamic reconfiguration port
          RESET_IN,            // Reset signal for the System Monitor control logic
          VAUXP0,              // Auxiliary channel 0
          VAUXN0,
          VAUXP1,              // Auxiliary channel 1
          VAUXN1,
          VAUXP2,              // Auxiliary channel 2
          VAUXN2,
          VAUXP3,              // Auxiliary channel 3
          VAUXN3,
          VAUXP4,              // Auxiliary channel 4
          VAUXN4,
          VAUXP5,              // Auxiliary channel 5
          VAUXN5,
          VAUXP6,              // Auxiliary channel 6
          VAUXN6,
          VAUXP8,              // Auxiliary channel 8
          VAUXN8,
          VAUXP9,              // Auxiliary channel 9
          VAUXN9,
          VAUXP10,             // Auxiliary channel 10
          VAUXN10,
          VAUXP11,             // Auxiliary channel 11
          VAUXN11,
          VAUXP13,             // Auxiliary channel 13
          VAUXN13,
          VAUXP14,             // Auxiliary channel 14
          VAUXN14,
          VAUXP15,             // Auxiliary channel 15
          VAUXN15,
          OT_OUT,              // Over-Temperature alarm output
          VCCAUX_ALARM_OUT,    // VCCAUX-sensor alarm output
          VCCINT_ALARM_OUT,    //  VCCINT-sensor alarm output
          USER_TEMP_ALARM_OUT, // Temperature-sensor alarm output
          VP_IN,               // Dedicated Analog Input Pair
          VN_IN);
     
     input VP_IN;
     input VN_IN;
    input DCLK_IN;
    input RESET_IN;
          input VAUXP0;
          input VAUXN0;
          input VAUXP1;
          input VAUXN1;
          input VAUXP2;
          input VAUXN2;
          input VAUXP3;
          input VAUXN3;
          input VAUXP4;
          input VAUXN4;
          input VAUXP5;
          input VAUXN5;
          input VAUXP6;
          input VAUXN6;
          input VAUXP8;
          input VAUXN8;
          input VAUXP9;
          input VAUXN9;
          input VAUXP10;
          input VAUXN10;
          input VAUXP11;
          input VAUXN11;
          input VAUXP13;
          input VAUXN13;
          input VAUXP14;
          input VAUXN14;
          input VAUXP15;
          input VAUXN15;
   output OT_OUT;
   output VCCAUX_ALARM_OUT;
   output VCCINT_ALARM_OUT;
   output USER_TEMP_ALARM_OUT;

    wire GND_BIT;
    wire [8:0] GND_BUS7;
    wire [15:0] GND_BUS16;
    assign GND_BIT = 0;
    assign GND_BUS7 = 7'b0000000;
    assign GND_BUS16 = 16'b0000000000000000;

sysmon
sysmon_wiz_inst (
      .DCLK_IN(DCLK_IN),
      .RESET_IN(RESET_IN),
      .VAUXP0(VAUXP0), 
      .VAUXN0(VAUXN0),
      .VAUXP1(VAUXP1),
      .VAUXN1(VAUXN1),
      .VAUXP2(VAUXP2),
      .VAUXN2(VAUXN2),
      .VAUXP3(VAUXP3),
      .VAUXN3(VAUXN3),
      .VAUXP4(VAUXP4),
      .VAUXN4(VAUXN4),
      .VAUXP5(VAUXP5),
      .VAUXN5(VAUXN5),
      .VAUXP6(VAUXP6),
      .VAUXN6(VAUXN6),
      .VAUXP8(VAUXP8),
      .VAUXN8(VAUXN8),
      .VAUXP9(VAUXP9),
      .VAUXN9(VAUXN9),
      .VAUXP10(VAUXP10),
      .VAUXN10(VAUXN10),
      .VAUXP11(VAUXP11),
      .VAUXN11(VAUXN11),
      .VAUXP13(VAUXP13),
      .VAUXN13(VAUXN13),
      .VAUXP14(VAUXP14),
      .VAUXN14(VAUXN14),
      .VAUXP15(VAUXP15),
      .VAUXN15(VAUXN15),
 
      .VCCAUX_ALARM_OUT(VCCAUX_ALARM_OUT),
      .VCCINT_ALARM_OUT(VCCINT_ALARM_OUT),
      .USER_TEMP_ALARM_OUT(USER_TEMP_ALARM_OUT),
      .OT_OUT(OT_OUT),
      .VP_IN(VP_IN),
      .VN_IN(VN_IN)
      );

endmodule
