`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:11 03/30/2011 
// Design Name: 
// Module Name:    fifo16ch_wide 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fifo16ch_wide #(
	parameter USE_CHIPSCOPE = 1,
	parameter TMR = 0,
	parameter TMR_Err_Det = 0
)(
	inout [35:0] LA_CNTRL,
	input CLK40,
	input RDCLK,
	input SMPCLK,
	input WRCLK,
	input RST,
	input RST_RESYNC,
	input FIFO_RST,
	input L1A,
	input L1A_MATCH,
	input [191:0] G1IN,
	input [191:0] G2IN,
	input [191:0] G3IN,
	input [191:0] G4IN,
	input [191:0] G5IN,
	input [191:0] G6IN,
	input [15:0] RD_ENA,
	input L1A_RD_EN,
	input [6:0] SAMP_MAX,  // number of samples per event minus 1
	input TRIG_IN,
	output TRIG_OUT,
	output RDY,
	output [37:0] L1A_SMP_OUT,
	output [6:0] OVRLP_SMP_OUT,
	output [191:0] DOUT_16CH,
	output [23:0] L1A_CNT,
	output [11:0] L1A_MTCH_CNT,
   output [15:0] FIFO_LOAD_ERRCNT,
	output [15:0] fmt
	);
	 
	
	wire wren;
//	wire [15:0] fmt;
	wire [15:0] ffl;
	wire [15:0] ovrflw;
	wire [11:0] fout[15:0];
	wire evt_start;
	wire evt_end;
	wire phase_align0;
	wire phase_align1;
	wire stretch_l1a;
	wire injectsbiterr;
	wire injectdbiterr;
	wire sbiterr[15:0];
	wire dbiterr[15:0];
	wire l1a_wren;
	wire l1a_smp_sbiterr;
	wire l1a_smp_dbiterr;
	wire l1a_smp_fl;
	wire l1a_smp_mt;
	wire ovrlap;
	wire multi_ovlp;
	wire new_l1a;
	wire oinc;
	wire odec;
	
	wire evt_end_smp_out;
	wire ovrlap_smp_out;
	wire multi_ovlp_smp_out;
	wire [3:0] ovrlap_cnt_smp_out;
	wire [23:0] l1acnt_smp_out;
	wire [11:0] l1amcnt_smp_out;
	wire l1a_match_smp_out;
	wire l1a_phase_smp_out;
	wire [2:0] sel;

	wire [3:0] ovrlap_cnt_i;
	wire [23:0] l1acnt_r1_i;
	wire [11:0] l1amcnt_r1_i;
	wire l1a_match_d1_i;
	wire l1a_match_d2_i;
	wire l1a_phase_i;
	wire l1a_phase_r1_i;

	reg [11:0] muxout[15:0];

	assign L1A_SMP_OUT     = {l1a_phase_smp_out,l1a_match_smp_out,l1amcnt_smp_out,l1acnt_smp_out};  // L1A FIFO output 
	assign DOUT_16CH = {fout[15],fout[14],fout[13],fout[12],fout[11],fout[10],fout[9],fout[8],fout[7],fout[6],fout[5],fout[4],fout[3],fout[2],fout[1],fout[0]}; // Data FIFO output
	assign RDY = ~l1a_smp_mt;
	assign injectsbiterr = 1'b0;
	assign injectdbiterr = 1'b0;
	
	
generate
if(USE_CHIPSCOPE==1) 
begin : chipscope_rng_fifo1
//
// Logic analyzer for readout FIFO
wire [74:0] rng_fifo1_la_data;
wire [3:0] rng_fifo1_la_trig;

fifo1_la fifo1_la_i (
    .CONTROL(LA_CNTRL),
    .CLK(WRCLK),
    .DATA(rng_fifo1_la_data),  // IN BUS [74:0]
    .TRIG0(rng_fifo1_la_trig),  // IN BUS [3:0]
    .TRIG_OUT(TRIG_OUT) // OUT
);
		

// LA Data [74:0]
	assign rng_fifo1_la_data[3:0]    = L1A_CNT[3:0];
	assign rng_fifo1_la_data[7:4]    = l1acnt_r1_i[3:0];
	assign rng_fifo1_la_data[11:8]   = L1A_MTCH_CNT[3:0];
	assign rng_fifo1_la_data[15:12]  = l1amcnt_r1_i[3:0];
	assign rng_fifo1_la_data[19:16]  = ovrlap_cnt_i[3:0];
//	assign rng_fifo1_la_data[31:20]  = event_pipe_i[11:0];
	assign rng_fifo1_la_data[31:20]  = 12'h000;
	assign rng_fifo1_la_data[43:32]  = muxout[0];
	assign rng_fifo1_la_data[46:44]  = sel[2:0];
//	assign rng_fifo1_la_data[53:47]  = sample[6:0];
	assign rng_fifo1_la_data[53:47]  = 7'h00;
	assign rng_fifo1_la_data[54]     = L1A;
	assign rng_fifo1_la_data[55]     = L1A_MATCH;
	assign rng_fifo1_la_data[56]     = l1a_match_d1_i;
	assign rng_fifo1_la_data[57]     = l1a_match_d2_i;
	assign rng_fifo1_la_data[58]     = phase_align0;
	assign rng_fifo1_la_data[59]     = phase_align1;
	assign rng_fifo1_la_data[60]     = l1a_phase_i;
	assign rng_fifo1_la_data[61]     = l1a_phase_r1_i;
	assign rng_fifo1_la_data[62]     = stretch_l1a;
	assign rng_fifo1_la_data[63]     = evt_start;
	assign rng_fifo1_la_data[64]     = evt_end;
	assign rng_fifo1_la_data[65]     = wren;
	assign rng_fifo1_la_data[66]     = l1a_wren;
	assign rng_fifo1_la_data[67]     = ovrlap;
	assign rng_fifo1_la_data[68]     = multi_ovlp;
	assign rng_fifo1_la_data[69]     = oinc;
	assign rng_fifo1_la_data[70]     = 1'b0;
	assign rng_fifo1_la_data[71]     = l1a_smp_mt;
	assign rng_fifo1_la_data[72]     = L1A_RD_EN;
	assign rng_fifo1_la_data[73]     = RD_ENA[0];
	assign rng_fifo1_la_data[74]     = new_l1a;

// LA Trigger [3:0]
	assign rng_fifo1_la_trig[0]      = L1A;
	assign rng_fifo1_la_trig[1]      = L1A_MATCH;
	assign rng_fifo1_la_trig[2]      = evt_start;
	assign rng_fifo1_la_trig[3]      = TRIG_IN;
	
end
else
begin
	assign TRIG_OUT = 0;
end
endgenerate
	 
	always @* begin
		case (sel)
			3'h0: {muxout[15],muxout[14],muxout[13],muxout[12],muxout[11],muxout[10],muxout[9],muxout[8],muxout[7],muxout[6],muxout[5],muxout[4],muxout[3],muxout[2],muxout[1],muxout[0]} = G1IN;
			3'h1: {muxout[15],muxout[14],muxout[13],muxout[12],muxout[11],muxout[10],muxout[9],muxout[8],muxout[7],muxout[6],muxout[5],muxout[4],muxout[3],muxout[2],muxout[1],muxout[0]} = G2IN;
			3'h2: {muxout[15],muxout[14],muxout[13],muxout[12],muxout[11],muxout[10],muxout[9],muxout[8],muxout[7],muxout[6],muxout[5],muxout[4],muxout[3],muxout[2],muxout[1],muxout[0]} = G3IN;
			3'h3: {muxout[15],muxout[14],muxout[13],muxout[12],muxout[11],muxout[10],muxout[9],muxout[8],muxout[7],muxout[6],muxout[5],muxout[4],muxout[3],muxout[2],muxout[1],muxout[0]} = G4IN;
			3'h4: {muxout[15],muxout[14],muxout[13],muxout[12],muxout[11],muxout[10],muxout[9],muxout[8],muxout[7],muxout[6],muxout[5],muxout[4],muxout[3],muxout[2],muxout[1],muxout[0]} = G5IN;
			3'h5: {muxout[15],muxout[14],muxout[13],muxout[12],muxout[11],muxout[10],muxout[9],muxout[8],muxout[7],muxout[6],muxout[5],muxout[4],muxout[3],muxout[2],muxout[1],muxout[0]} = G6IN;
			default: {muxout[15],muxout[14],muxout[13],muxout[12],muxout[11],muxout[10],muxout[9],muxout[8],muxout[7],muxout[6],muxout[5],muxout[4],muxout[3],muxout[2],muxout[1],muxout[0]} = 0;
		endcase
	end
	
generate
if(TMR==1) 
begin : FIFO16ch_logic_TMR
	 
	(* syn_preserve = "true" *) reg [3:0] ovrlap_cnt_1;
	(* syn_preserve = "true" *) reg [3:0] ovrlap_cnt_2;
	(* syn_preserve = "true" *) reg [3:0] ovrlap_cnt_3;
	(* syn_preserve = "true" *) reg [127:0] event_pipe_1;
	(* syn_preserve = "true" *) reg [127:0] event_pipe_2;
	(* syn_preserve = "true" *) reg [127:0] event_pipe_3;
	(* syn_preserve = "true" *) reg [6:0] ovrlp_smp_out_r_1;
	(* syn_preserve = "true" *) reg [6:0] ovrlp_smp_out_r_2;
	(* syn_preserve = "true" *) reg [6:0] ovrlp_smp_out_r_3;
	(* syn_preserve = "true" *) reg [23:0] l1acnt_1;
	(* syn_preserve = "true" *) reg [23:0] l1acnt_2;
	(* syn_preserve = "true" *) reg [23:0] l1acnt_3;
	(* syn_preserve = "true" *) reg [23:0] l1acnt_r1_1;
	(* syn_preserve = "true" *) reg [23:0] l1acnt_r1_2;
	(* syn_preserve = "true" *) reg [23:0] l1acnt_r1_3;
	(* syn_preserve = "true" *) reg [11:0] l1amcnt_1;
	(* syn_preserve = "true" *) reg [11:0] l1amcnt_2;
	(* syn_preserve = "true" *) reg [11:0] l1amcnt_3;
	(* syn_preserve = "true" *) reg [11:0] l1amcnt_r1_1;
	(* syn_preserve = "true" *) reg [11:0] l1amcnt_r1_2;
	(* syn_preserve = "true" *) reg [11:0] l1amcnt_r1_3;
	(* syn_preserve = "true" *) reg new_l1a_d1_1;
	(* syn_preserve = "true" *) reg new_l1a_d1_2;
	(* syn_preserve = "true" *) reg new_l1a_d1_3;
	(* syn_preserve = "true" *) reg l1a_match_d1_1;
	(* syn_preserve = "true" *) reg l1a_match_d1_2;
	(* syn_preserve = "true" *) reg l1a_match_d1_3;
	(* syn_preserve = "true" *) reg l1a_match_d2_1;
	(* syn_preserve = "true" *) reg l1a_match_d2_2;
	(* syn_preserve = "true" *) reg l1a_match_d2_3;
	(* syn_preserve = "true" *) reg l1a_phase_1;
	(* syn_preserve = "true" *) reg l1a_phase_2;
	(* syn_preserve = "true" *) reg l1a_phase_3;
	(* syn_preserve = "true" *) reg l1a_phase_r1_1;
	(* syn_preserve = "true" *) reg l1a_phase_r1_2;
	(* syn_preserve = "true" *) reg l1a_phase_r1_3;
	(* syn_preserve = "true" *) reg smpclk_dp5_1;
	(* syn_preserve = "true" *) reg smpclk_dp5_2;
	(* syn_preserve = "true" *) reg smpclk_dp5_3;
	(* syn_preserve = "true" *) reg smpclk_d1_1;
	(* syn_preserve = "true" *) reg smpclk_d1_2;
	(* syn_preserve = "true" *) reg smpclk_d1_3;
	(* syn_preserve = "true" *) reg smpclk_d2_1;
	(* syn_preserve = "true" *) reg smpclk_d2_2;
	(* syn_preserve = "true" *) reg smpclk_d2_3;
	(* syn_preserve = "true" *) reg smpclk_d3_1;
	(* syn_preserve = "true" *) reg smpclk_d3_2;
	(* syn_preserve = "true" *) reg smpclk_d3_3;

	(* syn_keep = "true" *) wire [3:0] vt_ovrlap_cnt_1;
	(* syn_keep = "true" *) wire [3:0] vt_ovrlap_cnt_2;
	(* syn_keep = "true" *) wire [3:0] vt_ovrlap_cnt_3;
	(* syn_keep = "true" *) wire [6:0] vt_ovrlp_smp_out_r_1;
	(* syn_keep = "true" *) wire [6:0] vt_ovrlp_smp_out_r_2;
	(* syn_keep = "true" *) wire [6:0] vt_ovrlp_smp_out_r_3;
	(* syn_keep = "true" *) wire [23:0] vt_l1acnt_1;
	(* syn_keep = "true" *) wire [23:0] vt_l1acnt_2;
	(* syn_keep = "true" *) wire [23:0] vt_l1acnt_3;
	(* syn_keep = "true" *) wire [23:0] vt_l1acnt_r1_1;
	(* syn_keep = "true" *) wire [11:0] vt_l1amcnt_1;
	(* syn_keep = "true" *) wire [11:0] vt_l1amcnt_2;
	(* syn_keep = "true" *) wire [11:0] vt_l1amcnt_3;
	(* syn_keep = "true" *) wire [11:0] vt_l1amcnt_r1_1;
	(* syn_keep = "true" *) wire vt_new_l1a_d1_1;
	(* syn_keep = "true" *) wire vt_new_l1a_d1_2;
	(* syn_keep = "true" *) wire vt_new_l1a_d1_3;
	(* syn_keep = "true" *) wire vt_l1a_match_d1_1;
	(* syn_keep = "true" *) wire vt_l1a_match_d1_2;
	(* syn_keep = "true" *) wire vt_l1a_match_d1_3;
	(* syn_keep = "true" *) wire vt_l1a_match_d2_1;
	(* syn_keep = "true" *) wire vt_l1a_phase_1;
	(* syn_keep = "true" *) wire vt_l1a_phase_2;
	(* syn_keep = "true" *) wire vt_l1a_phase_3;
	(* syn_keep = "true" *) wire vt_l1a_phase_r1_1;
	(* syn_keep = "true" *) wire vt_l1a_phase_r1_2;
	(* syn_keep = "true" *) wire vt_l1a_phase_r1_3;
	(* syn_keep = "true" *) wire vt_smpclk_dp5_1;
	(* syn_keep = "true" *) wire vt_smpclk_dp5_2;
	(* syn_keep = "true" *) wire vt_smpclk_dp5_3;
	(* syn_keep = "true" *) wire vt_smpclk_d1_1;
	(* syn_keep = "true" *) wire vt_smpclk_d1_2;
	(* syn_keep = "true" *) wire vt_smpclk_d1_3;
	(* syn_keep = "true" *) wire vt_smpclk_d2_1;
	(* syn_keep = "true" *) wire vt_smpclk_d2_2;
	(* syn_keep = "true" *) wire vt_smpclk_d2_3;
	(* syn_keep = "true" *) wire vt_smpclk_d3_1;
	(* syn_keep = "true" *) wire vt_smpclk_d3_2;
	(* syn_keep = "true" *) wire vt_smpclk_d3_3;

	(* syn_keep = "true" *) wire stretch_l1a_1;
	(* syn_keep = "true" *) wire stretch_l1a_2;
	(* syn_keep = "true" *) wire stretch_l1a_3;
	(* syn_keep = "true" *) wire phase_align0_1;
	(* syn_keep = "true" *) wire phase_align0_2;
	(* syn_keep = "true" *) wire phase_align0_3;
	(* syn_keep = "true" *) wire phase_align1_1;
	(* syn_keep = "true" *) wire phase_align1_2;
	(* syn_keep = "true" *) wire phase_align1_3;
	(* syn_keep = "true" *) wire evt_start_1;
	(* syn_keep = "true" *) wire evt_start_2;
	(* syn_keep = "true" *) wire evt_start_3;
	(* syn_keep = "true" *) wire evt_end_1;
	(* syn_keep = "true" *) wire evt_end_2;
	(* syn_keep = "true" *) wire evt_end_3;
	(* syn_keep = "true" *) wire new_l1a_1;
	(* syn_keep = "true" *) wire new_l1a_2;
	(* syn_keep = "true" *) wire new_l1a_3;
	(* syn_keep = "true" *) wire l1a_wren_1;
	(* syn_keep = "true" *) wire l1a_wren_2;
	(* syn_keep = "true" *) wire l1a_wren_3;
	(* syn_keep = "true" *) wire oinc_1;
	(* syn_keep = "true" *) wire oinc_2;
	(* syn_keep = "true" *) wire oinc_3;
	(* syn_keep = "true" *) wire odec_1;
	(* syn_keep = "true" *) wire odec_2;
	(* syn_keep = "true" *) wire odec_3;
	(* syn_keep = "true" *) wire ovrlap_1;
	(* syn_keep = "true" *) wire ovrlap_2;
	(* syn_keep = "true" *) wire ovrlap_3;
	(* syn_keep = "true" *) wire multi_ovlp_1;
	(* syn_keep = "true" *) wire multi_ovlp_2;
	(* syn_keep = "true" *) wire multi_ovlp_3;

	assign vt_ovrlap_cnt_1 = (ovrlap_cnt_1 & ovrlap_cnt_2) | (ovrlap_cnt_2 & ovrlap_cnt_3) | (ovrlap_cnt_1 & ovrlap_cnt_3); // Majority logic
	assign vt_ovrlap_cnt_2 = (ovrlap_cnt_1 & ovrlap_cnt_2) | (ovrlap_cnt_2 & ovrlap_cnt_3) | (ovrlap_cnt_1 & ovrlap_cnt_3); // Majority logic
	assign vt_ovrlap_cnt_3 = (ovrlap_cnt_1 & ovrlap_cnt_2) | (ovrlap_cnt_2 & ovrlap_cnt_3) | (ovrlap_cnt_1 & ovrlap_cnt_3); // Majority logic
	assign vt_event_pipe_1 = (event_pipe_1 & event_pipe_2) | (event_pipe_2 & event_pipe_3) | (event_pipe_1 & event_pipe_3); // Majority logic
	assign vt_event_pipe_2 = (event_pipe_1 & event_pipe_2) | (event_pipe_2 & event_pipe_3) | (event_pipe_1 & event_pipe_3); // Majority logic
	assign vt_event_pipe_3 = (event_pipe_1 & event_pipe_2) | (event_pipe_2 & event_pipe_3) | (event_pipe_1 & event_pipe_3); // Majority logic
	assign vt_ovrlp_smp_out_r_1 = (ovrlp_smp_out_r_1 & ovrlp_smp_out_r_2) | (ovrlp_smp_out_r_2 & ovrlp_smp_out_r_3) | (ovrlp_smp_out_r_1 & ovrlp_smp_out_r_3); // Majority logic
	assign vt_ovrlp_smp_out_r_2 = (ovrlp_smp_out_r_1 & ovrlp_smp_out_r_2) | (ovrlp_smp_out_r_2 & ovrlp_smp_out_r_3) | (ovrlp_smp_out_r_1 & ovrlp_smp_out_r_3); // Majority logic
	assign vt_ovrlp_smp_out_r_3 = (ovrlp_smp_out_r_1 & ovrlp_smp_out_r_2) | (ovrlp_smp_out_r_2 & ovrlp_smp_out_r_3) | (ovrlp_smp_out_r_1 & ovrlp_smp_out_r_3); // Majority logic
	assign vt_l1acnt_1       = (l1acnt_1     & l1acnt_2    ) | (l1acnt_2     & l1acnt_3    ) | (l1acnt_1     & l1acnt_3    ); // Majority logic
	assign vt_l1acnt_2       = (l1acnt_1     & l1acnt_2    ) | (l1acnt_2     & l1acnt_3    ) | (l1acnt_1     & l1acnt_3    ); // Majority logic
	assign vt_l1acnt_3       = (l1acnt_1     & l1acnt_2    ) | (l1acnt_2     & l1acnt_3    ) | (l1acnt_1     & l1acnt_3    ); // Majority logic
	assign vt_l1acnt_r1_1    = (l1acnt_r1_1  & l1acnt_r1_2 ) | (l1acnt_r1_2  & l1acnt_r1_3 ) | (l1acnt_r1_1  & l1acnt_r1_3 ); // Majority logic
	assign vt_l1amcnt_1      = (l1amcnt_1    & l1amcnt_2   ) | (l1amcnt_2    & l1amcnt_3   ) | (l1amcnt_1    & l1amcnt_3   ); // Majority logic
	assign vt_l1amcnt_2      = (l1amcnt_1    & l1amcnt_2   ) | (l1amcnt_2    & l1amcnt_3   ) | (l1amcnt_1    & l1amcnt_3   ); // Majority logic
	assign vt_l1amcnt_3      = (l1amcnt_1    & l1amcnt_2   ) | (l1amcnt_2    & l1amcnt_3   ) | (l1amcnt_1    & l1amcnt_3   ); // Majority logic
	assign vt_l1amcnt_r1_1   = (l1amcnt_r1_1 & l1amcnt_r1_2) | (l1amcnt_r1_2 & l1amcnt_r1_3) | (l1amcnt_r1_1 & l1amcnt_r1_3); // Majority logic
	assign vt_new_l1a_d1_1   = (new_l1a_d1_1 & new_l1a_d1_2) | (new_l1a_d1_2 & new_l1a_d1_3) | (new_l1a_d1_1 & new_l1a_d1_3); // Majority logic
	assign vt_new_l1a_d1_2   = (new_l1a_d1_1 & new_l1a_d1_2) | (new_l1a_d1_2 & new_l1a_d1_3) | (new_l1a_d1_1 & new_l1a_d1_3); // Majority logic
	assign vt_new_l1a_d1_3   = (new_l1a_d1_1 & new_l1a_d1_2) | (new_l1a_d1_2 & new_l1a_d1_3) | (new_l1a_d1_1 & new_l1a_d1_3); // Majority logic
	assign vt_l1a_match_d1_1 = (l1a_match_d1_1 & l1a_match_d1_2) | (l1a_match_d1_2 & l1a_match_d1_3) | (l1a_match_d1_1 & l1a_match_d1_3); // Majority logic
	assign vt_l1a_match_d1_2 = (l1a_match_d1_1 & l1a_match_d1_2) | (l1a_match_d1_2 & l1a_match_d1_3) | (l1a_match_d1_1 & l1a_match_d1_3); // Majority logic
	assign vt_l1a_match_d1_3 = (l1a_match_d1_1 & l1a_match_d1_2) | (l1a_match_d1_2 & l1a_match_d1_3) | (l1a_match_d1_1 & l1a_match_d1_3); // Majority logic
	assign vt_l1a_match_d2_1 = (l1a_match_d2_1 & l1a_match_d2_2) | (l1a_match_d2_2 & l1a_match_d2_3) | (l1a_match_d2_1 & l1a_match_d2_3); // Majority logic
	assign vt_l1a_phase_1    = (l1a_phase_1    & l1a_phase_2   ) | (l1a_phase_2    & l1a_phase_3   ) | (l1a_phase_1    & l1a_phase_3   ); // Majority logic
	assign vt_l1a_phase_2    = (l1a_phase_1    & l1a_phase_2   ) | (l1a_phase_2    & l1a_phase_3   ) | (l1a_phase_1    & l1a_phase_3   ); // Majority logic
	assign vt_l1a_phase_3    = (l1a_phase_1    & l1a_phase_2   ) | (l1a_phase_2    & l1a_phase_3   ) | (l1a_phase_1    & l1a_phase_3   ); // Majority logic
	assign vt_l1a_phase_r1_1 = (l1a_phase_r1_1 & l1a_phase_r1_2) | (l1a_phase_r1_2 & l1a_phase_r1_3) | (l1a_phase_r1_1 & l1a_phase_r1_3); // Majority logic
	assign vt_l1a_phase_r1_2 = (l1a_phase_r1_1 & l1a_phase_r1_2) | (l1a_phase_r1_2 & l1a_phase_r1_3) | (l1a_phase_r1_1 & l1a_phase_r1_3); // Majority logic
	assign vt_l1a_phase_r1_3 = (l1a_phase_r1_1 & l1a_phase_r1_2) | (l1a_phase_r1_2 & l1a_phase_r1_3) | (l1a_phase_r1_1 & l1a_phase_r1_3); // Majority logic
	assign vt_smpclk_dp5_1   = (smpclk_dp5_1 & smpclk_dp5_2) | (smpclk_dp5_2 & smpclk_dp5_3) | (smpclk_dp5_1 & smpclk_dp5_3); // Majority logic
	assign vt_smpclk_dp5_2   = (smpclk_dp5_1 & smpclk_dp5_2) | (smpclk_dp5_2 & smpclk_dp5_3) | (smpclk_dp5_1 & smpclk_dp5_3); // Majority logic
	assign vt_smpclk_dp5_3   = (smpclk_dp5_1 & smpclk_dp5_2) | (smpclk_dp5_2 & smpclk_dp5_3) | (smpclk_dp5_1 & smpclk_dp5_3); // Majority logic
	assign vt_smpclk_d1_1    = (smpclk_d1_1  & smpclk_d1_2 ) | (smpclk_d1_2  & smpclk_d1_3 ) | (smpclk_d1_1  & smpclk_d1_3 ); // Majority logic
	assign vt_smpclk_d1_2    = (smpclk_d1_1  & smpclk_d1_2 ) | (smpclk_d1_2  & smpclk_d1_3 ) | (smpclk_d1_1  & smpclk_d1_3 ); // Majority logic
	assign vt_smpclk_d1_3    = (smpclk_d1_1  & smpclk_d1_2 ) | (smpclk_d1_2  & smpclk_d1_3 ) | (smpclk_d1_1  & smpclk_d1_3 ); // Majority logic
	assign vt_smpclk_d2_1    = (smpclk_d2_1  & smpclk_d2_2 ) | (smpclk_d2_2  & smpclk_d2_3 ) | (smpclk_d2_1  & smpclk_d2_3 ); // Majority logic
	assign vt_smpclk_d2_2    = (smpclk_d2_1  & smpclk_d2_2 ) | (smpclk_d2_2  & smpclk_d2_3 ) | (smpclk_d2_1  & smpclk_d2_3 ); // Majority logic
	assign vt_smpclk_d2_3    = (smpclk_d2_1  & smpclk_d2_2 ) | (smpclk_d2_2  & smpclk_d2_3 ) | (smpclk_d2_1  & smpclk_d2_3 ); // Majority logic
	assign vt_smpclk_d3_1    = (smpclk_d3_1  & smpclk_d3_2 ) | (smpclk_d3_2  & smpclk_d3_3 ) | (smpclk_d3_1  & smpclk_d3_3 ); // Majority logic
	assign vt_smpclk_d3_2    = (smpclk_d3_1  & smpclk_d3_2 ) | (smpclk_d3_2  & smpclk_d3_3 ) | (smpclk_d3_1  & smpclk_d3_3 ); // Majority logic
	assign vt_smpclk_d3_3    = (smpclk_d3_1  & smpclk_d3_2 ) | (smpclk_d3_2  & smpclk_d3_3 ) | (smpclk_d3_1  & smpclk_d3_3 ); // Majority logic

	assign stretch_l1a_1  = L1A_MATCH | vt_l1a_match_d1_1;
	assign stretch_l1a_2  = L1A_MATCH | vt_l1a_match_d1_2;
	assign stretch_l1a_3  = L1A_MATCH | vt_l1a_match_d1_3;
	assign phase_align0_1 = ~vt_smpclk_d3_1 & vt_smpclk_d2_1;
	assign phase_align0_2 = ~vt_smpclk_d3_2 & vt_smpclk_d2_2;
	assign phase_align0_3 = ~vt_smpclk_d3_3 & vt_smpclk_d2_3;
	assign phase_align1_1 = vt_smpclk_d3_1 & ~vt_smpclk_d2_1;
	assign phase_align1_2 = vt_smpclk_d3_2 & ~vt_smpclk_d2_2;
	assign phase_align1_3 = vt_smpclk_d3_3 & ~vt_smpclk_d2_3;
	assign evt_start_1 = stretch_l1a_1 & phase_align1_1;
	assign evt_start_2 = stretch_l1a_2 & phase_align1_2;
	assign evt_start_3 = stretch_l1a_3 & phase_align1_3;
	assign evt_end_1 = event_pipe_1[SAMP_MAX];
	assign evt_end_2 = event_pipe_2[SAMP_MAX];
	assign evt_end_3 = event_pipe_3[SAMP_MAX];
	assign new_l1a_1 = (L1A_MATCH & wren);
	assign new_l1a_2 = (L1A_MATCH & wren);
	assign new_l1a_3 = (L1A_MATCH & wren);
	assign l1a_wren_1 = wren & (phase_align0_1 | phase_align1_1);
	assign l1a_wren_2 = wren & (phase_align0_2 | phase_align1_2);
	assign l1a_wren_3 = wren & (phase_align0_3 | phase_align1_3);
	assign oinc_1 = (new_l1a_1 | vt_new_l1a_d1_1 | (L1A_MATCH & vt_l1a_match_d1_1));
	assign oinc_2 = (new_l1a_2 | vt_new_l1a_d1_2 | (L1A_MATCH & vt_l1a_match_d1_2));
	assign oinc_3 = (new_l1a_3 | vt_new_l1a_d1_3 | (L1A_MATCH & vt_l1a_match_d1_3));
	assign odec_1 = evt_end_1 & (ovrlap_1 | oinc_1);
	assign odec_2 = evt_end_2 & (ovrlap_2 | oinc_2);
	assign odec_3 = evt_end_3 & (ovrlap_3 | oinc_3);
	assign ovrlap_1 = (vt_ovrlap_cnt_1 > 4'h0);
	assign ovrlap_2 = (vt_ovrlap_cnt_2 > 4'h0);
	assign ovrlap_3 = (vt_ovrlap_cnt_3 > 4'h0);
	assign multi_ovlp_1 = (vt_ovrlap_cnt_1 > 4'h1);
	assign multi_ovlp_2 = (vt_ovrlap_cnt_2 > 4'h1);
	assign multi_ovlp_3 = (vt_ovrlap_cnt_3 > 4'h1);

	assign stretch_l1a   = (stretch_l1a_1  & stretch_l1a_2 ) | (stretch_l1a_2  & stretch_l1a_3 ) | (stretch_l1a_1  & stretch_l1a_3 ); // Majority logic
	assign phase_align0  = (phase_align0_1 & phase_align0_2) | (phase_align0_2 & phase_align0_3) | (phase_align0_1 & phase_align0_3); // Majority logic
	assign phase_align1  = (phase_align1_1 & phase_align1_2) | (phase_align1_2 & phase_align1_3) | (phase_align1_1 & phase_align1_3); // Majority logic
	assign evt_start     = (evt_start_1    & evt_start_2   ) | (evt_start_2    & evt_start_3   ) | (evt_start_1    & evt_start_3   ); // Majority logic
	assign evt_end       = (evt_end_1      & evt_end_2     ) | (evt_end_2      & evt_end_3     ) | (evt_end_1      & evt_end_3     ); // Majority logic
	assign new_l1a       = (new_l1a_1      & new_l1a_2     ) | (new_l1a_2      & new_l1a_3     ) | (new_l1a_1      & new_l1a_3     ); // Majority logic
	assign l1a_wren      = (l1a_wren_1     & l1a_wren_2    ) | (l1a_wren_2     & l1a_wren_3    ) | (l1a_wren_1     & l1a_wren_3    ); // Majority logic
	assign oinc          = (oinc_1         & oinc_2        ) | (oinc_2         & oinc_3        ) | (oinc_1         & oinc_3        ); // Majority logic
	assign odec          = (odec_1         & odec_2        ) | (odec_2         & odec_3        ) | (odec_1         & odec_3        ); // Majority logic
	assign ovrlap        = (ovrlap_1       & ovrlap_2      ) | (ovrlap_2       & ovrlap_3      ) | (ovrlap_1       & ovrlap_3      ); // Majority logic
	assign multi_ovlp    = (multi_ovlp_1   & multi_ovlp_2  ) | (multi_ovlp_2   & multi_ovlp_3  ) | (multi_ovlp_1   & multi_ovlp_3  ); // Majority logic
	
	assign OVRLP_SMP_OUT   = vt_ovrlp_smp_out_r_1;
	assign L1A_CNT         = vt_l1acnt_1;
	assign L1A_MTCH_CNT    = vt_l1amcnt_1;
	assign ovrlap_cnt_i    = vt_ovrlap_cnt_1;
	assign l1acnt_r1_i     = vt_l1acnt_r1_1;
	assign l1amcnt_r1_i    = vt_l1amcnt_r1_1;
	assign l1a_match_d1_i  = vt_l1a_match_d1_1;
	assign l1a_match_d2_i  = vt_l1a_match_d2_1;
	assign l1a_phase_i     = vt_l1a_phase_1;
	assign l1a_phase_r1_i  = vt_l1a_phase_r1_1;

	always @(posedge CLK40) begin
		if(RST_RESYNC) begin
			l1acnt_1  <= 24'h000000;
			l1acnt_2  <= 24'h000000;
			l1acnt_3  <= 24'h000000;
			l1amcnt_1 <= 12'h000;
			l1amcnt_2 <= 12'h000;
			l1amcnt_3 <= 12'h000;
		end
		else begin
			l1acnt_1  <= L1A       ? vt_l1acnt_1 + 1  : vt_l1acnt_1;
			l1acnt_2  <= L1A       ? vt_l1acnt_2 + 1  : vt_l1acnt_2;
			l1acnt_3  <= L1A       ? vt_l1acnt_3 + 1  : vt_l1acnt_3;
			l1amcnt_1 <= L1A_MATCH ? vt_l1amcnt_1 + 1 : vt_l1amcnt_1;
			l1amcnt_2 <= L1A_MATCH ? vt_l1amcnt_2 + 1 : vt_l1amcnt_2;
			l1amcnt_3 <= L1A_MATCH ? vt_l1amcnt_3 + 1 : vt_l1amcnt_3;
		end
		l1a_phase_1 <= L1A_MATCH ? SMPCLK : vt_l1a_phase_1;
		l1a_phase_2 <= L1A_MATCH ? SMPCLK : vt_l1a_phase_2;
		l1a_phase_3 <= L1A_MATCH ? SMPCLK : vt_l1a_phase_3;
		l1a_match_d1_1 <= L1A_MATCH;
		l1a_match_d1_2 <= L1A_MATCH;
		l1a_match_d1_3 <= L1A_MATCH;
		l1a_match_d2_1 <= vt_l1a_match_d1_1;
		l1a_match_d2_2 <= vt_l1a_match_d1_2;
		l1a_match_d2_3 <= vt_l1a_match_d1_3;
		l1acnt_r1_1    <= vt_l1acnt_1;
		l1acnt_r1_2    <= vt_l1acnt_2;
		l1acnt_r1_3    <= vt_l1acnt_3;
		l1amcnt_r1_1   <= vt_l1amcnt_1;
		l1amcnt_r1_2   <= vt_l1amcnt_2;
		l1amcnt_r1_3   <= vt_l1amcnt_3;
		l1a_phase_r1_1 <= vt_l1a_phase_1;
		l1a_phase_r1_2 <= vt_l1a_phase_2;
		l1a_phase_r1_3 <= vt_l1a_phase_3;
		new_l1a_d1_1   <= new_l1a_1;
		new_l1a_d1_2   <= new_l1a_2;
		new_l1a_d1_3   <= new_l1a_3;
	end
	
	always @(posedge WRCLK) begin
		if(~wren) begin
			ovrlap_cnt_1 <= 4'h0;
			ovrlap_cnt_2 <= 4'h0;
			ovrlap_cnt_3 <= 4'h0;
		end
		else begin
		   if(phase_align1_1)
				case({oinc_1,odec_1})
					2'b10: ovrlap_cnt_1 <= vt_ovrlap_cnt_1 + 1;
					2'b01: ovrlap_cnt_1 <= vt_ovrlap_cnt_1 - 1;
					default: ovrlap_cnt_1 <= vt_ovrlap_cnt_1;
				endcase
			else
				ovrlap_cnt_1 <= vt_ovrlap_cnt_1;
		   if(phase_align1_2)
				case({oinc_2,odec_2})
					2'b10: ovrlap_cnt_2 <= vt_ovrlap_cnt_2 + 1;
					2'b01: ovrlap_cnt_2 <= vt_ovrlap_cnt_2 - 1;
					default: ovrlap_cnt_2 <= vt_ovrlap_cnt_2;
				endcase
			else
				ovrlap_cnt_2 <= vt_ovrlap_cnt_2;
		   if(phase_align1_3)
				case({oinc_3,odec_3})
					2'b10: ovrlap_cnt_3 <= vt_ovrlap_cnt_3 + 1;
					2'b01: ovrlap_cnt_3 <= vt_ovrlap_cnt_3 - 1;
					default: ovrlap_cnt_3 <= vt_ovrlap_cnt_3;
				endcase
			else
				ovrlap_cnt_3 <= vt_ovrlap_cnt_3;
		end
	end
		
	always @(negedge WRCLK) begin
	   if(SMPCLK) begin
		   smpclk_dp5_1 <= 1'b1;
		   smpclk_dp5_2 <= 1'b1;
		   smpclk_dp5_3 <= 1'b1;
		end
		else begin
		   smpclk_dp5_1 <= 1'b0;
		   smpclk_dp5_2 <= 1'b0;
		   smpclk_dp5_3 <= 1'b0;
		end
	end
	always @(posedge WRCLK) begin
		event_pipe_1 <= phase_align1_1 ? {event_pipe_1[126:0],evt_start_1} : event_pipe_1;   // output tap selected by SAMP_MAX
		event_pipe_2 <= phase_align1_2 ? {event_pipe_2[126:0],evt_start_2} : event_pipe_2;   // output tap selected by SAMP_MAX
		event_pipe_3 <= phase_align1_3 ? {event_pipe_3[126:0],evt_start_3} : event_pipe_3;   // output tap selected by SAMP_MAX
		smpclk_d1_1 <= vt_smpclk_dp5_1;
		smpclk_d1_2 <= vt_smpclk_dp5_2;
		smpclk_d1_3 <= vt_smpclk_dp5_3;
		smpclk_d2_1 <= vt_smpclk_d1_1;
		smpclk_d2_2 <= vt_smpclk_d1_2;
		smpclk_d2_3 <= vt_smpclk_d1_3;
		smpclk_d3_1 <= vt_smpclk_d2_1;
		smpclk_d3_2 <= vt_smpclk_d2_2;
		smpclk_d3_3 <= vt_smpclk_d2_3;
	end
	always @(posedge RDCLK) begin
		ovrlp_smp_out_r_1 <= L1A_RD_EN ? {evt_end_smp_out,multi_ovlp_smp_out,ovrlap_smp_out,ovrlap_cnt_smp_out} : vt_ovrlp_smp_out_r_1;
		ovrlp_smp_out_r_2 <= L1A_RD_EN ? {evt_end_smp_out,multi_ovlp_smp_out,ovrlap_smp_out,ovrlap_cnt_smp_out} : vt_ovrlp_smp_out_r_2;
		ovrlp_smp_out_r_3 <= L1A_RD_EN ? {evt_end_smp_out,multi_ovlp_smp_out,ovrlap_smp_out,ovrlap_cnt_smp_out} : vt_ovrlp_smp_out_r_3;
	end
	
end
else 
begin : FIFO16ch_logic
	 
	reg [3:0] ovrlap_cnt;
	reg [127:0] event_pipe;
	reg [6:0] ovrlp_smp_out_r;
	reg [23:0] l1acnt;
	reg [23:0] l1acnt_r1;
	reg [11:0] l1amcnt;
	reg [11:0] l1amcnt_r1;
	reg  new_l1a_d1;
	reg l1a_match_d1;
	reg l1a_match_d2;
	reg l1a_phase;
	reg l1a_phase_r1;
	reg smpclk_dp5;
	reg smpclk_d1;
	reg smpclk_d2;
	reg smpclk_d3;

	always @(posedge CLK40) begin
		if(RST_RESYNC) begin
			l1acnt  <= 24'h000000;
			l1amcnt <= 12'h000;
		end
		else begin
			l1acnt  <= L1A       ? l1acnt + 1  : l1acnt;
			l1amcnt <= L1A_MATCH ? l1amcnt + 1 : l1amcnt;
		end
		l1a_phase <= L1A_MATCH ? SMPCLK : l1a_phase;
		l1a_match_d1 <= L1A_MATCH;
		l1a_match_d2 <= l1a_match_d1;
		l1acnt_r1    <= l1acnt;
		l1amcnt_r1   <= l1amcnt;
		l1a_phase_r1 <= l1a_phase;
		new_l1a_d1   <= new_l1a;
	end
	
	always @(posedge WRCLK) begin
		if(~wren)
			ovrlap_cnt <= 4'h0;
		else
		   if(phase_align1)
				case({oinc,odec})
					2'b10: ovrlap_cnt <= ovrlap_cnt + 1;
					2'b01: ovrlap_cnt <= ovrlap_cnt - 1;
					default: ovrlap_cnt <= ovrlap_cnt;
				endcase
			else
				ovrlap_cnt <= ovrlap_cnt;
	end
		
	always @(negedge WRCLK) begin
	   if(SMPCLK)
		   smpclk_dp5 <= 1'b1;
		else
		   smpclk_dp5 <= 1'b0;
	end
	always @(posedge WRCLK) begin
		event_pipe <= phase_align1 ? {event_pipe[126:0],evt_start} : event_pipe;   // output tap selected by SAMP_MAX
		smpclk_d1 <= smpclk_dp5;
		smpclk_d2 <= smpclk_d1;
		smpclk_d3 <= smpclk_d2;
	end
	always @(posedge RDCLK) begin
		ovrlp_smp_out_r <= L1A_RD_EN ? {evt_end_smp_out,multi_ovlp_smp_out,ovrlap_smp_out,ovrlap_cnt_smp_out} : ovrlp_smp_out_r;
	end
	
	assign OVRLP_SMP_OUT = ovrlp_smp_out_r;
	assign L1A_CNT = l1acnt;
	assign L1A_MTCH_CNT = l1amcnt;
	assign ovrlap_cnt_i    = ovrlap_cnt;
	assign event_pipe_i    = event_pipe;
	assign l1acnt_r1_i     = l1acnt_r1;
	assign l1amcnt_r1_i    = l1amcnt_r1;
	assign l1a_match_d1_i  = l1a_match_d1;
	assign l1a_match_d2_i  = l1a_match_d2;
	assign l1a_phase_i     = l1a_phase;
	assign l1a_phase_r1_i  = l1a_phase_r1;

	assign stretch_l1a = L1A_MATCH | l1a_match_d1;
	assign oinc = (new_l1a | new_l1a_d1 | (L1A_MATCH & l1a_match_d1));
	assign ovrlap = (ovrlap_cnt > 4'h0);
	assign multi_ovlp = (ovrlap_cnt > 4'h1);
	assign evt_end = event_pipe[SAMP_MAX];
	assign phase_align0 = ~smpclk_d3 & smpclk_d2;
	assign phase_align1 = smpclk_d3 & ~smpclk_d2;
	
	assign evt_start = stretch_l1a & phase_align1;
	assign new_l1a = (L1A_MATCH & wren);
	assign odec = evt_end & (ovrlap | oinc);
	assign l1a_wren = wren & (phase_align0 | phase_align1);
end
endgenerate

generate
if(TMR==1 && TMR_Err_Det==1) 
begin : Load_FIFO_FSM_TMR_Err_Det
	FIFO_Load_FSM_TMR_Err_Det 
	FIFO_Load_FSM1(
     .SEL(sel),
     .WRENA(wren),
	  .TMR_ERR_COUNT(FIFO_LOAD_ERRCNT),
     .CLK(WRCLK),
     .RST(RST_RESYNC),
	  .SAMP_MAX(SAMP_MAX),
     .START(evt_start) 
	);
end
else if(TMR==1) 
begin : Load_FIFO_FSM_TMR
	FIFO_Load_FSM_TMR 
	FIFO_Load_FSM1(
     .SEL(sel),
     .WRENA(wren),
     .CLK(WRCLK),
     .RST(RST_RESYNC),
	  .SAMP_MAX(SAMP_MAX),
     .START(evt_start) 
	);
	assign FIFO_LOAD_ERRCNT = 0;
end
else 
begin : Load_FIFO_FSM
	FIFO_Load_FSM 
	FIFO_Load_FSM1(
     .SEL(sel),
     .WRENA(wren),
     .CLK(WRCLK),
     .RST(RST_RESYNC),
	  .SAMP_MAX(SAMP_MAX),
     .START(evt_start) 
	);
	assign FIFO_LOAD_ERRCNT = 0;
end
endgenerate
  

genvar Ch;

generate
	for (Ch=0; Ch<16; Ch=Ch+1) begin : channel
		ch_fifo_ecc fifo_ch (            // 36Kb FIFO with ECC protection
		  .rst(FIFO_RST),                // input rst
		  .wr_clk(WRCLK),                // input wr_clk
		  .rd_clk(RDCLK),                // input rd_clk
		  .din(muxout[Ch]),              // input [11 : 0] din
		  .wr_en(wren),                  // input wr_en
		  .rd_en(RD_ENA[Ch]),            // input rd_en
		  .injectdbiterr(injectdbiterr), // input injectdbiterr
		  .injectsbiterr(injectsbiterr), // input injectsbiterr
		  .dout(fout[Ch]),               // output [11 : 0] dout
		  .full(ffl[Ch]),                // output full
		  .overflow(ovrflw[Ch]),         // output overflow
		  .empty(fmt[Ch]),               // output empty
		  .sbiterr(sbiterr[Ch]),         // output sbiterr
		  .dbiterr(dbiterr[Ch])          // output dbiterr
		);
	end
endgenerate

l1a_smp_fifo l1a_smp_fifo_i (
  .rst(FIFO_RST),                      // input rst
  .wr_clk(WRCLK),                      // input wr_clk
  .rd_clk(RDCLK),                      // input rd_clk
  .din({evt_end,multi_ovlp,ovrlap,l1a_phase_r1_i,l1a_match_d2_i,ovrlap_cnt_i,l1amcnt_r1_i,l1acnt_r1_i}), // input [44 : 0] din
  .wr_en(l1a_wren),                    // input wr_en
  .rd_en(L1A_RD_EN),                   // input rd_en
  .dout({evt_end_smp_out,multi_ovlp_smp_out,ovrlap_smp_out,l1a_phase_smp_out,l1a_match_smp_out,ovrlap_cnt_smp_out,l1amcnt_smp_out,l1acnt_smp_out}),             // output [43 : 0] dout
  .full(l1a_smp_fl),                   // output full
  .empty(l1a_smp_mt),                  // output empty
  .sbiterr(l1a_smp_sbiterr),           // output sbiterr
  .dbiterr(l1a_smp_dbiterr)            // output dbiterr
);
	
endmodule
