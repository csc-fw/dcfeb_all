// file: sysmon.v
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
`timescale 1ns / 1 ps

(* X_CORE_INFO = "sysmon_wiz_v2_1, Coregen 12.4" *)


module sysmon
          (
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
          input VP_IN;
          input VN_IN;

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
          wire [15:0] aux_channel_p;
          wire [15:0] aux_channel_n;

          assign aux_channel_p[0] = VAUXP0;
          assign aux_channel_n[0] = VAUXN0;

          assign aux_channel_p[1] = VAUXP1;
          assign aux_channel_n[1] = VAUXN1;

          assign aux_channel_p[2] = VAUXP2;
          assign aux_channel_n[2] = VAUXN2;

          assign aux_channel_p[3] = VAUXP3;
          assign aux_channel_n[3] = VAUXN3;

          assign aux_channel_p[4] = VAUXP4;
          assign aux_channel_n[4] = VAUXN4;

          assign aux_channel_p[5] = VAUXP5;
          assign aux_channel_n[5] = VAUXN5;

          assign aux_channel_p[6] = VAUXP6;
          assign aux_channel_n[6] = VAUXN6;

          assign aux_channel_p[7] = 1'b0;
          assign aux_channel_n[7] = 1'b0;

          assign aux_channel_p[8] = VAUXP8;
          assign aux_channel_n[8] = VAUXN8;

          assign aux_channel_p[9] = VAUXP9;
          assign aux_channel_n[9] = VAUXN9;

          assign aux_channel_p[10] = VAUXP10;
          assign aux_channel_n[10] = VAUXN10;

          assign aux_channel_p[11] = VAUXP11;
          assign aux_channel_n[11] = VAUXN11;

          assign aux_channel_p[12] = 1'b0;
          assign aux_channel_n[12] = 1'b0;

          assign aux_channel_p[13] = VAUXP13;
          assign aux_channel_n[13] = VAUXN13;

          assign aux_channel_p[14] = VAUXP14;
          assign aux_channel_n[14] = VAUXN14;

          assign aux_channel_p[15] = VAUXP15;
          assign aux_channel_n[15] = VAUXN15;

SYSMON #(
        .INIT_40(16'h9000), // config reg 0
        .INIT_41(16'h2000), // config reg 1
        .INIT_42(16'h0800), // config reg 2
        .INIT_48(16'h0700), // Sequencer channel selection
        .INIT_49(16'hef7f), // Sequencer channel selection
        .INIT_4A(16'h0700), // Sequencer Average selection
        .INIT_4B(16'hef7f), // Sequencer Average selection
        .INIT_4C(16'h0000), // Sequencer Bipolar selection
        .INIT_4D(16'h0000), // Sequencer Bipolar selection
        .INIT_4E(16'h0000), // Sequencer Acq time selection
        .INIT_4F(16'h0000), // Sequencer Acq time selection
        .INIT_50(16'ha93a), // Temp alarm trigger
        .INIT_51(16'h5999), // Vccint upper alarm limit
        .INIT_52(16'he000), // Vccaux upper alarm limit
        .INIT_53(16'hb5e3),  // Temp alarm OT upper
        .INIT_54(16'ha6b0), // Temp alarm reset
        .INIT_55(16'h5111), // Vccint lower alarm limit
        .INIT_56(16'hcaaa), // Vccaux lower alarm limit
        .INIT_57(16'hae4e),  // Temp alarm OT reset
        .SIM_DEVICE("VIRTEX6"),
        .SIM_MONITOR_FILE("sysmon_sim.txt")
)

SYSMON_INST (
        .CONVST(GND_BIT),
        .CONVSTCLK(GND_BIT),
        .DADDR(GND_BUS7[6:0]),
        .DCLK(DCLK_IN),
        .DEN(GND_BIT),
        .DI(GND_BUS16[15:0]),
        .DWE(GND_BIT),
        .RESET(RESET_IN),
        .VAUXN(aux_channel_n[15:0]),
        .VAUXP(aux_channel_p[15:0]),
        .ALM({VCCAUX_ALARM_OUT,VCCINT_ALARM_OUT,USER_TEMP_ALARM_OUT}),
        .BUSY(),
        .CHANNEL(),
        .DO(),
        .DRDY(),
        .EOC(),
        .EOS(),
        .JTAGBUSY(),
        .JTAGLOCKED(),
        .JTAGMODIFIED(),
        .OT(OT_OUT),
        .VP(VP_IN),
        .VN(VN_IN)
          );

endmodule
