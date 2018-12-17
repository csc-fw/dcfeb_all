/////////////////////////////////////////////////////////////////////////////
//
//
//
/////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /
// \   \   \/    Core:          sem
//  \   \        Module:        sem_core_sem_mon_fifo
//  /   /        Filename:      sem_core_sem_mon_fifo.v
// /___/   /\    Purpose:       MON Shim 32x8 FIFO.
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
// This module contains a 32x8 synchronous FIFO implementation.
//
/////////////////////////////////////////////////////////////////////////////
//
// Port Definition:
//
// Name                          Type   Description
// ============================= ====== ====================================
// icap_clk                      input  The system clock signal.
//
// data_in[7:0]                  input  Input to the FIFO. Synchronous
//                                      to icap_clk.
//
// data_out[7:0]                 output Output from the FIFO.  Synchronous
//                                      to icap_clk.
//
// write                         input  Write strobe, used to enable data
//                                      capture.  Synchronous to icap_clk.
//
// read                          input  Read strobe, used to advance data
//                                      output to next value.  Synchronous
//                                      to icap_clk.
//
// full                          output Indicates when the FIFO is full.
//                                      Synchronous to icap_clk.
//
// data_present                  output Indicates when the FIFO has data
//                                      (not empty). Synchronous to icap_clk.
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
// sem_core_sem_mon_fifo
// |
// \- SRLC32E (unisim)
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//
// Modified by BGB for TMR
//
/////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

/////////////////////////////////////////////////////////////////////////////
// Module
/////////////////////////////////////////////////////////////////////////////

