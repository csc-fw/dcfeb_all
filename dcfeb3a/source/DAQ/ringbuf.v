`timescale 1ns / 1ps
module ringbuf #(
	parameter USE_CHIPSCOPE = 1,
	parameter TMR = 0,
	parameter TMR_Err_Det = 0
)(
	inout [35:0] LA_CNTRL,
   input CLK,
	input RST_RESYNC,
	input FIFO_RST,
	input [6:0] SAMP_MAX,
	input [11:0] WDATA,
	input WREN,
	input [37:0] L1A_SMP_DATA,
	input [6:0] OVRLP_SMP_DATA,
	input L1A_WRT_EN,
	input EVT_BUF_AMT,
	input EVT_BUF_AFL,
	input TRIG_IN,
	output TRIG_OUT,
	output [36:0] L1A_EVT_DATA,
	output L1A_EVT_PUSH,
	output [17:0] RDATA,
	output DATA_PUSH,
	output WARN,
	output [15:0] RGTRNS_ERRCNT
   );

wire injectdbiterr;
wire injectsbiterr;
// signals for L1A buffer
wire l1a_buf_mt;
wire l1a_buf_fl0;
wire l1a_sbiterr;
wire l1a_dbiterr;

// signals for ring buffer
wire ring_sbiterr;
wire ring_dbiterr;
wire ring_err;
wire [11:0] rdaddrecc;

wire mask_b12_strt;
wire mask_b12_rdad;
wire [12:0] ring_cnt_strt;
wire [12:0] ring_cnt_rdad;
wire ring_amt;

// FSM outputs
wire nxt_l1a;
wire nxt_wrd;
wire ld_addr;
wire [3:0] evt_state;


wire l1a_push;
wire valid1_i;
wire eb_amt_s2_i;
wire [4:0] l1abuf_i;
wire [11:0] prev_strt_addr_i;
wire [12:0] wrt_addr_i;
wire [11:0] rd_addr_i;


// input L1A_SMP_DATA
wire [23:0] l1acnt;
wire [11:0] l1amcnt;
wire l1a_match_smp;
wire l1a_phase_smp;

// input OVRLP_SMP_DATA
wire [3:0] ovrlap_cnt;
wire ovrlap_smp;
wire multi_ovlp_smp;
wire evt_end_smp;

// Direct L1A buffer output
wire [23:0] l1anum;
wire [11:0] l1a_mtch_num;
wire [11:0] strt_addr;
wire l1a_phs;

// Direct ring buffer output
wire [11:0] ring_out;
wire [3:0] ocnt;
wire ovrlp;
wire movlp;

assign injectdbiterr = 0;
assign injectsbiterr = 0;
assign {l1a_phase_smp,l1a_match_smp,l1amcnt,l1acnt} = L1A_SMP_DATA;         // input data
assign {evt_end_smp,multi_ovlp_smp,ovrlap_smp,ovrlap_cnt} = OVRLP_SMP_DATA; // input data
assign l1a_push     = L1A_WRT_EN & l1a_match_smp; // input data

assign L1A_EVT_DATA = {l1a_phs,l1a_mtch_num,l1anum}; // Direct L1A buffer output
assign L1A_EVT_PUSH = ld_addr;                       // from state machine
assign RDATA        = {movlp,ovrlp,ocnt,ring_out};   // Direct ring buffer output
assign evt_state[3] = 0;


generate
if(USE_CHIPSCOPE==1) 
begin : chipscope_rng_buf
//
// Logic analyzer for readout FIFO
wire [171:0] rng_buf_la_data;
wire [5:0] rng_buf_la_trig0;
wire [3:0] rng_buf_la_trig1;
wire [3:0] rng_buf_la_trig2;

ring_buf_la ring_buf_la_i (
    .CONTROL(LA_CNTRL),
    .CLK(CLK),
    .DATA(rng_buf_la_data),  // IN BUS [171:0]
    .TRIG0(rng_buf_la_trig0),  // IN BUS [5:0]
    .TRIG1(rng_buf_la_trig1),  // IN BUS [3:0]
    .TRIG2(rng_buf_la_trig2),  // IN BUS [3:0]
    .TRIG_OUT(TRIG_OUT) // OUT
);

// LA Data [171:0]
	assign rng_buf_la_data[3:0]     = l1acnt[3:0];
	assign rng_buf_la_data[7:4]     = l1amcnt[3:0];
	assign rng_buf_la_data[11:8]    = ovrlap_cnt[3:0];
	assign rng_buf_la_data[23:12]   = rd_addr_i;
	assign rng_buf_la_data[35:24]   = rdaddrecc;
	assign rng_buf_la_data[47:36]   = strt_addr;
	assign rng_buf_la_data[59:48]   = prev_strt_addr_i;
	assign rng_buf_la_data[71:60]   = ring_cnt_rdad;
	assign rng_buf_la_data[84:72]   = wrt_addr_i;
	assign rng_buf_la_data[89:85]   = l1abuf_i;
	assign rng_buf_la_data[93:90]   = ocnt;
	assign rng_buf_la_data[97:94]   = l1anum[3:0];
	assign rng_buf_la_data[101:98]  = l1a_mtch_num[3:0];
	assign rng_buf_la_data[105:102] = evt_state;
	assign rng_buf_la_data[112:106] = 7'h00;
	assign rng_buf_la_data[119:113] = 7'h00;
	assign rng_buf_la_data[131:120] = WDATA;
	assign rng_buf_la_data[143:132] = ring_out;

	assign rng_buf_la_data[144]     = WREN;
	assign rng_buf_la_data[145]     = L1A_WRT_EN;
	assign rng_buf_la_data[146]     = eb_amt_s2_i;
	assign rng_buf_la_data[147]     = EVT_BUF_AFL;
	assign rng_buf_la_data[148]     = L1A_EVT_PUSH;
	assign rng_buf_la_data[149]     = WARN;
	assign rng_buf_la_data[150]     = l1a_buf_mt;
	assign rng_buf_la_data[151]     = ring_err;
	assign rng_buf_la_data[152]     = mask_b12_rdad;
	assign rng_buf_la_data[153]     = ring_amt;
	assign rng_buf_la_data[154]     = ovrlp;
	assign rng_buf_la_data[155]     = movlp;
	assign rng_buf_la_data[156]     = l1a_match_smp;
	assign rng_buf_la_data[157]     = l1a_phase_smp;
	assign rng_buf_la_data[158]     = ovrlap_smp;
	assign rng_buf_la_data[159]     = multi_ovlp_smp;
	assign rng_buf_la_data[160]     = l1a_phs;
	assign rng_buf_la_data[161]     = l1a_push;
	assign rng_buf_la_data[162]     = nxt_l1a;
	assign rng_buf_la_data[163]     = nxt_wrd;
	assign rng_buf_la_data[164]     = valid1_i;
	assign rng_buf_la_data[165]     = DATA_PUSH;
	assign rng_buf_la_data[166]     = ld_addr;
	assign rng_buf_la_data[167]     = 1'b0;
	assign rng_buf_la_data[168]     = 1'b0;
	assign rng_buf_la_data[169]     = 1'b0;
	assign rng_buf_la_data[170]     = 1'b0;
	assign rng_buf_la_data[171]     = mask_b12_strt;

// LA Trigger0 [5:0]
	assign rng_buf_la_trig0[0]       = WREN;
	assign rng_buf_la_trig0[1]       = L1A_WRT_EN;
	assign rng_buf_la_trig0[2]       = l1a_buf_mt;
	assign rng_buf_la_trig0[3]       = TRIG_IN;
	assign rng_buf_la_trig0[4]       = EVT_BUF_AMT;
	assign rng_buf_la_trig0[5]       = EVT_BUF_AFL;
	
// LA Trigger1 [3:0]
	assign rng_buf_la_trig1[3:0]     = evt_state;

// LA Trigger2 [3:0]
	assign rng_buf_la_trig2[3:0]     = 4'h0;
	
end
else
begin
	assign TRIG_OUT = 0;
end
endgenerate



	ring_l1a_buf ring_l1a_buf_i (
	  .clk(CLK), // input clk for read and write
	  .rst(FIFO_RST),
	  .din({l1a_phase_smp,wrt_addr_i[11:0],l1amcnt,l1acnt}), // input [48 : 0] din
	  .wr_en(l1a_push),
	  .rd_en(nxt_l1a),
	  .injectdbiterr(injectdbiterr),
	  .injectsbiterr(injectsbiterr),
	  .dout({l1a_phs,strt_addr,l1a_mtch_num,l1anum}), // output [48 : 0] dout
	  .full(l1a_buf_fl0),
	  .empty(l1a_buf_mt),
	  .sbiterr(l1a_sbiterr),
	  .dbiterr(l1a_dbiterr)
	);

	ring_buf ring_buf_i (
	  .clka(CLK),
	  .wea(WREN),
	  .addra(wrt_addr_i[11:0]),                 // input [11 : 0] addra
	  .dina({multi_ovlp_smp,ovrlap_smp,ovrlap_cnt,WDATA}), // input [17 : 0] dina
	  .clkb(CLK),
	  .addrb(rd_addr_i),                  // input [11 : 0] addrb
	  .doutb({movlp,ovrlp,ocnt,ring_out}), // output [17 : 0] doutb
	  .injectsbiterr(injectsbiterr),
	  .injectdbiterr(injectdbiterr),
	  .sbiterr(ring_sbiterr),
	  .dbiterr(ring_dbiterr),
	  .rdaddrecc(rdaddrecc)             // output [11 : 0] rdaddrecc
	);

generate
if(TMR==1) 
begin : RGTRNS_logic_TMR
	
	(* syn_preserve = "true" *) reg data_push_1;
	(* syn_preserve = "true" *) reg data_push_2;
	(* syn_preserve = "true" *) reg data_push_3;
	(* syn_preserve = "true" *) reg valid1_1;
	(* syn_preserve = "true" *) reg valid1_2;
	(* syn_preserve = "true" *) reg valid1_3;
	(* syn_preserve = "true" *) reg eb_amt_s1_1;
	(* syn_preserve = "true" *) reg eb_amt_s1_2;
	(* syn_preserve = "true" *) reg eb_amt_s1_3;
	(* syn_preserve = "true" *) reg eb_amt_s2_1;
	(* syn_preserve = "true" *) reg eb_amt_s2_2;
	(* syn_preserve = "true" *) reg eb_amt_s2_3;
	(* syn_preserve = "true" *) reg [4:0] l1abuf_1;
	(* syn_preserve = "true" *) reg [4:0] l1abuf_2;
	(* syn_preserve = "true" *) reg [4:0] l1abuf_3;
	(* syn_preserve = "true" *) reg [11:0] prev_strt_addr_1;
	(* syn_preserve = "true" *) reg [11:0] prev_strt_addr_2;
	(* syn_preserve = "true" *) reg [11:0] prev_strt_addr_3;
	(* syn_preserve = "true" *) reg [12:0] wrt_addr_1;
	(* syn_preserve = "true" *) reg [12:0] wrt_addr_2;
	(* syn_preserve = "true" *) reg [12:0] wrt_addr_3;
	(* syn_preserve = "true" *) reg [12:0] wrt_addr2_1;
	(* syn_preserve = "true" *) reg [12:0] wrt_addr2_2;
	(* syn_preserve = "true" *) reg [12:0] wrt_addr2_3;
	(* syn_preserve = "true" *) reg [11:0] rd_addr_1;
	(* syn_preserve = "true" *) reg [11:0] rd_addr_2;
	(* syn_preserve = "true" *) reg [11:0] rd_addr_3;

	(* syn_keep = "true" *) wire vt_data_push_1;
	(* syn_keep = "true" *) wire vt_data_push_2;
	(* syn_keep = "true" *) wire vt_data_push_3;
	(* syn_keep = "true" *) wire vt_valid1_1;
	(* syn_keep = "true" *) wire vt_valid1_2;
	(* syn_keep = "true" *) wire vt_valid1_3;
	(* syn_keep = "true" *) wire vt_eb_amt_s1_1;
	(* syn_keep = "true" *) wire vt_eb_amt_s1_2;
	(* syn_keep = "true" *) wire vt_eb_amt_s1_3;
	(* syn_keep = "true" *) wire vt_eb_amt_s2_1;
	(* syn_keep = "true" *) wire vt_eb_amt_s2_2;
	(* syn_keep = "true" *) wire vt_eb_amt_s2_3;
	(* syn_keep = "true" *) wire [4:0] vt_l1abuf_1;
	(* syn_keep = "true" *) wire [4:0] vt_l1abuf_2;
	(* syn_keep = "true" *) wire [4:0] vt_l1abuf_3;
	(* syn_keep = "true" *) wire [11:0] vt_prev_strt_addr_1;
	(* syn_keep = "true" *) wire [11:0] vt_prev_strt_addr_2;
	(* syn_keep = "true" *) wire [11:0] vt_prev_strt_addr_3;
	(* syn_keep = "true" *) wire [12:0] vt_wrt_addr_1;
	(* syn_keep = "true" *) wire [12:0] vt_wrt_addr_2;
	(* syn_keep = "true" *) wire [12:0] vt_wrt_addr_3;
	(* syn_keep = "true" *) wire [12:0] vt_wrt_addr2_1;
	(* syn_keep = "true" *) wire [12:0] vt_wrt_addr2_2;
	(* syn_keep = "true" *) wire [12:0] vt_wrt_addr2_3;
	(* syn_keep = "true" *) wire [11:0] vt_rd_addr_1;
	(* syn_keep = "true" *) wire [11:0] vt_rd_addr_2;
	(* syn_keep = "true" *) wire [11:0] vt_rd_addr_3;

	assign vt_data_push_1      = (data_push_1      & data_push_2     ) | (data_push_2      & data_push_3     ) | (data_push_1      & data_push_3     ); // Majority logic
	assign vt_data_push_2      = (data_push_1      & data_push_2     ) | (data_push_2      & data_push_3     ) | (data_push_1      & data_push_3     ); // Majority logic
	assign vt_data_push_3      = (data_push_1      & data_push_2     ) | (data_push_2      & data_push_3     ) | (data_push_1      & data_push_3     ); // Majority logic
	assign vt_valid1_1         = (valid1_1         & valid1_2        ) | (valid1_2         & valid1_3        ) | (valid1_1         & valid1_3        ); // Majority logic
	assign vt_valid1_2         = (valid1_1         & valid1_2        ) | (valid1_2         & valid1_3        ) | (valid1_1         & valid1_3        ); // Majority logic
	assign vt_valid1_3         = (valid1_1         & valid1_2        ) | (valid1_2         & valid1_3        ) | (valid1_1         & valid1_3        ); // Majority logic
	assign vt_eb_amt_s1_1      = (eb_amt_s1_1      & eb_amt_s1_2     ) | (eb_amt_s1_2      & eb_amt_s1_3     ) | (eb_amt_s1_1      & eb_amt_s1_3     ); // Majority logic
	assign vt_eb_amt_s1_2      = (eb_amt_s1_1      & eb_amt_s1_2     ) | (eb_amt_s1_2      & eb_amt_s1_3     ) | (eb_amt_s1_1      & eb_amt_s1_3     ); // Majority logic
	assign vt_eb_amt_s1_3      = (eb_amt_s1_1      & eb_amt_s1_2     ) | (eb_amt_s1_2      & eb_amt_s1_3     ) | (eb_amt_s1_1      & eb_amt_s1_3     ); // Majority logic
	assign vt_eb_amt_s2_1      = (eb_amt_s2_1      & eb_amt_s2_2     ) | (eb_amt_s2_2      & eb_amt_s2_3     ) | (eb_amt_s2_1      & eb_amt_s2_3     ); // Majority logic
	assign vt_eb_amt_s2_2      = (eb_amt_s2_1      & eb_amt_s2_2     ) | (eb_amt_s2_2      & eb_amt_s2_3     ) | (eb_amt_s2_1      & eb_amt_s2_3     ); // Majority logic
	assign vt_eb_amt_s2_3      = (eb_amt_s2_1      & eb_amt_s2_2     ) | (eb_amt_s2_2      & eb_amt_s2_3     ) | (eb_amt_s2_1      & eb_amt_s2_3     ); // Majority logic
	assign vt_l1abuf_1         = (l1abuf_1         & l1abuf_2        ) | (l1abuf_2         & l1abuf_3        ) | (l1abuf_1         & l1abuf_3        ); // Majority logic
	assign vt_l1abuf_2         = (l1abuf_1         & l1abuf_2        ) | (l1abuf_2         & l1abuf_3        ) | (l1abuf_1         & l1abuf_3        ); // Majority logic
	assign vt_l1abuf_3         = (l1abuf_1         & l1abuf_2        ) | (l1abuf_2         & l1abuf_3        ) | (l1abuf_1         & l1abuf_3        ); // Majority logic
	assign vt_prev_strt_addr_1 = (prev_strt_addr_1 & prev_strt_addr_2) | (prev_strt_addr_2 & prev_strt_addr_3) | (prev_strt_addr_1 & prev_strt_addr_3); // Majority logic
	assign vt_prev_strt_addr_2 = (prev_strt_addr_1 & prev_strt_addr_2) | (prev_strt_addr_2 & prev_strt_addr_3) | (prev_strt_addr_1 & prev_strt_addr_3); // Majority logic
	assign vt_prev_strt_addr_3 = (prev_strt_addr_1 & prev_strt_addr_2) | (prev_strt_addr_2 & prev_strt_addr_3) | (prev_strt_addr_1 & prev_strt_addr_3); // Majority logic
	assign vt_wrt_addr_1       = (wrt_addr_1       & wrt_addr_2      ) | (wrt_addr_2       & wrt_addr_3      ) | (wrt_addr_1       & wrt_addr_3      ); // Majority logic
	assign vt_wrt_addr_2       = (wrt_addr_1       & wrt_addr_2      ) | (wrt_addr_2       & wrt_addr_3      ) | (wrt_addr_1       & wrt_addr_3      ); // Majority logic
	assign vt_wrt_addr_3       = (wrt_addr_1       & wrt_addr_2      ) | (wrt_addr_2       & wrt_addr_3      ) | (wrt_addr_1       & wrt_addr_3      ); // Majority logic
	assign vt_wrt_addr2_1      = (wrt_addr2_1      & wrt_addr2_2     ) | (wrt_addr2_2      & wrt_addr2_3     ) | (wrt_addr2_1      & wrt_addr2_3     ); // Majority logic
	assign vt_wrt_addr2_2      = (wrt_addr2_1      & wrt_addr2_2     ) | (wrt_addr2_2      & wrt_addr2_3     ) | (wrt_addr2_1      & wrt_addr2_3     ); // Majority logic
	assign vt_wrt_addr2_3      = (wrt_addr2_1      & wrt_addr2_2     ) | (wrt_addr2_2      & wrt_addr2_3     ) | (wrt_addr2_1      & wrt_addr2_3     ); // Majority logic
	assign vt_rd_addr_1        = (rd_addr_1        & rd_addr_2       ) | (rd_addr_2        & rd_addr_3       ) | (rd_addr_1        & rd_addr_3       ); // Majority logic
	assign vt_rd_addr_2        = (rd_addr_1        & rd_addr_2       ) | (rd_addr_2        & rd_addr_3       ) | (rd_addr_1        & rd_addr_3       ); // Majority logic
	assign vt_rd_addr_3        = (rd_addr_1        & rd_addr_2       ) | (rd_addr_2        & rd_addr_3       ) | (rd_addr_1        & rd_addr_3       ); // Majority logic

	(* syn_keep = "true" *) wire [12:0] ring_cnt_strt_1;
	(* syn_keep = "true" *) wire [12:0] ring_cnt_strt_2;
	(* syn_keep = "true" *) wire [12:0] ring_cnt_strt_3;
	(* syn_keep = "true" *) wire [12:0] ring_cnt_rdad_1;
	(* syn_keep = "true" *) wire [12:0] ring_cnt_rdad_2;
	(* syn_keep = "true" *) wire [12:0] ring_cnt_rdad_3;
	(* syn_keep = "true" *) wire ring_amt_1;
	(* syn_keep = "true" *) wire ring_amt_2;
	(* syn_keep = "true" *) wire ring_amt_3;
	(* syn_keep = "true" *) wire warn_1;
	(* syn_keep = "true" *) wire warn_2;
	(* syn_keep = "true" *) wire warn_3;
	(* syn_keep = "true" *) wire ring_err_1;
	(* syn_keep = "true" *) wire ring_err_2;
	(* syn_keep = "true" *) wire ring_err_3;
	(* syn_keep = "true" *) wire mask_b12_strt_1;
	(* syn_keep = "true" *) wire mask_b12_strt_2;
	(* syn_keep = "true" *) wire mask_b12_strt_3;
	(* syn_keep = "true" *) wire mask_b12_rdad_1;
	(* syn_keep = "true" *) wire mask_b12_rdad_2;
	(* syn_keep = "true" *) wire mask_b12_rdad_3;

	assign ring_cnt_strt_1 = vt_wrt_addr_1 - strt_addr;
	assign ring_cnt_strt_2 = vt_wrt_addr_2 - strt_addr;
	assign ring_cnt_strt_3 = vt_wrt_addr_3 - strt_addr;
	assign ring_cnt_rdad_1 = vt_wrt_addr2_1 - vt_rd_addr_1;
	assign ring_cnt_rdad_2 = vt_wrt_addr2_2 - vt_rd_addr_2;
	assign ring_cnt_rdad_3 = vt_wrt_addr2_3 - vt_rd_addr_3;
	assign ring_amt_1     = (ring_cnt_rdad_1 < 13'd7);
	assign ring_amt_2     = (ring_cnt_rdad_2 < 13'd7);
	assign ring_amt_3     = (ring_cnt_rdad_3 < 13'd7);
	assign warn_1         = (ring_cnt_strt_1 > 13'd3328);
	assign warn_2         = (ring_cnt_strt_2 > 13'd3328);
	assign warn_3         = (ring_cnt_strt_3 > 13'd3328);
	assign ring_err_1     = (ring_cnt_strt_1 > 13'h0FFF);
	assign ring_err_2     = (ring_cnt_strt_2 > 13'h0FFF);
	assign ring_err_3     = (ring_cnt_strt_3 > 13'h0FFF);
	assign mask_b12_strt_1 = (({1'b0,strt_addr} - vt_prev_strt_addr_1) >= 0);
	assign mask_b12_strt_2 = (({1'b0,strt_addr} - vt_prev_strt_addr_2) >= 0);
	assign mask_b12_strt_3 = (({1'b0,strt_addr} - vt_prev_strt_addr_3) >= 0);
	assign mask_b12_rdad_1 = nxt_wrd && (vt_rd_addr_1 == 12'hFFF);
	assign mask_b12_rdad_2 = nxt_wrd && (vt_rd_addr_2 == 12'hFFF);
	assign mask_b12_rdad_3 = nxt_wrd && (vt_rd_addr_3 == 12'hFFF);

	assign WARN             = (warn_1        & warn_2       ) | (warn_2        & warn_3       ) | (warn_1        & warn_3       ); // Majority logic
	assign DATA_PUSH        = vt_data_push_1;
	assign valid1_i         = vt_valid1_1;
	assign eb_amt_s2_i      = vt_eb_amt_s2_1;
	assign l1abuf_i         = vt_l1abuf_1;
	assign prev_strt_addr_i = vt_prev_strt_addr_1;
	assign wrt_addr_i       = vt_wrt_addr_1;
	assign rd_addr_i        = vt_rd_addr_1;
	assign ring_amt         = (ring_amt_1    & ring_amt_2   ) | (ring_amt_2    & ring_amt_3   ) | (ring_amt_1    & ring_amt_3   ); // Majority logic
	assign ring_err         = (ring_err_1    & ring_err_2   ) | (ring_err_2    & ring_err_3   ) | (ring_err_1    & ring_err_3   ); // Majority logic

	assign mask_b12_strt    = (mask_b12_strt_1 & mask_b12_strt_2) | (mask_b12_strt_2 & mask_b12_strt_3) | (mask_b12_strt_1 & mask_b12_strt_3); // Majority logic
	assign mask_b12_rdad    = (mask_b12_rdad_1 & mask_b12_rdad_2) | (mask_b12_rdad_2 & mask_b12_rdad_3) | (mask_b12_rdad_1 & mask_b12_rdad_3); // Majority logic
	assign ring_cnt_strt    = (ring_cnt_strt_1 & ring_cnt_strt_2) | (ring_cnt_strt_2 & ring_cnt_strt_3) | (ring_cnt_strt_1 & ring_cnt_strt_3); // Majority logic
	assign ring_cnt_rdad    = (ring_cnt_rdad_1 & ring_cnt_rdad_2) | (ring_cnt_rdad_2 & ring_cnt_rdad_3) | (ring_cnt_rdad_1 & ring_cnt_rdad_3); // Majority logic

	always @(posedge CLK or posedge RST_RESYNC) begin
		if(RST_RESYNC) begin
			wrt_addr_1       <= 13'h0000;
			wrt_addr_2       <= 13'h0000;
			wrt_addr_3       <= 13'h0000;
			wrt_addr2_1      <= 13'h0000;
			wrt_addr2_2      <= 13'h0000;
			wrt_addr2_3      <= 13'h0000;
			prev_strt_addr_1 <= 12'h000;
			prev_strt_addr_2 <= 12'h000;
			prev_strt_addr_3 <= 12'h000;
			rd_addr_1        <= 12'h000;
			rd_addr_2        <= 12'h000;
			rd_addr_3        <= 12'h000;
			l1abuf_1         <= 5'h00;
			l1abuf_2         <= 5'h00;
			l1abuf_3         <= 5'h00;
		end
		else begin
			wrt_addr_1       <= WREN ? (vt_wrt_addr_1  & {mask_b12_strt_1,12'hFFF}) + 1 : (vt_wrt_addr_1  & {mask_b12_strt_1,12'hFFF});
			wrt_addr_2       <= WREN ? (vt_wrt_addr_2  & {mask_b12_strt_2,12'hFFF}) + 1 : (vt_wrt_addr_2  & {mask_b12_strt_2,12'hFFF});
			wrt_addr_3       <= WREN ? (vt_wrt_addr_3  & {mask_b12_strt_3,12'hFFF}) + 1 : (vt_wrt_addr_3  & {mask_b12_strt_3,12'hFFF});
			wrt_addr2_1      <= WREN ? (vt_wrt_addr2_1 & {mask_b12_rdad_1,12'hFFF}) + 1 : (vt_wrt_addr2_1 & {mask_b12_rdad_1,12'hFFF});
			wrt_addr2_2      <= WREN ? (vt_wrt_addr2_2 & {mask_b12_rdad_2,12'hFFF}) + 1 : (vt_wrt_addr2_2 & {mask_b12_rdad_2,12'hFFF});
			wrt_addr2_3      <= WREN ? (vt_wrt_addr2_3 & {mask_b12_rdad_3,12'hFFF}) + 1 : (vt_wrt_addr2_3 & {mask_b12_rdad_3,12'hFFF});
			prev_strt_addr_1 <= nxt_l1a ? strt_addr : vt_prev_strt_addr_1;
			prev_strt_addr_2 <= nxt_l1a ? strt_addr : vt_prev_strt_addr_2;
			prev_strt_addr_3 <= nxt_l1a ? strt_addr : vt_prev_strt_addr_3;
			rd_addr_1        <= ld_addr ? strt_addr : (nxt_wrd ? vt_rd_addr_1 + 1 : vt_rd_addr_1);
			rd_addr_2        <= ld_addr ? strt_addr : (nxt_wrd ? vt_rd_addr_2 + 1 : vt_rd_addr_2);
			rd_addr_3        <= ld_addr ? strt_addr : (nxt_wrd ? vt_rd_addr_3 + 1 : vt_rd_addr_3);
			l1abuf_1         <= (l1a_push && !nxt_l1a) ? vt_l1abuf_1 + 1 : ((nxt_l1a && !l1a_push) ? vt_l1abuf_1 - 1 : vt_l1abuf_1);
			l1abuf_2         <= (l1a_push && !nxt_l1a) ? vt_l1abuf_2 + 1 : ((nxt_l1a && !l1a_push) ? vt_l1abuf_2 - 1 : vt_l1abuf_2);
			l1abuf_3         <= (l1a_push && !nxt_l1a) ? vt_l1abuf_3 + 1 : ((nxt_l1a && !l1a_push) ? vt_l1abuf_3 - 1 : vt_l1abuf_3);
		end
	end

	always @(posedge CLK) begin
		valid1_1      <= nxt_wrd;
		valid1_2      <= nxt_wrd;
		valid1_3      <= nxt_wrd;
		data_push_1 <= vt_valid1_1;
		data_push_2 <= vt_valid1_2;
		data_push_3 <= vt_valid1_3;
		eb_amt_s1_1   <= EVT_BUF_AMT;
		eb_amt_s1_2   <= EVT_BUF_AMT;
		eb_amt_s1_3   <= EVT_BUF_AMT;
		eb_amt_s2_1   <= vt_eb_amt_s1_1;
		eb_amt_s2_2   <= vt_eb_amt_s1_2;
		eb_amt_s2_3   <= vt_eb_amt_s1_3;
	end
	
end
else 
begin : RGTRNS_logic
	
	reg data_push_r;
	reg valid1;
	reg eb_amt_s1;
	reg eb_amt_s2;
	reg [4:0] l1abuf;
	reg [11:0] prev_strt_addr;
	reg [12:0] wrt_addr;
	reg [12:0] wrt_addr2;
	reg [11:0] rd_addr;

	assign ring_cnt_strt = wrt_addr - strt_addr;
	assign ring_cnt_rdad = wrt_addr2 - rd_addr;
	assign ring_amt     = (ring_cnt_rdad < 13'd7);
	assign WARN         = (ring_cnt_strt > 13'd3328);
	assign ring_err     = (ring_cnt_strt > 13'h0FFF);
	assign mask_b12_strt = (({1'b0,strt_addr} - prev_strt_addr) >= 0);
	assign mask_b12_rdad = nxt_wrd && (rd_addr == 12'hFFF);

	assign DATA_PUSH = data_push_r;
	assign valid1_i = valid1;
	assign eb_amt_s2_i = eb_amt_s2;
	assign l1abuf_i = l1abuf;
	assign prev_strt_addr_i = prev_strt_addr;
	assign wrt_addr_i = wrt_addr;
	assign rd_addr_i = rd_addr;

	always @(posedge CLK or posedge RST_RESYNC) begin
		if(RST_RESYNC) begin
			wrt_addr       <= 13'h0000;
			wrt_addr2      <= 13'h0000;
			prev_strt_addr <= 12'h000;
			rd_addr        <= 12'h000;
			l1abuf         <= 5'h00;
		end
		else begin
			wrt_addr       <= WREN ? (wrt_addr  & {mask_b12_strt,12'hFFF}) + 1 : (wrt_addr  & {mask_b12_strt,12'hFFF});
			wrt_addr2      <= WREN ? (wrt_addr2 & {mask_b12_rdad,12'hFFF}) + 1 : (wrt_addr2 & {mask_b12_rdad,12'hFFF});
			prev_strt_addr <= nxt_l1a ? strt_addr : prev_strt_addr;
			rd_addr        <= ld_addr ? strt_addr : (nxt_wrd ? rd_addr + 1 : rd_addr);
			l1abuf         <= (l1a_push && !nxt_l1a) ? l1abuf + 1 : ((nxt_l1a && !l1a_push) ? l1abuf - 1 : l1abuf);
		end
	end

	always @(posedge CLK) begin
		valid1      <= nxt_wrd;
		data_push_r <= valid1;
		eb_amt_s1   <= EVT_BUF_AMT;
		eb_amt_s2   <= eb_amt_s1;
	end
	
end
endgenerate

generate
if(TMR==1 && TMR_Err_Det==1) 
begin : RGTRNS_FSM_TMR_Err_Det
Ring_Trans_FSM_TMR_Err_Det
Ring_Trans_FSM_i (
   .LD_ADDR(ld_addr),
   .NXT_L1A(nxt_l1a),
   .RD(nxt_wrd),
   .EVT_STATE(evt_state[2:0]),
	.TMR_ERR_COUNT(RGTRNS_ERRCNT),
   .CLK(CLK),
   .EVT_BUF_AFL(EVT_BUF_AFL),
   .EVT_BUF_AMT(eb_amt_s2_i),
   .L1A_BUF_MT(l1a_buf_mt),
   .RING_AMT(ring_amt),
   .RST(RST_RESYNC),
   .SAMP_MAX(SAMP_MAX)
);
end
else if(TMR==1) 
begin : RGTRNS_FSM_TMR
Ring_Trans_FSM_TMR
Ring_Trans_FSM_i (
   .LD_ADDR(ld_addr),
   .NXT_L1A(nxt_l1a),
   .RD(nxt_wrd),
   .EVT_STATE(evt_state[2:0]),
   .CLK(CLK),
   .EVT_BUF_AFL(EVT_BUF_AFL),
   .EVT_BUF_AMT(eb_amt_s2_i),
   .L1A_BUF_MT(l1a_buf_mt),
   .RING_AMT(ring_amt),
   .RST(RST_RESYNC),
   .SAMP_MAX(SAMP_MAX)
);
assign RGTRNS_ERRCNT = 0;
end
else 
begin : RGTRNS_FSM
Ring_Trans_FSM
Ring_Trans_FSM_i (
   .LD_ADDR(ld_addr),
   .NXT_L1A(nxt_l1a),
   .RD(nxt_wrd),
   .EVT_STATE(evt_state[2:0]),
   .CLK(CLK),
   .EVT_BUF_AFL(EVT_BUF_AFL),
   .EVT_BUF_AMT(eb_amt_s2_i),
   .L1A_BUF_MT(l1a_buf_mt),
   .RING_AMT(ring_amt),
   .RST(RST_RESYNC),
   .SAMP_MAX(SAMP_MAX)
);
assign RGTRNS_ERRCNT = 0;
end
endgenerate
	
endmodule
