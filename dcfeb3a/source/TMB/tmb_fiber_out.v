`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:36:50 08/05/2011 
// Design Name: 
// Module Name:    tmb_fiber_out 
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
module tmb_fiber_out #(
	parameter SIM_SPEEDUP = 0,
	parameter XDCFEB = 0,
	parameter TMR = 0
)
(
	input RST,
   input TRG_OP_TX_DISABLE,
//	input TRG_SIGDET, // unused
	input TRG_RX_N,
	input TRG_RX_P,
	output TRG_TDIS,
	output TRG_TX_N,
	output TRG_TX_P,
	input [7:0] G1C,
	input [7:0] G2C,
	input [7:0] G3C,
	input [7:0] G4C,
	input [7:0] G5C,
	input [7:0] G6C,
	input TRG_TX_REFCLK,
	input TRG_TXUSRCLK,
	input TRG_CLK80,
	input TRG_GTXTXRST,
	input TRG_TX_PLLRST,
	input TRG_RST,
	input ENA_TEST_PAT,
	input [2:0] TMB_TX_MODE,
	input [29:0] LAY1_TO_6_HALF_STRIP,
	input [5:0] LAYER_MASK,
	input TRG_PULSE,
	input INJ_ERR,
	output TRG_TX_PLL_LOCK,
	output TRG_TXRESETDONE,
	output TX_SYNC_DONE,
	output STRT_LTNCY,
	output LTNCY_TRIG,
	output MON_TX_SEL,
	output [3:0] MON_TRG_TX_ISK,
	output [31:0] MON_TRG_TX_DATA
	);
	
wire trg_tx_dis;
//wire trg_sd; //unused

reg [15:0] frm_sep;

//Inputs to TRG GTX transmitter
wire [3:0] trg_tx_isk;
wire [31:0] trg_tx_data;
wire tx_dlyalignreset;
wire tx_enpmaphasealign;
wire tx_pmasetphase;
wire [7:0] tx_dly_align_mon;
wire tx_dly_align_mon_ena;

// Dummy outputs
wire trg_txoutclk;

//PRBS signals
wire [47:0] prbs;
wire [47:0] comp_data;
wire [47:0] out_data;
wire [7:0] trgcnt_i;
reg  [47:0] tx_mode_data;
wire [47:0] fixed_pats_i;
wire [7:0] txmode_cntr_i;
wire [7:0] ly1ds_i,ly2ds_i,ly3ds_i,ly4ds_i,ly5ds_i,ly6ds_i;
wire [4:0] lay1_half_strip, lay2_half_strip, lay3_half_strip, lay4_half_strip, lay5_half_strip, lay6_half_strip;
wire tx_sel_i;
wire rst_tx_i;
wire prbs_rst_i;

assign MON_TX_SEL      = tx_sel_i;
assign MON_TRG_TX_ISK  = trg_tx_isk;
assign MON_TRG_TX_DATA = trg_tx_data;
assign trg_tx_dis = TRG_OP_TX_DISABLE;
assign tx_dly_align_mon_ena = 1'b0;
assign lay1_half_strip = LAY1_TO_6_HALF_STRIP[4:0];
assign lay2_half_strip = LAY1_TO_6_HALF_STRIP[9:5];
assign lay3_half_strip = LAY1_TO_6_HALF_STRIP[14:10];
assign lay4_half_strip = LAY1_TO_6_HALF_STRIP[19:15];
assign lay5_half_strip = LAY1_TO_6_HALF_STRIP[24:20];
assign lay6_half_strip = LAY1_TO_6_HALF_STRIP[29:25];


generate
if(XDCFEB==1) 
begin : xdcfeb_trg_tx
  assign TRG_TDIS = trg_tx_dis;
end
else
begin : dcfeb_trg_tx
	//IBUF IBUF_TRG_SIGDET (.O(trg_sd),.I(TRG_SIGDET)); // Trigger rx Optical signal detect is unused on DCFEBs and non-existant on xDCFEBs 
	OBUF  #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_TRG_TDIS (.O(TRG_TDIS),.I(trg_tx_dis));
end
endgenerate


	 (* LOC = "GTXE1_X0Y13" *)
	 TRG_TX_BUF_BYPASS #
	 (
		  .WRAPPER_SIM_GTXRESET_SPEEDUP   (SIM_SPEEDUP)      // Set this to 1 for simulation
	 )
	 trg_tx_buf_bypass_i
	 (
		  //_____________________________________________________________________
		  //_____________________________________________________________________
		  //GTX0  (X0Y13)

		  //----- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
		  .GTX0_RXN_IN                    (TRG_RX_N),
		  .GTX0_RXP_IN                    (TRG_RX_P),
		  //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
		  .GTX0_TXCHARISK_IN              (trg_tx_isk),
		  //---------------- Transmit Ports - TX Data Path interface -----------------
		  .GTX0_TXDATA_IN                 (trg_tx_data),
		  .GTX0_TXOUTCLK_OUT              (trg_txoutclk),
		  .GTX0_TXUSRCLK_IN               (TRG_TXUSRCLK),
		  .GTX0_TXUSRCLK2_IN              (TRG_CLK80),
		  //-------------- Transmit Ports - TX Driver and OOB signaling --------------
		  .GTX0_TXN_OUT                   (TRG_TX_N),
		  .GTX0_TXP_OUT                   (TRG_TX_P),
		  //------ Transmit Ports - TX Elastic Buffer and Phase Alignment Ports ------
		  .GTX0_TXDLYALIGNDISABLE_IN      (!TX_SYNC_DONE),
		  .GTX0_TXDLYALIGNMONENB_IN       (tx_dly_align_mon_ena),
		  .GTX0_TXDLYALIGNMONITOR_OUT     (tx_dly_align_mon),
		  .GTX0_TXDLYALIGNRESET_IN        (tx_dlyalignreset),
		  .GTX0_TXENPMAPHASEALIGN_IN      (tx_enpmaphasealign),
		  .GTX0_TXPMASETPHASE_IN          (tx_pmasetphase),
		  //--------------------- Transmit Ports - TX PLL Ports ----------------------
		  .GTX0_GTXTXRESET_IN             (TRG_GTXTXRST),
		  .GTX0_MGTREFCLKTX_IN            (TRG_TX_REFCLK),
		  .GTX0_PLLTXRESET_IN             (TRG_TX_PLLRST),
		  .GTX0_TXPLLLKDET_OUT            (TRG_TX_PLL_LOCK),
		  .GTX0_TXRESETDONE_OUT           (TRG_TXRESETDONE)
	 );

	 //---------------------------- TXSYNC module ------------------------------
	 // Since you are bypassing the TX Buffer in your wrapper, you will need to drive
	 // the phase alignment ports to align the phase of the TX Datapath. Include
	 // this module in your design to have phase alignment performed automatically as
	 // it is done in the example design.

generate
if(TMR==1) 
begin : TX_SYNC_FSM_TMR

	(* syn_preserve = "true" *) reg trg_txresetdone_r_1;
	(* syn_preserve = "true" *) reg trg_txresetdone_r_2;
	(* syn_preserve = "true" *) reg trg_txresetdone_r_3;
	(* syn_preserve = "true" *) reg trg_txresetdone_r2_1;
	(* syn_preserve = "true" *) reg trg_txresetdone_r2_2;
	(* syn_preserve = "true" *) reg trg_txresetdone_r2_3;

	(* syn_keep = "true" *) wire vt_trg_txresetdone_r_1;
	(* syn_keep = "true" *) wire vt_trg_txresetdone_r_2;
	(* syn_keep = "true" *) wire vt_trg_txresetdone_r_3;
	(* syn_keep = "true" *) wire vt_trg_txresetdone_r2_1;

	assign vt_trg_txresetdone_r_1  = (trg_txresetdone_r_1  & trg_txresetdone_r_2 ) | (trg_txresetdone_r_2  & trg_txresetdone_r_3 ) | (trg_txresetdone_r_1  & trg_txresetdone_r_3 ); // Majority logic
	assign vt_trg_txresetdone_r_2  = (trg_txresetdone_r_1  & trg_txresetdone_r_2 ) | (trg_txresetdone_r_2  & trg_txresetdone_r_3 ) | (trg_txresetdone_r_1  & trg_txresetdone_r_3 ); // Majority logic
	assign vt_trg_txresetdone_r_3  = (trg_txresetdone_r_1  & trg_txresetdone_r_2 ) | (trg_txresetdone_r_2  & trg_txresetdone_r_3 ) | (trg_txresetdone_r_1  & trg_txresetdone_r_3 ); // Majority logic
	assign vt_trg_txresetdone_r2_1 = (trg_txresetdone_r2_1 & trg_txresetdone_r2_2) | (trg_txresetdone_r2_2 & trg_txresetdone_r2_3) | (trg_txresetdone_r2_1 & trg_txresetdone_r2_3); // Majority logic

	always @(posedge TRG_CLK80 or negedge TRG_TXRESETDONE) begin
		if(!TRG_TXRESETDONE) begin
			trg_txresetdone_r_1  <= 1'b0;
			trg_txresetdone_r_2  <= 1'b0;
			trg_txresetdone_r_3  <= 1'b0;
			trg_txresetdone_r2_1 <= 1'b0;
			trg_txresetdone_r2_2 <= 1'b0;
			trg_txresetdone_r2_3 <= 1'b0;
		end
		else begin
			trg_txresetdone_r_1  <= TRG_TXRESETDONE;
			trg_txresetdone_r_2  <= TRG_TXRESETDONE;
			trg_txresetdone_r_3  <= TRG_TXRESETDONE;
			trg_txresetdone_r2_1 <= vt_trg_txresetdone_r_1;
			trg_txresetdone_r2_2 <= vt_trg_txresetdone_r_2;
			trg_txresetdone_r2_3 <= vt_trg_txresetdone_r_3;
		end
	end

	if(SIM_SPEEDUP==1)
	begin:fast_simulation
		 // 64 cycles of setphase for simulation 
		tx_sync_FSM_TMR #(
			.SYNC_CNT(64)
		)
		gtx_txsync_i (
			.SYNC_DONE          (TX_SYNC_DONE),
			.TXDLYALIGNRESET    (tx_dlyalignreset),
			.TXENPMAPHASEALIGN  (tx_enpmaphasealign),      
			.TXPMASETPHASE      (tx_pmasetphase),
			.CLK                (TRG_CLK80),
			.RST                (!vt_trg_txresetdone_r2_1)
		);
	end
	else
	begin:no_fast_simulation
		 // 8192 cycles of setphase for output divider of 1
		tx_sync_FSM_TMR #(
			.SYNC_CNT(8192)
		)
		gtx_txsync_i (
			.SYNC_DONE          (TX_SYNC_DONE),
			.TXDLYALIGNRESET    (tx_dlyalignreset),
			.TXENPMAPHASEALIGN  (tx_enpmaphasealign),      
			.TXPMASETPHASE      (tx_pmasetphase),
			.CLK                (TRG_CLK80),
			.RST                (!vt_trg_txresetdone_r2_1)
		);
	end


end
else 
begin : TX_SYNC_FSM

	reg trg_txresetdone_r;
	reg trg_txresetdone_r2;

	always @(posedge TRG_CLK80 or negedge TRG_TXRESETDONE) begin
		if(!TRG_TXRESETDONE) begin
			trg_txresetdone_r  <= 1'b0;
			trg_txresetdone_r2 <= 1'b0;
		end
		else begin
			trg_txresetdone_r  <= TRG_TXRESETDONE;
			trg_txresetdone_r2 <= trg_txresetdone_r;
		end
	end

	if(SIM_SPEEDUP==1)
	begin:fast_simulation
		 // 64 cycles of setphase for simulation 
		tx_sync_FSM #(
			.SYNC_CNT(64)
		)
		gtx_txsync_i (
			.SYNC_DONE          (TX_SYNC_DONE),
			.TXDLYALIGNRESET    (tx_dlyalignreset),
			.TXENPMAPHASEALIGN  (tx_enpmaphasealign),      
			.TXPMASETPHASE      (tx_pmasetphase),
			.CLK                (TRG_CLK80),
			.RST                (!trg_txresetdone_r2)
		);
	end
	else
	begin:no_fast_simulation
		 // 8192 cycles of setphase for output divider of 1
		tx_sync_FSM #(
			.SYNC_CNT(8192)
		)
		gtx_txsync_i (
			.SYNC_DONE          (TX_SYNC_DONE),
			.TXDLYALIGNRESET    (tx_dlyalignreset),
			.TXENPMAPHASEALIGN  (tx_enpmaphasealign),      
			.TXPMASETPHASE      (tx_pmasetphase),
			.CLK                (TRG_CLK80),
			.RST                (!trg_txresetdone_r2)
		);
	end
	
end
endgenerate

//
// Transmit data
//  

	assign comp_data = {G6C,G5C,G4C,G3C,G2C,G1C};
   assign out_data = ENA_TEST_PAT ? prbs : tx_mode_data;
	assign trg_tx_data = rst_tx_i ? 32'h50BC50BC : (tx_sel_i ? out_data[47:16] : {out_data[15:0],frm_sep});
	assign trg_tx_isk  = rst_tx_i ?  4'b0101 :     (tx_sel_i ?               4'b0000     :  4'b0001);

	always @* begin
		case(TMB_TX_MODE)
			3'd0: tx_mode_data = comp_data;
			3'd1: tx_mode_data = fixed_pats_i;
			3'd2: tx_mode_data = {6{txmode_cntr_i}};
			3'd3: tx_mode_data = prbs;
			3'd5: tx_mode_data = {ly2ds_i,ly4ds_i,ly6ds_i,ly5ds_i,ly1ds_i,ly3ds_i};
			default: tx_mode_data = comp_data;
		endcase
	end

	always @* begin
		if(!rst_tx_i && (trgcnt_i==8'h00)) begin
			frm_sep = 16'h50FC;
		end
		else begin
			frm_sep = 16'h50BC;
		end
	end

generate
if(TMR==1) 
begin : Comp_logic_TMR

	(* syn_preserve = "true" *) reg rst_tx_1;
	(* syn_preserve = "true" *) reg prbs_rst_1;
	(* syn_preserve = "true" *) reg p_rst_r7_1;
	(* syn_preserve = "true" *) reg [6:0] p_rst_p_1;
	(* syn_preserve = "true" *) reg ltncy_trig_r_1;
	(* syn_preserve = "true" *) reg tx_sel_1;
	(* syn_preserve = "true" *) reg tx_sel_bar_1;
	(* syn_preserve = "true" *) reg [47:0] fixed_pats_1;
	(* syn_preserve = "true" *) reg [7:0] trgcnt_1;
	(* syn_preserve = "true" *) reg [7:0] txmode_cntr_1;
	(* syn_preserve = "true" *) reg [7:0] ly1ds_1;
	(* syn_preserve = "true" *) reg [7:0] ly2ds_1;
	(* syn_preserve = "true" *) reg [7:0] ly3ds_1;
	(* syn_preserve = "true" *) reg [7:0] ly4ds_1;
	(* syn_preserve = "true" *) reg [7:0] ly5ds_1;
	(* syn_preserve = "true" *) reg [7:0] ly6ds_1;
	(* syn_preserve = "true" *) reg [2:0] ly1hs_1;
	(* syn_preserve = "true" *) reg [2:0] ly2hs_1;
	(* syn_preserve = "true" *) reg [2:0] ly3hs_1;
	(* syn_preserve = "true" *) reg [2:0] ly4hs_1;
	(* syn_preserve = "true" *) reg [2:0] ly5hs_1;
	(* syn_preserve = "true" *) reg [2:0] ly6hs_1;
	(* syn_preserve = "true" *) reg trig_r1_1;
	(* syn_preserve = "true" *) reg trig_r2_1;
	(* syn_preserve = "true" *) reg trig_r3_1;

	(* syn_preserve = "true" *) reg rst_tx_2;
	(* syn_preserve = "true" *) reg prbs_rst_2;
	(* syn_preserve = "true" *) reg p_rst_r7_2;
	(* syn_preserve = "true" *) reg [6:0] p_rst_p_2;
	(* syn_preserve = "true" *) reg ltncy_trig_r_2;
	(* syn_preserve = "true" *) reg tx_sel_2;
	(* syn_preserve = "true" *) reg tx_sel_bar_2;
	(* syn_preserve = "true" *) reg [47:0] fixed_pats_2;
	(* syn_preserve = "true" *) reg [7:0] trgcnt_2;
	(* syn_preserve = "true" *) reg [7:0] txmode_cntr_2;
	(* syn_preserve = "true" *) reg [7:0] ly1ds_2;
	(* syn_preserve = "true" *) reg [7:0] ly2ds_2;
	(* syn_preserve = "true" *) reg [7:0] ly3ds_2;
	(* syn_preserve = "true" *) reg [7:0] ly4ds_2;
	(* syn_preserve = "true" *) reg [7:0] ly5ds_2;
	(* syn_preserve = "true" *) reg [7:0] ly6ds_2;
	(* syn_preserve = "true" *) reg [2:0] ly1hs_2;
	(* syn_preserve = "true" *) reg [2:0] ly2hs_2;
	(* syn_preserve = "true" *) reg [2:0] ly3hs_2;
	(* syn_preserve = "true" *) reg [2:0] ly4hs_2;
	(* syn_preserve = "true" *) reg [2:0] ly5hs_2;
	(* syn_preserve = "true" *) reg [2:0] ly6hs_2;
	(* syn_preserve = "true" *) reg trig_r1_2;
	(* syn_preserve = "true" *) reg trig_r2_2;
	(* syn_preserve = "true" *) reg trig_r3_2;

	(* syn_preserve = "true" *) reg rst_tx_3;
	(* syn_preserve = "true" *) reg prbs_rst_3;
	(* syn_preserve = "true" *) reg p_rst_r7_3;
	(* syn_preserve = "true" *) reg [6:0] p_rst_p_3;
	(* syn_preserve = "true" *) reg ltncy_trig_r_3;
	(* syn_preserve = "true" *) reg tx_sel_3;
	(* syn_preserve = "true" *) reg tx_sel_bar_3;
	(* syn_preserve = "true" *) reg [47:0] fixed_pats_3;
	(* syn_preserve = "true" *) reg [7:0] trgcnt_3;
	(* syn_preserve = "true" *) reg [7:0] txmode_cntr_3;
	(* syn_preserve = "true" *) reg [7:0] ly1ds_3;
	(* syn_preserve = "true" *) reg [7:0] ly2ds_3;
	(* syn_preserve = "true" *) reg [7:0] ly3ds_3;
	(* syn_preserve = "true" *) reg [7:0] ly4ds_3;
	(* syn_preserve = "true" *) reg [7:0] ly5ds_3;
	(* syn_preserve = "true" *) reg [7:0] ly6ds_3;
	(* syn_preserve = "true" *) reg [2:0] ly1hs_3;
	(* syn_preserve = "true" *) reg [2:0] ly2hs_3;
	(* syn_preserve = "true" *) reg [2:0] ly3hs_3;
	(* syn_preserve = "true" *) reg [2:0] ly4hs_3;
	(* syn_preserve = "true" *) reg [2:0] ly5hs_3;
	(* syn_preserve = "true" *) reg [2:0] ly6hs_3;
	(* syn_preserve = "true" *) reg trig_r1_3;
	(* syn_preserve = "true" *) reg trig_r2_3;
	(* syn_preserve = "true" *) reg trig_r3_3;

	(* syn_keep = "true" *) wire vt_rst_tx_1;
	(* syn_keep = "true" *) wire vt_prbs_rst_1;
	(* syn_keep = "true" *) wire vt_p_rst_r6_1;
	(* syn_keep = "true" *) wire vt_p_rst_r7_1;
	(* syn_keep = "true" *) wire vt_ltncy_trig_r_1;
	(* syn_keep = "true" *) wire vt_tx_sel_1;
	(* syn_keep = "true" *) wire vt_tx_sel_bar_1;
	(* syn_keep = "true" *) wire [47:0] vt_fixed_pats_1;
	(* syn_keep = "true" *) wire [7:0] vt_trgcnt_1;
	(* syn_keep = "true" *) wire [7:0] vt_txmode_cntr_1;
	(* syn_keep = "true" *) wire [7:0] vt_ly1ds_1;
	(* syn_keep = "true" *) wire [7:0] vt_ly2ds_1;
	(* syn_keep = "true" *) wire [7:0] vt_ly3ds_1;
	(* syn_keep = "true" *) wire [7:0] vt_ly4ds_1;
	(* syn_keep = "true" *) wire [7:0] vt_ly5ds_1;
	(* syn_keep = "true" *) wire [7:0] vt_ly6ds_1;
	(* syn_keep = "true" *) wire [2:0] vt_ly1hs_1;
	(* syn_keep = "true" *) wire [2:0] vt_ly2hs_1;
	(* syn_keep = "true" *) wire [2:0] vt_ly3hs_1;
	(* syn_keep = "true" *) wire [2:0] vt_ly4hs_1;
	(* syn_keep = "true" *) wire [2:0] vt_ly5hs_1;
	(* syn_keep = "true" *) wire [2:0] vt_ly6hs_1;
	(* syn_keep = "true" *) wire vt_trig_r1_1;
	(* syn_keep = "true" *) wire vt_trig_r2_1;
	(* syn_keep = "true" *) wire vt_trig_r3_1;

	(* syn_keep = "true" *) wire vt_rst_tx_2;
	(* syn_keep = "true" *) wire vt_prbs_rst_2;
	(* syn_keep = "true" *) wire vt_p_rst_r6_2;
	(* syn_keep = "true" *) wire vt_p_rst_r7_2;
	(* syn_keep = "true" *) wire vt_ltncy_trig_r_2;
	(* syn_keep = "true" *) wire vt_tx_sel_2;
	(* syn_keep = "true" *) wire vt_tx_sel_bar_2;
	(* syn_keep = "true" *) wire [47:0] vt_fixed_pats_2;
	(* syn_keep = "true" *) wire [7:0] vt_trgcnt_2;
	(* syn_keep = "true" *) wire [7:0] vt_txmode_cntr_2;
	(* syn_keep = "true" *) wire [7:0] vt_ly1ds_2;
	(* syn_keep = "true" *) wire [7:0] vt_ly2ds_2;
	(* syn_keep = "true" *) wire [7:0] vt_ly3ds_2;
	(* syn_keep = "true" *) wire [7:0] vt_ly4ds_2;
	(* syn_keep = "true" *) wire [7:0] vt_ly5ds_2;
	(* syn_keep = "true" *) wire [7:0] vt_ly6ds_2;
	(* syn_keep = "true" *) wire [2:0] vt_ly1hs_2;
	(* syn_keep = "true" *) wire [2:0] vt_ly2hs_2;
	(* syn_keep = "true" *) wire [2:0] vt_ly3hs_2;
	(* syn_keep = "true" *) wire [2:0] vt_ly4hs_2;
	(* syn_keep = "true" *) wire [2:0] vt_ly5hs_2;
	(* syn_keep = "true" *) wire [2:0] vt_ly6hs_2;
	(* syn_keep = "true" *) wire vt_trig_r1_2;
	(* syn_keep = "true" *) wire vt_trig_r2_2;
	(* syn_keep = "true" *) wire vt_trig_r3_2;

	(* syn_keep = "true" *) wire vt_rst_tx_3;
	(* syn_keep = "true" *) wire vt_prbs_rst_3;
	(* syn_keep = "true" *) wire vt_p_rst_r6_3;
	(* syn_keep = "true" *) wire vt_p_rst_r7_3;
	(* syn_keep = "true" *) wire vt_ltncy_trig_r_3;
	(* syn_keep = "true" *) wire vt_tx_sel_3;
	(* syn_keep = "true" *) wire vt_tx_sel_bar_3;
	(* syn_keep = "true" *) wire [47:0] vt_fixed_pats_3;
	(* syn_keep = "true" *) wire [7:0] vt_trgcnt_3;
	(* syn_keep = "true" *) wire [7:0] vt_txmode_cntr_3;
	(* syn_keep = "true" *) wire [7:0] vt_ly1ds_3;
	(* syn_keep = "true" *) wire [7:0] vt_ly2ds_3;
	(* syn_keep = "true" *) wire [7:0] vt_ly3ds_3;
	(* syn_keep = "true" *) wire [7:0] vt_ly4ds_3;
	(* syn_keep = "true" *) wire [7:0] vt_ly5ds_3;
	(* syn_keep = "true" *) wire [7:0] vt_ly6ds_3;
	(* syn_keep = "true" *) wire [2:0] vt_ly1hs_3;
	(* syn_keep = "true" *) wire [2:0] vt_ly2hs_3;
	(* syn_keep = "true" *) wire [2:0] vt_ly3hs_3;
	(* syn_keep = "true" *) wire [2:0] vt_ly4hs_3;
	(* syn_keep = "true" *) wire [2:0] vt_ly5hs_3;
	(* syn_keep = "true" *) wire [2:0] vt_ly6hs_3;
	(* syn_keep = "true" *) wire vt_trig_r1_3;
	(* syn_keep = "true" *) wire vt_trig_r2_3;
	(* syn_keep = "true" *) wire vt_trig_r3_3;
	
	(* syn_keep = "true" *) wire p_rst_clr_1;
	(* syn_keep = "true" *) wire p_rst_clr_2;
	(* syn_keep = "true" *) wire p_rst_clr_3;
	(* syn_keep = "true" *) wire inject_1;
	(* syn_keep = "true" *) wire inject_2;
	(* syn_keep = "true" *) wire inject_3;
	(* syn_keep = "true" *) reg  lt_trg_1;
	(* syn_keep = "true" *) reg  lt_trg_2;
	(* syn_keep = "true" *) reg  lt_trg_3;

	assign vt_rst_tx_1       = (rst_tx_1       & rst_tx_2      ) | (rst_tx_2       & rst_tx_3      ) | (rst_tx_1       & rst_tx_3      ); // Majority logic;
	assign vt_prbs_rst_1     = (prbs_rst_1     & prbs_rst_2    ) | (prbs_rst_2     & prbs_rst_3    ) | (prbs_rst_1     & prbs_rst_3    ); // Majority logic;
	assign vt_p_rst_r6_1     = (p_rst_p_1[6]   & p_rst_p_2[6]  ) | (p_rst_p_2[6]   & p_rst_p_3[6]  ) | (p_rst_p_1[6]   & p_rst_p_3[6]  ); // Majority logic;
	assign vt_p_rst_r7_1     = (p_rst_r7_1     & p_rst_r7_2    ) | (p_rst_r7_2     & p_rst_r7_3    ) | (p_rst_r7_1     & p_rst_r7_3    ); // Majority logic;
	assign vt_ltncy_trig_r_1 = (ltncy_trig_r_1 & ltncy_trig_r_2) | (ltncy_trig_r_2 & ltncy_trig_r_3) | (ltncy_trig_r_1 & ltncy_trig_r_3); // Majority logic;
	assign vt_tx_sel_1       = (tx_sel_1       & tx_sel_2      ) | (tx_sel_2       & tx_sel_3      ) | (tx_sel_1       & tx_sel_3      ); // Majority logic;
	assign vt_tx_sel_bar_1   = (tx_sel_bar_1   & tx_sel_bar_2  ) | (tx_sel_bar_2   & tx_sel_bar_3  ) | (tx_sel_bar_1   & tx_sel_bar_3  ); // Majority logic;
	assign vt_fixed_pats_1   = (fixed_pats_1   & fixed_pats_2  ) | (fixed_pats_2   & fixed_pats_3  ) | (fixed_pats_1   & fixed_pats_3  ); // Majority logic;
	assign vt_trgcnt_1       = (trgcnt_1       & trgcnt_2      ) | (trgcnt_2       & trgcnt_3      ) | (trgcnt_1       & trgcnt_3      ); // Majority logic;
	assign vt_txmode_cntr_1  = (txmode_cntr_1  & txmode_cntr_2 ) | (txmode_cntr_2  & txmode_cntr_3 ) | (txmode_cntr_1  & txmode_cntr_3 ); // Majority logic;
	assign vt_ly1ds_1        = (ly1ds_1        & ly1ds_2       ) | (ly1ds_2        & ly1ds_3       ) | (ly1ds_1        & ly1ds_3       ); // Majority logic;
	assign vt_ly2ds_1        = (ly2ds_1        & ly2ds_2       ) | (ly2ds_2        & ly2ds_3       ) | (ly2ds_1        & ly2ds_3       ); // Majority logic;
	assign vt_ly3ds_1        = (ly3ds_1        & ly3ds_2       ) | (ly3ds_2        & ly3ds_3       ) | (ly3ds_1        & ly3ds_3       ); // Majority logic;
	assign vt_ly4ds_1        = (ly4ds_1        & ly4ds_2       ) | (ly4ds_2        & ly4ds_3       ) | (ly4ds_1        & ly4ds_3       ); // Majority logic;
	assign vt_ly5ds_1        = (ly5ds_1        & ly5ds_2       ) | (ly5ds_2        & ly5ds_3       ) | (ly5ds_1        & ly5ds_3       ); // Majority logic;
	assign vt_ly6ds_1        = (ly6ds_1        & ly6ds_2       ) | (ly6ds_2        & ly6ds_3       ) | (ly6ds_1        & ly6ds_3       ); // Majority logic;
	assign vt_ly1hs_1        = (ly1hs_1        & ly1hs_2       ) | (ly1hs_2        & ly1hs_3       ) | (ly1hs_1        & ly1hs_3       ); // Majority logic;
	assign vt_ly2hs_1        = (ly2hs_1        & ly2hs_2       ) | (ly2hs_2        & ly2hs_3       ) | (ly2hs_1        & ly2hs_3       ); // Majority logic;
	assign vt_ly3hs_1        = (ly3hs_1        & ly3hs_2       ) | (ly3hs_2        & ly3hs_3       ) | (ly3hs_1        & ly3hs_3       ); // Majority logic;
	assign vt_ly4hs_1        = (ly4hs_1        & ly4hs_2       ) | (ly4hs_2        & ly4hs_3       ) | (ly4hs_1        & ly4hs_3       ); // Majority logic;
	assign vt_ly5hs_1        = (ly5hs_1        & ly5hs_2       ) | (ly5hs_2        & ly5hs_3       ) | (ly5hs_1        & ly5hs_3       ); // Majority logic;
	assign vt_ly6hs_1        = (ly6hs_1        & ly6hs_2       ) | (ly6hs_2        & ly6hs_3       ) | (ly6hs_1        & ly6hs_3       ); // Majority logic;
	assign vt_trig_r1_1      = (trig_r1_1      & trig_r1_2     ) | (trig_r1_2      & trig_r1_3     ) | (trig_r1_1      & trig_r1_3     ); // Majority logic;
	assign vt_trig_r2_1      = (trig_r2_1      & trig_r2_2     ) | (trig_r2_2      & trig_r2_3     ) | (trig_r2_1      & trig_r2_3     ); // Majority logic;
	assign vt_trig_r3_1      = (trig_r3_1      & trig_r3_2     ) | (trig_r3_2      & trig_r3_3     ) | (trig_r3_1      & trig_r3_3     ); // Majority logic;

	assign vt_rst_tx_2       = (rst_tx_1       & rst_tx_2      ) | (rst_tx_2       & rst_tx_3      ) | (rst_tx_1       & rst_tx_3      ); // Majority logic;
	assign vt_prbs_rst_2     = (prbs_rst_1     & prbs_rst_2    ) | (prbs_rst_2     & prbs_rst_3    ) | (prbs_rst_1     & prbs_rst_3    ); // Majority logic;
	assign vt_p_rst_r6_2     = (p_rst_p_1[6]   & p_rst_p_2[6]  ) | (p_rst_p_2[6]   & p_rst_p_3[6]  ) | (p_rst_p_1[6]   & p_rst_p_3[6]  ); // Majority logic;
	assign vt_p_rst_r7_2     = (p_rst_r7_1     & p_rst_r7_2    ) | (p_rst_r7_2     & p_rst_r7_3    ) | (p_rst_r7_1     & p_rst_r7_3    ); // Majority logic;
	assign vt_ltncy_trig_r_2 = (ltncy_trig_r_1 & ltncy_trig_r_2) | (ltncy_trig_r_2 & ltncy_trig_r_3) | (ltncy_trig_r_1 & ltncy_trig_r_3); // Majority logic;
	assign vt_tx_sel_2       = (tx_sel_1       & tx_sel_2      ) | (tx_sel_2       & tx_sel_3      ) | (tx_sel_1       & tx_sel_3      ); // Majority logic;
	assign vt_tx_sel_bar_2   = (tx_sel_bar_1   & tx_sel_bar_2  ) | (tx_sel_bar_2   & tx_sel_bar_3  ) | (tx_sel_bar_1   & tx_sel_bar_3  ); // Majority logic;
	assign vt_fixed_pats_2   = (fixed_pats_1   & fixed_pats_2  ) | (fixed_pats_2   & fixed_pats_3  ) | (fixed_pats_1   & fixed_pats_3  ); // Majority logic;
	assign vt_trgcnt_2       = (trgcnt_1       & trgcnt_2      ) | (trgcnt_2       & trgcnt_3      ) | (trgcnt_1       & trgcnt_3      ); // Majority logic;
	assign vt_txmode_cntr_2  = (txmode_cntr_1  & txmode_cntr_2 ) | (txmode_cntr_2  & txmode_cntr_3 ) | (txmode_cntr_1  & txmode_cntr_3 ); // Majority logic;
	assign vt_ly1ds_2        = (ly1ds_1        & ly1ds_2       ) | (ly1ds_2        & ly1ds_3       ) | (ly1ds_1        & ly1ds_3       ); // Majority logic;
	assign vt_ly2ds_2        = (ly2ds_1        & ly2ds_2       ) | (ly2ds_2        & ly2ds_3       ) | (ly2ds_1        & ly2ds_3       ); // Majority logic;
	assign vt_ly3ds_2        = (ly3ds_1        & ly3ds_2       ) | (ly3ds_2        & ly3ds_3       ) | (ly3ds_1        & ly3ds_3       ); // Majority logic;
	assign vt_ly4ds_2        = (ly4ds_1        & ly4ds_2       ) | (ly4ds_2        & ly4ds_3       ) | (ly4ds_1        & ly4ds_3       ); // Majority logic;
	assign vt_ly5ds_2        = (ly5ds_1        & ly5ds_2       ) | (ly5ds_2        & ly5ds_3       ) | (ly5ds_1        & ly5ds_3       ); // Majority logic;
	assign vt_ly6ds_2        = (ly6ds_1        & ly6ds_2       ) | (ly6ds_2        & ly6ds_3       ) | (ly6ds_1        & ly6ds_3       ); // Majority logic;
	assign vt_ly1hs_2        = (ly1hs_1        & ly1hs_2       ) | (ly1hs_2        & ly1hs_3       ) | (ly1hs_1        & ly1hs_3       ); // Majority logic;
	assign vt_ly2hs_2        = (ly2hs_1        & ly2hs_2       ) | (ly2hs_2        & ly2hs_3       ) | (ly2hs_1        & ly2hs_3       ); // Majority logic;
	assign vt_ly3hs_2        = (ly3hs_1        & ly3hs_2       ) | (ly3hs_2        & ly3hs_3       ) | (ly3hs_1        & ly3hs_3       ); // Majority logic;
	assign vt_ly4hs_2        = (ly4hs_1        & ly4hs_2       ) | (ly4hs_2        & ly4hs_3       ) | (ly4hs_1        & ly4hs_3       ); // Majority logic;
	assign vt_ly5hs_2        = (ly5hs_1        & ly5hs_2       ) | (ly5hs_2        & ly5hs_3       ) | (ly5hs_1        & ly5hs_3       ); // Majority logic;
	assign vt_ly6hs_2        = (ly6hs_1        & ly6hs_2       ) | (ly6hs_2        & ly6hs_3       ) | (ly6hs_1        & ly6hs_3       ); // Majority logic;
	assign vt_trig_r1_2      = (trig_r1_1      & trig_r1_2     ) | (trig_r1_2      & trig_r1_3     ) | (trig_r1_1      & trig_r1_3     ); // Majority logic;
	assign vt_trig_r2_2      = (trig_r2_1      & trig_r2_2     ) | (trig_r2_2      & trig_r2_3     ) | (trig_r2_1      & trig_r2_3     ); // Majority logic;
	assign vt_trig_r3_2      = (trig_r3_1      & trig_r3_2     ) | (trig_r3_2      & trig_r3_3     ) | (trig_r3_1      & trig_r3_3     ); // Majority logic;

	assign vt_rst_tx_3       = (rst_tx_1       & rst_tx_2      ) | (rst_tx_2       & rst_tx_3      ) | (rst_tx_1       & rst_tx_3      ); // Majority logic;
	assign vt_prbs_rst_3     = (prbs_rst_1     & prbs_rst_2    ) | (prbs_rst_2     & prbs_rst_3    ) | (prbs_rst_1     & prbs_rst_3    ); // Majority logic;
	assign vt_p_rst_r6_3     = (p_rst_p_1[6]   & p_rst_p_2[6]  ) | (p_rst_p_2[6]   & p_rst_p_3[6]  ) | (p_rst_p_1[6]   & p_rst_p_3[6]  ); // Majority logic;
	assign vt_p_rst_r7_3     = (p_rst_r7_1     & p_rst_r7_2    ) | (p_rst_r7_2     & p_rst_r7_3    ) | (p_rst_r7_1     & p_rst_r7_3    ); // Majority logic;
	assign vt_ltncy_trig_r_3 = (ltncy_trig_r_1 & ltncy_trig_r_2) | (ltncy_trig_r_2 & ltncy_trig_r_3) | (ltncy_trig_r_1 & ltncy_trig_r_3); // Majority logic;
	assign vt_tx_sel_3       = (tx_sel_1       & tx_sel_2      ) | (tx_sel_2       & tx_sel_3      ) | (tx_sel_1       & tx_sel_3      ); // Majority logic;
	assign vt_tx_sel_bar_3   = (tx_sel_bar_1   & tx_sel_bar_2  ) | (tx_sel_bar_2   & tx_sel_bar_3  ) | (tx_sel_bar_1   & tx_sel_bar_3  ); // Majority logic;
	assign vt_fixed_pats_3   = (fixed_pats_1   & fixed_pats_2  ) | (fixed_pats_2   & fixed_pats_3  ) | (fixed_pats_1   & fixed_pats_3  ); // Majority logic;
	assign vt_trgcnt_3       = (trgcnt_1       & trgcnt_2      ) | (trgcnt_2       & trgcnt_3      ) | (trgcnt_1       & trgcnt_3      ); // Majority logic;
	assign vt_txmode_cntr_3  = (txmode_cntr_1  & txmode_cntr_2 ) | (txmode_cntr_2  & txmode_cntr_3 ) | (txmode_cntr_1  & txmode_cntr_3 ); // Majority logic;
	assign vt_ly1ds_3        = (ly1ds_1        & ly1ds_2       ) | (ly1ds_2        & ly1ds_3       ) | (ly1ds_1        & ly1ds_3       ); // Majority logic;
	assign vt_ly2ds_3        = (ly2ds_1        & ly2ds_2       ) | (ly2ds_2        & ly2ds_3       ) | (ly2ds_1        & ly2ds_3       ); // Majority logic;
	assign vt_ly3ds_3        = (ly3ds_1        & ly3ds_2       ) | (ly3ds_2        & ly3ds_3       ) | (ly3ds_1        & ly3ds_3       ); // Majority logic;
	assign vt_ly4ds_3        = (ly4ds_1        & ly4ds_2       ) | (ly4ds_2        & ly4ds_3       ) | (ly4ds_1        & ly4ds_3       ); // Majority logic;
	assign vt_ly5ds_3        = (ly5ds_1        & ly5ds_2       ) | (ly5ds_2        & ly5ds_3       ) | (ly5ds_1        & ly5ds_3       ); // Majority logic;
	assign vt_ly6ds_3        = (ly6ds_1        & ly6ds_2       ) | (ly6ds_2        & ly6ds_3       ) | (ly6ds_1        & ly6ds_3       ); // Majority logic;
	assign vt_ly1hs_3        = (ly1hs_1        & ly1hs_2       ) | (ly1hs_2        & ly1hs_3       ) | (ly1hs_1        & ly1hs_3       ); // Majority logic;
	assign vt_ly2hs_3        = (ly2hs_1        & ly2hs_2       ) | (ly2hs_2        & ly2hs_3       ) | (ly2hs_1        & ly2hs_3       ); // Majority logic;
	assign vt_ly3hs_3        = (ly3hs_1        & ly3hs_2       ) | (ly3hs_2        & ly3hs_3       ) | (ly3hs_1        & ly3hs_3       ); // Majority logic;
	assign vt_ly4hs_3        = (ly4hs_1        & ly4hs_2       ) | (ly4hs_2        & ly4hs_3       ) | (ly4hs_1        & ly4hs_3       ); // Majority logic;
	assign vt_ly5hs_3        = (ly5hs_1        & ly5hs_2       ) | (ly5hs_2        & ly5hs_3       ) | (ly5hs_1        & ly5hs_3       ); // Majority logic;
	assign vt_ly6hs_3        = (ly6hs_1        & ly6hs_2       ) | (ly6hs_2        & ly6hs_3       ) | (ly6hs_1        & ly6hs_3       ); // Majority logic;
	assign vt_trig_r1_3      = (trig_r1_1      & trig_r1_2     ) | (trig_r1_2      & trig_r1_3     ) | (trig_r1_1      & trig_r1_3     ); // Majority logic;
	assign vt_trig_r2_3      = (trig_r2_1      & trig_r2_2     ) | (trig_r2_2      & trig_r2_3     ) | (trig_r2_1      & trig_r2_3     ); // Majority logic;
	assign vt_trig_r3_3      = (trig_r3_1      & trig_r3_2     ) | (trig_r3_2      & trig_r3_3     ) | (trig_r3_1      & trig_r3_3     ); // Majority logic;
	

	assign LTNCY_TRIG = vt_ltncy_trig_r_1;
	assign trgcnt_i = vt_trgcnt_1;
	assign fixed_pats_i = vt_fixed_pats_1;
	assign txmode_cntr_i = vt_txmode_cntr_1;
	assign ly1ds_i = vt_ly1ds_1;
	assign ly2ds_i = vt_ly2ds_1;
	assign ly3ds_i = vt_ly3ds_1;
	assign ly4ds_i = vt_ly4ds_1;
	assign ly5ds_i = vt_ly5ds_1;
	assign ly6ds_i = vt_ly6ds_1;
	assign tx_sel_i = vt_tx_sel_1;
	assign prbs_rst_i = vt_prbs_rst_1;
	assign rst_tx_i = vt_rst_tx_1;
	
	assign p_rst_clr_1 = ~vt_p_rst_r6_1 & vt_p_rst_r7_1;
	assign p_rst_clr_2 = ~vt_p_rst_r6_2 & vt_p_rst_r7_2;
	assign p_rst_clr_3 = ~vt_p_rst_r6_3 & vt_p_rst_r7_3;
	assign inject_1    = vt_trig_r2_1 & ~vt_trig_r3_1;
	assign inject_2    = vt_trig_r2_2 & ~vt_trig_r3_2;
	assign inject_3    = vt_trig_r2_3 & ~vt_trig_r3_3;

	always @* begin
		if(!vt_rst_tx_1 && (vt_trgcnt_1==8'h00)) begin
			lt_trg_1 = 1'b1;
			lt_trg_2 = 1'b1;
			lt_trg_3 = 1'b1;
		end
		else begin
			lt_trg_1 = 1'b0;
			lt_trg_2 = 1'b0;
			lt_trg_3 = 1'b0;
		end
	end

	always @(posedge TRG_CLK80) begin
		rst_tx_1 <= TRG_RST;
		rst_tx_2 <= TRG_RST;
		rst_tx_3 <= TRG_RST;
		ltncy_trig_r_1 <= lt_trg_1;
		ltncy_trig_r_2 <= lt_trg_2;
		ltncy_trig_r_3 <= lt_trg_3;
	end
	always @(posedge TRG_CLK80 or posedge TRG_RST) begin
		if(TRG_RST) begin
			tx_sel_1 <= 1'b1;
			tx_sel_2 <= 1'b1;
			tx_sel_3 <= 1'b1;
			tx_sel_bar_1 <= 1'b1;
			tx_sel_bar_2 <= 1'b1;
			tx_sel_bar_3 <= 1'b1;
		end
		else begin
			tx_sel_1 <= ~vt_tx_sel_1;
			tx_sel_2 <= ~vt_tx_sel_2;
			tx_sel_3 <= ~vt_tx_sel_3;
			tx_sel_bar_1 <= vt_tx_sel_1;
			tx_sel_bar_2 <= vt_tx_sel_2;
			tx_sel_bar_3 <= vt_tx_sel_3;
		end
	end
	always @(posedge TRG_CLK80 or posedge rst_tx_1) begin
		if(rst_tx_1) begin
			trgcnt_1 <= 8'h00;
		end
		else begin
			trgcnt_1 <= vt_trgcnt_1 + 1;
		end
	end
	always @(posedge TRG_CLK80 or posedge rst_tx_2) begin
		if(rst_tx_2) begin
			trgcnt_2 <= 8'h00;
		end
		else begin
			trgcnt_2 <= vt_trgcnt_2 + 1;
		end
	end
	always @(posedge TRG_CLK80 or posedge rst_tx_3) begin
		if(rst_tx_3) begin
			trgcnt_3 <= 8'h00;
		end
		else begin
			trgcnt_3 <= vt_trgcnt_3 + 1;
		end
	end
	

//
// Test pattern reset
//  

	always @(posedge TRG_CLK80) begin
		p_rst_p_1 <= vt_tx_sel_bar_1 ? {p_rst_p_1[5:0],TRG_RST} : p_rst_p_1; // use SRL
		p_rst_p_2 <= vt_tx_sel_bar_2 ? {p_rst_p_2[5:0],TRG_RST} : p_rst_p_2; // use SRL
		p_rst_p_3 <= vt_tx_sel_bar_3 ? {p_rst_p_3[5:0],TRG_RST} : p_rst_p_3; // use SRL
		p_rst_r7_1 <= vt_tx_sel_bar_1 ? vt_p_rst_r6_1 : vt_p_rst_r7_1;
		p_rst_r7_2 <= vt_tx_sel_bar_2 ? vt_p_rst_r6_2 : vt_p_rst_r7_2;
		p_rst_r7_3 <= vt_tx_sel_bar_3 ? vt_p_rst_r6_3 : vt_p_rst_r7_3;
	end
	always @(posedge TRG_CLK80 or posedge TRG_RST) begin // stretch prbs reset 8 CMS clock cycles beyond TRG_RST release
		if(TRG_RST) begin
			prbs_rst_1 <= 1'b1;
			prbs_rst_2 <= 1'b1;
			prbs_rst_3 <= 1'b1;
		end
		else begin
			prbs_rst_1 <= (p_rst_clr_1 && vt_tx_sel_bar_1) ? 1'b0 : vt_prbs_rst_1;
			prbs_rst_2 <= (p_rst_clr_2 && vt_tx_sel_bar_2) ? 1'b0 : vt_prbs_rst_2;
			prbs_rst_3 <= (p_rst_clr_3 && vt_tx_sel_bar_3) ? 1'b0 : vt_prbs_rst_3;
		end
	end

//
// TMB transmit mode counter
//
	always @(posedge TRG_CLK80 or posedge rst_tx_1) begin
		if(rst_tx_1)
			txmode_cntr_1 <= 8'h00;
		else
			txmode_cntr_1 <= vt_tx_sel_bar_1 ? vt_txmode_cntr_1 + 1 : vt_txmode_cntr_1;
	end
	always @(posedge TRG_CLK80 or posedge rst_tx_2) begin
		if(rst_tx_2)
			txmode_cntr_2 <= 8'h00;
		else
			txmode_cntr_2 <= vt_tx_sel_bar_2 ? vt_txmode_cntr_2 + 1 : vt_txmode_cntr_2;
	end
	always @(posedge TRG_CLK80 or posedge rst_tx_3) begin
		if(rst_tx_3)
			txmode_cntr_3 <= 8'h00;
		else
			txmode_cntr_3 <= vt_tx_sel_bar_3 ? vt_txmode_cntr_3 + 1 : vt_txmode_cntr_3;
	end
//
// TMB transmit mode fixed patterns
//
	always @(posedge TRG_CLK80) begin
		if(vt_tx_sel_bar_1)
			case(vt_txmode_cntr_1[1:0])
				2'd0: fixed_pats_1 <= 48'h000000000000;
				2'd1: fixed_pats_1 <= 48'hAAAAAAAAAAAA;
				2'd2: fixed_pats_1 <= 48'hFFFFFFFFFFFF;
				2'd3: fixed_pats_1 <= 48'h555555555555;
				default: fixed_pats_1 <= 48'h000000000000;
			endcase
		if(vt_tx_sel_bar_2)
			case(vt_txmode_cntr_2[1:0])
				2'd0: fixed_pats_2 <= 48'h000000000000;
				2'd1: fixed_pats_2 <= 48'hAAAAAAAAAAAA;
				2'd2: fixed_pats_2 <= 48'hFFFFFFFFFFFF;
				2'd3: fixed_pats_2 <= 48'h555555555555;
				default: fixed_pats_2 <= 48'h000000000000;
			endcase
		if(vt_tx_sel_bar_3)
			case(vt_txmode_cntr_3[1:0])
				2'd0: fixed_pats_3 <= 48'h000000000000;
				2'd1: fixed_pats_3 <= 48'hAAAAAAAAAAAA;
				2'd2: fixed_pats_3 <= 48'hFFFFFFFFFFFF;
				2'd3: fixed_pats_3 <= 48'h555555555555;
				default: fixed_pats_3 <= 48'h000000000000;
			endcase
	end

//
// Synchronize pulse trigger
//
	always @(posedge TRG_CLK80) begin
		if(vt_tx_sel_bar_1) begin
			trig_r1_1 <= TRG_PULSE;
			trig_r2_1 <= vt_trig_r1_1;
			trig_r3_1 <= vt_trig_r2_1;
		end
		if(vt_tx_sel_bar_2) begin
			trig_r1_2 <= TRG_PULSE;
			trig_r2_2 <= vt_trig_r1_2;
			trig_r3_2 <= vt_trig_r2_2;
		end
		if(vt_tx_sel_bar_3) begin
			trig_r1_3 <= TRG_PULSE;
			trig_r2_3 <= vt_trig_r1_3;
			trig_r3_3 <= vt_trig_r2_3;
		end
	end

	always @(posedge TRG_CLK80) begin
		case(lay1_half_strip[4:2])
			3'd0: ly1ds_1 <= {7'b0000000,vt_ly1hs_1[2]}; 
			3'd1: ly1ds_1 <= {6'b000000,vt_ly1hs_1[2],1'b0}; 
			3'd2: ly1ds_1 <= {5'b00000,vt_ly1hs_1[2],2'b00}; 
			3'd3: ly1ds_1 <= {4'b0000,vt_ly1hs_1[2],3'b000}; 
			3'd4: ly1ds_1 <= {3'b000,vt_ly1hs_1[2],4'b0000}; 
			3'd5: ly1ds_1 <= {2'b00,vt_ly1hs_1[2],5'b00000}; 
			3'd6: ly1ds_1 <= {1'b0,vt_ly1hs_1[2],6'b000000}; 
			3'd7: ly1ds_1 <= {vt_ly1hs_1[2],7'b0000000}; 
			default: ly1ds_1 <=8'h00;
		endcase
		case(lay2_half_strip[4:2])
			3'd0: ly2ds_1 <= {7'b0000000,vt_ly2hs_1[2]}; 
			3'd1: ly2ds_1 <= {6'b000000,vt_ly2hs_1[2],1'b0}; 
			3'd2: ly2ds_1 <= {5'b00000,vt_ly2hs_1[2],2'b00}; 
			3'd3: ly2ds_1 <= {4'b0000,vt_ly2hs_1[2],3'b000}; 
			3'd4: ly2ds_1 <= {3'b000,vt_ly2hs_1[2],4'b0000}; 
			3'd5: ly2ds_1 <= {2'b00,vt_ly2hs_1[2],5'b00000}; 
			3'd6: ly2ds_1 <= {1'b0,vt_ly2hs_1[2],6'b000000}; 
			3'd7: ly2ds_1 <= {vt_ly2hs_1[2],7'b0000000}; 
			default: ly2ds_1 <=8'h00;
		endcase
		case(lay3_half_strip[4:2])
			3'd0: ly3ds_1 <= {7'b0000000,vt_ly3hs_1[2]}; 
			3'd1: ly3ds_1 <= {6'b000000,vt_ly3hs_1[2],1'b0}; 
			3'd2: ly3ds_1 <= {5'b00000,vt_ly3hs_1[2],2'b00}; 
			3'd3: ly3ds_1 <= {4'b0000,vt_ly3hs_1[2],3'b000}; 
			3'd4: ly3ds_1 <= {3'b000,vt_ly3hs_1[2],4'b0000}; 
			3'd5: ly3ds_1 <= {2'b00,vt_ly3hs_1[2],5'b00000}; 
			3'd6: ly3ds_1 <= {1'b0,vt_ly3hs_1[2],6'b000000}; 
			3'd7: ly3ds_1 <= {vt_ly3hs_1[2],7'b0000000}; 
			default: ly3ds_1 <=8'h00;
		endcase
		case(lay4_half_strip[4:2])
			3'd0: ly4ds_1 <= {7'b0000000,vt_ly4hs_1[2]}; 
			3'd1: ly4ds_1 <= {6'b000000,vt_ly4hs_1[2],1'b0}; 
			3'd2: ly4ds_1 <= {5'b00000,vt_ly4hs_1[2],2'b00}; 
			3'd3: ly4ds_1 <= {4'b0000,vt_ly4hs_1[2],3'b000}; 
			3'd4: ly4ds_1 <= {3'b000,vt_ly4hs_1[2],4'b0000}; 
			3'd5: ly4ds_1 <= {2'b00,vt_ly4hs_1[2],5'b00000}; 
			3'd6: ly4ds_1 <= {1'b0,vt_ly4hs_1[2],6'b000000}; 
			3'd7: ly4ds_1 <= {vt_ly4hs_1[2],7'b0000000}; 
			default: ly4ds_1 <=8'h00;
		endcase
		case(lay5_half_strip[4:2])
			3'd0: ly5ds_1 <= {7'b0000000,vt_ly5hs_1[2]}; 
			3'd1: ly5ds_1 <= {6'b000000,vt_ly5hs_1[2],1'b0}; 
			3'd2: ly5ds_1 <= {5'b00000,vt_ly5hs_1[2],2'b00}; 
			3'd3: ly5ds_1 <= {4'b0000,vt_ly5hs_1[2],3'b000}; 
			3'd4: ly5ds_1 <= {3'b000,vt_ly5hs_1[2],4'b0000}; 
			3'd5: ly5ds_1 <= {2'b00,vt_ly5hs_1[2],5'b00000}; 
			3'd6: ly5ds_1 <= {1'b0,vt_ly5hs_1[2],6'b000000}; 
			3'd7: ly5ds_1 <= {vt_ly5hs_1[2],7'b0000000}; 
			default: ly5ds_1 <=8'h00;
		endcase
		case(lay6_half_strip[4:2])
			3'd0: ly6ds_1 <= {7'b0000000,vt_ly6hs_1[2]}; 
			3'd1: ly6ds_1 <= {6'b000000,vt_ly6hs_1[2],1'b0}; 
			3'd2: ly6ds_1 <= {5'b00000,vt_ly6hs_1[2],2'b00}; 
			3'd3: ly6ds_1 <= {4'b0000,vt_ly6hs_1[2],3'b000}; 
			3'd4: ly6ds_1 <= {3'b000,vt_ly6hs_1[2],4'b0000}; 
			3'd5: ly6ds_1 <= {2'b00,vt_ly6hs_1[2],5'b00000}; 
			3'd6: ly6ds_1 <= {1'b0,vt_ly6hs_1[2],6'b000000}; 
			3'd7: ly6ds_1 <= {vt_ly6hs_1[2],7'b0000000}; 
			default: ly6ds_1 <=8'h00;
		endcase
	end

	always @(posedge TRG_CLK80) begin
		case(lay1_half_strip[4:2])
			3'd0: ly1ds_2 <= {7'b0000000,vt_ly1hs_2[2]}; 
			3'd1: ly1ds_2 <= {6'b000000,vt_ly1hs_2[2],1'b0}; 
			3'd2: ly1ds_2 <= {5'b00000,vt_ly1hs_2[2],2'b00}; 
			3'd3: ly1ds_2 <= {4'b0000,vt_ly1hs_2[2],3'b000}; 
			3'd4: ly1ds_2 <= {3'b000,vt_ly1hs_2[2],4'b0000}; 
			3'd5: ly1ds_2 <= {2'b00,vt_ly1hs_2[2],5'b00000}; 
			3'd6: ly1ds_2 <= {1'b0,vt_ly1hs_2[2],6'b000000}; 
			3'd7: ly1ds_2 <= {vt_ly1hs_2[2],7'b0000000}; 
			default: ly1ds_2 <=8'h00;
		endcase
		case(lay2_half_strip[4:2])
			3'd0: ly2ds_2 <= {7'b0000000,vt_ly2hs_2[2]}; 
			3'd1: ly2ds_2 <= {6'b000000,vt_ly2hs_2[2],1'b0}; 
			3'd2: ly2ds_2 <= {5'b00000,vt_ly2hs_2[2],2'b00}; 
			3'd3: ly2ds_2 <= {4'b0000,vt_ly2hs_2[2],3'b000}; 
			3'd4: ly2ds_2 <= {3'b000,vt_ly2hs_2[2],4'b0000}; 
			3'd5: ly2ds_2 <= {2'b00,vt_ly2hs_2[2],5'b00000}; 
			3'd6: ly2ds_2 <= {1'b0,vt_ly2hs_2[2],6'b000000}; 
			3'd7: ly2ds_2 <= {vt_ly2hs_2[2],7'b0000000}; 
			default: ly2ds_2 <=8'h00;
		endcase
		case(lay3_half_strip[4:2])
			3'd0: ly3ds_2 <= {7'b0000000,vt_ly3hs_2[2]}; 
			3'd1: ly3ds_2 <= {6'b000000,vt_ly3hs_2[2],1'b0}; 
			3'd2: ly3ds_2 <= {5'b00000,vt_ly3hs_2[2],2'b00}; 
			3'd3: ly3ds_2 <= {4'b0000,vt_ly3hs_2[2],3'b000}; 
			3'd4: ly3ds_2 <= {3'b000,vt_ly3hs_2[2],4'b0000}; 
			3'd5: ly3ds_2 <= {2'b00,vt_ly3hs_2[2],5'b00000}; 
			3'd6: ly3ds_2 <= {1'b0,vt_ly3hs_2[2],6'b000000}; 
			3'd7: ly3ds_2 <= {vt_ly3hs_2[2],7'b0000000}; 
			default: ly3ds_2 <=8'h00;
		endcase
		case(lay4_half_strip[4:2])
			3'd0: ly4ds_2 <= {7'b0000000,vt_ly4hs_2[2]}; 
			3'd1: ly4ds_2 <= {6'b000000,vt_ly4hs_2[2],1'b0}; 
			3'd2: ly4ds_2 <= {5'b00000,vt_ly4hs_2[2],2'b00}; 
			3'd3: ly4ds_2 <= {4'b0000,vt_ly4hs_2[2],3'b000}; 
			3'd4: ly4ds_2 <= {3'b000,vt_ly4hs_2[2],4'b0000}; 
			3'd5: ly4ds_2 <= {2'b00,vt_ly4hs_2[2],5'b00000}; 
			3'd6: ly4ds_2 <= {1'b0,vt_ly4hs_2[2],6'b000000}; 
			3'd7: ly4ds_2 <= {vt_ly4hs_2[2],7'b0000000}; 
			default: ly4ds_2 <=8'h00;
		endcase
		case(lay5_half_strip[4:2])
			3'd0: ly5ds_2 <= {7'b0000000,vt_ly5hs_2[2]}; 
			3'd1: ly5ds_2 <= {6'b000000,vt_ly5hs_2[2],1'b0}; 
			3'd2: ly5ds_2 <= {5'b00000,vt_ly5hs_2[2],2'b00}; 
			3'd3: ly5ds_2 <= {4'b0000,vt_ly5hs_2[2],3'b000}; 
			3'd4: ly5ds_2 <= {3'b000,vt_ly5hs_2[2],4'b0000}; 
			3'd5: ly5ds_2 <= {2'b00,vt_ly5hs_2[2],5'b00000}; 
			3'd6: ly5ds_2 <= {1'b0,vt_ly5hs_2[2],6'b000000}; 
			3'd7: ly5ds_2 <= {vt_ly5hs_2[2],7'b0000000}; 
			default: ly5ds_2 <=8'h00;
		endcase
		case(lay6_half_strip[4:2])
			3'd0: ly6ds_2 <= {7'b0000000,vt_ly6hs_2[2]}; 
			3'd1: ly6ds_2 <= {6'b000000,vt_ly6hs_2[2],1'b0}; 
			3'd2: ly6ds_2 <= {5'b00000,vt_ly6hs_2[2],2'b00}; 
			3'd3: ly6ds_2 <= {4'b0000,vt_ly6hs_2[2],3'b000}; 
			3'd4: ly6ds_2 <= {3'b000,vt_ly6hs_2[2],4'b0000}; 
			3'd5: ly6ds_2 <= {2'b00,vt_ly6hs_2[2],5'b00000}; 
			3'd6: ly6ds_2 <= {1'b0,vt_ly6hs_2[2],6'b000000}; 
			3'd7: ly6ds_2 <= {vt_ly6hs_2[2],7'b0000000}; 
			default: ly6ds_2 <=8'h00;
		endcase
	end

	always @(posedge TRG_CLK80) begin
		case(lay1_half_strip[4:2])
			3'd0: ly1ds_3 <= {7'b0000000,vt_ly1hs_3[2]}; 
			3'd1: ly1ds_3 <= {6'b000000,vt_ly1hs_3[2],1'b0}; 
			3'd2: ly1ds_3 <= {5'b00000,vt_ly1hs_3[2],2'b00}; 
			3'd3: ly1ds_3 <= {4'b0000,vt_ly1hs_3[2],3'b000}; 
			3'd4: ly1ds_3 <= {3'b000,vt_ly1hs_3[2],4'b0000}; 
			3'd5: ly1ds_3 <= {2'b00,vt_ly1hs_3[2],5'b00000}; 
			3'd6: ly1ds_3 <= {1'b0,vt_ly1hs_3[2],6'b000000}; 
			3'd7: ly1ds_3 <= {vt_ly1hs_3[2],7'b0000000}; 
			default: ly1ds_3 <=8'h00;
		endcase
		case(lay2_half_strip[4:2])
			3'd0: ly2ds_3 <= {7'b0000000,vt_ly2hs_3[2]}; 
			3'd1: ly2ds_3 <= {6'b000000,vt_ly2hs_3[2],1'b0}; 
			3'd2: ly2ds_3 <= {5'b00000,vt_ly2hs_3[2],2'b00}; 
			3'd3: ly2ds_3 <= {4'b0000,vt_ly2hs_3[2],3'b000}; 
			3'd4: ly2ds_3 <= {3'b000,vt_ly2hs_3[2],4'b0000}; 
			3'd5: ly2ds_3 <= {2'b00,vt_ly2hs_3[2],5'b00000}; 
			3'd6: ly2ds_3 <= {1'b0,vt_ly2hs_3[2],6'b000000}; 
			3'd7: ly2ds_3 <= {vt_ly2hs_3[2],7'b0000000}; 
			default: ly2ds_3 <=8'h00;
		endcase
		case(lay3_half_strip[4:2])
			3'd0: ly3ds_3 <= {7'b0000000,vt_ly3hs_3[2]}; 
			3'd1: ly3ds_3 <= {6'b000000,vt_ly3hs_3[2],1'b0}; 
			3'd2: ly3ds_3 <= {5'b00000,vt_ly3hs_3[2],2'b00}; 
			3'd3: ly3ds_3 <= {4'b0000,vt_ly3hs_3[2],3'b000}; 
			3'd4: ly3ds_3 <= {3'b000,vt_ly3hs_3[2],4'b0000}; 
			3'd5: ly3ds_3 <= {2'b00,vt_ly3hs_3[2],5'b00000}; 
			3'd6: ly3ds_3 <= {1'b0,vt_ly3hs_3[2],6'b000000}; 
			3'd7: ly3ds_3 <= {vt_ly3hs_3[2],7'b0000000}; 
			default: ly3ds_3 <=8'h00;
		endcase
		case(lay4_half_strip[4:2])
			3'd0: ly4ds_3 <= {7'b0000000,vt_ly4hs_3[2]}; 
			3'd1: ly4ds_3 <= {6'b000000,vt_ly4hs_3[2],1'b0}; 
			3'd2: ly4ds_3 <= {5'b00000,vt_ly4hs_3[2],2'b00}; 
			3'd3: ly4ds_3 <= {4'b0000,vt_ly4hs_3[2],3'b000}; 
			3'd4: ly4ds_3 <= {3'b000,vt_ly4hs_3[2],4'b0000}; 
			3'd5: ly4ds_3 <= {2'b00,vt_ly4hs_3[2],5'b00000}; 
			3'd6: ly4ds_3 <= {1'b0,vt_ly4hs_3[2],6'b000000}; 
			3'd7: ly4ds_3 <= {vt_ly4hs_3[2],7'b0000000}; 
			default: ly4ds_3 <=8'h00;
		endcase
		case(lay5_half_strip[4:2])
			3'd0: ly5ds_3 <= {7'b0000000,vt_ly5hs_3[2]}; 
			3'd1: ly5ds_3 <= {6'b000000,vt_ly5hs_3[2],1'b0}; 
			3'd2: ly5ds_3 <= {5'b00000,vt_ly5hs_3[2],2'b00}; 
			3'd3: ly5ds_3 <= {4'b0000,vt_ly5hs_3[2],3'b000}; 
			3'd4: ly5ds_3 <= {3'b000,vt_ly5hs_3[2],4'b0000}; 
			3'd5: ly5ds_3 <= {2'b00,vt_ly5hs_3[2],5'b00000}; 
			3'd6: ly5ds_3 <= {1'b0,vt_ly5hs_3[2],6'b000000}; 
			3'd7: ly5ds_3 <= {vt_ly5hs_3[2],7'b0000000}; 
			default: ly5ds_3 <=8'h00;
		endcase
		case(lay6_half_strip[4:2])
			3'd0: ly6ds_3 <= {7'b0000000,vt_ly6hs_3[2]}; 
			3'd1: ly6ds_3 <= {6'b000000,vt_ly6hs_3[2],1'b0}; 
			3'd2: ly6ds_3 <= {5'b00000,vt_ly6hs_3[2],2'b00}; 
			3'd3: ly6ds_3 <= {4'b0000,vt_ly6hs_3[2],3'b000}; 
			3'd4: ly6ds_3 <= {3'b000,vt_ly6hs_3[2],4'b0000}; 
			3'd5: ly6ds_3 <= {2'b00,vt_ly6hs_3[2],5'b00000}; 
			3'd6: ly6ds_3 <= {1'b0,vt_ly6hs_3[2],6'b000000}; 
			3'd7: ly6ds_3 <= {vt_ly6hs_3[2],7'b0000000}; 
			default: ly6ds_3 <=8'h00;
		endcase
	end
//
// TMB transmit mode half strip patterns
//
	always @(posedge TRG_CLK80) begin
		if(vt_tx_sel_bar_1)
			if(inject_1)
				begin
					if(LAYER_MASK[0])
						case(lay1_half_strip[1:0])
							2'd0: ly1hs_1 <= 3'b100;
							2'd1: ly1hs_1 <= 3'b101;
							2'd2: ly1hs_1 <= 3'b110;
							2'd3: ly1hs_1 <= 3'b111;
							default: ly1hs_1 <= 3'b000;
						endcase
					else
						ly1hs_1 <= 3'b000;
					if(LAYER_MASK[1])
						case(lay2_half_strip[1:0])
							2'd0: ly2hs_1 <= 3'b100;
							2'd1: ly2hs_1 <= 3'b101;
							2'd2: ly2hs_1 <= 3'b110;
							2'd3: ly2hs_1 <= 3'b111;
							default: ly2hs_1 <= 3'b000;
						endcase
					else
						ly2hs_1 <= 3'b000;
					if(LAYER_MASK[2])
						case(lay3_half_strip[1:0])
							2'd0: ly3hs_1 <= 3'b100;
							2'd1: ly3hs_1 <= 3'b101;
							2'd2: ly3hs_1 <= 3'b110;
							2'd3: ly3hs_1 <= 3'b111;
							default: ly3hs_1 <= 3'b000;
						endcase
					else
						ly3hs_1 <= 3'b000;
					if(LAYER_MASK[3])
						case(lay4_half_strip[1:0])
							2'd0: ly4hs_1 <= 3'b100;
							2'd1: ly4hs_1 <= 3'b101;
							2'd2: ly4hs_1 <= 3'b110;
							2'd3: ly4hs_1 <= 3'b111;
							default: ly4hs_1 <= 3'b000;
						endcase
					else
						ly4hs_1 <= 3'b000;
					if(LAYER_MASK[4])
						case(lay5_half_strip[1:0])
							2'd0: ly5hs_1 <= 3'b100;
							2'd1: ly5hs_1 <= 3'b101;
							2'd2: ly5hs_1 <= 3'b110;
							2'd3: ly5hs_1 <= 3'b111;
							default: ly5hs_1 <= 3'b000;
						endcase
					else
						ly5hs_1 <= 3'b000;
					if(LAYER_MASK[5])
						case(lay6_half_strip[1:0])
							2'd0: ly6hs_1 <= 3'b100;
							2'd1: ly6hs_1 <= 3'b101;
							2'd2: ly6hs_1 <= 3'b110;
							2'd3: ly6hs_1 <= 3'b111;
							default: ly6hs_1 <= 3'b000;
						endcase
					else
						ly6hs_1 <= 3'b000;
				end
			else
				begin
					ly1hs_1 <= {vt_ly1hs_1[1:0],1'b0};
					ly2hs_1 <= {vt_ly2hs_1[1:0],1'b0};
					ly3hs_1 <= {vt_ly3hs_1[1:0],1'b0};
					ly4hs_1 <= {vt_ly4hs_1[1:0],1'b0};
					ly5hs_1 <= {vt_ly5hs_1[1:0],1'b0};
					ly6hs_1 <= {vt_ly6hs_1[1:0],1'b0};
				end
	end
	
	always @(posedge TRG_CLK80) begin
		if(vt_tx_sel_bar_2)
			if(inject_2)
				begin
					if(LAYER_MASK[0])
						case(lay1_half_strip[1:0])
							2'd0: ly1hs_2 <= 3'b100;
							2'd1: ly1hs_2 <= 3'b101;
							2'd2: ly1hs_2 <= 3'b110;
							2'd3: ly1hs_2 <= 3'b111;
							default: ly1hs_2 <= 3'b000;
						endcase
					else
						ly1hs_2 <= 3'b000;
					if(LAYER_MASK[1])
						case(lay2_half_strip[1:0])
							2'd0: ly2hs_2 <= 3'b100;
							2'd1: ly2hs_2 <= 3'b101;
							2'd2: ly2hs_2 <= 3'b110;
							2'd3: ly2hs_2 <= 3'b111;
							default: ly2hs_2 <= 3'b000;
						endcase
					else
						ly2hs_2 <= 3'b000;
					if(LAYER_MASK[2])
						case(lay3_half_strip[1:0])
							2'd0: ly3hs_2 <= 3'b100;
							2'd1: ly3hs_2 <= 3'b101;
							2'd2: ly3hs_2 <= 3'b110;
							2'd3: ly3hs_2 <= 3'b111;
							default: ly3hs_2 <= 3'b000;
						endcase
					else
						ly3hs_2 <= 3'b000;
					if(LAYER_MASK[3])
						case(lay4_half_strip[1:0])
							2'd0: ly4hs_2 <= 3'b100;
							2'd1: ly4hs_2 <= 3'b101;
							2'd2: ly4hs_2 <= 3'b110;
							2'd3: ly4hs_2 <= 3'b111;
							default: ly4hs_2 <= 3'b000;
						endcase
					else
						ly4hs_2 <= 3'b000;
					if(LAYER_MASK[4])
						case(lay5_half_strip[1:0])
							2'd0: ly5hs_2 <= 3'b100;
							2'd1: ly5hs_2 <= 3'b101;
							2'd2: ly5hs_2 <= 3'b110;
							2'd3: ly5hs_2 <= 3'b111;
							default: ly5hs_2 <= 3'b000;
						endcase
					else
						ly5hs_2 <= 3'b000;
					if(LAYER_MASK[5])
						case(lay6_half_strip[1:0])
							2'd0: ly6hs_2 <= 3'b100;
							2'd1: ly6hs_2 <= 3'b101;
							2'd2: ly6hs_2 <= 3'b110;
							2'd3: ly6hs_2 <= 3'b111;
							default: ly6hs_2 <= 3'b000;
						endcase
					else
						ly6hs_2 <= 3'b000;
				end
			else
				begin
					ly1hs_2 <= {vt_ly1hs_2[1:0],1'b0};
					ly2hs_2 <= {vt_ly2hs_2[1:0],1'b0};
					ly3hs_2 <= {vt_ly3hs_2[1:0],1'b0};
					ly4hs_2 <= {vt_ly4hs_2[1:0],1'b0};
					ly5hs_2 <= {vt_ly5hs_2[1:0],1'b0};
					ly6hs_2 <= {vt_ly6hs_2[1:0],1'b0};
				end
	end
	
	always @(posedge TRG_CLK80) begin
		if(vt_tx_sel_bar_3)
			if(inject_3)
				begin
					if(LAYER_MASK[0])
						case(lay1_half_strip[1:0])
							2'd0: ly1hs_3 <= 3'b100;
							2'd1: ly1hs_3 <= 3'b101;
							2'd2: ly1hs_3 <= 3'b110;
							2'd3: ly1hs_3 <= 3'b111;
							default: ly1hs_3 <= 3'b000;
						endcase
					else
						ly1hs_3 <= 3'b000;
					if(LAYER_MASK[1])
						case(lay2_half_strip[1:0])
							2'd0: ly2hs_3 <= 3'b100;
							2'd1: ly2hs_3 <= 3'b101;
							2'd2: ly2hs_3 <= 3'b110;
							2'd3: ly2hs_3 <= 3'b111;
							default: ly2hs_3 <= 3'b000;
						endcase
					else
						ly2hs_3 <= 3'b000;
					if(LAYER_MASK[2])
						case(lay3_half_strip[1:0])
							2'd0: ly3hs_3 <= 3'b100;
							2'd1: ly3hs_3 <= 3'b101;
							2'd2: ly3hs_3 <= 3'b110;
							2'd3: ly3hs_3 <= 3'b111;
							default: ly3hs_3 <= 3'b000;
						endcase
					else
						ly3hs_3 <= 3'b000;
					if(LAYER_MASK[3])
						case(lay4_half_strip[1:0])
							2'd0: ly4hs_3 <= 3'b100;
							2'd1: ly4hs_3 <= 3'b101;
							2'd2: ly4hs_3 <= 3'b110;
							2'd3: ly4hs_3 <= 3'b111;
							default: ly4hs_3 <= 3'b000;
						endcase
					else
						ly4hs_3 <= 3'b000;
					if(LAYER_MASK[4])
						case(lay5_half_strip[1:0])
							2'd0: ly5hs_3 <= 3'b100;
							2'd1: ly5hs_3 <= 3'b101;
							2'd2: ly5hs_3 <= 3'b110;
							2'd3: ly5hs_3 <= 3'b111;
							default: ly5hs_3 <= 3'b000;
						endcase
					else
						ly5hs_3 <= 3'b000;
					if(LAYER_MASK[5])
						case(lay6_half_strip[1:0])
							2'd0: ly6hs_3 <= 3'b100;
							2'd1: ly6hs_3 <= 3'b101;
							2'd2: ly6hs_3 <= 3'b110;
							2'd3: ly6hs_3 <= 3'b111;
							default: ly6hs_3 <= 3'b000;
						endcase
					else
						ly6hs_3 <= 3'b000;
				end
			else
				begin
					ly1hs_3 <= {vt_ly1hs_3[1:0],1'b0};
					ly2hs_3 <= {vt_ly2hs_3[1:0],1'b0};
					ly3hs_3 <= {vt_ly3hs_3[1:0],1'b0};
					ly4hs_3 <= {vt_ly4hs_3[1:0],1'b0};
					ly5hs_3 <= {vt_ly5hs_3[1:0],1'b0};
					ly6hs_3 <= {vt_ly6hs_3[1:0],1'b0};
				end
	end
	
end
else 
begin : Comp_logic

	reg rst_tx;
	reg prbs_rst;
	reg p_rst_r7;
	reg [6:0] p_rst_p;
	reg ltncy_trig_r;
	reg tx_sel;
	reg tx_sel_bar;
	reg [47:0] fixed_pats;
	reg [7:0] trgcnt;
	reg [7:0] txmode_cntr;
	reg [7:0] ly1ds;
	reg [7:0] ly2ds;
	reg [7:0] ly3ds;
	reg [7:0] ly4ds;
	reg [7:0] ly5ds;
	reg [7:0] ly6ds;
	reg [2:0] ly1hs;
	reg [2:0] ly2hs;
	reg [2:0] ly3hs;
	reg [2:0] ly4hs;
	reg [2:0] ly5hs;
	reg [2:0] ly6hs;
	reg trig_r1;
	reg trig_r2;
	reg trig_r3;
	
	wire p_rst_clr;
	wire inject;
	reg  lt_trg;
	

	assign LTNCY_TRIG = ltncy_trig_r;
	assign trgcnt_i = trgcnt;
	assign fixed_pats_i = fixed_pats;
	assign txmode_cntr_i = txmode_cntr;
	assign ly1ds_i = ly1ds;
	assign ly2ds_i = ly2ds;
	assign ly3ds_i = ly3ds;
	assign ly4ds_i = ly4ds;
	assign ly5ds_i = ly5ds;
	assign ly6ds_i = ly6ds;
	assign tx_sel_i = tx_sel;
	assign prbs_rst_i = prbs_rst;
	assign rst_tx_i = rst_tx;
	
	assign p_rst_clr = ~p_rst_p[6] & p_rst_r7;
	assign inject = trig_r2 & ~trig_r3;

	always @* begin
		if(!rst_tx && (trgcnt==8'h00)) begin
			lt_trg = 1'b1;
		end
		else begin
			lt_trg = 1'b0;
		end
	end
	
	always @(posedge TRG_CLK80) begin
		rst_tx <= TRG_RST;
		ltncy_trig_r <= lt_trg;
	end
	always @(posedge TRG_CLK80 or posedge TRG_RST) begin
		if(TRG_RST) begin
			tx_sel <= 1'b1;
			tx_sel_bar <= 1'b1;
		end
		else begin
			tx_sel <= ~tx_sel;
			tx_sel_bar <= tx_sel;
		end
	end
	always @(posedge TRG_CLK80 or posedge rst_tx) begin
		if(rst_tx) begin
			trgcnt <= 8'h00;
		end
		else begin
			trgcnt <= trgcnt + 1;
		end
	end
	

//
// Test pattern reset
//  

	always @(posedge TRG_CLK80) begin
		p_rst_p <= tx_sel_bar ? {p_rst_p[5:0],TRG_RST} : p_rst_p; // use SRL
		p_rst_r7 <= tx_sel_bar ? p_rst_p[6] : p_rst_r7;
	end
	always @(posedge TRG_CLK80 or posedge TRG_RST) begin // stretch prbs reset 8 CMS clock cycles beyond TRG_RST release
		if(TRG_RST) begin
			prbs_rst <= 1'b1;
		end
		else begin
			prbs_rst <= (p_rst_clr && tx_sel_bar) ? 1'b0 : prbs_rst;
		end
	end

//
// TMB transmit mode counter
//
	always @(posedge TRG_CLK80 or posedge rst_tx) begin
		if(rst_tx)
			txmode_cntr <= 8'h00;
		else
			if(tx_sel_bar)
				txmode_cntr <= txmode_cntr + 1;
	end
//
// TMB transmit mode fixed patterns
//
	always @(posedge TRG_CLK80) begin
		if(tx_sel_bar)
			case(txmode_cntr[1:0])
				2'd0: fixed_pats <= 48'h000000000000;
				2'd1: fixed_pats <= 48'hAAAAAAAAAAAA;
				2'd2: fixed_pats <= 48'hFFFFFFFFFFFF;
				2'd3: fixed_pats <= 48'h555555555555;
				default: fixed_pats <= 48'h000000000000;
			endcase
	end

//
// Synchronize pulse trigger
//
	always @(posedge TRG_CLK80) begin
		if(tx_sel_bar) begin
			trig_r1 <= TRG_PULSE;
			trig_r2 <= trig_r1;
			trig_r3 <= trig_r2;
		end
	end

	always @(posedge TRG_CLK80) begin
		case(lay1_half_strip[4:2])
			3'd0: ly1ds <= {7'b0000000,ly1hs[2]}; 
			3'd1: ly1ds <= {6'b000000,ly1hs[2],1'b0}; 
			3'd2: ly1ds <= {5'b00000,ly1hs[2],2'b00}; 
			3'd3: ly1ds <= {4'b0000,ly1hs[2],3'b000}; 
			3'd4: ly1ds <= {3'b000,ly1hs[2],4'b0000}; 
			3'd5: ly1ds <= {2'b00,ly1hs[2],5'b00000}; 
			3'd6: ly1ds <= {1'b0,ly1hs[2],6'b000000}; 
			3'd7: ly1ds <= {ly1hs[2],7'b0000000}; 
			default: ly1ds <=8'h00;
		endcase
		case(lay2_half_strip[4:2])
			3'd0: ly2ds <= {7'b0000000,ly2hs[2]}; 
			3'd1: ly2ds <= {6'b000000,ly2hs[2],1'b0}; 
			3'd2: ly2ds <= {5'b00000,ly2hs[2],2'b00}; 
			3'd3: ly2ds <= {4'b0000,ly2hs[2],3'b000}; 
			3'd4: ly2ds <= {3'b000,ly2hs[2],4'b0000}; 
			3'd5: ly2ds <= {2'b00,ly2hs[2],5'b00000}; 
			3'd6: ly2ds <= {1'b0,ly2hs[2],6'b000000}; 
			3'd7: ly2ds <= {ly2hs[2],7'b0000000}; 
			default: ly2ds <=8'h00;
		endcase
		case(lay3_half_strip[4:2])
			3'd0: ly3ds <= {7'b0000000,ly3hs[2]}; 
			3'd1: ly3ds <= {6'b000000,ly3hs[2],1'b0}; 
			3'd2: ly3ds <= {5'b00000,ly3hs[2],2'b00}; 
			3'd3: ly3ds <= {4'b0000,ly3hs[2],3'b000}; 
			3'd4: ly3ds <= {3'b000,ly3hs[2],4'b0000}; 
			3'd5: ly3ds <= {2'b00,ly3hs[2],5'b00000}; 
			3'd6: ly3ds <= {1'b0,ly3hs[2],6'b000000}; 
			3'd7: ly3ds <= {ly3hs[2],7'b0000000}; 
			default: ly3ds <=8'h00;
		endcase
		case(lay4_half_strip[4:2])
			3'd0: ly4ds <= {7'b0000000,ly4hs[2]}; 
			3'd1: ly4ds <= {6'b000000,ly4hs[2],1'b0}; 
			3'd2: ly4ds <= {5'b00000,ly4hs[2],2'b00}; 
			3'd3: ly4ds <= {4'b0000,ly4hs[2],3'b000}; 
			3'd4: ly4ds <= {3'b000,ly4hs[2],4'b0000}; 
			3'd5: ly4ds <= {2'b00,ly4hs[2],5'b00000}; 
			3'd6: ly4ds <= {1'b0,ly4hs[2],6'b000000}; 
			3'd7: ly4ds <= {ly4hs[2],7'b0000000}; 
			default: ly4ds <=8'h00;
		endcase
		case(lay5_half_strip[4:2])
			3'd0: ly5ds <= {7'b0000000,ly5hs[2]}; 
			3'd1: ly5ds <= {6'b000000,ly5hs[2],1'b0}; 
			3'd2: ly5ds <= {5'b00000,ly5hs[2],2'b00}; 
			3'd3: ly5ds <= {4'b0000,ly5hs[2],3'b000}; 
			3'd4: ly5ds <= {3'b000,ly5hs[2],4'b0000}; 
			3'd5: ly5ds <= {2'b00,ly5hs[2],5'b00000}; 
			3'd6: ly5ds <= {1'b0,ly5hs[2],6'b000000}; 
			3'd7: ly5ds <= {ly5hs[2],7'b0000000}; 
			default: ly5ds <=8'h00;
		endcase
		case(lay6_half_strip[4:2])
			3'd0: ly6ds <= {7'b0000000,ly6hs[2]}; 
			3'd1: ly6ds <= {6'b000000,ly6hs[2],1'b0}; 
			3'd2: ly6ds <= {5'b00000,ly6hs[2],2'b00}; 
			3'd3: ly6ds <= {4'b0000,ly6hs[2],3'b000}; 
			3'd4: ly6ds <= {3'b000,ly6hs[2],4'b0000}; 
			3'd5: ly6ds <= {2'b00,ly6hs[2],5'b00000}; 
			3'd6: ly6ds <= {1'b0,ly6hs[2],6'b000000}; 
			3'd7: ly6ds <= {ly6hs[2],7'b0000000}; 
			default: ly6ds <=8'h00;
		endcase
	end
//
// TMB transmit mode half strip patterns
//
	always @(posedge TRG_CLK80) begin
		if(tx_sel_bar)
			if(inject)
				begin
					if(LAYER_MASK[0])
						case(lay1_half_strip[1:0])
							2'd0: ly1hs <= 3'b100;
							2'd1: ly1hs <= 3'b101;
							2'd2: ly1hs <= 3'b110;
							2'd3: ly1hs <= 3'b111;
							default: ly1hs <= 3'b000;
						endcase
					else
						ly1hs <= 3'b000;
					if(LAYER_MASK[1])
						case(lay2_half_strip[1:0])
							2'd0: ly2hs <= 3'b100;
							2'd1: ly2hs <= 3'b101;
							2'd2: ly2hs <= 3'b110;
							2'd3: ly2hs <= 3'b111;
							default: ly2hs <= 3'b000;
						endcase
					else
						ly2hs <= 3'b000;
					if(LAYER_MASK[2])
						case(lay3_half_strip[1:0])
							2'd0: ly3hs <= 3'b100;
							2'd1: ly3hs <= 3'b101;
							2'd2: ly3hs <= 3'b110;
							2'd3: ly3hs <= 3'b111;
							default: ly3hs <= 3'b000;
						endcase
					else
						ly3hs <= 3'b000;
					if(LAYER_MASK[3])
						case(lay4_half_strip[1:0])
							2'd0: ly4hs <= 3'b100;
							2'd1: ly4hs <= 3'b101;
							2'd2: ly4hs <= 3'b110;
							2'd3: ly4hs <= 3'b111;
							default: ly4hs <= 3'b000;
						endcase
					else
						ly4hs <= 3'b000;
					if(LAYER_MASK[4])
						case(lay5_half_strip[1:0])
							2'd0: ly5hs <= 3'b100;
							2'd1: ly5hs <= 3'b101;
							2'd2: ly5hs <= 3'b110;
							2'd3: ly5hs <= 3'b111;
							default: ly5hs <= 3'b000;
						endcase
					else
						ly5hs <= 3'b000;
					if(LAYER_MASK[5])
						case(lay6_half_strip[1:0])
							2'd0: ly6hs <= 3'b100;
							2'd1: ly6hs <= 3'b101;
							2'd2: ly6hs <= 3'b110;
							2'd3: ly6hs <= 3'b111;
							default: ly6hs <= 3'b000;
						endcase
					else
						ly6hs <= 3'b000;
				end
			else
				begin
					ly1hs <= {ly1hs[1:0],1'b0};
					ly2hs <= {ly2hs[1:0],1'b0};
					ly3hs <= {ly3hs[1:0],1'b0};
					ly4hs <= {ly4hs[1:0],1'b0};
					ly5hs <= {ly5hs[1:0],1'b0};
					ly6hs <= {ly6hs[1:0],1'b0};
				end
	end
	
end
endgenerate

//
// Pseudo Random Bit Stream
//

	PRBS_tx #(
		.start_pattern(48'hFFFFFF000000),
		.TMR(TMR)
	)
	tx1 (
		.OUT_CLK_ENA(tx_sel_i), 
		.GEN_CLK(TRG_CLK80), 
		.RST(prbs_rst_i),
		.INJ_ERR(INJ_ERR),
		.PRBS(prbs),
		.STRT_LTNCY(STRT_LTNCY)
	);
	
endmodule
