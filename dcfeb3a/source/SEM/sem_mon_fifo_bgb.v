/////////////////////////////////////////////////////////////////////////////
//
//
//
/////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /
// \   \   \/    Core:          sem
//  \   \        Module:        sem_mon_fifo
//  /   /        Filename:      sem_mon_fifo.v
// /___/   /\    Purpose:       MON Shim 32x8 FIFO.
// \   \  /  \
//  \___\/\___\
//
/////////////////////////////////////////////////////////////////////////////
//
// (c) Copyright 2010 Xilinx, Inc. All rights reserved.
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
// sem_mon_fifo
// |
// \- SRLC32E (unisim)
//
/////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

/////////////////////////////////////////////////////////////////////////////
// Module
/////////////////////////////////////////////////////////////////////////////

module sem_mon_fifo_bgb (
  input  wire        icap_clk,
  input  wire  [7:0] data_in,
  output wire  [7:0] data_out,
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

  reg   [6:0] augend = 7'b0111111;
  reg   [6:0] addend;
  wire  [1:0] addsel;
  wire  [7:0] d_cascade;
  wire  [7:0] data_out_a;
  wire  [7:0] data_out_b;

	assign data_out = augend[5] ? data_out_b : data_out_a;


  ///////////////////////////////////////////////////////////////////////////
  // Data storage.
  ///////////////////////////////////////////////////////////////////////////

  SRLC32E data_srl_0a (
    .D(data_in[0]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_a[0]),
    .Q31(d_cascade[0])
    );

  SRLC32E data_srl_1a (
    .D(data_in[1]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_a[1]),
    .Q31(d_cascade[1])
    );

  SRLC32E data_srl_2a (
    .D(data_in[2]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_a[2]),
    .Q31(d_cascade[2])
    );

  SRLC32E data_srl_3a (
    .D(data_in[3]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_a[3]),
    .Q31(d_cascade[3])
    );

  SRLC32E data_srl_4a (
    .D(data_in[4]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_a[4]),
    .Q31(d_cascade[4])
    );

  SRLC32E data_srl_5a (
    .D(data_in[5]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_a[5]),
    .Q31(d_cascade[5])
    );

  SRLC32E data_srl_6a (
    .D(data_in[6]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_a[6]),
    .Q31(d_cascade[6])
    );

  SRLC32E data_srl_7a (
    .D(data_in[7]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_a[7]),
    .Q31(d_cascade[7])
    );

  SRLC32E data_srl_0b (
    .D(d_cascade[0]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_b[0]),
    .Q31()
    );
	 
  SRLC32E data_srl_1b (
    .D(d_cascade[1]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_b[1]),
    .Q31()
    );

  SRLC32E data_srl_2b (
    .D(d_cascade[2]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_b[2]),
    .Q31()
    );

  SRLC32E data_srl_3b (
    .D(d_cascade[3]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_b[3]),
    .Q31()
    );

  SRLC32E data_srl_4b (
    .D(d_cascade[4]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_b[4]),
    .Q31()
    );

  SRLC32E data_srl_5b (
    .D(d_cascade[5]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_b[5]),
    .Q31()
    );

  SRLC32E data_srl_6b (
    .D(d_cascade[6]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_b[6]),
    .Q31()
    );

  SRLC32E data_srl_7b (
    .D(d_cascade[7]),
    .CE(write),
    .CLK(icap_clk),
    .A(augend[4:0]),
    .Q(data_out_b[7]),
    .Q31()
    );
	 
  ///////////////////////////////////////////////////////////////////////////
  // Buffer management; this does not check for illegal reads and writes,
  // it is the responsibility of the data producer to stop writing when
  // "full" is logic one and the responsibility of the data consumer to
  // stop reading when "data_present" is logic zero.
  ///////////////////////////////////////////////////////////////////////////

  assign addsel = {read, write};

  always @*
  begin
    case (addsel)
      2'b01: addend = 7'b0000001;
      2'b10: addend = 7'b1111111;
      default: addend = 7'b0000000;
    endcase
  end

  always @(posedge icap_clk)
  begin
    augend <= #TCQ (augend + addend);
  end

  assign data_present = augend[6];
  assign full = (augend == 7'b1111111);

  ///////////////////////////////////////////////////////////////////////////
  //
  ///////////////////////////////////////////////////////////////////////////

endmodule

/////////////////////////////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////////////////////////////
