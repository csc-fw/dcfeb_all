`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:21 05/27/2011 
// Design Name: 
// Module Name:    readout_fifo 
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
module readout_fifo #(
	parameter USE_CHIPSCOPE = 1
	)(
    inout [35:0] CSP_CNTRL,
    input WCLK,
    input RCLK,
    input CMSCLK,
    input RST,
	 input [6:0] SAMP_MAX,
	 input [11:0] WDATA,
	 input WREN,
	 input L1A,
	 input L1A_MATCH,
	 input L1A_PHASE,
	 input RESYNC,
	output l1a_push,
	 output reg LAST_WRD,
	 output reg DVALID,
    output reg [15:0] DOUT
    );


// signals for readout FIFO
	wire famt0;
	wire fafl0;
	wire fmt0;
	wire ffl0;
	wire [9:0] rdcount0;
	wire rderr0;
	wire [9:0] wrcount0;
	wire wrerr0;
	wire [11:0] fout0;
	
// signals for L1A buffer
	wire l1a_buf_amt0;
	wire l1a_buf_afl0;
	wire l1a_buf_mt0;
	wire l1a_buf_fl0;
	wire [10:0] l1a_buf_rdcount0;
	wire l1a_buf_rderr0;
	wire [10:0] l1a_buf_wrcount0;
	wire l1a_buf_wrerr0;
	
wire ovrlp;
reg serial;
wire warn;
wire l1a_phs;
reg  l1a_push;
wire nxt_l1a;
wire nxt_wrd;
reg [4:0] l1abuf;
reg [5:0] l1acnt;
wire [5:0] l1anum;
reg [12:0] adcdata;
reg [14:0] crc;
reg [15:0] fullwrd;
reg [15:0] frame;

wire inc_seq;
wire rst_seq;
wire inc_smp;
wire rst_smp;
wire last_wrd0;
wire valid0;
wire clr_crc0;
reg [6:0] smp;
reg [6:0] seq,seq1;
reg clr_crc;
reg valid1,valid2;
wire [2:0] frm_state;

assign ovrlp = 0;
assign nxt_l1a = last_wrd0;
assign warn = l1a_buf_afl0;
	
generate 
if(USE_CHIPSCOPE==1)
begin
//
// Logic analyzer for readout FIFO
wire [127:0] readout_fifo_la_data;
wire [11:0] readout_fifo_la_trig;

readout_la la3_readout (
    .CONTROL(CSP_CNTRL),
    .CLK(RCLK),
    .DATA(readout_fifo_la_data),  // IN BUS [127:0]
    .TRIG0(readout_fifo_la_trig)  // IN BUS [11:0]
);


// LA Data [109:0]
	assign readout_fifo_la_data[15:0]    = frame;
	assign readout_fifo_la_data[16]      = valid2;
	assign readout_fifo_la_data[17]      = last_wrd0;
	assign readout_fifo_la_data[24:18]   = seq1;
	assign readout_fifo_la_data[40:25]   = fullwrd;
	assign readout_fifo_la_data[55:41]   = crc;
	assign readout_fifo_la_data[56]      = clr_crc;
	assign readout_fifo_la_data[57]      = valid1;
	assign readout_fifo_la_data[63:58]   = l1anum;
	assign readout_fifo_la_data[64]      = l1a_phs;
	assign readout_fifo_la_data[65]      = serial;
	assign readout_fifo_la_data[66]      = nxt_wrd;
	assign readout_fifo_la_data[67]      = nxt_l1a;
	assign readout_fifo_la_data[72:68]   = l1abuf;
	assign readout_fifo_la_data[79:73]   = SAMP_MAX;
	assign readout_fifo_la_data[80]      = l1a_buf_mt0;
	assign readout_fifo_la_data[81]      = famt0;
	assign readout_fifo_la_data[85:82]   = frm_state;
	assign readout_fifo_la_data[86]      = 1'b0;
	assign readout_fifo_la_data[87]      = L1A;
	assign readout_fifo_la_data[88]      = l1a_push;
	assign readout_fifo_la_data[94:89]   = l1acnt;
	assign readout_fifo_la_data[95]      = CMSCLK;
	assign readout_fifo_la_data[96]      = RCLK;
	assign readout_fifo_la_data[97]      = l1a_buf_amt0;
	assign readout_fifo_la_data[98]      = l1a_buf_rderr0;
	assign readout_fifo_la_data[99]      = l1a_buf_wrerr0;
	assign readout_fifo_la_data[103:100] = l1a_buf_rdcount0[3:0];
	assign readout_fifo_la_data[107:104] = l1a_buf_wrcount0[3:0];
	assign readout_fifo_la_data[108]     = L1A_PHASE;
	assign readout_fifo_la_data[109]     = 1'b0;
	assign readout_fifo_la_data[110]     = 1'b0;
	assign readout_fifo_la_data[111]     = 1'b0;
	assign readout_fifo_la_data[127:112] = 16'h0000;

// LA Trigger [11:0]
	assign readout_fifo_la_trig[0]       = nxt_wrd;
	assign readout_fifo_la_trig[1]       = nxt_l1a;
	assign readout_fifo_la_trig[2]       = last_wrd0;
	assign readout_fifo_la_trig[3]       = clr_crc;
	assign readout_fifo_la_trig[4]       = valid0;
	assign readout_fifo_la_trig[5]       = l1a_buf_mt0;
	assign readout_fifo_la_trig[6]       = famt0;
	assign readout_fifo_la_trig[7]       = L1A;
	assign readout_fifo_la_trig[11:8]    = 4'h0;
	

end
endgenerate

   FIFO_DUALCLOCK_MACRO  #(
      .DEVICE("VIRTEX6"),  // Target device: "VIRTEX5", "VIRTEX6" 
      .ALMOST_EMPTY_OFFSET(9'h006), // Sets the almost empty threshold
      .ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
      .DATA_WIDTH(12), // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      .FIFO_SIZE ("18Kb"), // Target BRAM: "18Kb" or "36Kb" 
      .FIRST_WORD_FALL_THROUGH ("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
   ) Readout_FIFO1 (
      .ALMOSTEMPTY(famt0), // 1-bit output almost empty
      .ALMOSTFULL(fafl0),   // 1-bit output almost full
      .DO(fout0),                   // Output data, width defined by DATA_WIDTH parameter
      .EMPTY(fmt0),             // 1-bit output empty
      .FULL(ffl0),               // 1-bit output full
      .RDCOUNT(rdcount0),         // Output read count, width determined by FIFO depth
      .RDERR(rderr0),             // 1-bit output read error
      .WRCOUNT(wrcount0),         // Output write count, width determined by FIFO depth
      .WRERR(wrerr0),             // 1-bit output write error
      .DI(WDATA),                   // Input data, width defined by DATA_WIDTH parameter
      .RDCLK(RCLK),             // 1-bit input read clock
      .RDEN(nxt_wrd),               // 1-bit input read enable
      .RST(RST),                 // 1-bit input reset
      .WRCLK(WCLK),             // 1-bit input write clock
      .WREN(WREN)                // 1-bit input write enable
   );


always @(posedge CMSCLK) begin
	if(RESYNC)
	   l1acnt <= 6'h00;
	else
		if(L1A)
			l1acnt <= l1acnt + 1;
		else
			l1acnt <= l1acnt;
end

always @(posedge CMSCLK) begin
	l1a_push <= L1A_MATCH;
end


   FIFO_DUALCLOCK_MACRO  #(
      .DEVICE("VIRTEX6"),  // Target device: "VIRTEX5", "VIRTEX6" 
      .ALMOST_EMPTY_OFFSET(11'h006), // Sets the almost empty threshold
      .ALMOST_FULL_OFFSET(11'h080),  // Sets almost full threshold
      .DATA_WIDTH(7), // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      .FIFO_SIZE ("18Kb"), // Target BRAM: "18Kb" or "36Kb" 
      .FIRST_WORD_FALL_THROUGH ("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
   ) l1abuf1 (
      .ALMOSTEMPTY(l1a_buf_amt0), // 1-bit output almost empty
      .ALMOSTFULL(l1a_buf_afl0),   // 1-bit output almost full
      .DO({l1a_phs,l1anum}),                   // Output data, width defined by DATA_WIDTH parameter
      .EMPTY(l1a_buf_mt0),             // 1-bit output empty
      .FULL(l1a_buf_fl0),               // 1-bit output full
      .RDCOUNT(l1a_buf_rdcount0),         // Output read count, width determined by FIFO depth
      .RDERR(l1a_buf_rderr0),             // 1-bit output read error
      .WRCOUNT(l1a_buf_wrcount0),         // Output write count, width determined by FIFO depth
      .WRERR(l1a_buf_wrerr0),             // 1-bit output write error
      .DI({L1A_PHASE,l1acnt}),                   // Input data, width defined by DATA_WIDTH parameter
      .RDCLK(RCLK),             // 1-bit input read clock
      .RDEN(nxt_l1a),               // 1-bit input read enable
      .RST(RST),                 // 1-bit input reset
      .WRCLK(CMSCLK),             // 1-bit input write clock
      .WREN(l1a_push)                // 1-bit input write enable
   );

always @* begin
	case(seq)  // seq counts from 0
		7'd72, 7'd73, 7'd74, 7'd75, 7'd76,7'd77: serial = l1a_phs;
		default: serial = 0;
	endcase
end

always @(posedge RCLK) begin
	adcdata <= {1'b0,fout0};
	fullwrd <= {1'b0,~ovrlp,serial,1'b0,fout0};
	clr_crc <= clr_crc0;
	seq1    <= seq;
	valid1  <= valid0;
	valid2  <= valid1;
	DVALID  <= valid2;
	DOUT    <= frame;
	LAST_WRD <= last_wrd0;
end
always @(posedge RCLK or posedge clr_crc) begin
	if(clr_crc)
		crc <= 15'h0000;
	else
		crc <= CRC15_D13(adcdata, crc);
end

always @(posedge RCLK) begin
	case(seq1)
		7'd96: frame <= {1'b0,crc};
		7'd97: frame <= 16'h700C;
		7'd98: frame <= {4'h7,l1anum,l1abuf,warn};
		7'd99: frame <= 16'h7FFF;
		default: frame <= fullwrd;
	endcase
end

always @(posedge RCLK or posedge RST) begin
	if(RST)
		l1abuf <= 5'h00;
	else
		if(l1a_push)
			l1abuf <= l1abuf + 1;
		else if(nxt_l1a)
			l1abuf <= l1abuf - 1;
		else
			l1abuf <= l1abuf;
end

always @(posedge RCLK or posedge RST) begin
	if(RST)
		smp <= 7'h00;
	else
		if(inc_smp)
			smp <= smp +1;
		else if(rst_smp)
			smp <= 7'h00;
		else
			smp <= smp;
end
always @(posedge RCLK or posedge RST) begin
	if(RST)
		seq <= 7'h00;
	else
		if(inc_seq)
			seq <= seq +1;
		else if(rst_seq)
			seq <= 7'h00;
		else
			seq <= seq;
end


Frame_Seq_FSM 
Frame_Seq_FSM1 (
   .CLR_CRC(clr_crc0),
   .INC_SEQ(inc_seq),
   .INC_SMP(inc_smp),
   .LAST_WRD(last_wrd0),
   .RD(nxt_wrd),
   .RST_SEQ(rst_seq),
   .RST_SMP(rst_smp),
   .VALID(valid0),
	.FRM_STATE(frm_state),
   .CLK(RCLK),
   .FAMT(famt0),
   .L1A_BUF_MT(l1a_buf_mt0),
   .RST(RST),
   .SAMP_MAX(SAMP_MAX),
   .SEQ(seq),
   .SMP(smp)
);
  


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
