//////////////////////////////////////////////////////////////////////////////
//
// crc calculation
// This VERILOG code was generated using CRCGEN.PL version 1.7
// Last Modified: 01/02/2002
// Options Used:
//    Module Name = crc32
//      CRC Width = 32
//     Data Width = 16
//     CRC Init   = F
//     Polynomial = [0 -> 32]
//        1 1 1 0 1 1 0 1 1 0 1 1 1 0 0 0 1 0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 1
//
// Disclaimer: THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY 
//             WHATSOEVER AND XILINX SPECIFICALLY DISCLAIMS ANY 
//             IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
//             A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.
//
// Copyright (c) 2001,2002 Xilinx, Inc.  All rights reserved.
//
//
//////////////////////////////////////////////////////////////////////////////

module crc_gen_tmr (
	output [15:0] CRC1,
	output [15:0] CRC2,
	output [15:0] CRC3,
	input  [15:0] D,
	input CALC,
	input INIT,
	input D_VALID,
	input CLK,
	input RESET
);

//////////////////////////////////////////////////////////////////////////////
// Internal Signals
//////////////////////////////////////////////////////////////////////////////

(* syn_preserve = "true" *) reg    [31:0] crc_reg_1;
(* syn_preserve = "true" *) reg    [31:0] crc_reg_2;
(* syn_preserve = "true" *) reg    [31:0] crc_reg_3;
(* syn_preserve = "true" *) reg    [15:0] crc_1;
(* syn_preserve = "true" *) reg    [15:0] crc_2;
(* syn_preserve = "true" *) reg    [15:0] crc_3;

(* syn_keep = "true" *) wire    [31:0] vt_crc_reg_1;
(* syn_keep = "true" *) wire    [31:0] vt_crc_reg_2;
(* syn_keep = "true" *) wire    [31:0] vt_crc_reg_3;
(* syn_keep = "true" *) wire    [15:0] vt_crc_1;
(* syn_keep = "true" *) wire    [15:0] vt_crc_2;
(* syn_keep = "true" *) wire    [15:0] vt_crc_3;

(* syn_keep = "true" *) wire   [31:0] next_crc_1;
(* syn_keep = "true" *) wire   [31:0] next_crc_2;
(* syn_keep = "true" *) wire   [31:0] next_crc_3;

assign vt_crc_reg_1  = (crc_reg_1 & crc_reg_2) | (crc_reg_2 & crc_reg_3) | (crc_reg_1 & crc_reg_3); // Majority logic
assign vt_crc_reg_2  = (crc_reg_1 & crc_reg_2) | (crc_reg_2 & crc_reg_3) | (crc_reg_1 & crc_reg_3); // Majority logic
assign vt_crc_reg_3  = (crc_reg_1 & crc_reg_2) | (crc_reg_2 & crc_reg_3) | (crc_reg_1 & crc_reg_3); // Majority logic
assign vt_crc_1      = (crc_1      & crc_2   ) | (crc_2     & crc_3    ) | (crc_1     & crc_3    ); // Majority logic
assign vt_crc_2      = (crc_1      & crc_2   ) | (crc_2     & crc_3    ) | (crc_1     & crc_3    ); // Majority logic
assign vt_crc_3      = (crc_1      & crc_2   ) | (crc_2     & crc_3    ) | (crc_1     & crc_3    ); // Majority logic

assign CRC1 = vt_crc_1;
assign CRC2 = vt_crc_2;
assign CRC3 = vt_crc_3;

//////////////////////////////////////////////////////////////////////////////
// Infer CRC-32 registers
// 
// The crc_reg register stores the CRC-32 value.
// The crc register is the most significant 16 bits of the 
// CRC-32 value.
//
// Truth Table:
// -----+---------+----------+----------------------------------------------
// calc | d_valid | crc_reg  | crc 
// -----+---------+----------+----------------------------------------------
//  0   |     0   | crc_reg  | crc 
//  0   |     1   |  shift   | bit-swapped, complimented msbyte of crc_reg
//  1   |     0   | crc_reg  | crc 
//  1   |     1   | next_crc_1 | bit-swapped, complimented msbyte of next_crc_1
// -----+---------+----------+----------------------------------------------
// 
//////////////////////////////////////////////////////////////////////////////
 
