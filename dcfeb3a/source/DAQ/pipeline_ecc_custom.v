////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: pipeline_ecc.v
// /___/   /\     Timestamp: Thu Jun 26 15:22:00 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/pipeline_ecc.ngc C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/pipeline_ecc.v 
// Device	: 6vlx130tff1156-1
// Input file	: C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/pipeline_ecc.ngc
// Output file	: C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/ipcore_dir/tmp/_cg/pipeline_ecc.v
// # of Modules	: 2
// Design Name	: pipeline_ecc
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

module reset_builtin (
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
  wire [0 : 0] NlwRenamedSignal_WR_RST_I;
  wire [5 : 5] NlwRenamedSig_OI_n0019;
  assign
    WR_RST_I[1] = NlwRenamedSignal_WR_RST_I[0],
    WR_RST_I[0] = NlwRenamedSignal_WR_RST_I[0],
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
  \WR_RST_I<1>1  (
    .I0(wr_rst_reg_3),
    .I1(power_on_wr_rst[0]),
    .O(NlwRenamedSignal_WR_RST_I[0])
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

module pipeline_ecc (
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
  input [63 : 0] din;
  output [63 : 0] dout;
  
  // synthesis translate_off
  
  wire N1;
  wire NlwRenamedSig_OI_empty;
  wire \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/rden_tmp ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_WR_RST_I<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_RD_RST_I<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_RD_RST_I<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_INT_RST_I<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_INT_RST_I<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTEMPTY_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTFULL_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDERR_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRERR_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<12>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<11>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<10>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<9>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<8>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<0>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<12>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<11>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<10>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<9>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<8>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<7>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<6>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<5>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<4>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<3>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<2>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<1>_UNCONNECTED ;
  wire \NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<0>_UNCONNECTED ;
  wire my_wr_rst_i ;
  assign
    empty = NlwRenamedSig_OI_empty;
  GND   XST_GND (
    .G(N1)
  );
  reset_builtin   \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt  (
    .CLK(N1),
    .WR_CLK(wr_clk),
    .RD_CLK(rd_clk),
    .INT_CLK(N1),
    .RST(rst),
    .WR_RST_I({\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_WR_RST_I<1>_UNCONNECTED , 
my_wr_rst_i}),
    .RD_RST_I({\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_RD_RST_I<1>_UNCONNECTED , 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_RD_RST_I<0>_UNCONNECTED }),
    .INT_RST_I({\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_INT_RST_I<1>_UNCONNECTED , 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/rstbt_INT_RST_I<0>_UNCONNECTED })
  );
  FIFO36E1 #(
    .ALMOST_EMPTY_OFFSET ( 13'h0006 ),
    .ALMOST_FULL_OFFSET ( 13'h0007 ),
    .DATA_WIDTH ( 72 ),
    .DO_REG ( 1 ),
    .EN_ECC_READ ( "TRUE" ),
    .EN_ECC_WRITE ( "TRUE" ),
    .EN_SYN ( "FALSE" ),
    .FIFO_MODE ( "FIFO36_72" ),
    .FIRST_WORD_FALL_THROUGH ( "TRUE" ),
    .INIT ( 72'h000000000000000000 ),
    .SIM_DEVICE ( "VIRTEX6" ),
    .SRVAL ( 72'h000000000000000000 ))
  \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1  (
    .ALMOSTEMPTY
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTEMPTY_UNCONNECTED )
,
    .ALMOSTFULL
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ALMOSTFULL_UNCONNECTED )
,
    .DBITERR(dbiterr),
    .EMPTY(NlwRenamedSig_OI_empty),
    .FULL(full),
    .INJECTDBITERR(injectdbiterr),
    .INJECTSBITERR(injectsbiterr),
    .RDCLK(rd_clk),
    .RDEN(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/rden_tmp ),
    .RDERR
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDERR_UNCONNECTED )
,
    .REGCE(N1),
    .RST(my_wr_rst_i),
    .RSTREG(N1),
    .SBITERR(sbiterr),
    .WRCLK(wr_clk),
    .WREN(wr_en),
    .WRERR
(\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRERR_UNCONNECTED )
,
    .DI({din[63], din[62], din[61], din[60], din[59], din[58], din[57], din[56], din[55], din[54], din[53], din[52], din[51], din[50], din[49], 
din[48], din[47], din[46], din[45], din[44], din[43], din[42], din[41], din[40], din[39], din[38], din[37], din[36], din[35], din[34], din[33], 
din[32], din[31], din[30], din[29], din[28], din[27], din[26], din[25], din[24], din[23], din[22], din[21], din[20], din[19], din[18], din[17], 
din[16], din[15], din[14], din[13], din[12], din[11], din[10], din[9], din[8], din[7], din[6], din[5], din[4], din[3], din[2], din[1], din[0]}),
    .DIP({N1, N1, N1, N1, N1, N1, N1, N1}),
    .DO({dout[63], dout[62], dout[61], dout[60], dout[59], dout[58], dout[57], dout[56], dout[55], dout[54], dout[53], dout[52], dout[51], dout[50], 
dout[49], dout[48], dout[47], dout[46], dout[45], dout[44], dout[43], dout[42], dout[41], dout[40], dout[39], dout[38], dout[37], dout[36], dout[35], 
dout[34], dout[33], dout[32], dout[31], dout[30], dout[29], dout[28], dout[27], dout[26], dout[25], dout[24], dout[23], dout[22], dout[21], dout[20], 
dout[19], dout[18], dout[17], dout[16], dout[15], dout[14], dout[13], dout[12], dout[11], dout[10], dout[9], dout[8], dout[7], dout[6], dout[5], 
dout[4], dout[3], dout[2], dout[1], dout[0]}),
    .DOP({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_DOP<0>_UNCONNECTED 
}),
    .ECCPARITY({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_ECCPARITY<0>_UNCONNECTED 
}),
    .RDCOUNT({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<12>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<11>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<10>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<9>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<8>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_RDCOUNT<0>_UNCONNECTED 
}),
    .WRCOUNT({
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<12>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<11>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<10>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<9>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<8>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<7>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<6>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<5>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<4>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<3>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<2>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<1>_UNCONNECTED 
, 
\NLW_U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/gf36e1_inst.sngfifo36e1_WRCOUNT<0>_UNCONNECTED 
})
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/rden_tmp1  (
    .I0(NlwRenamedSig_OI_empty),
    .I1(rd_en),
    .O(\U0/xst_fifo_generator/gconvfifo.rf/gbiv5.bi/v6_fifo.fblk/gextw[1].gnll_fifo.inst_extd/gonep.inst_prim/rden_tmp )
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
