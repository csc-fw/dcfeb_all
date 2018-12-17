`timescale 1ns / 1ps
module eth_fifo #(
	parameter USE_CHIPSCOPE = 1,
	parameter TMR = 0,
	parameter TMR_Err_Det = 0
)(
	inout [35:0] LA_CNTRL,
	input WCLK,
	input RCLK,
	input RST_RESYNC,
	input FIFO_RST,
	input [6:0] SAMP_MAX,
	input [17:0] WDATA,
	input WREN,
	input [36:0] L1A_EVT_DATA,
	input L1A_WRT_EN,
	input WARN,
	input L1A_HEAD,
	input TXACK,
	input TRIG_IN,
	output TRIG_OUT,
	output EVT_BUF_AMT,
	output EVT_BUF_AFL,
	output [15:0] TXD,
	output TXD_VLD,
	output [15:0] SMPPRC_ERRCNT
   );


wire injectdbiterr;
wire injectsbiterr;

// signals for readout FIFO
wire evt_buf_mt;
wire evt_buf_full;
wire evt_sbiterr;
wire evt_dbiterr;
	
// signals for L1A buffer
wire l1a_buf_mt;
wire l1a_buf_full;
wire l1a_sbiterr;
wire l1a_dbiterr;
	
// input L1A_EVT_DATA
wire [23:0] l1acnt;
wire [11:0] l1amcnt;
wire l1a_phase;
	
// Direct L1A buffer output
wire [23:0] l1anum;
wire [11:0] l1ahigh;
wire [11:0] l1alow;
wire [11:0] l1a_mtch_num;
wire l1a_phs;

// Direct event FIFO output
wire [11:0] data_out;
wire [3:0] ocnt;
wire ovrlp;
wire movlp;
wire dmy;

// State machine outputs
wire ce;
wire clr_crc0;
wire ld_l1a_h;
wire ld_l1a_l;
wire nxt_l1a;
wire nxt_wrd;
wire valid0;
wire [6:0] seq;
wire [3:0] frm_state;


wire [4:0] l1abuf_i;
wire [15:0] fullwrd_i;
wire [15:0] frame_i;
wire clr_crc_i;
wire mt_r3_i;

wire serial_i;
wire l1a_out_i;

assign injectdbiterr = 0;
assign injectsbiterr = 0;
assign l1ahigh = l1anum[23:12];
assign l1alow = l1anum[11:0];
assign {l1a_phase,l1amcnt,l1acnt} = L1A_EVT_DATA; // input data

generate
if(USE_CHIPSCOPE==1) 
begin : chipscope_rng_eth
//
// Logic analyzer for readout FIFO
wire [148:0] rng_eth_la_data;
wire [5:0] rng_eth_la_trig;

eth_fifo_la eth_fifo_la_i (
    .CONTROL(LA_CNTRL),
    .CLK(WCLK),
    .DATA(rng_eth_la_data),  // IN BUS [148:0]
    .TRIG0(rng_eth_la_trig),  // IN BUS [5:0]
    .TRIG_OUT(TRIG_OUT) // OUT
);

// LA Data [148:0]
	assign rng_eth_la_data[3:0]     = l1acnt[3:0];
	assign rng_eth_la_data[7:4]     = l1amcnt[3:0];
	assign rng_eth_la_data[24:8]    = WDATA[16:0];
	assign rng_eth_la_data[36:25]   = data_out;
	assign rng_eth_la_data[52:37]   = fullwrd_i;
	assign rng_eth_la_data[68:53]   = frame_i;
	assign rng_eth_la_data[84:69]   = TXD;
	assign rng_eth_la_data[89:85]   = l1abuf_i;
	assign rng_eth_la_data[93:90]   = ocnt;
	assign rng_eth_la_data[97:94]   = l1anum[3:0];
	assign rng_eth_la_data[101:98]  = l1a_mtch_num[3:0];
	assign rng_eth_la_data[105:102] = frm_state;
	assign rng_eth_la_data[112:106] = 7'h00;
	assign rng_eth_la_data[119:113] = seq;
	
	assign rng_eth_la_data[120]     = WREN;
	assign rng_eth_la_data[121]     = L1A_WRT_EN;
	assign rng_eth_la_data[122]     = EVT_BUF_AMT;
	assign rng_eth_la_data[123]     = EVT_BUF_AFL;
	assign rng_eth_la_data[124]     = L1A_HEAD;
	assign rng_eth_la_data[125]     = WARN;
	assign rng_eth_la_data[126]     = l1a_buf_mt;
	assign rng_eth_la_data[127]     = evt_buf_mt;
	assign rng_eth_la_data[128]     = TXACK;
	assign rng_eth_la_data[129]     = mt_r3_i;
	assign rng_eth_la_data[130]     = ovrlp;
	assign rng_eth_la_data[131]     = movlp;
	assign rng_eth_la_data[132]     = serial_i;
	assign rng_eth_la_data[133]     = l1a_out_i;
	assign rng_eth_la_data[134]     = ce;
	assign rng_eth_la_data[135]     = ld_l1a_h;
	assign rng_eth_la_data[136]     = l1a_phs;
	assign rng_eth_la_data[137]     = l1a_phase;
	assign rng_eth_la_data[138]     = nxt_l1a;
	assign rng_eth_la_data[139]     = nxt_wrd;
	assign rng_eth_la_data[140]     = valid0;
	assign rng_eth_la_data[141]     = TXD_VLD;
	assign rng_eth_la_data[142]     = ld_l1a_l;
	assign rng_eth_la_data[143]     = clr_crc_i;
	assign rng_eth_la_data[144]     = 1'b0;
	assign rng_eth_la_data[145]     = 1'b0;
	assign rng_eth_la_data[146]     = 1'b0;
	assign rng_eth_la_data[147]     = evt_buf_underflow;
	assign rng_eth_la_data[148]     = evt_buf_overflow;
	

// LA Trigger [5:0]
	assign rng_eth_la_trig[0]       = WREN;
	assign rng_eth_la_trig[1]       = evt_buf_mt;
	assign rng_eth_la_trig[2]       = l1a_buf_mt;
	assign rng_eth_la_trig[3]       = TRIG_IN;
	assign rng_eth_la_trig[4]       = evt_buf_underflow;
	assign rng_eth_la_trig[5]       = evt_buf_overflow;
end
else
begin
	assign TRIG_OUT = 0;
end
endgenerate
	
	l1a_buf eth_l1a_buf_i (
		.rst(FIFO_RST),
		.wr_clk(WCLK),
		.rd_clk(RCLK),
		.din({l1a_phase,l1amcnt,l1acnt}), // input [36 : 0] din
		.wr_en(L1A_WRT_EN),
		.rd_en(nxt_l1a),
		.injectdbiterr(injectdbiterr),
		.injectsbiterr(injectsbiterr),
		.dout({l1a_phs,l1a_mtch_num,l1anum}), // output [36 : 0] dout
		.full(l1a_buf_full),
		.empty(l1a_buf_mt),
		.sbiterr(l1a_sbiterr),
		.dbiterr(l1a_dbiterr)
	);

	evt_buf eth_evt_buf (
		.rst(FIFO_RST),
		.wr_clk(WCLK),
		.rd_clk(RCLK),
		.din({1'b0,WDATA}), // input [18 : 0] din
		.wr_en(WREN),
		.rd_en(nxt_wrd),
		.injectdbiterr(injectdbiterr),
		.injectsbiterr(injectsbiterr),
		.dout({dmy,movlp,ovrlp,ocnt,data_out}), // output [18 : 0] dout
		.full(evt_buf_full),
		.overflow(evt_buf_overflow), // output overflow
		.empty(evt_buf_mt),
		.underflow(evt_buf_underflow), // output underflow
		.prog_full(EVT_BUF_AFL),
		.prog_empty(EVT_BUF_AMT),
		.sbiterr(evt_sbiterr),
		.dbiterr(evt_dbiterr)
	);

generate
if(TMR==1) 
begin : Eth_FIFO_logic_TMR

	(* syn_preserve = "true" *) reg [15:0] txd_1;
	(* syn_preserve = "true" *) reg [15:0] txd_2;
	(* syn_preserve = "true" *) reg [15:0] txd_3;
	(* syn_preserve = "true" *) reg txd_vld_1;
	(* syn_preserve = "true" *) reg txd_vld_2;
	(* syn_preserve = "true" *) reg txd_vld_3;
	
	(* syn_preserve = "true" *) reg [4:0] l1abuf_1;
	(* syn_preserve = "true" *) reg [4:0] l1abuf_2;
	(* syn_preserve = "true" *) reg [4:0] l1abuf_3;
	(* syn_preserve = "true" *) reg nxt_l1a_sync1_1;
	(* syn_preserve = "true" *) reg nxt_l1a_sync1_2;
	(* syn_preserve = "true" *) reg nxt_l1a_sync1_3;
	(* syn_preserve = "true" *) reg nxt_l1a_sync2_1;
	(* syn_preserve = "true" *) reg nxt_l1a_sync2_2;
	(* syn_preserve = "true" *) reg nxt_l1a_sync2_3;
	(* syn_preserve = "true" *) reg [12:0] adcdata_1;
	(* syn_preserve = "true" *) reg [12:0] adcdata_2;
	(* syn_preserve = "true" *) reg [12:0] adcdata_3;
	(* syn_preserve = "true" *) reg [14:0] crc_1;
	(* syn_preserve = "true" *) reg [14:0] crc_2;
	(* syn_preserve = "true" *) reg [14:0] crc_3;
	(* syn_preserve = "true" *) reg [15:0] fullwrd_1;
	(* syn_preserve = "true" *) reg [15:0] fullwrd_2;
	(* syn_preserve = "true" *) reg [15:0] fullwrd_3;
	(* syn_preserve = "true" *) reg [15:0] frame_1;
	(* syn_preserve = "true" *) reg [15:0] frame_2;
	(* syn_preserve = "true" *) reg [15:0] frame_3;
	(* syn_preserve = "true" *) reg [6:0] seq1_1;
	(* syn_preserve = "true" *) reg [6:0] seq1_2;
	(* syn_preserve = "true" *) reg [6:0] seq1_3;
	(* syn_preserve = "true" *) reg clr_crc_1;
	(* syn_preserve = "true" *) reg clr_crc_2;
	(* syn_preserve = "true" *) reg clr_crc_3;
	(* syn_preserve = "true" *) reg valid1_1;
	(* syn_preserve = "true" *) reg valid1_2;
	(* syn_preserve = "true" *) reg valid1_3;
	(* syn_preserve = "true" *) reg valid2_1;
	(* syn_preserve = "true" *) reg valid2_2;
	(* syn_preserve = "true" *) reg valid2_3;
	(* syn_preserve = "true" *) reg mt_r1_1;
	(* syn_preserve = "true" *) reg mt_r1_2;
	(* syn_preserve = "true" *) reg mt_r1_3;
	(* syn_preserve = "true" *) reg mt_r2_1;
	(* syn_preserve = "true" *) reg mt_r2_2;
	(* syn_preserve = "true" *) reg mt_r2_3;
	(* syn_preserve = "true" *) reg mt_r3_1;
	(* syn_preserve = "true" *) reg mt_r3_2;
	(* syn_preserve = "true" *) reg mt_r3_3;

	(* syn_keep = "true" *) wire [15:0] vt_txd_1;
	(* syn_keep = "true" *) wire [15:0] vt_txd_2;
	(* syn_keep = "true" *) wire [15:0] vt_txd_3;
	(* syn_keep = "true" *) wire vt_txd_vld_1;
	(* syn_keep = "true" *) wire vt_txd_vld_2;
	(* syn_keep = "true" *) wire vt_txd_vld_3;
	
	(* syn_keep = "true" *) wire [4:0] vt_l1abuf_1;
	(* syn_keep = "true" *) wire [4:0] vt_l1abuf_2;
	(* syn_keep = "true" *) wire [4:0] vt_l1abuf_3;
	(* syn_keep = "true" *) wire vt_nxt_l1a_sync1_1;
	(* syn_keep = "true" *) wire vt_nxt_l1a_sync1_2;
	(* syn_keep = "true" *) wire vt_nxt_l1a_sync1_3;
	(* syn_keep = "true" *) wire vt_nxt_l1a_sync2_1;
	(* syn_keep = "true" *) wire vt_nxt_l1a_sync2_2;
	(* syn_keep = "true" *) wire vt_nxt_l1a_sync2_3;
	(* syn_keep = "true" *) wire [12:0] vt_adcdata_1;
	(* syn_keep = "true" *) wire [12:0] vt_adcdata_2;
	(* syn_keep = "true" *) wire [12:0] vt_adcdata_3;
	(* syn_keep = "true" *) wire [14:0] vt_crc_1;
	(* syn_keep = "true" *) wire [14:0] vt_crc_2;
	(* syn_keep = "true" *) wire [14:0] vt_crc_3;
	(* syn_keep = "true" *) wire [15:0] vt_fullwrd_1;
	(* syn_keep = "true" *) wire [15:0] vt_fullwrd_2;
	(* syn_keep = "true" *) wire [15:0] vt_fullwrd_3;
	(* syn_keep = "true" *) wire [15:0] vt_frame_1;
	(* syn_keep = "true" *) wire [15:0] vt_frame_2;
	(* syn_keep = "true" *) wire [15:0] vt_frame_3;
	(* syn_keep = "true" *) wire [6:0] vt_seq1_1;
	(* syn_keep = "true" *) wire [6:0] vt_seq1_2;
	(* syn_keep = "true" *) wire [6:0] vt_seq1_3;
	(* syn_keep = "true" *) wire vt_clr_crc_1;
	(* syn_keep = "true" *) wire vt_clr_crc_2;
	(* syn_keep = "true" *) wire vt_clr_crc_3;
	(* syn_keep = "true" *) wire vt_valid1_1;
	(* syn_keep = "true" *) wire vt_valid1_2;
	(* syn_keep = "true" *) wire vt_valid1_3;
	(* syn_keep = "true" *) wire vt_valid2_1;
	(* syn_keep = "true" *) wire vt_valid2_2;
	(* syn_keep = "true" *) wire vt_valid2_3;
	(* syn_keep = "true" *) wire vt_mt_r1_1;
	(* syn_keep = "true" *) wire vt_mt_r1_2;
	(* syn_keep = "true" *) wire vt_mt_r1_3;
	(* syn_keep = "true" *) wire vt_mt_r2_1;
	(* syn_keep = "true" *) wire vt_mt_r2_2;
	(* syn_keep = "true" *) wire vt_mt_r2_3;
	(* syn_keep = "true" *) wire vt_mt_r3_1;
	(* syn_keep = "true" *) wire vt_mt_r3_2;
	(* syn_keep = "true" *) wire vt_mt_r3_3;

	(* syn_keep = "true" *) reg serial_1;
	(* syn_keep = "true" *) reg serial_2;
	(* syn_keep = "true" *) reg serial_3;

	(* syn_keep = "true" *) wire l1a_out_1;
	(* syn_keep = "true" *) wire l1a_out_2;
	(* syn_keep = "true" *) wire l1a_out_3;
	
	assign vt_txd_1           = (txd_1           & txd_2          ) | (txd_2           & txd_3          ) | (txd_1           & txd_3          ); // Majority logic
	assign vt_txd_2           = (txd_1           & txd_2          ) | (txd_2           & txd_3          ) | (txd_1           & txd_3          ); // Majority logic
	assign vt_txd_3           = (txd_1           & txd_2          ) | (txd_2           & txd_3          ) | (txd_1           & txd_3          ); // Majority logic
	assign vt_txd_vld_1       = (txd_vld_1       & txd_vld_2      ) | (txd_vld_2       & txd_vld_3      ) | (txd_vld_1       & txd_vld_3      ); // Majority logic
	assign vt_txd_vld_2       = (txd_vld_1       & txd_vld_2      ) | (txd_vld_2       & txd_vld_3      ) | (txd_vld_1       & txd_vld_3      ); // Majority logic
	assign vt_txd_vld_3       = (txd_vld_1       & txd_vld_2      ) | (txd_vld_2       & txd_vld_3      ) | (txd_vld_1       & txd_vld_3      ); // Majority logic

	assign vt_l1abuf_1        = (l1abuf_1        & l1abuf_2       ) | (l1abuf_2        & l1abuf_3       ) | (l1abuf_1        & l1abuf_3       ); // Majority logic
	assign vt_l1abuf_2        = (l1abuf_1        & l1abuf_2       ) | (l1abuf_2        & l1abuf_3       ) | (l1abuf_1        & l1abuf_3       ); // Majority logic
	assign vt_l1abuf_3        = (l1abuf_1        & l1abuf_2       ) | (l1abuf_2        & l1abuf_3       ) | (l1abuf_1        & l1abuf_3       ); // Majority logic
	assign vt_nxt_l1a_sync1_1 = (nxt_l1a_sync1_1 & nxt_l1a_sync1_2) | (nxt_l1a_sync1_2 & nxt_l1a_sync1_3) | (nxt_l1a_sync1_1 & nxt_l1a_sync1_3); // Majority logic
	assign vt_nxt_l1a_sync1_2 = (nxt_l1a_sync1_1 & nxt_l1a_sync1_2) | (nxt_l1a_sync1_2 & nxt_l1a_sync1_3) | (nxt_l1a_sync1_1 & nxt_l1a_sync1_3); // Majority logic
	assign vt_nxt_l1a_sync1_3 = (nxt_l1a_sync1_1 & nxt_l1a_sync1_2) | (nxt_l1a_sync1_2 & nxt_l1a_sync1_3) | (nxt_l1a_sync1_1 & nxt_l1a_sync1_3); // Majority logic
	assign vt_nxt_l1a_sync2_1 = (nxt_l1a_sync2_1 & nxt_l1a_sync2_2) | (nxt_l1a_sync2_2 & nxt_l1a_sync2_3) | (nxt_l1a_sync2_1 & nxt_l1a_sync2_3); // Majority logic
	assign vt_nxt_l1a_sync2_2 = (nxt_l1a_sync2_1 & nxt_l1a_sync2_2) | (nxt_l1a_sync2_2 & nxt_l1a_sync2_3) | (nxt_l1a_sync2_1 & nxt_l1a_sync2_3); // Majority logic
	assign vt_nxt_l1a_sync2_3 = (nxt_l1a_sync2_1 & nxt_l1a_sync2_2) | (nxt_l1a_sync2_2 & nxt_l1a_sync2_3) | (nxt_l1a_sync2_1 & nxt_l1a_sync2_3); // Majority logic
	assign vt_adcdata_1       = (adcdata_1       & adcdata_2      ) | (adcdata_2       & adcdata_3      ) | (adcdata_1       & adcdata_3      ); // Majority logic
	assign vt_adcdata_2       = (adcdata_1       & adcdata_2      ) | (adcdata_2       & adcdata_3      ) | (adcdata_1       & adcdata_3      ); // Majority logic
	assign vt_adcdata_3       = (adcdata_1       & adcdata_2      ) | (adcdata_2       & adcdata_3      ) | (adcdata_1       & adcdata_3      ); // Majority logic
	assign vt_crc_1           = (crc_1           & crc_2          ) | (crc_2           & crc_3          ) | (crc_1           & crc_3          ); // Majority logic
	assign vt_crc_2           = (crc_1           & crc_2          ) | (crc_2           & crc_3          ) | (crc_1           & crc_3          ); // Majority logic
	assign vt_crc_3           = (crc_1           & crc_2          ) | (crc_2           & crc_3          ) | (crc_1           & crc_3          ); // Majority logic
	assign vt_fullwrd_1       = (fullwrd_1       & fullwrd_2      ) | (fullwrd_2       & fullwrd_3      ) | (fullwrd_1       & fullwrd_3      ); // Majority logic
	assign vt_fullwrd_2       = (fullwrd_1       & fullwrd_2      ) | (fullwrd_2       & fullwrd_3      ) | (fullwrd_1       & fullwrd_3      ); // Majority logic
	assign vt_fullwrd_3       = (fullwrd_1       & fullwrd_2      ) | (fullwrd_2       & fullwrd_3      ) | (fullwrd_1       & fullwrd_3      ); // Majority logic
	assign vt_frame_1         = (frame_1         & frame_2        ) | (frame_2         & frame_3        ) | (frame_1         & frame_3        ); // Majority logic
	assign vt_frame_2         = (frame_1         & frame_2        ) | (frame_2         & frame_3        ) | (frame_1         & frame_3        ); // Majority logic
	assign vt_frame_3         = (frame_1         & frame_2        ) | (frame_2         & frame_3        ) | (frame_1         & frame_3        ); // Majority logic
	assign vt_seq1_1          = (seq1_1          & seq1_2         ) | (seq1_2          & seq1_3         ) | (seq1_1          & seq1_3         ); // Majority logic
	assign vt_seq1_2          = (seq1_1          & seq1_2         ) | (seq1_2          & seq1_3         ) | (seq1_1          & seq1_3         ); // Majority logic
	assign vt_seq1_3          = (seq1_1          & seq1_2         ) | (seq1_2          & seq1_3         ) | (seq1_1          & seq1_3         ); // Majority logic
	assign vt_clr_crc_1       = (clr_crc_1       & clr_crc_2      ) | (clr_crc_2       & clr_crc_3      ) | (clr_crc_1       & clr_crc_3      ); // Majority logic
	assign vt_clr_crc_2       = (clr_crc_1       & clr_crc_2      ) | (clr_crc_2       & clr_crc_3      ) | (clr_crc_1       & clr_crc_3      ); // Majority logic
	assign vt_clr_crc_3       = (clr_crc_1       & clr_crc_2      ) | (clr_crc_2       & clr_crc_3      ) | (clr_crc_1       & clr_crc_3      ); // Majority logic
	assign vt_valid1_1        = (valid1_1        & valid1_2       ) | (valid1_2        & valid1_3       ) | (valid1_1        & valid1_3       ); // Majority logic
	assign vt_valid1_2        = (valid1_1        & valid1_2       ) | (valid1_2        & valid1_3       ) | (valid1_1        & valid1_3       ); // Majority logic
	assign vt_valid1_3        = (valid1_1        & valid1_2       ) | (valid1_2        & valid1_3       ) | (valid1_1        & valid1_3       ); // Majority logic
	assign vt_valid2_1        = (valid2_1        & valid2_2       ) | (valid2_2        & valid2_3       ) | (valid2_1        & valid2_3       ); // Majority logic
	assign vt_valid2_2        = (valid2_1        & valid2_2       ) | (valid2_2        & valid2_3       ) | (valid2_1        & valid2_3       ); // Majority logic
	assign vt_valid2_3        = (valid2_1        & valid2_2       ) | (valid2_2        & valid2_3       ) | (valid2_1        & valid2_3       ); // Majority logic
	assign vt_mt_r1_1         = (mt_r1_1         & mt_r1_2        ) | (mt_r1_2         & mt_r1_3        ) | (mt_r1_1         & mt_r1_3        ); // Majority logic
	assign vt_mt_r1_2         = (mt_r1_1         & mt_r1_2        ) | (mt_r1_2         & mt_r1_3        ) | (mt_r1_1         & mt_r1_3        ); // Majority logic
	assign vt_mt_r1_3         = (mt_r1_1         & mt_r1_2        ) | (mt_r1_2         & mt_r1_3        ) | (mt_r1_1         & mt_r1_3        ); // Majority logic
	assign vt_mt_r2_1         = (mt_r2_1         & mt_r2_2        ) | (mt_r2_2         & mt_r2_3        ) | (mt_r2_1         & mt_r2_3        ); // Majority logic
	assign vt_mt_r2_2         = (mt_r2_1         & mt_r2_2        ) | (mt_r2_2         & mt_r2_3        ) | (mt_r2_1         & mt_r2_3        ); // Majority logic
	assign vt_mt_r2_3         = (mt_r2_1         & mt_r2_2        ) | (mt_r2_2         & mt_r2_3        ) | (mt_r2_1         & mt_r2_3        ); // Majority logic
	assign vt_mt_r3_1         = (mt_r3_1         & mt_r3_2        ) | (mt_r3_2         & mt_r3_3        ) | (mt_r3_1         & mt_r3_3        ); // Majority logic
	assign vt_mt_r3_2         = (mt_r3_1         & mt_r3_2        ) | (mt_r3_2         & mt_r3_3        ) | (mt_r3_1         & mt_r3_3        ); // Majority logic
	assign vt_mt_r3_3         = (mt_r3_1         & mt_r3_2        ) | (mt_r3_2         & mt_r3_3        ) | (mt_r3_1         & mt_r3_3        ); // Majority logic

	assign TXD       = vt_txd_1;
	assign TXD_VLD   = vt_txd_vld_1;
	
	assign l1a_out_1 = vt_nxt_l1a_sync1_1 & ~vt_nxt_l1a_sync2_1;
	assign l1a_out_2 = vt_nxt_l1a_sync1_2 & ~vt_nxt_l1a_sync2_2;
	assign l1a_out_3 = vt_nxt_l1a_sync1_3 & ~vt_nxt_l1a_sync2_3;
	
	assign serial_i  = serial_1;
	assign l1a_out_i = l1a_out_1;

	assign l1abuf_i  = vt_l1abuf_1;
	assign fullwrd_i = vt_fullwrd_1;
	assign frame_i   = vt_frame_1;
	assign clr_crc_i = vt_clr_crc_1;
	assign mt_r3_i   = vt_mt_r3_1;

	always @* begin
		case(seq)  // seq counts from 0
			7'd72, 7'd73, 7'd74, 7'd75, 7'd76,7'd77: serial_1 = l1a_phs;
			7'd90, 7'd91, 7'd92, 7'd93, 7'd94,7'd95: serial_1 = (SAMP_MAX == 7'h0F);
			default: serial_1 = 0;
		endcase
		case(seq)  // seq counts from 0
			7'd72, 7'd73, 7'd74, 7'd75, 7'd76,7'd77: serial_2 = l1a_phs;
			7'd90, 7'd91, 7'd92, 7'd93, 7'd94,7'd95: serial_2 = (SAMP_MAX == 7'h0F);
			default: serial_2 = 0;
		endcase
		case(seq)  // seq counts from 0
			7'd72, 7'd73, 7'd74, 7'd75, 7'd76,7'd77: serial_3 = l1a_phs;
			7'd90, 7'd91, 7'd92, 7'd93, 7'd94,7'd95: serial_3 = (SAMP_MAX == 7'h0F);
			default: serial_3 = 0;
		endcase
	end

	always @(posedge WCLK) begin
		nxt_l1a_sync1_1 <= nxt_l1a;
		nxt_l1a_sync1_2 <= nxt_l1a;
		nxt_l1a_sync1_3 <= nxt_l1a;
		nxt_l1a_sync2_1 <= vt_nxt_l1a_sync1_1;
		nxt_l1a_sync2_2 <= vt_nxt_l1a_sync1_2;
		nxt_l1a_sync2_3 <= vt_nxt_l1a_sync1_3;
	end

	always @(posedge WCLK or posedge RST_RESYNC) begin
		if(RST_RESYNC) begin
			l1abuf_1 <= 5'h00;
			l1abuf_2 <= 5'h00;
			l1abuf_3 <= 5'h00;
		end
		else begin
			l1abuf_1 <= (L1A_WRT_EN && !l1a_out_1) ? vt_l1abuf_1 + 1 : ((l1a_out_1 && !L1A_WRT_EN) ? vt_l1abuf_1 - 1 : vt_l1abuf_1);
			l1abuf_2 <= (L1A_WRT_EN && !l1a_out_2) ? vt_l1abuf_2 + 1 : ((l1a_out_2 && !L1A_WRT_EN) ? vt_l1abuf_2 - 1 : vt_l1abuf_2);
			l1abuf_3 <= (L1A_WRT_EN && !l1a_out_3) ? vt_l1abuf_3 + 1 : ((l1a_out_3 && !L1A_WRT_EN) ? vt_l1abuf_3 - 1 : vt_l1abuf_3);
		end
	end

	always @(posedge RCLK) begin
		if(ce) begin
			adcdata_1    <= {1'b0,data_out};
			adcdata_2    <= {1'b0,data_out};
			adcdata_3    <= {1'b0,data_out};
			clr_crc_1    <= clr_crc0;
			clr_crc_2    <= clr_crc0;
			clr_crc_3    <= clr_crc0;
			seq1_1       <= seq;
			seq1_2       <= seq;
			seq1_3       <= seq;
			fullwrd_1 <= ld_l1a_h ? {4'h0,l1ahigh} : (ld_l1a_l ? {4'h0,l1alow} : {1'b0,~ovrlp,serial_1,1'b0,data_out});
			fullwrd_2 <= ld_l1a_h ? {4'h0,l1ahigh} : (ld_l1a_l ? {4'h0,l1alow} : {1'b0,~ovrlp,serial_2,1'b0,data_out});
			fullwrd_3 <= ld_l1a_h ? {4'h0,l1ahigh} : (ld_l1a_l ? {4'h0,l1alow} : {1'b0,~ovrlp,serial_3,1'b0,data_out});
		end
	end
	
	always @(posedge RCLK) begin
		mt_r1_1      <= EVT_BUF_AMT;
		mt_r1_2      <= EVT_BUF_AMT;
		mt_r1_3      <= EVT_BUF_AMT;
		mt_r2_1      <= vt_mt_r1_1;
		mt_r2_2      <= vt_mt_r1_2;
		mt_r2_3      <= vt_mt_r1_3;
		mt_r3_1      <= vt_mt_r2_1;
		mt_r3_2      <= vt_mt_r2_2;
		mt_r3_3      <= vt_mt_r2_3;
		valid1_1     <= valid0;
		valid1_2     <= valid0;
		valid1_3     <= valid0;
		valid2_1     <= vt_valid1_1;
		valid2_2     <= vt_valid1_2;
		valid2_3     <= vt_valid1_3;
		txd_vld_1  <= vt_valid2_1;
		txd_vld_2  <= vt_valid2_2;
		txd_vld_3  <= vt_valid2_3;
	end
	
	always @(posedge RCLK or posedge vt_clr_crc_1) begin
		if(vt_clr_crc_1) begin
			crc_1 <= 15'h0000;
		end
		else begin
			if(ce) begin
				crc_1 <= CRC15_D13(vt_adcdata_1, vt_crc_1);
			end
		end
	end
	always @(posedge RCLK or posedge vt_clr_crc_2) begin
		if(vt_clr_crc_2) begin
			crc_2 <= 15'h0000;
		end
		else begin
			if(ce) begin
				crc_2 <= CRC15_D13(vt_adcdata_2, vt_crc_2);
			end
		end
	end
	always @(posedge RCLK or posedge vt_clr_crc_3) begin
		if(vt_clr_crc_3) begin
			crc_3 <= 15'h0000;
		end
		else begin
			if(ce) begin
				crc_3 <= CRC15_D13(vt_adcdata_3, vt_crc_3);
			end
		end
	end

	always @(posedge RCLK) begin
		if(ce) begin
			case(vt_seq1_1)
				7'd96: frame_1 <= {1'b0,vt_crc_1};
				7'd97: frame_1 <= 16'h700C;
				7'd98: frame_1 <= {4'h7,l1anum[5:0],vt_l1abuf_1,WARN};
				7'd99: frame_1 <= 16'h7FFF;
				default: frame_1 <= vt_fullwrd_1;
			endcase
			case(vt_seq1_2)
				7'd96: frame_2 <= {1'b0,vt_crc_2};
				7'd97: frame_2 <= 16'h700C;
				7'd98: frame_2 <= {4'h7,l1anum[5:0],vt_l1abuf_2,WARN};
				7'd99: frame_2 <= 16'h7FFF;
				default: frame_2 <= vt_fullwrd_2;
			endcase
			case(vt_seq1_3)
				7'd96: frame_3 <= {1'b0,vt_crc_3};
				7'd97: frame_3 <= 16'h700C;
				7'd98: frame_3 <= {4'h7,l1anum[5:0],vt_l1abuf_3,WARN};
				7'd99: frame_3 <= 16'h7FFF;
				default: frame_3 <= vt_fullwrd_3;
			endcase
		end
	end

	always @(posedge RCLK) begin
		if(ce) begin
			txd_1  <= vt_frame_1;
			txd_2  <= vt_frame_2;
			txd_3  <= vt_frame_3;
		end
	end
end
else 
begin : Eth_FIFO_logic

	reg [15:0] txd_r;
	reg txd_vld_r;
	
	reg [4:0] l1abuf;
	reg nxt_l1a_sync1;
	reg nxt_l1a_sync2;
	reg [12:0] adcdata;
	reg [14:0] crc;
	reg [15:0] fullwrd;
	reg [15:0] frame;
	reg [6:0] seq1;
	reg clr_crc;
	reg valid1;
	reg valid2;
	reg mt_r1;
	reg mt_r2;
	reg mt_r3;

	reg serial;

	wire l1a_out;

	assign TXD       = txd_r;
	assign TXD_VLD   = txd_vld_r;
	assign l1a_out   = nxt_l1a_sync1 & ~nxt_l1a_sync2;
	
	assign serial_i  = serial;
	assign l1a_out_i = l1a_out;

	assign l1abuf_i  = l1abuf;
	assign fullwrd_i = fullwrd;
	assign frame_i   = frame;
	assign clr_crc_i = clr_crc;
	assign mt_r3_i   = mt_r3;

	always @* begin
		case(seq)  // seq counts from 0
			7'd72, 7'd73, 7'd74, 7'd75, 7'd76,7'd77: serial = l1a_phs;
			7'd90, 7'd91, 7'd92, 7'd93, 7'd94,7'd95: serial = (SAMP_MAX == 7'h0F);
			default: serial = 0;
		endcase
	end

	always @(posedge WCLK) begin
		nxt_l1a_sync1 <= nxt_l1a;
		nxt_l1a_sync2 <= nxt_l1a_sync1;
	end

	always @(posedge WCLK or posedge RST_RESYNC) begin
		if(RST_RESYNC) begin
			l1abuf <= 5'h00;
		end
		else begin
			l1abuf <= (L1A_WRT_EN && !l1a_out) ? l1abuf + 1 : ((l1a_out && !L1A_WRT_EN) ? l1abuf - 1 : l1abuf);
		end
	end

	always @(posedge RCLK) begin
		if(ce) begin
			adcdata <= {1'b0,data_out};
			clr_crc <= clr_crc0;
			seq1    <= seq;
			fullwrd <= ld_l1a_h ? {4'h0,l1ahigh} : (ld_l1a_l ? {4'h0,l1alow} : {1'b0,~ovrlp,serial,1'b0,data_out});
		end
	end
	
	always @(posedge RCLK) begin
		mt_r1 <= EVT_BUF_AMT;
		mt_r2 <= mt_r1;
		mt_r3 <= mt_r2;
		valid1  <= valid0;
		valid2  <= valid1;
		txd_vld_r  <= valid2;
	end

	always @(posedge RCLK or posedge clr_crc) begin
		if(clr_crc) begin
			crc <= 15'h0000;
		end
		else
			if(ce) begin
				crc <= CRC15_D13(adcdata, crc);
			end
	end


	always @(posedge RCLK) begin
		if(ce)
			case(seq1)
				7'd96: frame <= {1'b0,crc};
				7'd97: frame <= 16'h700C;
				7'd98: frame <= {4'h7,l1anum[5:0],l1abuf,WARN};
				7'd99: frame <= 16'h7FFF;
				default: frame <= fullwrd;
			endcase
	end

	always @(posedge RCLK) begin
		if(ce) begin
			txd_r  <= frame;
		end
	end
end
endgenerate


generate
if(TMR==1 && TMR_Err_Det==1) 
begin : Smp_Proc_FSM_TMR_Err_Det
	Sample_Proc_FSM_TMR_Err_Det 
	Sample_Proc_FSM1 (
		.CE(ce),
		.CLR_CRC(clr_crc0),
		.LAST_WRD(nxt_l1a),
		.LD_L1A_H(ld_l1a_h),
		.LD_L1A_L(ld_l1a_l),
		.RD(nxt_wrd),
		.SEQ(seq),
		.VALID(valid0),
		.SMP_STATE(frm_state),
		.TMR_ERR_COUNT(SMPPRC_ERRCNT),
		.CLK(RCLK),
		.FAMT(mt_r3_i),
		.L1A_BUF_MT(l1a_buf_mt),
		.L1A_HEAD(L1A_HEAD),
		.RST(RST_RESYNC),
		.SAMP_MAX(SAMP_MAX),
		.TXACK(TXACK)
	);
end
else if(TMR==1) 
begin : Smp_Proc_FSM_TMR
	Sample_Proc_FSM_TMR 
	Sample_Proc_FSM1 (
		.CE(ce),
		.CLR_CRC(clr_crc0),
		.LAST_WRD(nxt_l1a),
		.LD_L1A_H(ld_l1a_h),
		.LD_L1A_L(ld_l1a_l),
		.RD(nxt_wrd),
		.SEQ(seq),
		.VALID(valid0),
		.SMP_STATE(frm_state),
		.CLK(RCLK),
		.FAMT(mt_r3_i),
		.L1A_BUF_MT(l1a_buf_mt),
		.L1A_HEAD(L1A_HEAD),
		.RST(RST_RESYNC),
		.SAMP_MAX(SAMP_MAX),
		.TXACK(TXACK)
	);
assign SMPPRC_ERRCNT = 0;
end
else 
begin : Smp_Proc_FSM
	Sample_Proc_FSM 
	Sample_Proc_FSM1 (
		.CE(ce),
		.CLR_CRC(clr_crc0),
		.LAST_WRD(nxt_l1a),
		.LD_L1A_H(ld_l1a_h),
		.LD_L1A_L(ld_l1a_l),
		.RD(nxt_wrd),
		.SEQ(seq),
		.VALID(valid0),
		.SMP_STATE(frm_state),
		.CLK(RCLK),
		.FAMT(mt_r3_i),
		.L1A_BUF_MT(l1a_buf_mt),
		.L1A_HEAD(L1A_HEAD),
		.RST(RST_RESYNC),
		.SAMP_MAX(SAMP_MAX),
		.TXACK(TXACK)
	);
assign SMPPRC_ERRCNT = 0;
end
endgenerate

function [14:0] CRC15_D13 (input [12:0] d, input [14:0] c);
  reg [14:0] newcrc;
  begin
    newcrc[0] =   d[0] ^                  c[2];
    newcrc[1] =   d[0] ^  d[1] ^  c[2] ^  c[3];
    newcrc[2] =   d[1] ^  d[2] ^  c[3] ^  c[4];
    newcrc[3] =   d[2] ^  d[3] ^  c[4] ^  c[5];
    newcrc[4] =   d[3] ^  d[4] ^  c[5] ^  c[6];
    newcrc[5] =   d[4] ^  d[5] ^  c[6] ^  c[7];
    newcrc[6] =   d[5] ^  d[6] ^  c[7] ^  c[8];
    newcrc[7] =   d[6] ^  d[7] ^  c[8] ^  c[9];
    newcrc[8] =   d[7] ^  d[8] ^  c[9] ^ c[10];
    newcrc[9] =   d[8] ^  d[9] ^ c[10] ^ c[11];
    newcrc[10] =  d[9] ^ d[10] ^ c[11] ^ c[12];
    newcrc[11] = d[10] ^ d[11] ^ c[12] ^ c[13];
    newcrc[12] = d[11] ^ d[12] ^ c[13] ^ c[14];
    newcrc[13] = d[12]         ^ c[14] ^  c[0];
    newcrc[14] =                          c[1];
    CRC15_D13 = newcrc;
  end
endfunction
	
endmodule

