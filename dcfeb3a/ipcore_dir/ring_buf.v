////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: ring_buf.v
// /___/   /\     Timestamp: Tue Jun 24 14:14:53 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/ring_buf.ngc C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/ring_buf.v 
// Device	: 6vlx130tff1156-1
// Input file	: C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/ring_buf.ngc
// Output file	: C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/ring_buf.v
// # of Modules	: 1
// Design Name	: ring_buf
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module ring_buf (
  clka, clkb, injectsbiterr, injectdbiterr, sbiterr, dbiterr, wea, addra, dina, addrb, doutb, rdaddrecc
)/* synthesis syn_black_box syn_noprune=1 */;
  input clka;
  input clkb;
  input injectsbiterr;
  input injectdbiterr;
  output sbiterr;
  output dbiterr;
  input [0 : 0] wea;
  input [11 : 0] addra;
  input [17 : 0] dina;
  input [11 : 0] addrb;
  output [17 : 0] doutb;
  output [11 : 0] rdaddrecc;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_dbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_sbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<8> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<9> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<10> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<11> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<12> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<13> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<14> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<15> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<16> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<17> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_dbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_sbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<8> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<9> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<10> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<11> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<12> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<13> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<14> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<15> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<16> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<17> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_dbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_sbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<8> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<9> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<10> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<11> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<12> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<13> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<14> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<15> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<16> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<17> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_dbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_sbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<8> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<9> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<10> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<11> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<12> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<13> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<14> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<15> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<16> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<17> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_dbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_sbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<8> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<9> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<10> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<11> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<12> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<13> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<14> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<15> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<16> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<17> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_dbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_sbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<8> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<9> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<10> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<11> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<12> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<13> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<14> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<15> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<16> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<17> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_dbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_sbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<8> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<9> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<10> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<11> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<12> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<13> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<14> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<15> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<16> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<17> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_dbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_sbiterr ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<8> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<9> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<10> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<11> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<12> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<13> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<14> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<15> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<16> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<17> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_sbiterr_mux_3_257 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_sbiterr_mux_4_258 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_3_259 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_4_260 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_31_261 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_41_262 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_32_263 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_42_264 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_33_265 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_43_266 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_34_267 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_44_268 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_35_269 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_45_270 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_36_271 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_46_272 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_37_273 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_47_274 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_38_275 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_48_276 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_39_277 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_49_278 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_310_279 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_410_280 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_311_281 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_411_282 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_312_283 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_412_284 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_313_285 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_413_286 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_314_287 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_414_288 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_315_289 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_415_290 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_316_291 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_416_292 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_317_293 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_417_294 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dbiterr_mux_3_295 ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dbiterr_mux_4_296 ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED ;
  wire [8 : 0] \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux ;
  wire [11 : 9] \NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux ;
  wire [7 : 0] \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array ;
  wire [7 : 0] \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array ;
  wire [11 : 0] \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat ;
  assign
    rdaddrecc[11] = \NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11],
    rdaddrecc[10] = \NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10],
    rdaddrecc[9] = \NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9],
    rdaddrecc[8] = \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [8],
    rdaddrecc[7] = \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [7],
    rdaddrecc[6] = \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [6],
    rdaddrecc[5] = \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [5],
    rdaddrecc[4] = \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [4],
    rdaddrecc[3] = \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [3],
    rdaddrecc[2] = \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [2],
    rdaddrecc[1] = \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [1],
    rdaddrecc[0] = \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [0];
  VCC   XST_VCC (
    .P(N0)
  );
  GND   XST_GND (
    .G(N1)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_sbiterr_mux_3  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_sbiterr ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_sbiterr ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_sbiterr ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_sbiterr ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_sbiterr_mux_3_257 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_sbiterr_mux_4  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_sbiterr ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_sbiterr ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_sbiterr ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_sbiterr ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_sbiterr_mux_4_258 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_sbiterr_mux_2_f7  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_sbiterr_mux_4_258 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_sbiterr_mux_3_257 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(sbiterr)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_3  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<0> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<0> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<0> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<0> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_3_259 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_4  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<0> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<0> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<0> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<0> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_4_260 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_4_260 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_3_259 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[0])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_31  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<10> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<10> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<10> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<10> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_31_261 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_41  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<10> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<10> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<10> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<10> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_41_262 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_0  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_41_262 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_31_261 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[10])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_32  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<11> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<11> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<11> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<11> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_32_263 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_42  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<11> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<11> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<11> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<11> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_42_264 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_1  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_42_264 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_32_263 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[11])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_33  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<12> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<12> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<12> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<12> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_33_265 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_43  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<12> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<12> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<12> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<12> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_43_266 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_2  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_43_266 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_33_265 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[12])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_34  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<13> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<13> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<13> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<13> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_34_267 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_44  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<13> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<13> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<13> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<13> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_44_268 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_3  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_44_268 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_34_267 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[13])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_35  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<14> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<14> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<14> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<14> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_35_269 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_45  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<14> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<14> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<14> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<14> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_45_270 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_4  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_45_270 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_35_269 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[14])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_36  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<15> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<15> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<15> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<15> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_36_271 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_46  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<15> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<15> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<15> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<15> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_46_272 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_5  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_46_272 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_36_271 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[15])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_37  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<16> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<16> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<16> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<16> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_37_273 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_47  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<16> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<16> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<16> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<16> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_47_274 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_6  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_47_274 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_37_273 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[16])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_38  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<17> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<17> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<17> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<17> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_38_275 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_48  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<17> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<17> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<17> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<17> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_48_276 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_7  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_48_276 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_38_275 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[17])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_39  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<1> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<1> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<1> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<1> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_39_277 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_49  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<1> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<1> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<1> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<1> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_49_278 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_8  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_49_278 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_39_277 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[1])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_310  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<2> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<2> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<2> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<2> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_310_279 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_410  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<2> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<2> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<2> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<2> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_410_280 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_9  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_410_280 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_310_279 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[2])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_311  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<3> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<3> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<3> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<3> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_311_281 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_411  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<3> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<3> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<3> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<3> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_411_282 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_10  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_411_282 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_311_281 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[3])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_312  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<4> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<4> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<4> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<4> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_312_283 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_412  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<4> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<4> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<4> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<4> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_412_284 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_11  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_412_284 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_312_283 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[4])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_313  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<5> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<5> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<5> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<5> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_313_285 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_413  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<5> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<5> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<5> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<5> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_413_286 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_12  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_413_286 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_313_285 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[5])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_314  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<6> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<6> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<6> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<6> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_314_287 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_414  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<6> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<6> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<6> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<6> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_414_288 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_13  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_414_288 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_314_287 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[6])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_315  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<7> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<7> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<7> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<7> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_315_289 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_415  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<7> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<7> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<7> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<7> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_415_290 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_14  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_415_290 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_315_289 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[7])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_316  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<8> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<8> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<8> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<8> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_316_291 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_416  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<8> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<8> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<8> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<8> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_416_292 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_15  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_416_292 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_316_291 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[8])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_317  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<9> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<9> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<9> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<9> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_317_293 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_417  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<9> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<9> ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<9> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<9> ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_417_294 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_2_f7_16  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_417_294 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dout_mux_317_293 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(doutb[9])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dbiterr_mux_3  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_dbiterr ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_dbiterr ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_dbiterr ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_dbiterr ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dbiterr_mux_3_295 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dbiterr_mux_4  (
    .I0(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10]),
    .I1(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_dbiterr ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_dbiterr ),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_dbiterr ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_dbiterr ),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dbiterr_mux_4_296 )
  );
  MUXF7   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dbiterr_mux_2_f7  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dbiterr_mux_4_296 ),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/Mmux_dbiterr_mux_3_295 ),
    .S(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11]),
    .O(dbiterr)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_11  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [11]),
    .R(N1),
    .Q(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_10  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [10]),
    .R(N1),
    .Q(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_9  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [9]),
    .R(N1),
    .Q(\NlwRenamedSig_OI_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_8  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [8]),
    .R(N1),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_7  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [7]),
    .R(N1),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_6  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [6]),
    .R(N1),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_5  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [5]),
    .R(N1),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_4  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [4]),
    .R(N1),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_3  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [3]),
    .R(N1),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_2  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [2]),
    .R(N1),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_1  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [1]),
    .R(N1),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux_0  (
    .C(clkb),
    .CE(N0),
    .D(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [0]),
    .R(N1),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_mux [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_11  (
    .C(clkb),
    .CE(N0),
    .D(addrb[11]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_10  (
    .C(clkb),
    .CE(N0),
    .D(addrb[10]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_9  (
    .C(clkb),
    .CE(N0),
    .D(addrb[9]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_8  (
    .C(clkb),
    .CE(N0),
    .D(addrb[8]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_7  (
    .C(clkb),
    .CE(N0),
    .D(addrb[7]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_6  (
    .C(clkb),
    .CE(N0),
    .D(addrb[6]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_5  (
    .C(clkb),
    .CE(N0),
    .D(addrb[5]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_4  (
    .C(clkb),
    .CE(N0),
    .D(addrb[4]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_3  (
    .C(clkb),
    .CE(N0),
    .D(addrb[3]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_2  (
    .C(clkb),
    .CE(N0),
    .D(addrb[2]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_1  (
    .C(clkb),
    .CE(N0),
    .D(addrb[1]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat_0  (
    .C(clkb),
    .CE(N0),
    .D(addrb[0]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_b.B/rdaddrecc_lat [0])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_a.bindec_inst_a/ADDR[2]_PWR_16_o_equal_5_o<2>1  (
    .I0(addra[11]),
    .I1(addra[10]),
    .I2(addra[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [4])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_a.bindec_inst_a/ADDR[2]_PWR_16_o_equal_6_o<2>1  (
    .I0(addra[11]),
    .I1(addra[10]),
    .I2(addra[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [5])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_a.bindec_inst_a/ADDR[2]_PWR_16_o_equal_7_o<2>1  (
    .I0(addra[10]),
    .I1(addra[9]),
    .I2(addra[11]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [6])
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_a.bindec_inst_a/ADDR[2]_PWR_16_o_equal_8_o<2>1  (
    .I0(addra[11]),
    .I1(addra[10]),
    .I2(addra[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [7])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_a.bindec_inst_a/ADDR[2]_GND_16_o_equal_3_o<2>1  (
    .I0(addra[10]),
    .I1(addra[11]),
    .I2(addra[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [2])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_a.bindec_inst_a/ADDR[2]_GND_16_o_equal_4_o<2>1  (
    .I0(addra[10]),
    .I1(addra[11]),
    .I2(addra[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [3])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_a.bindec_inst_a/ADDR[2]_GND_16_o_equal_2_o<2>1  (
    .I0(addra[9]),
    .I1(addra[11]),
    .I2(addra[10]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [1])
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_a.bindec_inst_a/ADDR[2]_GND_16_o_equal_1_o<2>1  (
    .I0(addra[11]),
    .I1(addra[10]),
    .I2(addra[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [0])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_b.bindec_inst_b/ADDR[2]_PWR_16_o_equal_5_o<2>1  (
    .I0(addrb[11]),
    .I1(addrb[10]),
    .I2(addrb[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [4])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_b.bindec_inst_b/ADDR[2]_PWR_16_o_equal_6_o<2>1  (
    .I0(addrb[11]),
    .I1(addrb[10]),
    .I2(addrb[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [5])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_b.bindec_inst_b/ADDR[2]_PWR_16_o_equal_7_o<2>1  (
    .I0(addrb[10]),
    .I1(addrb[9]),
    .I2(addrb[11]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [6])
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_b.bindec_inst_b/ADDR[2]_PWR_16_o_equal_8_o<2>1  (
    .I0(addrb[11]),
    .I1(addrb[10]),
    .I2(addrb[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [7])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_b.bindec_inst_b/ADDR[2]_GND_16_o_equal_3_o<2>1  (
    .I0(addrb[10]),
    .I1(addrb[11]),
    .I2(addrb[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [2])
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_b.bindec_inst_b/ADDR[2]_GND_16_o_equal_4_o<2>1  (
    .I0(addrb[10]),
    .I1(addrb[11]),
    .I2(addrb[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [3])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_b.bindec_inst_b/ADDR[2]_GND_16_o_equal_2_o<2>1  (
    .I0(addrb[9]),
    .I1(addrb[11]),
    .I2(addrb[10]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [1])
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_b.bindec_inst_b/ADDR[2]_GND_16_o_equal_1_o<2>1  (
    .I0(addrb[11]),
    .I1(addrb[10]),
    .I2(addrb[9]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [0])
  );
  RAMB36E1 #(
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "SDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .READ_WIDTH_A ( 72 ),
    .READ_WIDTH_B ( 0 ),
    .RSTREG_PRIORITY_A ( "REGCE" ),
    .RSTREG_PRIORITY_B ( "REGCE" ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .WRITE_WIDTH_A ( 0 ),
    .WRITE_WIDTH_B ( 72 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram  (
    .CASCADEINA(N1),
    .CASCADEINB(N1),
    .CASCADEOUTA
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED )
,
    .CASCADEOUTB
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED )
,
    .CLKARDCLK(clkb),
    .CLKBWRCLK(clka),
    .DBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_dbiterr ),
    .ENARDEN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [7]),
    .ENBWREN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [7]),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .REGCEAREGCE(N0),
    .REGCEB(N1),
    .RSTRAMARSTRAM(N1),
    .RSTRAMB(N1),
    .RSTREGARSTREG(N1),
    .RSTREGB(N1),
    .SBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_sbiterr ),
    .ADDRARDADDR({N0, addrb[8], addrb[7], addrb[6], addrb[5], addrb[4], addrb[3], addrb[2], addrb[1], addrb[0], N1, N1, N1, N1, N1, N1}),
    .ADDRBWRADDR({N0, addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1, N1, N1, N1}),
    .DIADI({N1, N1, N1, N1, N1, N1, dina[8], dina[7], N1, N1, N1, N1, N1, N1, dina[6], dina[5], N1, N1, N1, N1, N1, N1, dina[4], dina[3], N1, N1, N1, 
N1, N1, dina[2], dina[1], dina[0]}),
    .DIBDI({N1, N1, N1, N1, N1, N1, dina[17], dina[16], N1, N1, N1, N1, N1, N1, dina[15], dina[14], N1, N1, N1, N1, N1, N1, dina[13], dina[12], N1, N1
, N1, N1, N1, dina[11], dina[10], dina[9]}),
    .DIPADIP({N1, N1, N1, N1}),
    .DIPBDIP({N1, N1, N1, N1}),
    .DOADO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<8> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<7> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<5> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<3> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<0> }),
    .DOBDO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<17> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<16> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<15> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<14> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<13> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<12> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<11> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<10> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.ram_doutb<9> }),
    .DOPADOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED 
}),
    .DOPBDOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED 
}),
    .RDADDRECC({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED 
}),
    .WEA({N1, N1, N1, N1}),
    .WEBWE({wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0]})
  );
  RAMB36E1 #(
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "SDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .READ_WIDTH_A ( 72 ),
    .READ_WIDTH_B ( 0 ),
    .RSTREG_PRIORITY_A ( "REGCE" ),
    .RSTREG_PRIORITY_B ( "REGCE" ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .WRITE_WIDTH_A ( 0 ),
    .WRITE_WIDTH_B ( 72 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram  (
    .CASCADEINA(N1),
    .CASCADEINB(N1),
    .CASCADEOUTA
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED )
,
    .CASCADEOUTB
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED )
,
    .CLKARDCLK(clkb),
    .CLKBWRCLK(clka),
    .DBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_dbiterr ),
    .ENARDEN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [6]),
    .ENBWREN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [6]),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .REGCEAREGCE(N0),
    .REGCEB(N1),
    .RSTRAMARSTRAM(N1),
    .RSTRAMB(N1),
    .RSTREGARSTREG(N1),
    .RSTREGB(N1),
    .SBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_sbiterr ),
    .ADDRARDADDR({N0, addrb[8], addrb[7], addrb[6], addrb[5], addrb[4], addrb[3], addrb[2], addrb[1], addrb[0], N1, N1, N1, N1, N1, N1}),
    .ADDRBWRADDR({N0, addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1, N1, N1, N1}),
    .DIADI({N1, N1, N1, N1, N1, N1, dina[8], dina[7], N1, N1, N1, N1, N1, N1, dina[6], dina[5], N1, N1, N1, N1, N1, N1, dina[4], dina[3], N1, N1, N1, 
N1, N1, dina[2], dina[1], dina[0]}),
    .DIBDI({N1, N1, N1, N1, N1, N1, dina[17], dina[16], N1, N1, N1, N1, N1, N1, dina[15], dina[14], N1, N1, N1, N1, N1, N1, dina[13], dina[12], N1, N1
, N1, N1, N1, dina[11], dina[10], dina[9]}),
    .DIPADIP({N1, N1, N1, N1}),
    .DIPBDIP({N1, N1, N1, N1}),
    .DOADO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<8> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<7> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<5> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<3> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<0> }),
    .DOBDO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<17> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<16> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<15> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<14> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<13> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<12> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<11> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<10> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_doutb<9> }),
    .DOPADOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED 
}),
    .DOPBDOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED 
}),
    .RDADDRECC({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED 
}),
    .WEA({N1, N1, N1, N1}),
    .WEBWE({wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0]})
  );
  RAMB36E1 #(
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "SDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .READ_WIDTH_A ( 72 ),
    .READ_WIDTH_B ( 0 ),
    .RSTREG_PRIORITY_A ( "REGCE" ),
    .RSTREG_PRIORITY_B ( "REGCE" ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .WRITE_WIDTH_A ( 0 ),
    .WRITE_WIDTH_B ( 72 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram  (
    .CASCADEINA(N1),
    .CASCADEINB(N1),
    .CASCADEOUTA
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED )
,
    .CASCADEOUTB
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED )
,
    .CLKARDCLK(clkb),
    .CLKBWRCLK(clka),
    .DBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_dbiterr ),
    .ENARDEN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [5]),
    .ENBWREN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [5]),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .REGCEAREGCE(N0),
    .REGCEB(N1),
    .RSTRAMARSTRAM(N1),
    .RSTRAMB(N1),
    .RSTREGARSTREG(N1),
    .RSTREGB(N1),
    .SBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_sbiterr ),
    .ADDRARDADDR({N0, addrb[8], addrb[7], addrb[6], addrb[5], addrb[4], addrb[3], addrb[2], addrb[1], addrb[0], N1, N1, N1, N1, N1, N1}),
    .ADDRBWRADDR({N0, addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1, N1, N1, N1}),
    .DIADI({N1, N1, N1, N1, N1, N1, dina[8], dina[7], N1, N1, N1, N1, N1, N1, dina[6], dina[5], N1, N1, N1, N1, N1, N1, dina[4], dina[3], N1, N1, N1, 
N1, N1, dina[2], dina[1], dina[0]}),
    .DIBDI({N1, N1, N1, N1, N1, N1, dina[17], dina[16], N1, N1, N1, N1, N1, N1, dina[15], dina[14], N1, N1, N1, N1, N1, N1, dina[13], dina[12], N1, N1
, N1, N1, N1, dina[11], dina[10], dina[9]}),
    .DIPADIP({N1, N1, N1, N1}),
    .DIPBDIP({N1, N1, N1, N1}),
    .DOADO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<8> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<7> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<5> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<3> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<0> }),
    .DOBDO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<17> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<16> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<15> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<14> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<13> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<12> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<11> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<10> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_doutb<9> }),
    .DOPADOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED 
}),
    .DOPBDOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED 
}),
    .RDADDRECC({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED 
}),
    .WEA({N1, N1, N1, N1}),
    .WEBWE({wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0]})
  );
  RAMB36E1 #(
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "SDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .READ_WIDTH_A ( 72 ),
    .READ_WIDTH_B ( 0 ),
    .RSTREG_PRIORITY_A ( "REGCE" ),
    .RSTREG_PRIORITY_B ( "REGCE" ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .WRITE_WIDTH_A ( 0 ),
    .WRITE_WIDTH_B ( 72 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram  (
    .CASCADEINA(N1),
    .CASCADEINB(N1),
    .CASCADEOUTA
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED )
,
    .CASCADEOUTB
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED )
,
    .CLKARDCLK(clkb),
    .CLKBWRCLK(clka),
    .DBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_dbiterr ),
    .ENARDEN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [4]),
    .ENBWREN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [4]),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .REGCEAREGCE(N0),
    .REGCEB(N1),
    .RSTRAMARSTRAM(N1),
    .RSTRAMB(N1),
    .RSTREGARSTREG(N1),
    .RSTREGB(N1),
    .SBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_sbiterr ),
    .ADDRARDADDR({N0, addrb[8], addrb[7], addrb[6], addrb[5], addrb[4], addrb[3], addrb[2], addrb[1], addrb[0], N1, N1, N1, N1, N1, N1}),
    .ADDRBWRADDR({N0, addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1, N1, N1, N1}),
    .DIADI({N1, N1, N1, N1, N1, N1, dina[8], dina[7], N1, N1, N1, N1, N1, N1, dina[6], dina[5], N1, N1, N1, N1, N1, N1, dina[4], dina[3], N1, N1, N1, 
N1, N1, dina[2], dina[1], dina[0]}),
    .DIBDI({N1, N1, N1, N1, N1, N1, dina[17], dina[16], N1, N1, N1, N1, N1, N1, dina[15], dina[14], N1, N1, N1, N1, N1, N1, dina[13], dina[12], N1, N1
, N1, N1, N1, dina[11], dina[10], dina[9]}),
    .DIPADIP({N1, N1, N1, N1}),
    .DIPBDIP({N1, N1, N1, N1}),
    .DOADO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<8> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<7> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<5> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<3> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<0> }),
    .DOBDO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<17> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<16> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<15> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<14> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<13> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<12> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<11> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<10> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_doutb<9> }),
    .DOPADOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED 
}),
    .DOPBDOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED 
}),
    .RDADDRECC({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED 
}),
    .WEA({N1, N1, N1, N1}),
    .WEBWE({wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0]})
  );
  RAMB36E1 #(
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "SDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .READ_WIDTH_A ( 72 ),
    .READ_WIDTH_B ( 0 ),
    .RSTREG_PRIORITY_A ( "REGCE" ),
    .RSTREG_PRIORITY_B ( "REGCE" ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .WRITE_WIDTH_A ( 0 ),
    .WRITE_WIDTH_B ( 72 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram  (
    .CASCADEINA(N1),
    .CASCADEINB(N1),
    .CASCADEOUTA
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED )
,
    .CASCADEOUTB
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED )
,
    .CLKARDCLK(clkb),
    .CLKBWRCLK(clka),
    .DBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_dbiterr ),
    .ENARDEN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [3]),
    .ENBWREN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [3]),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .REGCEAREGCE(N0),
    .REGCEB(N1),
    .RSTRAMARSTRAM(N1),
    .RSTRAMB(N1),
    .RSTREGARSTREG(N1),
    .RSTREGB(N1),
    .SBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_sbiterr ),
    .ADDRARDADDR({N0, addrb[8], addrb[7], addrb[6], addrb[5], addrb[4], addrb[3], addrb[2], addrb[1], addrb[0], N1, N1, N1, N1, N1, N1}),
    .ADDRBWRADDR({N0, addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1, N1, N1, N1}),
    .DIADI({N1, N1, N1, N1, N1, N1, dina[8], dina[7], N1, N1, N1, N1, N1, N1, dina[6], dina[5], N1, N1, N1, N1, N1, N1, dina[4], dina[3], N1, N1, N1, 
N1, N1, dina[2], dina[1], dina[0]}),
    .DIBDI({N1, N1, N1, N1, N1, N1, dina[17], dina[16], N1, N1, N1, N1, N1, N1, dina[15], dina[14], N1, N1, N1, N1, N1, N1, dina[13], dina[12], N1, N1
, N1, N1, N1, dina[11], dina[10], dina[9]}),
    .DIPADIP({N1, N1, N1, N1}),
    .DIPBDIP({N1, N1, N1, N1}),
    .DOADO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<8> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<7> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<5> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<3> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<0> }),
    .DOBDO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<17> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<16> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<15> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<14> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<13> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<12> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<11> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<10> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_doutb<9> }),
    .DOPADOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED 
}),
    .DOPBDOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED 
}),
    .RDADDRECC({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED 
}),
    .WEA({N1, N1, N1, N1}),
    .WEBWE({wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0]})
  );
  RAMB36E1 #(
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "SDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .READ_WIDTH_A ( 72 ),
    .READ_WIDTH_B ( 0 ),
    .RSTREG_PRIORITY_A ( "REGCE" ),
    .RSTREG_PRIORITY_B ( "REGCE" ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .WRITE_WIDTH_A ( 0 ),
    .WRITE_WIDTH_B ( 72 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram  (
    .CASCADEINA(N1),
    .CASCADEINB(N1),
    .CASCADEOUTA
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED )
,
    .CASCADEOUTB
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED )
,
    .CLKARDCLK(clkb),
    .CLKBWRCLK(clka),
    .DBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_dbiterr ),
    .ENARDEN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [2]),
    .ENBWREN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [2]),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .REGCEAREGCE(N0),
    .REGCEB(N1),
    .RSTRAMARSTRAM(N1),
    .RSTRAMB(N1),
    .RSTREGARSTREG(N1),
    .RSTREGB(N1),
    .SBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_sbiterr ),
    .ADDRARDADDR({N0, addrb[8], addrb[7], addrb[6], addrb[5], addrb[4], addrb[3], addrb[2], addrb[1], addrb[0], N1, N1, N1, N1, N1, N1}),
    .ADDRBWRADDR({N0, addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1, N1, N1, N1}),
    .DIADI({N1, N1, N1, N1, N1, N1, dina[8], dina[7], N1, N1, N1, N1, N1, N1, dina[6], dina[5], N1, N1, N1, N1, N1, N1, dina[4], dina[3], N1, N1, N1, 
N1, N1, dina[2], dina[1], dina[0]}),
    .DIBDI({N1, N1, N1, N1, N1, N1, dina[17], dina[16], N1, N1, N1, N1, N1, N1, dina[15], dina[14], N1, N1, N1, N1, N1, N1, dina[13], dina[12], N1, N1
, N1, N1, N1, dina[11], dina[10], dina[9]}),
    .DIPADIP({N1, N1, N1, N1}),
    .DIPBDIP({N1, N1, N1, N1}),
    .DOADO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<8> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<7> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<5> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<3> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<0> }),
    .DOBDO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<17> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<16> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<15> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<14> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<13> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<12> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<11> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<10> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_doutb<9> }),
    .DOPADOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED 
}),
    .DOPBDOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED 
}),
    .RDADDRECC({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED 
}),
    .WEA({N1, N1, N1, N1}),
    .WEBWE({wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0]})
  );
  RAMB36E1 #(
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "SDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .READ_WIDTH_A ( 72 ),
    .READ_WIDTH_B ( 0 ),
    .RSTREG_PRIORITY_A ( "REGCE" ),
    .RSTREG_PRIORITY_B ( "REGCE" ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .WRITE_WIDTH_A ( 0 ),
    .WRITE_WIDTH_B ( 72 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram  (
    .CASCADEINA(N1),
    .CASCADEINB(N1),
    .CASCADEOUTA
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED )
,
    .CASCADEOUTB
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED )
,
    .CLKARDCLK(clkb),
    .CLKBWRCLK(clka),
    .DBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_dbiterr ),
    .ENARDEN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [1]),
    .ENBWREN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [1]),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .REGCEAREGCE(N0),
    .REGCEB(N1),
    .RSTRAMARSTRAM(N1),
    .RSTRAMB(N1),
    .RSTREGARSTREG(N1),
    .RSTREGB(N1),
    .SBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_sbiterr ),
    .ADDRARDADDR({N0, addrb[8], addrb[7], addrb[6], addrb[5], addrb[4], addrb[3], addrb[2], addrb[1], addrb[0], N1, N1, N1, N1, N1, N1}),
    .ADDRBWRADDR({N0, addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1, N1, N1, N1}),
    .DIADI({N1, N1, N1, N1, N1, N1, dina[8], dina[7], N1, N1, N1, N1, N1, N1, dina[6], dina[5], N1, N1, N1, N1, N1, N1, dina[4], dina[3], N1, N1, N1, 
N1, N1, dina[2], dina[1], dina[0]}),
    .DIBDI({N1, N1, N1, N1, N1, N1, dina[17], dina[16], N1, N1, N1, N1, N1, N1, dina[15], dina[14], N1, N1, N1, N1, N1, N1, dina[13], dina[12], N1, N1
, N1, N1, N1, dina[11], dina[10], dina[9]}),
    .DIPADIP({N1, N1, N1, N1}),
    .DIPBDIP({N1, N1, N1, N1}),
    .DOADO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<8> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<7> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<5> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<3> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<0> }),
    .DOBDO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<17> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<16> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<15> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<14> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<13> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<12> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<11> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<10> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_doutb<9> }),
    .DOPADOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED 
}),
    .DOPBDOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED 
}),
    .RDADDRECC({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED 
}),
    .WEA({N1, N1, N1, N1}),
    .WEBWE({wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0]})
  );
  RAMB36E1 #(
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "SDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .READ_WIDTH_A ( 72 ),
    .READ_WIDTH_B ( 0 ),
    .RSTREG_PRIORITY_A ( "REGCE" ),
    .RSTREG_PRIORITY_B ( "REGCE" ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .WRITE_WIDTH_A ( 0 ),
    .WRITE_WIDTH_B ( 72 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram  (
    .CASCADEINA(N1),
    .CASCADEINB(N1),
    .CASCADEOUTA
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTA_UNCONNECTED )
,
    .CASCADEOUTB
(\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_CASCADEOUTB_UNCONNECTED )
,
    .CLKARDCLK(clkb),
    .CLKBWRCLK(clka),
    .DBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_dbiterr ),
    .ENARDEN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/enb_array [0]),
    .ENBWREN(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [0]),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .REGCEAREGCE(N0),
    .REGCEB(N1),
    .RSTRAMARSTRAM(N1),
    .RSTRAMB(N1),
    .RSTREGARSTREG(N1),
    .RSTREGB(N1),
    .SBITERR(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_sbiterr ),
    .ADDRARDADDR({N0, addrb[8], addrb[7], addrb[6], addrb[5], addrb[4], addrb[3], addrb[2], addrb[1], addrb[0], N1, N1, N1, N1, N1, N1}),
    .ADDRBWRADDR({N0, addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1, N1, N1, N1}),
    .DIADI({N1, N1, N1, N1, N1, N1, dina[8], dina[7], N1, N1, N1, N1, N1, N1, dina[6], dina[5], N1, N1, N1, N1, N1, N1, dina[4], dina[3], N1, N1, N1, 
N1, N1, dina[2], dina[1], dina[0]}),
    .DIBDI({N1, N1, N1, N1, N1, N1, dina[17], dina[16], N1, N1, N1, N1, N1, N1, dina[15], dina[14], N1, N1, N1, N1, N1, N1, dina[13], dina[12], N1, N1
, N1, N1, N1, dina[11], dina[10], dina[9]}),
    .DIPADIP({N1, N1, N1, N1}),
    .DIPBDIP({N1, N1, N1, N1}),
    .DOADO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<8> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<7> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<5> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<3> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOADO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<0> }),
    .DOBDO({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<31>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<30>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<29>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<28>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<27>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<26>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<17> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<16> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<23>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<22>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<21>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<20>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<19>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<18>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<15> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<14> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<15>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<14>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<13>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<12>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<11>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<10>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<13> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<12> , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOBDO<3>_UNCONNECTED 
, \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<11> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<10> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_doutb<9> }),
    .DOPADOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPADOP<0>_UNCONNECTED 
}),
    .DOPBDOP({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_DOPBDOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_ECCPARITY<0>_UNCONNECTED 
}),
    .RDADDRECC({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<8>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<7>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<6>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<5>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<4>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<3>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<2>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<1>_UNCONNECTED 
, 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/v6_noinit.ram/NO_BMM_INFO.SDP.WIDE_PRIM36.ram_RDADDRECC<0>_UNCONNECTED 
}),
    .WEA({N1, N1, N1, N1}),
    .WEBWE({wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0], wea[0]})
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