always @ (posedge CLK or posedge RESET)
begin
   if (RESET) begin
      crc_reg_1 <= 32'hFFFFFFFF;
      crc_reg_2 <= 32'hFFFFFFFF;
      crc_reg_3 <= 32'hFFFFFFFF;
      crc_1     <= 16'hFFFF;
      crc_2     <= 16'hFFFF;
      crc_3     <= 16'hFFFF;
   end
   
   else if (INIT) begin
      crc_reg_1 <= 32'hFFFFFFFF;
      crc_reg_2 <= 32'hFFFFFFFF;
      crc_reg_3 <= 32'hFFFFFFFF;
      crc_1     <=  16'hFFFF;
      crc_2     <=  16'hFFFF;
      crc_3     <=  16'hFFFF;
   end

   else if (CALC & D_VALID) begin
      crc_reg_1 <= next_crc_1;
      crc_reg_2 <= next_crc_2;
      crc_reg_3 <= next_crc_3;
      crc_1     <= ~{next_crc_1[16], next_crc_1[17], next_crc_1[18], next_crc_1[19],
                     next_crc_1[20], next_crc_1[21], next_crc_1[22], next_crc_1[23],
                     next_crc_1[24], next_crc_1[25], next_crc_1[26], next_crc_1[27],
                     next_crc_1[28], next_crc_1[29], next_crc_1[30], next_crc_1[31]};
      crc_2     <= ~{next_crc_2[16], next_crc_2[17], next_crc_2[18], next_crc_2[19],
                     next_crc_2[20], next_crc_2[21], next_crc_2[22], next_crc_2[23],
                     next_crc_2[24], next_crc_2[25], next_crc_2[26], next_crc_2[27],
                     next_crc_2[28], next_crc_2[29], next_crc_2[30], next_crc_2[31]};
      crc_3     <= ~{next_crc_3[16], next_crc_3[17], next_crc_3[18], next_crc_3[19],
                     next_crc_3[20], next_crc_3[21], next_crc_3[22], next_crc_3[23],
                     next_crc_3[24], next_crc_3[25], next_crc_3[26], next_crc_3[27],
                     next_crc_3[28], next_crc_3[29], next_crc_3[30], next_crc_3[31]};
   end
   
   else if (~CALC & D_VALID) begin
      crc_reg_1 <=  {crc_reg_1[15:0], 16'hFFFF};
      crc_reg_2 <=  {crc_reg_1[15:0], 16'hFFFF};
      crc_reg_3 <=  {crc_reg_1[15:0], 16'hFFFF};
      crc_1     <= ~{crc_reg_1[0], crc_reg_1[1], crc_reg_1[2], crc_reg_1[3],
                     crc_reg_1[4], crc_reg_1[5], crc_reg_1[6], crc_reg_1[7],
                     crc_reg_1[8], crc_reg_1[9], crc_reg_1[10], crc_reg_1[11],
                     crc_reg_1[12], crc_reg_1[13], crc_reg_1[14], crc_reg_1[15]};
      crc_2     <= ~{crc_reg_2[0], crc_reg_2[1], crc_reg_2[2], crc_reg_2[3],
                     crc_reg_2[4], crc_reg_2[5], crc_reg_2[6], crc_reg_2[7],
                     crc_reg_2[8], crc_reg_2[9], crc_reg_2[10], crc_reg_2[11],
                     crc_reg_2[12], crc_reg_2[13], crc_reg_2[14], crc_reg_2[15]};
      crc_3     <= ~{crc_reg_3[0], crc_reg_3[1], crc_reg_3[2], crc_reg_3[3],
                     crc_reg_3[4], crc_reg_3[5], crc_reg_3[6], crc_reg_3[7],
                     crc_reg_3[8], crc_reg_3[9], crc_reg_3[10], crc_reg_3[11],
                     crc_reg_3[12], crc_reg_3[13], crc_reg_3[14], crc_reg_3[15]};
   end
end

//////////////////////////////////////////////////////////////////////////////
// CRC XOR equations
//////////////////////////////////////////////////////////////////////////////

assign next_crc_1[0]  = crc_reg_1[22] ^ crc_reg_1[25] ^ D[5] ^ D[3] ^ D[6] ^ crc_reg_1[16] ^ crc_reg_1[28] ^ D[15] ^ D[9] ^ crc_reg_1[26];
assign next_crc_1[1]  = crc_reg_1[22] ^ crc_reg_1[17] ^ D[3] ^ crc_reg_1[27] ^ D[15] ^ D[4] ^ crc_reg_1[25] ^ D[8] ^ crc_reg_1[23] ^ D[2] ^ crc_reg_1[29] ^ D[6] ^ crc_reg_1[16] ^ crc_reg_1[28] ^ D[14] ^ D[9];
assign next_crc_1[2]  = crc_reg_1[22] ^ crc_reg_1[17] ^ D[1] ^ crc_reg_1[30] ^ D[15] ^ crc_reg_1[24] ^ D[13] ^ D[7] ^ crc_reg_1[18] ^ crc_reg_1[25] ^ D[8] ^ D[2] ^ crc_reg_1[23] ^ D[6] ^ crc_reg_1[29] ^ crc_reg_1[16] ^ D[14] ^ D[9];
assign next_crc_1[3]  = crc_reg_1[17] ^ D[1] ^ crc_reg_1[31] ^ crc_reg_1[30] ^ crc_reg_1[24] ^ crc_reg_1[19] ^ D[13] ^ D[7] ^ crc_reg_1[18] ^ crc_reg_1[25] ^ D[5] ^ D[12] ^ D[8] ^ crc_reg_1[23] ^ D[6] ^ D[14] ^ crc_reg_1[26] ^ D[0];
assign next_crc_1[4]  = crc_reg_1[22] ^ crc_reg_1[31] ^ D[3] ^ crc_reg_1[27] ^ D[15] ^ crc_reg_1[24] ^ D[4] ^ crc_reg_1[19] ^ D[13] ^ D[7] ^ crc_reg_1[20] ^ crc_reg_1[18] ^ D[12] ^ D[11] ^ crc_reg_1[16] ^ crc_reg_1[28] ^ D[9] ^ D[0];
assign next_crc_1[5]  = crc_reg_1[22] ^ crc_reg_1[17] ^ D[15] ^ crc_reg_1[19] ^ crc_reg_1[20] ^ crc_reg_1[21] ^ D[12] ^ D[5] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_1[23] ^ D[2] ^ crc_reg_1[29] ^ crc_reg_1[16] ^ D[14] ^ D[9] ^ crc_reg_1[26];
assign next_crc_1[6]  = crc_reg_1[22] ^ crc_reg_1[17] ^ D[1] ^ crc_reg_1[27] ^ crc_reg_1[30] ^ crc_reg_1[24] ^ D[4] ^ D[13] ^ D[7] ^ crc_reg_1[20] ^ crc_reg_1[21] ^ crc_reg_1[18] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_1[23] ^ D[14] ^ D[9];
assign next_crc_1[7]  = crc_reg_1[31] ^ D[15] ^ crc_reg_1[24] ^ crc_reg_1[19] ^ D[13] ^ D[7] ^ crc_reg_1[21] ^ crc_reg_1[18] ^ D[5] ^ D[12] ^ D[8] ^ D[10] ^ crc_reg_1[23] ^ crc_reg_1[16] ^ crc_reg_1[26] ^ D[0];
assign next_crc_1[8]  = crc_reg_1[17] ^ D[3] ^ crc_reg_1[27] ^ D[15] ^ D[4] ^ crc_reg_1[24] ^ crc_reg_1[19] ^ crc_reg_1[20] ^ D[7] ^ D[12] ^ D[5] ^ D[11] ^ crc_reg_1[16] ^ crc_reg_1[28] ^ D[14] ^ crc_reg_1[26];
assign next_crc_1[9]  = crc_reg_1[17] ^ D[3] ^ crc_reg_1[27] ^ D[4] ^ D[13] ^ crc_reg_1[20] ^ crc_reg_1[21] ^ crc_reg_1[18] ^ crc_reg_1[25] ^ D[10] ^ D[11] ^ D[2] ^ crc_reg_1[29] ^ D[6] ^ crc_reg_1[28] ^ D[14];
assign next_crc_1[10] = D[1] ^ crc_reg_1[30] ^ D[15] ^ crc_reg_1[19] ^ D[13] ^ crc_reg_1[21] ^ crc_reg_1[18] ^ crc_reg_1[25] ^ D[12] ^ D[10] ^ D[2] ^ crc_reg_1[29] ^ D[6] ^ crc_reg_1[16];
assign next_crc_1[11] = crc_reg_1[17] ^ D[1] ^ D[3] ^ crc_reg_1[31] ^ crc_reg_1[30] ^ D[15] ^ crc_reg_1[19] ^ crc_reg_1[20] ^ crc_reg_1[25] ^ D[12] ^ D[11] ^ D[6] ^ crc_reg_1[16] ^ crc_reg_1[28] ^ D[14] ^ D[0];
assign next_crc_1[12] = crc_reg_1[22] ^ crc_reg_1[17] ^ crc_reg_1[31] ^ D[3] ^ D[15] ^ D[13] ^ crc_reg_1[20] ^ crc_reg_1[21] ^ crc_reg_1[18] ^ crc_reg_1[25] ^ D[10] ^ D[11] ^ D[2] ^ D[6] ^ crc_reg_1[29] ^ crc_reg_1[16] ^ crc_reg_1[28] ^ D[14] ^ D[9] ^ D[0];
assign next_crc_1[13] = crc_reg_1[22] ^ crc_reg_1[17] ^ D[1] ^ crc_reg_1[30] ^ crc_reg_1[19] ^ D[13] ^ crc_reg_1[21] ^ crc_reg_1[18] ^ D[5] ^ D[12] ^ D[8] ^ D[10] ^ crc_reg_1[23] ^ D[2] ^ crc_reg_1[29] ^ D[14] ^ crc_reg_1[26] ^ D[9];
assign next_crc_1[14] = crc_reg_1[22] ^ D[1] ^ crc_reg_1[31] ^ crc_reg_1[27] ^ crc_reg_1[30] ^ crc_reg_1[24] ^ D[4] ^ crc_reg_1[19] ^ D[13] ^ D[7] ^ crc_reg_1[20] ^ crc_reg_1[18] ^ D[12] ^ D[8] ^ D[11] ^ crc_reg_1[23] ^ D[9] ^ D[0];
assign next_crc_1[15] = D[3] ^ crc_reg_1[31] ^ crc_reg_1[24] ^ crc_reg_1[19] ^ crc_reg_1[20] ^ D[7] ^ crc_reg_1[21] ^ crc_reg_1[25] ^ D[12] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_1[23] ^ D[6] ^ crc_reg_1[28] ^ D[0];
assign next_crc_1[16] = crc_reg_1[0] ^ D[3] ^ D[15] ^ crc_reg_1[24] ^ crc_reg_1[20] ^ D[7] ^ crc_reg_1[21] ^ D[10] ^ D[11] ^ D[2] ^ crc_reg_1[29] ^ crc_reg_1[16] ^ crc_reg_1[28];
assign next_crc_1[17] = crc_reg_1[22] ^ crc_reg_1[17] ^ D[1] ^ crc_reg_1[30] ^ crc_reg_1[21] ^ crc_reg_1[25] ^ D[10] ^ D[2] ^ D[6] ^ crc_reg_1[29] ^ crc_reg_1[1] ^ D[14] ^ D[9];
assign next_crc_1[18] = crc_reg_1[22] ^ D[1] ^ crc_reg_1[31] ^ crc_reg_1[30] ^ D[13] ^ crc_reg_1[18] ^ D[5] ^ D[8] ^ crc_reg_1[23] ^ D[9] ^ D[0] ^ crc_reg_1[26] ^ crc_reg_1[2];
assign next_crc_1[19] = crc_reg_1[31] ^ crc_reg_1[27] ^ crc_reg_1[24] ^ D[4] ^ crc_reg_1[19] ^ D[7] ^ D[12] ^ D[8] ^ crc_reg_1[23] ^ D[0] ^ crc_reg_1[3];
assign next_crc_1[20] = crc_reg_1[4] ^ D[3] ^ crc_reg_1[24] ^ crc_reg_1[20] ^ D[7] ^ crc_reg_1[25] ^ D[11] ^ D[6] ^ crc_reg_1[28];
assign next_crc_1[21] = crc_reg_1[5] ^ crc_reg_1[21] ^ crc_reg_1[25] ^ D[5] ^ D[10] ^ D[2] ^ D[6] ^ crc_reg_1[29] ^ crc_reg_1[26];
assign next_crc_1[22] = D[1] ^ D[3] ^ crc_reg_1[27] ^ crc_reg_1[30] ^ D[15] ^ D[4] ^ crc_reg_1[25] ^ D[6] ^ crc_reg_1[16] ^ crc_reg_1[28] ^ crc_reg_1[6];
assign next_crc_1[23] = crc_reg_1[22] ^ crc_reg_1[17] ^ crc_reg_1[31] ^ D[15] ^ crc_reg_1[7] ^ crc_reg_1[25] ^ D[2] ^ D[6] ^ crc_reg_1[29] ^ crc_reg_1[16] ^ D[14] ^ D[9] ^ D[0];
assign next_crc_1[24] = crc_reg_1[17] ^ D[1] ^ crc_reg_1[8] ^ crc_reg_1[30] ^ D[13] ^ crc_reg_1[18] ^ D[5] ^ D[8] ^ crc_reg_1[23] ^ D[14] ^ crc_reg_1[26];
assign next_crc_1[25] = crc_reg_1[9] ^ crc_reg_1[31] ^ crc_reg_1[27] ^ crc_reg_1[24] ^ D[4] ^ crc_reg_1[19] ^ D[13] ^ D[7] ^ crc_reg_1[18] ^ D[12] ^ D[0];
assign next_crc_1[26] = crc_reg_1[22] ^ crc_reg_1[10] ^ D[15] ^ crc_reg_1[19] ^ crc_reg_1[20] ^ D[12] ^ D[5] ^ D[11] ^ crc_reg_1[16] ^ D[9] ^ crc_reg_1[26];
assign next_crc_1[27] = crc_reg_1[17] ^ crc_reg_1[27] ^ D[4] ^ crc_reg_1[20] ^ crc_reg_1[21] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_1[11] ^ crc_reg_1[23] ^ D[14];
assign next_crc_1[28] = crc_reg_1[22] ^ D[3] ^ crc_reg_1[24] ^ D[13] ^ D[7] ^ crc_reg_1[21] ^ crc_reg_1[18] ^ D[10] ^ crc_reg_1[12] ^ crc_reg_1[28] ^ D[9];
assign next_crc_1[29] = crc_reg_1[22] ^ crc_reg_1[19] ^ crc_reg_1[25] ^ D[12] ^ D[8] ^ crc_reg_1[13] ^ crc_reg_1[23] ^ D[2] ^ D[6] ^ crc_reg_1[29] ^ D[9];
assign next_crc_1[30] = D[1] ^ crc_reg_1[30] ^ crc_reg_1[24] ^ crc_reg_1[20] ^ D[7] ^ crc_reg_1[14] ^ D[5] ^ D[8] ^ D[11] ^ crc_reg_1[23] ^ crc_reg_1[26];
assign next_crc_1[31] = crc_reg_1[31] ^ crc_reg_1[27] ^ D[4] ^ crc_reg_1[24] ^ D[7] ^ crc_reg_1[21] ^ crc_reg_1[25] ^ crc_reg_1[15] ^ D[10] ^ D[6] ^ D[0];

assign next_crc_2[0]  = crc_reg_2[22] ^ crc_reg_2[25] ^ D[5] ^ D[3] ^ D[6] ^ crc_reg_2[16] ^ crc_reg_2[28] ^ D[15] ^ D[9] ^ crc_reg_2[26];
assign next_crc_2[1]  = crc_reg_2[22] ^ crc_reg_2[17] ^ D[3] ^ crc_reg_2[27] ^ D[15] ^ D[4] ^ crc_reg_2[25] ^ D[8] ^ crc_reg_2[23] ^ D[2] ^ crc_reg_2[29] ^ D[6] ^ crc_reg_2[16] ^ crc_reg_2[28] ^ D[14] ^ D[9];
assign next_crc_2[2]  = crc_reg_2[22] ^ crc_reg_2[17] ^ D[1] ^ crc_reg_2[30] ^ D[15] ^ crc_reg_2[24] ^ D[13] ^ D[7] ^ crc_reg_2[18] ^ crc_reg_2[25] ^ D[8] ^ D[2] ^ crc_reg_2[23] ^ D[6] ^ crc_reg_2[29] ^ crc_reg_2[16] ^ D[14] ^ D[9];
assign next_crc_2[3]  = crc_reg_2[17] ^ D[1] ^ crc_reg_2[31] ^ crc_reg_2[30] ^ crc_reg_2[24] ^ crc_reg_2[19] ^ D[13] ^ D[7] ^ crc_reg_2[18] ^ crc_reg_2[25] ^ D[5] ^ D[12] ^ D[8] ^ crc_reg_2[23] ^ D[6] ^ D[14] ^ crc_reg_2[26] ^ D[0];
assign next_crc_2[4]  = crc_reg_2[22] ^ crc_reg_2[31] ^ D[3] ^ crc_reg_2[27] ^ D[15] ^ crc_reg_2[24] ^ D[4] ^ crc_reg_2[19] ^ D[13] ^ D[7] ^ crc_reg_2[20] ^ crc_reg_2[18] ^ D[12] ^ D[11] ^ crc_reg_2[16] ^ crc_reg_2[28] ^ D[9] ^ D[0];
assign next_crc_2[5]  = crc_reg_2[22] ^ crc_reg_2[17] ^ D[15] ^ crc_reg_2[19] ^ crc_reg_2[20] ^ crc_reg_2[21] ^ D[12] ^ D[5] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_2[23] ^ D[2] ^ crc_reg_2[29] ^ crc_reg_2[16] ^ D[14] ^ D[9] ^ crc_reg_2[26];
assign next_crc_2[6]  = crc_reg_2[22] ^ crc_reg_2[17] ^ D[1] ^ crc_reg_2[27] ^ crc_reg_2[30] ^ crc_reg_2[24] ^ D[4] ^ D[13] ^ D[7] ^ crc_reg_2[20] ^ crc_reg_2[21] ^ crc_reg_2[18] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_2[23] ^ D[14] ^ D[9];
assign next_crc_2[7]  = crc_reg_2[31] ^ D[15] ^ crc_reg_2[24] ^ crc_reg_2[19] ^ D[13] ^ D[7] ^ crc_reg_2[21] ^ crc_reg_2[18] ^ D[5] ^ D[12] ^ D[8] ^ D[10] ^ crc_reg_2[23] ^ crc_reg_2[16] ^ crc_reg_2[26] ^ D[0];
assign next_crc_2[8]  = crc_reg_2[17] ^ D[3] ^ crc_reg_2[27] ^ D[15] ^ D[4] ^ crc_reg_2[24] ^ crc_reg_2[19] ^ crc_reg_2[20] ^ D[7] ^ D[12] ^ D[5] ^ D[11] ^ crc_reg_2[16] ^ crc_reg_2[28] ^ D[14] ^ crc_reg_2[26];
assign next_crc_2[9]  = crc_reg_2[17] ^ D[3] ^ crc_reg_2[27] ^ D[4] ^ D[13] ^ crc_reg_2[20] ^ crc_reg_2[21] ^ crc_reg_2[18] ^ crc_reg_2[25] ^ D[10] ^ D[11] ^ D[2] ^ crc_reg_2[29] ^ D[6] ^ crc_reg_2[28] ^ D[14];
assign next_crc_2[10] = D[1] ^ crc_reg_2[30] ^ D[15] ^ crc_reg_2[19] ^ D[13] ^ crc_reg_2[21] ^ crc_reg_2[18] ^ crc_reg_2[25] ^ D[12] ^ D[10] ^ D[2] ^ crc_reg_2[29] ^ D[6] ^ crc_reg_2[16];
assign next_crc_2[11] = crc_reg_2[17] ^ D[1] ^ D[3] ^ crc_reg_2[31] ^ crc_reg_2[30] ^ D[15] ^ crc_reg_2[19] ^ crc_reg_2[20] ^ crc_reg_2[25] ^ D[12] ^ D[11] ^ D[6] ^ crc_reg_2[16] ^ crc_reg_2[28] ^ D[14] ^ D[0];
assign next_crc_2[12] = crc_reg_2[22] ^ crc_reg_2[17] ^ crc_reg_2[31] ^ D[3] ^ D[15] ^ D[13] ^ crc_reg_2[20] ^ crc_reg_2[21] ^ crc_reg_2[18] ^ crc_reg_2[25] ^ D[10] ^ D[11] ^ D[2] ^ D[6] ^ crc_reg_2[29] ^ crc_reg_2[16] ^ crc_reg_2[28] ^ D[14] ^ D[9] ^ D[0];
assign next_crc_2[13] = crc_reg_2[22] ^ crc_reg_2[17] ^ D[1] ^ crc_reg_2[30] ^ crc_reg_2[19] ^ D[13] ^ crc_reg_2[21] ^ crc_reg_2[18] ^ D[5] ^ D[12] ^ D[8] ^ D[10] ^ crc_reg_2[23] ^ D[2] ^ crc_reg_2[29] ^ D[14] ^ crc_reg_2[26] ^ D[9];
assign next_crc_2[14] = crc_reg_2[22] ^ D[1] ^ crc_reg_2[31] ^ crc_reg_2[27] ^ crc_reg_2[30] ^ crc_reg_2[24] ^ D[4] ^ crc_reg_2[19] ^ D[13] ^ D[7] ^ crc_reg_2[20] ^ crc_reg_2[18] ^ D[12] ^ D[8] ^ D[11] ^ crc_reg_2[23] ^ D[9] ^ D[0];
assign next_crc_2[15] = D[3] ^ crc_reg_2[31] ^ crc_reg_2[24] ^ crc_reg_2[19] ^ crc_reg_2[20] ^ D[7] ^ crc_reg_2[21] ^ crc_reg_2[25] ^ D[12] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_2[23] ^ D[6] ^ crc_reg_2[28] ^ D[0];
assign next_crc_2[16] = crc_reg_2[0] ^ D[3] ^ D[15] ^ crc_reg_2[24] ^ crc_reg_2[20] ^ D[7] ^ crc_reg_2[21] ^ D[10] ^ D[11] ^ D[2] ^ crc_reg_2[29] ^ crc_reg_2[16] ^ crc_reg_2[28];
assign next_crc_2[17] = crc_reg_2[22] ^ crc_reg_2[17] ^ D[1] ^ crc_reg_2[30] ^ crc_reg_2[21] ^ crc_reg_2[25] ^ D[10] ^ D[2] ^ D[6] ^ crc_reg_2[29] ^ crc_reg_2[1] ^ D[14] ^ D[9];
assign next_crc_2[18] = crc_reg_2[22] ^ D[1] ^ crc_reg_2[31] ^ crc_reg_2[30] ^ D[13] ^ crc_reg_2[18] ^ D[5] ^ D[8] ^ crc_reg_2[23] ^ D[9] ^ D[0] ^ crc_reg_2[26] ^ crc_reg_2[2];
assign next_crc_2[19] = crc_reg_2[31] ^ crc_reg_2[27] ^ crc_reg_2[24] ^ D[4] ^ crc_reg_2[19] ^ D[7] ^ D[12] ^ D[8] ^ crc_reg_2[23] ^ D[0] ^ crc_reg_2[3];
assign next_crc_2[20] = crc_reg_2[4] ^ D[3] ^ crc_reg_2[24] ^ crc_reg_2[20] ^ D[7] ^ crc_reg_2[25] ^ D[11] ^ D[6] ^ crc_reg_2[28];
assign next_crc_2[21] = crc_reg_2[5] ^ crc_reg_2[21] ^ crc_reg_2[25] ^ D[5] ^ D[10] ^ D[2] ^ D[6] ^ crc_reg_2[29] ^ crc_reg_2[26];
assign next_crc_2[22] = D[1] ^ D[3] ^ crc_reg_2[27] ^ crc_reg_2[30] ^ D[15] ^ D[4] ^ crc_reg_2[25] ^ D[6] ^ crc_reg_2[16] ^ crc_reg_2[28] ^ crc_reg_2[6];
assign next_crc_2[23] = crc_reg_2[22] ^ crc_reg_2[17] ^ crc_reg_2[31] ^ D[15] ^ crc_reg_2[7] ^ crc_reg_2[25] ^ D[2] ^ D[6] ^ crc_reg_2[29] ^ crc_reg_2[16] ^ D[14] ^ D[9] ^ D[0];
assign next_crc_2[24] = crc_reg_2[17] ^ D[1] ^ crc_reg_2[8] ^ crc_reg_2[30] ^ D[13] ^ crc_reg_2[18] ^ D[5] ^ D[8] ^ crc_reg_2[23] ^ D[14] ^ crc_reg_2[26];
assign next_crc_2[25] = crc_reg_2[9] ^ crc_reg_2[31] ^ crc_reg_2[27] ^ crc_reg_2[24] ^ D[4] ^ crc_reg_2[19] ^ D[13] ^ D[7] ^ crc_reg_2[18] ^ D[12] ^ D[0];
assign next_crc_2[26] = crc_reg_2[22] ^ crc_reg_2[10] ^ D[15] ^ crc_reg_2[19] ^ crc_reg_2[20] ^ D[12] ^ D[5] ^ D[11] ^ crc_reg_2[16] ^ D[9] ^ crc_reg_2[26];
assign next_crc_2[27] = crc_reg_2[17] ^ crc_reg_2[27] ^ D[4] ^ crc_reg_2[20] ^ crc_reg_2[21] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_2[11] ^ crc_reg_2[23] ^ D[14];
assign next_crc_2[28] = crc_reg_2[22] ^ D[3] ^ crc_reg_2[24] ^ D[13] ^ D[7] ^ crc_reg_2[21] ^ crc_reg_2[18] ^ D[10] ^ crc_reg_2[12] ^ crc_reg_2[28] ^ D[9];
assign next_crc_2[29] = crc_reg_2[22] ^ crc_reg_2[19] ^ crc_reg_2[25] ^ D[12] ^ D[8] ^ crc_reg_2[13] ^ crc_reg_2[23] ^ D[2] ^ D[6] ^ crc_reg_2[29] ^ D[9];
assign next_crc_2[30] = D[1] ^ crc_reg_2[30] ^ crc_reg_2[24] ^ crc_reg_2[20] ^ D[7] ^ crc_reg_2[14] ^ D[5] ^ D[8] ^ D[11] ^ crc_reg_2[23] ^ crc_reg_2[26];
assign next_crc_2[31] = crc_reg_2[31] ^ crc_reg_2[27] ^ D[4] ^ crc_reg_2[24] ^ D[7] ^ crc_reg_2[21] ^ crc_reg_2[25] ^ crc_reg_2[15] ^ D[10] ^ D[6] ^ D[0];

assign next_crc_3[0]  = crc_reg_3[22] ^ crc_reg_3[25] ^ D[5] ^ D[3] ^ D[6] ^ crc_reg_3[16] ^ crc_reg_3[28] ^ D[15] ^ D[9] ^ crc_reg_3[26];
assign next_crc_3[1]  = crc_reg_3[22] ^ crc_reg_3[17] ^ D[3] ^ crc_reg_3[27] ^ D[15] ^ D[4] ^ crc_reg_3[25] ^ D[8] ^ crc_reg_3[23] ^ D[2] ^ crc_reg_3[29] ^ D[6] ^ crc_reg_3[16] ^ crc_reg_3[28] ^ D[14] ^ D[9];
assign next_crc_3[2]  = crc_reg_3[22] ^ crc_reg_3[17] ^ D[1] ^ crc_reg_3[30] ^ D[15] ^ crc_reg_3[24] ^ D[13] ^ D[7] ^ crc_reg_3[18] ^ crc_reg_3[25] ^ D[8] ^ D[2] ^ crc_reg_3[23] ^ D[6] ^ crc_reg_3[29] ^ crc_reg_3[16] ^ D[14] ^ D[9];
assign next_crc_3[3]  = crc_reg_3[17] ^ D[1] ^ crc_reg_3[31] ^ crc_reg_3[30] ^ crc_reg_3[24] ^ crc_reg_3[19] ^ D[13] ^ D[7] ^ crc_reg_3[18] ^ crc_reg_3[25] ^ D[5] ^ D[12] ^ D[8] ^ crc_reg_3[23] ^ D[6] ^ D[14] ^ crc_reg_3[26] ^ D[0];
assign next_crc_3[4]  = crc_reg_3[22] ^ crc_reg_3[31] ^ D[3] ^ crc_reg_3[27] ^ D[15] ^ crc_reg_3[24] ^ D[4] ^ crc_reg_3[19] ^ D[13] ^ D[7] ^ crc_reg_3[20] ^ crc_reg_3[18] ^ D[12] ^ D[11] ^ crc_reg_3[16] ^ crc_reg_3[28] ^ D[9] ^ D[0];
assign next_crc_3[5]  = crc_reg_3[22] ^ crc_reg_3[17] ^ D[15] ^ crc_reg_3[19] ^ crc_reg_3[20] ^ crc_reg_3[21] ^ D[12] ^ D[5] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_3[23] ^ D[2] ^ crc_reg_3[29] ^ crc_reg_3[16] ^ D[14] ^ D[9] ^ crc_reg_3[26];
assign next_crc_3[6]  = crc_reg_3[22] ^ crc_reg_3[17] ^ D[1] ^ crc_reg_3[27] ^ crc_reg_3[30] ^ crc_reg_3[24] ^ D[4] ^ D[13] ^ D[7] ^ crc_reg_3[20] ^ crc_reg_3[21] ^ crc_reg_3[18] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_3[23] ^ D[14] ^ D[9];
assign next_crc_3[7]  = crc_reg_3[31] ^ D[15] ^ crc_reg_3[24] ^ crc_reg_3[19] ^ D[13] ^ D[7] ^ crc_reg_3[21] ^ crc_reg_3[18] ^ D[5] ^ D[12] ^ D[8] ^ D[10] ^ crc_reg_3[23] ^ crc_reg_3[16] ^ crc_reg_3[26] ^ D[0];
assign next_crc_3[8]  = crc_reg_3[17] ^ D[3] ^ crc_reg_3[27] ^ D[15] ^ D[4] ^ crc_reg_3[24] ^ crc_reg_3[19] ^ crc_reg_3[20] ^ D[7] ^ D[12] ^ D[5] ^ D[11] ^ crc_reg_3[16] ^ crc_reg_3[28] ^ D[14] ^ crc_reg_3[26];
assign next_crc_3[9]  = crc_reg_3[17] ^ D[3] ^ crc_reg_3[27] ^ D[4] ^ D[13] ^ crc_reg_3[20] ^ crc_reg_3[21] ^ crc_reg_3[18] ^ crc_reg_3[25] ^ D[10] ^ D[11] ^ D[2] ^ crc_reg_3[29] ^ D[6] ^ crc_reg_3[28] ^ D[14];
assign next_crc_3[10] = D[1] ^ crc_reg_3[30] ^ D[15] ^ crc_reg_3[19] ^ D[13] ^ crc_reg_3[21] ^ crc_reg_3[18] ^ crc_reg_3[25] ^ D[12] ^ D[10] ^ D[2] ^ crc_reg_3[29] ^ D[6] ^ crc_reg_3[16];
assign next_crc_3[11] = crc_reg_3[17] ^ D[1] ^ D[3] ^ crc_reg_3[31] ^ crc_reg_3[30] ^ D[15] ^ crc_reg_3[19] ^ crc_reg_3[20] ^ crc_reg_3[25] ^ D[12] ^ D[11] ^ D[6] ^ crc_reg_3[16] ^ crc_reg_3[28] ^ D[14] ^ D[0];
assign next_crc_3[12] = crc_reg_3[22] ^ crc_reg_3[17] ^ crc_reg_3[31] ^ D[3] ^ D[15] ^ D[13] ^ crc_reg_3[20] ^ crc_reg_3[21] ^ crc_reg_3[18] ^ crc_reg_3[25] ^ D[10] ^ D[11] ^ D[2] ^ D[6] ^ crc_reg_3[29] ^ crc_reg_3[16] ^ crc_reg_3[28] ^ D[14] ^ D[9] ^ D[0];
assign next_crc_3[13] = crc_reg_3[22] ^ crc_reg_3[17] ^ D[1] ^ crc_reg_3[30] ^ crc_reg_3[19] ^ D[13] ^ crc_reg_3[21] ^ crc_reg_3[18] ^ D[5] ^ D[12] ^ D[8] ^ D[10] ^ crc_reg_3[23] ^ D[2] ^ crc_reg_3[29] ^ D[14] ^ crc_reg_3[26] ^ D[9];
assign next_crc_3[14] = crc_reg_3[22] ^ D[1] ^ crc_reg_3[31] ^ crc_reg_3[27] ^ crc_reg_3[30] ^ crc_reg_3[24] ^ D[4] ^ crc_reg_3[19] ^ D[13] ^ D[7] ^ crc_reg_3[20] ^ crc_reg_3[18] ^ D[12] ^ D[8] ^ D[11] ^ crc_reg_3[23] ^ D[9] ^ D[0];
assign next_crc_3[15] = D[3] ^ crc_reg_3[31] ^ crc_reg_3[24] ^ crc_reg_3[19] ^ crc_reg_3[20] ^ D[7] ^ crc_reg_3[21] ^ crc_reg_3[25] ^ D[12] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_3[23] ^ D[6] ^ crc_reg_3[28] ^ D[0];
assign next_crc_3[16] = crc_reg_3[0] ^ D[3] ^ D[15] ^ crc_reg_3[24] ^ crc_reg_3[20] ^ D[7] ^ crc_reg_3[21] ^ D[10] ^ D[11] ^ D[2] ^ crc_reg_3[29] ^ crc_reg_3[16] ^ crc_reg_3[28];
assign next_crc_3[17] = crc_reg_3[22] ^ crc_reg_3[17] ^ D[1] ^ crc_reg_3[30] ^ crc_reg_3[21] ^ crc_reg_3[25] ^ D[10] ^ D[2] ^ D[6] ^ crc_reg_3[29] ^ crc_reg_3[1] ^ D[14] ^ D[9];
assign next_crc_3[18] = crc_reg_3[22] ^ D[1] ^ crc_reg_3[31] ^ crc_reg_3[30] ^ D[13] ^ crc_reg_3[18] ^ D[5] ^ D[8] ^ crc_reg_3[23] ^ D[9] ^ D[0] ^ crc_reg_3[26] ^ crc_reg_3[2];
assign next_crc_3[19] = crc_reg_3[31] ^ crc_reg_3[27] ^ crc_reg_3[24] ^ D[4] ^ crc_reg_3[19] ^ D[7] ^ D[12] ^ D[8] ^ crc_reg_3[23] ^ D[0] ^ crc_reg_3[3];
assign next_crc_3[20] = crc_reg_3[4] ^ D[3] ^ crc_reg_3[24] ^ crc_reg_3[20] ^ D[7] ^ crc_reg_3[25] ^ D[11] ^ D[6] ^ crc_reg_3[28];
assign next_crc_3[21] = crc_reg_3[5] ^ crc_reg_3[21] ^ crc_reg_3[25] ^ D[5] ^ D[10] ^ D[2] ^ D[6] ^ crc_reg_3[29] ^ crc_reg_3[26];
assign next_crc_3[22] = D[1] ^ D[3] ^ crc_reg_3[27] ^ crc_reg_3[30] ^ D[15] ^ D[4] ^ crc_reg_3[25] ^ D[6] ^ crc_reg_3[16] ^ crc_reg_3[28] ^ crc_reg_3[6];
assign next_crc_3[23] = crc_reg_3[22] ^ crc_reg_3[17] ^ crc_reg_3[31] ^ D[15] ^ crc_reg_3[7] ^ crc_reg_3[25] ^ D[2] ^ D[6] ^ crc_reg_3[29] ^ crc_reg_3[16] ^ D[14] ^ D[9] ^ D[0];
assign next_crc_3[24] = crc_reg_3[17] ^ D[1] ^ crc_reg_3[8] ^ crc_reg_3[30] ^ D[13] ^ crc_reg_3[18] ^ D[5] ^ D[8] ^ crc_reg_3[23] ^ D[14] ^ crc_reg_3[26];
assign next_crc_3[25] = crc_reg_3[9] ^ crc_reg_3[31] ^ crc_reg_3[27] ^ crc_reg_3[24] ^ D[4] ^ crc_reg_3[19] ^ D[13] ^ D[7] ^ crc_reg_3[18] ^ D[12] ^ D[0];
assign next_crc_3[26] = crc_reg_3[22] ^ crc_reg_3[10] ^ D[15] ^ crc_reg_3[19] ^ crc_reg_3[20] ^ D[12] ^ D[5] ^ D[11] ^ crc_reg_3[16] ^ D[9] ^ crc_reg_3[26];
assign next_crc_3[27] = crc_reg_3[17] ^ crc_reg_3[27] ^ D[4] ^ crc_reg_3[20] ^ crc_reg_3[21] ^ D[8] ^ D[10] ^ D[11] ^ crc_reg_3[11] ^ crc_reg_3[23] ^ D[14];
assign next_crc_3[28] = crc_reg_3[22] ^ D[3] ^ crc_reg_3[24] ^ D[13] ^ D[7] ^ crc_reg_3[21] ^ crc_reg_3[18] ^ D[10] ^ crc_reg_3[12] ^ crc_reg_3[28] ^ D[9];
assign next_crc_3[29] = crc_reg_3[22] ^ crc_reg_3[19] ^ crc_reg_3[25] ^ D[12] ^ D[8] ^ crc_reg_3[13] ^ crc_reg_3[23] ^ D[2] ^ D[6] ^ crc_reg_3[29] ^ D[9];
assign next_crc_3[30] = D[1] ^ crc_reg_3[30] ^ crc_reg_3[24] ^ crc_reg_3[20] ^ D[7] ^ crc_reg_3[14] ^ D[5] ^ D[8] ^ D[11] ^ crc_reg_3[23] ^ crc_reg_3[26];
assign next_crc_3[31] = crc_reg_3[31] ^ crc_reg_3[27] ^ D[4] ^ crc_reg_3[24] ^ D[7] ^ crc_reg_3[21] ^ crc_reg_3[25] ^ crc_reg_3[15] ^ D[10] ^ D[6] ^ D[0];

endmodule
