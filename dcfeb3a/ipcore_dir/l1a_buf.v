////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: l1a_buf.v
// /___/   /\     Timestamp: Tue Jun 24 13:59:05 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/l1a_buf.ngc C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/l1a_buf.v 
// Device	: 6vlx130tff1156-1
// Input file	: C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/l1a_buf.ngc
// Output file	: C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/l1a_buf.v
// # of Modules	: 2
// Design Name	: l1a_buf
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

module reset_builtin_l1a_buf (
  CLK, WR_CLK, RD_CLK, INT_CLK, RST, WR_RST_I, RD_RST_I, INT_RST_I
)/* synthesis syn_black_box syn_noprune=1 */;
  input CLK;
  input WR_CLK;
  input RD_CLK;
  input INT_CLK;
  input RST;
  output [1 : 0] WR_RST_I;
  output [1 : 0] RD_RST_I;
  output [1 : 0] INT_RST_I;
  
  // synthesis translate_off
  
  wire wr_rst_reg_3;
  wire rd_rst_reg_15;
  wire wr_rst_reg_GND_25_o_MUX_1_o;
  wire rd_rst_reg_GND_25_o_MUX_2_o;
  wire [4 : 0] wr_rst_fb;
  wire [5 : 0] power_on_wr_rst;
  wire [4 : 0] rd_rst_fb;
  wire [5 : 0] power_on_rd_rst;
  wire [5 : 5] NlwRenamedSig_OI_n0019;
  wire [0 : 0] NlwRenamedSignal_RD_RST_I;
  assign
    RD_RST_I[1] = NlwRenamedSignal_RD_RST_I[0],
    RD_RST_I[0] = NlwRenamedSignal_RD_RST_I[0],
    INT_RST_I[1] = NlwRenamedSig_OI_n0019[5],
    INT_RST_I[0] = NlwRenamedSig_OI_n0019[5];
  GND   XST_GND (
    .G(NlwRenamedSig_OI_n0019[5])
  );
  FD #(
    .INIT ( 1'b0 ))
  wr_rst_fb_0 (
    .C(WR_CLK),
    .D(wr_rst_fb[1]),
    .Q(wr_rst_fb[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  wr_rst_fb_1 (
    .C(WR_CLK),
    .D(wr_rst_fb[2]),
    .Q(wr_rst_fb[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  wr_rst_fb_2 (
    .C(WR_CLK),
    .D(wr_rst_fb[3]),
    .Q(wr_rst_fb[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  wr_rst_fb_3 (
    .C(WR_CLK),
    .D(wr_rst_fb[4]),
    .Q(wr_rst_fb[3])
  );
  FD #(
    .INIT ( 1'b0 ))
  wr_rst_fb_4 (
    .C(WR_CLK),
    .D(wr_rst_reg_3),
    .Q(wr_rst_fb[4])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_wr_rst_0 (
    .C(WR_CLK),
    .D(power_on_wr_rst[1]),
    .Q(power_on_wr_rst[0])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_wr_rst_1 (
    .C(WR_CLK),
    .D(power_on_wr_rst[2]),
    .Q(power_on_wr_rst[1])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_wr_rst_2 (
    .C(WR_CLK),
    .D(power_on_wr_rst[3]),
    .Q(power_on_wr_rst[2])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_wr_rst_3 (
    .C(WR_CLK),
    .D(power_on_wr_rst[4]),
    .Q(power_on_wr_rst[3])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_wr_rst_4 (
    .C(WR_CLK),
    .D(power_on_wr_rst[5]),
    .Q(power_on_wr_rst[4])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_wr_rst_5 (
    .C(WR_CLK),
    .D(NlwRenamedSig_OI_n0019[5]),
    .Q(power_on_wr_rst[5])
  );
  FD #(
    .INIT ( 1'b0 ))
  rd_rst_fb_0 (
    .C(RD_CLK),
    .D(rd_rst_fb[1]),
    .Q(rd_rst_fb[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  rd_rst_fb_1 (
    .C(RD_CLK),
    .D(rd_rst_fb[2]),
    .Q(rd_rst_fb[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  rd_rst_fb_2 (
    .C(RD_CLK),
    .D(rd_rst_fb[3]),
    .Q(rd_rst_fb[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  rd_rst_fb_3 (
    .C(RD_CLK),
    .D(rd_rst_fb[4]),
    .Q(rd_rst_fb[3])
  );
  FD #(
    .INIT ( 1'b0 ))
  rd_rst_fb_4 (
    .C(RD_CLK),
    .D(rd_rst_reg_15),
    .Q(rd_rst_fb[4])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_rd_rst_0 (
    .C(RD_CLK),
    .D(power_on_rd_rst[1]),
    .Q(power_on_rd_rst[0])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_rd_rst_1 (
    .C(RD_CLK),
    .D(power_on_rd_rst[2]),
    .Q(power_on_rd_rst[1])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_rd_rst_2 (
    .C(RD_CLK),
    .D(power_on_rd_rst[3]),
    .Q(power_on_rd_rst[2])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_rd_rst_3 (
    .C(RD_CLK),
    .D(power_on_rd_rst[4]),
    .Q(power_on_rd_rst[3])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_rd_rst_4 (
    .C(RD_CLK),
    .D(power_on_rd_rst[5]),
    .Q(power_on_rd_rst[4])
  );
  FD #(
    .INIT ( 1'b1 ))
  power_on_rd_rst_5 (
    .C(RD_CLK),
    .D(NlwRenamedSig_OI_n0019[5]),
    .Q(power_on_rd_rst[5])
  );
  FDP #(
    .INIT ( 1'b0 ))
  wr_rst_reg (
    .C(WR_CLK),
    .D(wr_rst_reg_GND_25_o_MUX_1_o),
    .PRE(RST),
    .Q(wr_rst_reg_3)
  );
  FDP #(
    .INIT ( 1'b0 ))
  rd_rst_reg (
    .C(RD_CLK),
    .D(rd_rst_reg_GND_25_o_MUX_2_o),
    .PRE(RST),
    .Q(rd_rst_reg_15)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \RD_RST_I<1>1  (
    .I0(rd_rst_reg_15),
    .I1(power_on_rd_rst[0]),
    .O(NlwRenamedSignal_RD_RST_I[0])
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  Mmux_wr_rst_reg_GND_25_o_MUX_1_o11 (
    .I0(wr_rst_fb[0]),
    .I1(wr_rst_reg_3),
    .O(wr_rst_reg_GND_25_o_MUX_1_o)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  Mmux_rd_rst_reg_GND_25_o_MUX_2_o11 (
    .I0(rd_rst_fb[0]),
    .I1(rd_rst_reg_15),
    .O(rd_rst_reg_GND_25_o_MUX_2_o)
  );

// synthesis translate_on

endmodule

module l1a_buf (
  rst, wr_clk, rd_clk, wr_en, rd_en, injectdbiterr, injectsbiterr, full, empty, sbiterr, dbiterr, din, dout
)/* synthesis syn_black_box syn_noprune=1 */;
  input rst;
  input wr_clk;
  input rd_clk;
  input wr_en;
  input rd_en;
  input injectdbiterr;
  input injectsbiterr;
  output full;
  output empty;
  output sbiterr;
  output dbiterr;
  input [36 : 0] din;
  output [36 : 0] dout;
  
  // synthesis translate_off
  
  wire N1;
  wire NlwRenamedSig_OI_empty;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/rden_tmp ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><71> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><70> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><69> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><68> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><67> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><66> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><65> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><64> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><63> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><62> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><61> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><60> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><59> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><58> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><57> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><56> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><55> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><54> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><53> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><52> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><51> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><50> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><49> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><48> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><47> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><46> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><45> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><44> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><43> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><42> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><41> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><40> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><39> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><38> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><37> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><36> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><35> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><34> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><33> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><32> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><31> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><30> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><29> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><28> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><27> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><26> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><25> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><24> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><23> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><22> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><21> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><20> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><19> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><18> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><17> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><16> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><15> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><14> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><13> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><12> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><11> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><10> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><9> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><8> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><7> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><6> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><5> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><4> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><3> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><2> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><1> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><0> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/emp<1> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/sbiterr_row<1> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/dbiterr_row<1> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/ful<2> ;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/e ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_WR_RST_I<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_WR_RST_I<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_RD_RST_I<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_INT_RST_I<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_INT_RST_I<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTEMPTY_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTFULL_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDERR_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRERR_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<63>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<62>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<61>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<60>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<59>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<58>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<57>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<56>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<55>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<54>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<53>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<52>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<51>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<50>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<49>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<48>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<47>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<46>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<45>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<44>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<43>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<42>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<41>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<40>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<39>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<38>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<37>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<12>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<11>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<10>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<9>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<8>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<12>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<11>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<10>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<9>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<8>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTEMPTY_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTFULL_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDERR_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRERR_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<12>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<11>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<10>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<9>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<8>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<12>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<11>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<10>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<9>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<8>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<0>_UNCONNECTED ;
  wire my_rd_rst_i ;
  assign
    empty = NlwRenamedSig_OI_empty;
  GND   XST_GND (
    .G(N1)
  );
  reset_builtin_l1a_buf   \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt  (
    .CLK(N1),
    .WR_CLK(wr_clk),
    .RD_CLK(rd_clk),
    .INT_CLK(N1),
    .RST(rst),
    .WR_RST_I({\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_WR_RST_I<1>_UNCONNECTED , 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_WR_RST_I<0>_UNCONNECTED }),
    .RD_RST_I({\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_RD_RST_I<1>_UNCONNECTED , 
my_rd_rst_i}),
    .INT_RST_I({\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_INT_RST_I<1>_UNCONNECTED , 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_INT_RST_I<0>_UNCONNECTED })
  );
  FIFO36E1 #(
    .ALMOST_EMPTY_OFFSET ( 13'h0006 ),
    .ALMOST_FULL_OFFSET ( 13'h000A ),
    .DATA_WIDTH ( 72 ),
    .DO_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "FALSE" ),
    .EN_SYN ( "FALSE" ),
    .FIFO_MODE ( "FIFO36_72" ),
    .FIRST_WORD_FALL_THROUGH ( "TRUE" ),
    .INIT ( 72'h000000000000000000 ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL ( 72'h000000000000000000 ))
  \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1  (
    .ALMOSTEMPTY
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTEMPTY_UNCONNECTED )
,
    .ALMOSTFULL
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTFULL_UNCONNECTED )
,
    .DBITERR(dbiterr),
    .EMPTY(NlwRenamedSig_OI_empty),
    .FULL(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/ful<2> ),
    .INJECTDBITERR(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/dbiterr_row<1> ),
    .INJECTSBITERR(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/sbiterr_row<1> ),
    .RDCLK(rd_clk),
    .RDEN(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/rden_tmp ),
    .RDERR
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDERR_UNCONNECTED )
,
    .REGCE(N1),
    .RST(my_rd_rst_i),
    .RSTREG(N1),
    .SBITERR(sbiterr),
    .WRCLK(wr_clk),
    .WREN(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/e ),
    .WRERR
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRERR_UNCONNECTED )
,
    .DI({\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><63> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><62> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><61> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><60> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><59> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><58> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><57> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><56> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><55> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><54> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><53> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><52> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><51> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><50> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><49> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><48> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><47> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><46> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><45> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><44> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><43> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><42> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><41> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><40> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><39> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><38> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><37> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><36> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><35> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><34> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><33> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><32> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><31> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><30> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><29> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><28> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><27> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><26> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><25> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><24> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><23> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><22> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><21> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><20> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><19> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><18> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><17> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><16> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><15> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><14> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><13> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><12> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><11> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><10> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><9> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><8> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><7> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><6> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><5> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><4> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><3> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><2> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><1> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><0> }),
    .DIP({\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><71> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><70> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><69> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><68> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><67> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><66> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><65> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><64> }),
    .DO({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<63>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<62>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<61>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<60>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<59>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<58>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<57>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<56>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<55>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<54>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<53>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<52>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<51>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<50>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<49>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<48>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<47>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<46>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<45>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<44>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<43>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<42>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<41>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<40>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<39>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<38>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DO<37>_UNCONNECTED 
, dout[36], dout[35], dout[34], dout[33], dout[32], dout[31], dout[30], dout[29], dout[28], dout[27], dout[26], dout[25], dout[24], dout[23], dout[22]
, dout[21], dout[20], dout[19], dout[18], dout[17], dout[16], dout[15], dout[14], dout[13], dout[12], dout[11], dout[10], dout[9], dout[8], dout[7], 
dout[6], dout[5], dout[4], dout[3], dout[2], dout[1], dout[0]}),
    .DOP({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_DOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<0>_UNCONNECTED 
}),
    .RDCOUNT({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<12>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<11>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<10>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<9>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<8>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<0>_UNCONNECTED 
}),
    .WRCOUNT({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<12>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<11>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<10>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<9>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<8>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<0>_UNCONNECTED 
})
  );
  FIFO36E1 #(
    .ALMOST_EMPTY_OFFSET ( 13'h000A ),
    .ALMOST_FULL_OFFSET ( 13'h0007 ),
    .DATA_WIDTH ( 72 ),
    .DO_REG ( 1 ),
    .EN_ECC_READ ( "FALSE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .EN_SYN ( "FALSE" ),
    .FIFO_MODE ( "FIFO36_72" ),
    .FIRST_WORD_FALL_THROUGH ( "TRUE" ),
    .INIT ( 72'h000000000000000000 ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL ( 72'h000000000000000000 ))
  \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1  (
    .ALMOSTEMPTY
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTEMPTY_UNCONNECTED )
,
    .ALMOSTFULL
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTFULL_UNCONNECTED )
,
    .DBITERR(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/dbiterr_row<1> ),
    .EMPTY(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/emp<1> ),
    .FULL(full),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .RDCLK(wr_clk),
    .RDEN(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/e ),
    .RDERR
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDERR_UNCONNECTED )
,
    .REGCE(N1),
    .RST(my_rd_rst_i),
    .RSTREG(N1),
    .SBITERR(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/sbiterr_row<1> ),
    .WRCLK(wr_clk),
    .WREN(wr_en),
    .WRERR
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRERR_UNCONNECTED )
,
    .DI({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, din[36], din[35], din[34], 
din[33], din[32], din[31], din[30], din[29], din[28], din[27], din[26], din[25], din[24], din[23], din[22], din[21], din[20], din[19], din[18], 
din[17], din[16], din[15], din[14], din[13], din[12], din[11], din[10], din[9], din[8], din[7], din[6], din[5], din[4], din[3], din[2], din[1], din[0]
}),
    .DIP({N1, N1, N1, N1, N1, N1, N1, N1}),
    .DO({\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><63> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><62> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><61> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><60> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><59> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><58> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><57> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><56> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><55> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><54> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><53> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><52> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><51> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><50> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><49> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><48> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><47> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><46> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><45> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><44> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><43> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><42> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><41> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><40> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><39> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><38> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><37> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><36> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><35> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><34> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><33> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><32> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><31> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><30> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><29> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><28> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><27> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><26> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><25> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><24> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><23> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><22> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><21> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><20> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><19> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><18> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><17> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><16> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><15> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><14> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><13> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><12> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><11> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><10> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><9> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><8> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><7> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><6> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><5> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><4> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><3> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><2> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><1> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><0> }),
    .DOP({\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><71> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><70> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><69> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><68> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><67> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><66> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><65> , 
\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/d<1><64> }),
    .ECCPARITY({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<0>_UNCONNECTED 
}),
    .RDCOUNT({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<12>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<11>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<10>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<9>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<8>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<0>_UNCONNECTED 
}),
    .WRCOUNT({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<12>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<11>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<10>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<9>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<8>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[1].gbldc.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<0>_UNCONNECTED 
})
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/rden_tmp1  (
    .I0(NlwRenamedSig_OI_empty),
    .I1(rd_en),
    .O(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gchain.gp1[2].gbldl.inst_prim/rden_tmp )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/e1  (
    .I0(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/emp<1> ),
    .I1(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/ful<2> ),
    .O(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/e )
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
