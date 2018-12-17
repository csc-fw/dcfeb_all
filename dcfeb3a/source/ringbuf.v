`timescale 1ns / 1ps
module ringbuf (
   input CLK,
	input RST_RESYNC,
	input [6:0] SAMP_MAX,
	input [11:0] WDATA,
	input WREN,
	input [43:0] L1A_SMP_DATA,
	input L1A_WRT_EN,
	output [36:0] L1A_EVT_DATA,
	output L1A_EVT_PUSH,
	output [17:0] RDATA,
	output reg DATA_PUSH
   );


wire [11:0] ring_out;
	
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
reg [12:0] wrt_addr;
reg [11:0] rd_addr;
reg [11:0] rdaddrecc;
wire strt_addr;
reg  prev_strt_addr;
wire mask_b12;
wire [12:0] ring_cnt;
wire ring_amt;

wire ovrlp;
wire movlp;
wire warn;
wire l1a_match_smp;
wire l1a_phase_smp;
wire ovrlap_smp;
wire multi_ovlp_smp;
wire l1a_phs;
reg  l1a_push;
wire nxt_l1a;
wire nxt_wrd;
wire valid1;
reg [4:0] l1abuf;
reg [4:0] ovrlap_cnt;
reg [4:0] ocnt;
reg [23:0] l1acnt;
reg [11:0] l1amcnt;
wire [23:0] l1anum;
reg [11:0] l1a_mtch_num;
wire [3:0] evt_state;

wire inc_seq;
wire rst_seq;
wire inc_smp;
wire rst_smp;
reg [6:0] smp;
reg [6:0] seq;


assign injectdbiterr = 0;
assign injectsbiterr = 0;
assign {multi_ovlp_smp,ovrlap_smp,l1a_phase_smp,l1a_match_smp,ovrlap_cnt,l1amcnt,l1acnt} = L1A_SMP_DATA;
assign l1a_push     = L1A_WRT_EN & l1a_match_smp;
assign ring_cnt     = wrt_addr - strt_addr;
assign ring_amt     = (ring_cnt < 13'd7);
assign warn         = (ring_cnt > 13'd4000);
assign ring_err     = (ring_cnt > 13'h0FFF);
assign mask_b12     = (({1'b0,strt_addr} - prev_strt_addr) >= 0);
assign L1A_EVT_DATA = {l1a_phs,l1a_mtch_num,l1anum};
assign L1A_EVT_PUSH = ld_addr;
assign RDATA        = {movlp,ovrlp,ocnt,ring_out};

always @(posedge CLK or posedge RST_RESYNC) begin
	if(RST_RESYNC)
		wrt_addr <= 13'h0000;
	else
		if(WREN)
			wrt_addr <= (wrt_addr & {mask_b12,12'hFFF}) + 1;
		else
			wrt_addr <= (wrt_addr & {mask_b12,12'hFFF});
end


	ring_l1a_buf ring_l1a_buf_i (
	  .clk(CLK), // input clk for read and write
	  .rst(RST_RESYNC),
	  .din({l1a_phase_smp,wrt_addr[11:0],l1amcnt,l1acnt}), // input [48 : 0] din
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
	  .addra(wrt_addr[11:0]),                 // input [11 : 0] addra
	  .dina({multi_ovlp_smp,ovrlap_smp,ovrlap_cnt,WDATA}), // input [17 : 0] dina
	  .clkb(CLK),
	  .addrb(rd_addr),                  // input [11 : 0] addrb
	  .doutb({movlp,ovrlp,ocnt,ring_out}), // output [17 : 0] doutb
	  .injectsbiterr(injectsbiterr),
	  .injectdbiterr(injectdbiterr),
	  .sbiterr(ring_sbiterr),
	  .dbiterr(ring_dbiterr),
	  .rdaddrecc(rdaddrecc)             // output [11 : 0] rdaddrecc
	);



always @(posedge CLK or posedge RST_RESYNC) begin
	if(RST_RESYNC)
		prev_strt_addr <= 12'h000;
	else
		if(nxt_l1a)
			prev_strt_addr <= strt_addr;
		else
			prev_strt_addr <= prev_strt_addr;
end

always @(posedge CLK or posedge RST_RESYNC) begin
	if(RST_RESYNC)
		rd_addr <= 12'h000;
	else
		if(ld_addr)
			rd_addr <= strt_addr;
		else if(nxt_wrd)
			rd_addr <= rd_addr + 1;
		else
			rd_addr <= rd_addr;
end



always @(posedge CLK or posedge RST_RESYNC) begin
	if(RST_RESYNC)
		l1abuf <= 5'h00;
	else
		if(l1a_push && !nxt_l1a)
			l1abuf <= l1abuf + 1;
		else if(nxt_l1a && !l1a_push)
			l1abuf <= l1abuf - 1;
		else
			l1abuf <= l1abuf;
end

always @(posedge CLK or posedge RST_RESYNC) begin
	if(RST_RESYNC)
		smp <= 7'h00;
	else
		if(inc_smp)
			smp <= smp +1;
		else if(rst_smp)
			smp <= 7'h00;
		else
			smp <= smp;
end
always @(posedge CLK or posedge RST_RESYNC) begin
	if(RST_RESYNC)
		seq <= 7'h00;
	else
		if(inc_seq)
			seq <= seq +1;
		else if(rst_seq)
			seq <= 7'h00;
		else
			seq <= seq;
end

always @(posedge CLK) begin
	valid1 <= nxt_wrd;
	DATA_PUSH <= valid1;
end


Ring_Trans 
Ring_Trans_FSM (
   .INC_SEQ(inc_seq),
   .INC_SMP(inc_smp),
   .NXT_L1A(nxt_l1a),
   .RD(nxt_wrd),
   .RST_SEQ(rst_seq),
   .RST_SMP(rst_smp),
	.EVT_STATE(evt_state),
   .CLK(CLK),
   .L1A_BUF_MT(l1a_buf_mt),
   .RING_AMT(ring_amt),
   .RST(RST_RESYNC),
   .SAMP_MAX(SAMP_MAX),
   .SEQ(seq),
   .SMP(smp)
);
	
endmodule

