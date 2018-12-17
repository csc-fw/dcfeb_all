`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:25 12/30/2013 
// Design Name: 
// Module Name:    auto_load_const 
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
module auto_load_const #(
	parameter USE_CHIPSCOPE = 0,
	parameter TMR = 0,
	parameter TMR_Err_Det = 0
)
(
	inout [35:0] VIO_CNTRL,
	inout [35:0] LA_CNTRL,
    input CLK,
    input RST,
    input BUSY,
    input AL_START,
    input AL_DONE,
	 input BPI_LOAD_DATA,
	 input [15:0] BPI_AL_REG,
	 input AUTO_LOAD,
	 output CSP_AL_START,
    output [22:0] AL_ADDR,
    output [15:0] AL_CMD_DATA_OUT,
    output [1:0] AL_OP,
    output AL_EXECUTE,
    output AUTO_LOAD_ENA,
    output CLR_AL_DONE,
    output wire [5:0] AL_CNT,
    output [2:0] AL_STATUS
    );

localparam Read_Array_Cmd = 16'h00FF;

wire [22:0] base_addr;
wire [2:0] al_blk;
wire [1:0] al_pblk;
wire al_aborted;
wire al_completed;
wire [3:0] al_state;


generate
if(USE_CHIPSCOPE==1) 
begin : chipscope_auto_load
//
// Logic analyzer and i/o for auto loading constants
//wire [127:0] al_vio_async_in;
//wire [59:0]  al_vio_async_out;
wire [31:0] al_vio_sync_in;
wire [3:0]  al_vio_sync_out;
wire [64:0] al_la_data;
wire [7:0] al_la_trig;

//wire [3:0] dummy_asigs;
wire [3:0] dummy_ssigs;

	auto_load_vio auto_load_vio_i (
		 .CONTROL(VIO_CNTRL), // INOUT BUS [35:0]
		 .CLK(CLK),
//		 .ASYNC_IN(al_vio_async_in), // IN BUS [127:0]
//		 .ASYNC_OUT(al_vio_async_out), // OUT BUS [59:0]
		 .SYNC_IN(al_vio_sync_in), // IN BUS [31:0]
		 .SYNC_OUT(al_vio_sync_out) // OUT BUS [3:0]
	);


//		 ASYNC_IN [127:0]
//	assign al_vio_async_in[127:0]     = {rbkbuf0,rbkbuf1,rbkbuf2,rbkbuf3,rbkbuf4,rbkbuf5,rbkbuf6,rbkbuf7};
		 
//		 ASYNC_OUT [59:0]
//	assign csp_start_offset    = al_vio_async_out[15:0];
//	assign dummy_asigs[2:0]    = al_vio_async_out[59:57];

//		 SYNC_IN [31:0]
	assign al_vio_sync_in[3:0]     = al_state; // seq_state
	assign al_vio_sync_in[6:4]     = AL_STATUS;
	assign al_vio_sync_in[29:7]    = AL_ADDR;
	assign al_vio_sync_in[31:30]   = 2'b00;

//		 SYNC_OUT [3:0]
	assign CSP_AL_START        = al_vio_sync_out[0];
	assign dummy_ssigs[3:1] 	= al_vio_sync_out[3:1];

auto_load_la auto_load_la_i (
    .CONTROL(LA_CNTRL),
    .CLK(CLK),
    .DATA(al_la_data),  // IN BUS [64:0]
    .TRIG0(al_la_trig)  // IN BUS [7:0]
);

// LA Data [64:0]
	assign al_la_data[3:0]     = al_state[3:0];
	assign al_la_data[26:4]    = AL_ADDR[22:0];
	assign al_la_data[29:27]   = AL_CNT[2:0];
	assign al_la_data[32:30]   = al_blk[2:0];
	assign al_la_data[34:33]   = al_pblk[1:0];
	assign al_la_data[50:35]   = BPI_AL_REG[15:0];
	assign al_la_data[53:51]   = AL_STATUS[2:0];
	assign al_la_data[54]      = BUSY;
	assign al_la_data[55]      = AL_START;
	assign al_la_data[56]      = AL_DONE;
	assign al_la_data[57]      = CSP_AL_START;
	assign al_la_data[58]      = AL_EXECUTE;
	assign al_la_data[59]      = AUTO_LOAD_ENA;
	assign al_la_data[60]      = CLR_AL_DONE;
	assign al_la_data[61]      = al_aborted;
	assign al_la_data[62]      = al_completed;
	assign al_la_data[63]      = BPI_LOAD_DATA;
	assign al_la_data[64]      = AUTO_LOAD;
	

// LA Trigger [7:0]
	assign al_la_trig[0]       = AL_START;
	assign al_la_trig[1]       = CSP_AL_START;
	assign al_la_trig[2]       = AL_DONE;
	assign al_la_trig[3]       = BUSY;
	assign al_la_trig[4]       = AL_EXECUTE;
	assign al_la_trig[5]       = AUTO_LOAD_ENA;
	assign al_la_trig[6]       = CLR_AL_DONE;
	assign al_la_trig[7]       = 1'b0;
	
end
else
begin
	assign CSP_AL_START = 0;
end
endgenerate

//assign base_addr = 23'h7FC000; //Last parameter block 0x7FC000
assign base_addr = 23'h780000; //Starting address of parameter bank (7 main blocks + 4 parameter blocks)
assign AL_ADDR = {base_addr[22:19],al_blk,al_pblk,8'b00000000,AL_CNT};
assign AL_CMD_DATA_OUT = Read_Array_Cmd;
assign AL_OP = 2'b10;



generate
if(TMR==1) 
begin : BPI_intrf_FSM_TMR

	(* syn_preserve = "true" *) reg [2:0] al_status_r_1;
	(* syn_preserve = "true" *) reg [2:0] al_status_r_2;
	(* syn_preserve = "true" *) reg [2:0] al_status_r_3;
	
	(* syn_keep = "true" *) wire [2:0] vt_al_status_r_1;
	(* syn_keep = "true" *) wire [2:0] vt_al_status_r_2;
	(* syn_keep = "true" *) wire [2:0] vt_al_status_r_3;
	
	assign vt_al_status_r_1 = (al_status_r_1 & al_status_r_2) | (al_status_r_2 & al_status_r_3) | (al_status_r_1 & al_status_r_3); // Majority logic
	assign vt_al_status_r_2 = (al_status_r_1 & al_status_r_2) | (al_status_r_2 & al_status_r_3) | (al_status_r_1 & al_status_r_3); // Majority logic
	assign vt_al_status_r_3 = (al_status_r_1 & al_status_r_2) | (al_status_r_2 & al_status_r_3) | (al_status_r_1 & al_status_r_3); // Majority logic
	
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			al_status_r_1 <= 3'b000;
			al_status_r_2 <= 3'b000;
			al_status_r_3 <= 3'b000;
		end
		else 
			if(CLR_AL_DONE) begin
				al_status_r_1 <= 3'b000;
				al_status_r_2 <= 3'b000;
				al_status_r_3 <= 3'b000;
			end
			else if(al_aborted) begin
				al_status_r_1 <= {1'b1,vt_al_status_r_1[1:0]};
				al_status_r_2 <= {1'b1,vt_al_status_r_2[1:0]};
				al_status_r_3 <= {1'b1,vt_al_status_r_3[1:0]};
			end
			else if(AL_DONE) begin
				al_status_r_1 <= {vt_al_status_r_1[2],1'b1,vt_al_status_r_1[0]};
				al_status_r_2 <= {vt_al_status_r_2[2],1'b1,vt_al_status_r_2[0]};
				al_status_r_3 <= {vt_al_status_r_3[2],1'b1,vt_al_status_r_3[0]};
			end
			else if(al_completed) begin
				al_status_r_1 <= {vt_al_status_r_1[2:1],1'b1};
				al_status_r_2 <= {vt_al_status_r_2[2:1],1'b1};
				al_status_r_3 <= {vt_al_status_r_3[2:1],1'b1};
			end
			else begin
				al_status_r_1 <= vt_al_status_r_1;
				al_status_r_2 <= vt_al_status_r_2;
				al_status_r_3 <= vt_al_status_r_3;
			end
	end
	
	auto_load_FSM_TMR #(
		.MAX_ADDR(6'd33),
		.MAX_BLK(3'd7),
		.MAX_PBLK(2'd3),
		.SKIP_PBLK(2'd2)
	)
	auto_load_FSM_i(
	  .ABORTED(al_aborted),
	  .AL_BLK(al_blk),
	  .AL_CNT(AL_CNT),
	  .AL_ENA(AUTO_LOAD_ENA),
	  .AL_PBLK(al_pblk),
	  .CLR_AL_DONE(CLR_AL_DONE),
	  .COMPLETED(al_completed),
	  .EXECUTE(AL_EXECUTE),
	  .state(al_state),
	  .AL_DONE(AL_DONE),
	  .BUSY(BUSY),
	  .CLK(CLK),
	  .RST(RST),
	  .START(AL_START)
	);
	
	assign AL_STATUS = vt_al_status_r_1;
	
end
else 
begin : BPI_intrf_FSM

	reg [2:0] al_status_r;
	
	always @(posedge CLK or posedge RST) begin
		if(RST)
			al_status_r <= 3'b000;
		else
			if(CLR_AL_DONE)
				al_status_r <= 3'b000;
			else if(al_aborted)
				al_status_r <= {1'b1,al_status_r[1:0]};
			else if(AL_DONE)
				al_status_r <= {al_status_r[2],1'b1,al_status_r[0]};
			else if(al_completed)
				al_status_r <= {al_status_r[2:1],1'b1};
			else
				al_status_r <= al_status_r;
	end
	
	auto_load_FSM #(
		.MAX_ADDR(6'd33),
		.MAX_BLK(3'd7),
		.MAX_PBLK(2'd3),
		.SKIP_PBLK(2'd2)
	)
	auto_load_FSM_i(
	  .ABORTED(al_aborted),
	  .AL_BLK(al_blk),
	  .AL_CNT(AL_CNT),
	  .AL_ENA(AUTO_LOAD_ENA),
	  .AL_PBLK(al_pblk),
	  .CLR_AL_DONE(CLR_AL_DONE),
	  .COMPLETED(al_completed),
	  .EXECUTE(AL_EXECUTE),
	  .state(al_state),
	  .AL_DONE(AL_DONE),
	  .BUSY(BUSY),
	  .CLK(CLK),
	  .RST(RST),
	  .START(AL_START)
	);
	
	assign AL_STATUS = al_status_r;
	
end
endgenerate

endmodule