module sem_core_sem_mon_fifo_TMR (
  input  wire        icap_clk,
  input  wire  [7:0] data_in,
  output wire  [7:0] data_out_i,
  input  wire        write,
  input  wire        read,
  output wire        full,
  output wire        data_present
  );

  ///////////////////////////////////////////////////////////////////////////
  // Define local constants.
  ///////////////////////////////////////////////////////////////////////////

  localparam TCQ = 1;

  ///////////////////////////////////////////////////////////////////////////
  // Declare signals.
  ///////////////////////////////////////////////////////////////////////////

  (* syn_preserve = "true" *) reg   [5:0] augend_1 = 6'b011111;
  (* syn_preserve = "true" *) reg   [5:0] augend_2 = 6'b011111;
  (* syn_preserve = "true" *) reg   [5:0] augend_3 = 6'b011111;
  (* syn_preserve = "true" *) reg   [5:0] addend_1;
  (* syn_preserve = "true" *) reg   [5:0] addend_2;
  (* syn_preserve = "true" *) reg   [5:0] addend_3;

  (* syn_keep = "true" *)     wire  [5:0] vt_augend_1;
  (* syn_keep = "true" *)     wire  [5:0] vt_augend_2;
  (* syn_keep = "true" *)     wire  [5:0] vt_augend_3;

  (* syn_keep = "true" *)     wire  [7:0] data_out_1;
  (* syn_keep = "true" *)     wire  [7:0] data_out_2;
  (* syn_keep = "true" *)     wire  [7:0] data_out_3;
  
  assign vt_augend_1 = (augend_1   & augend_2  ) | (augend_2   & augend_3  ) | (augend_1   & augend_3  ); // Majority logic
  assign vt_augend_2 = (augend_1   & augend_2  ) | (augend_2   & augend_3  ) | (augend_1   & augend_3  ); // Majority logic
  assign vt_augend_3 = (augend_1   & augend_2  ) | (augend_2   & augend_3  ) | (augend_1   & augend_3  ); // Majority logic
  
  assign data_out_i  = (data_out_1 & data_out_2) | (data_out_2 & data_out_3) | (data_out_1 & data_out_3); // Majority logic

  ///////////////////////////////////////////////////////////////////////////
  // Data storage.
  ///////////////////////////////////////////////////////////////////////////

  SRLC32E data_srl0_1 (.D(data_in[0]),.CE(write),.CLK(icap_clk),.A(vt_augend_1[4:0]),.Q(data_out_1[0]),.Q31());
  SRLC32E data_srl1_1 (.D(data_in[1]),.CE(write),.CLK(icap_clk),.A(vt_augend_1[4:0]),.Q(data_out_1[1]),.Q31());
  SRLC32E data_srl2_1 (.D(data_in[2]),.CE(write),.CLK(icap_clk),.A(vt_augend_1[4:0]),.Q(data_out_1[2]),.Q31());
  SRLC32E data_srl3_1 (.D(data_in[3]),.CE(write),.CLK(icap_clk),.A(vt_augend_1[4:0]),.Q(data_out_1[3]),.Q31());
  SRLC32E data_srl4_1 (.D(data_in[4]),.CE(write),.CLK(icap_clk),.A(vt_augend_1[4:0]),.Q(data_out_1[4]),.Q31());
  SRLC32E data_srl5_1 (.D(data_in[5]),.CE(write),.CLK(icap_clk),.A(vt_augend_1[4:0]),.Q(data_out_1[5]),.Q31());
  SRLC32E data_srl6_1 (.D(data_in[6]),.CE(write),.CLK(icap_clk),.A(vt_augend_1[4:0]),.Q(data_out_1[6]),.Q31());
  SRLC32E data_srl7_1 (.D(data_in[7]),.CE(write),.CLK(icap_clk),.A(vt_augend_1[4:0]),.Q(data_out_1[7]),.Q31());

  SRLC32E data_srl0_2 (.D(data_in[0]),.CE(write),.CLK(icap_clk),.A(vt_augend_2[4:0]),.Q(data_out_2[0]),.Q31());
  SRLC32E data_srl1_2 (.D(data_in[1]),.CE(write),.CLK(icap_clk),.A(vt_augend_2[4:0]),.Q(data_out_2[1]),.Q31());
  SRLC32E data_srl2_2 (.D(data_in[2]),.CE(write),.CLK(icap_clk),.A(vt_augend_2[4:0]),.Q(data_out_2[2]),.Q31());
  SRLC32E data_srl3_2 (.D(data_in[3]),.CE(write),.CLK(icap_clk),.A(vt_augend_2[4:0]),.Q(data_out_2[3]),.Q31());
  SRLC32E data_srl4_2 (.D(data_in[4]),.CE(write),.CLK(icap_clk),.A(vt_augend_2[4:0]),.Q(data_out_2[4]),.Q31());
  SRLC32E data_srl5_2 (.D(data_in[5]),.CE(write),.CLK(icap_clk),.A(vt_augend_2[4:0]),.Q(data_out_2[5]),.Q31());
  SRLC32E data_srl6_2 (.D(data_in[6]),.CE(write),.CLK(icap_clk),.A(vt_augend_2[4:0]),.Q(data_out_2[6]),.Q31());
  SRLC32E data_srl7_2 (.D(data_in[7]),.CE(write),.CLK(icap_clk),.A(vt_augend_2[4:0]),.Q(data_out_2[7]),.Q31());

  SRLC32E data_srl0_3 (.D(data_in[0]),.CE(write),.CLK(icap_clk),.A(vt_augend_3[4:0]),.Q(data_out_3[0]),.Q31());
  SRLC32E data_srl1_3 (.D(data_in[1]),.CE(write),.CLK(icap_clk),.A(vt_augend_3[4:0]),.Q(data_out_3[1]),.Q31());
  SRLC32E data_srl2_3 (.D(data_in[2]),.CE(write),.CLK(icap_clk),.A(vt_augend_3[4:0]),.Q(data_out_3[2]),.Q31());
  SRLC32E data_srl3_3 (.D(data_in[3]),.CE(write),.CLK(icap_clk),.A(vt_augend_3[4:0]),.Q(data_out_3[3]),.Q31());
  SRLC32E data_srl4_3 (.D(data_in[4]),.CE(write),.CLK(icap_clk),.A(vt_augend_3[4:0]),.Q(data_out_3[4]),.Q31());
  SRLC32E data_srl5_3 (.D(data_in[5]),.CE(write),.CLK(icap_clk),.A(vt_augend_3[4:0]),.Q(data_out_3[5]),.Q31());
  SRLC32E data_srl6_3 (.D(data_in[6]),.CE(write),.CLK(icap_clk),.A(vt_augend_3[4:0]),.Q(data_out_3[6]),.Q31());
  SRLC32E data_srl7_3 (.D(data_in[7]),.CE(write),.CLK(icap_clk),.A(vt_augend_3[4:0]),.Q(data_out_3[7]),.Q31());

  ///////////////////////////////////////////////////////////////////////////
  // Buffer management; this does not check for illegal reads and writes,
  // it is the responsibility of the data producer to stop writing when
  // "full" is logic one and the responsibility of the data consumer to
  // stop reading when "data_present" is logic zero.
  ///////////////////////////////////////////////////////////////////////////

  always @*
  begin
    case ({read, write})
      2'b01: addend_1 = 6'b000001;
      2'b10: addend_1 = 6'b111111;
      default: addend_1 = 6'b000000;
    endcase
    case ({read, write})
      2'b01: addend_2 = 6'b000001;
      2'b10: addend_2 = 6'b111111;
      default: addend_2 = 6'b000000;
    endcase
    case ({read, write})
      2'b01: addend_3 = 6'b000001;
      2'b10: addend_3 = 6'b111111;
      default: addend_3 = 6'b000000;
    endcase
  end

  always @(posedge icap_clk)
  begin
    augend_1 <= #TCQ (vt_augend_1 + addend_1);
    augend_2 <= #TCQ (vt_augend_2 + addend_2);
    augend_3 <= #TCQ (vt_augend_3 + addend_3);
  end

  assign data_present = vt_augend_1[5];
  assign full = (vt_augend_1 == 6'b111111);

  ///////////////////////////////////////////////////////////////////////////
  //
  ///////////////////////////////////////////////////////////////////////////

endmodule

/////////////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////////////
