`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:59 04/01/2011 
// Design Name: 
// Module Name:    trigger 
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
// Removed all FF EMU functionality 10/27/2017
//
//////////////////////////////////////////////////////////////////////////////////
module trigger #(
	parameter TMR = 0
)
(
	input CLK40,
	input RST,
	// external connections
	input SKW_L1A_P,
	input SKW_L1A_N,
	input SKW_L1A_MATCH_P,
	input SKW_L1A_MATCH_N,
	input SKW_RESYNC_P,
	input SKW_RESYNC_N,
	input SKW_BC0_P,
	input SKW_BC0_N,
	// internal signals
	input [1:0] TTC_SRC,
	input USE_ANY_L1A,
	input CSP_RESYNC,
	// common signals
	output L1A,
	output L1A_MATCH,
	output LCT,
	output RESYNC,
	output RST_RESYNC,
	output [11:0] BC0CNT,
	output BC0
	);
  // TTC configuration modes
  parameter 
  FF_EMU_mode    = 2'b00, // mode not used
  FF_FEM_mode    = 2'b01, // mode not used
  Skew_Clr_mode  = 2'b10;

wire skw_rw_l1a;
wire skw_rw_l1a_match;
wire skw_rw_resync;
wire skw_rw_bc0;

assign RST_RESYNC = RST || RESYNC;

  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_L1A (.O(skw_rw_l1a),.I(SKW_L1A_P),.IB(SKW_L1A_N));
  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_L1A_MATCH (.O(skw_rw_l1a_match),.I(SKW_L1A_MATCH_P),.IB(SKW_L1A_MATCH_N));
  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_RESYNC (.O(skw_rw_resync),.I(SKW_RESYNC_P),.IB(SKW_RESYNC_N));
  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_BC0 (.O(skw_rw_bc0),.I(SKW_BC0_P),.IB(SKW_BC0_N));

generate
if(TMR==1) 
begin : TRG_logic_TMR

	(* syn_preserve = "true" *) reg l1a_1;
	(* syn_preserve = "true" *) reg l1a_2;
	(* syn_preserve = "true" *) reg l1a_3;
	(* syn_preserve = "true" *) reg l1a_match_1;
	(* syn_preserve = "true" *) reg l1a_match_2;
	(* syn_preserve = "true" *) reg l1a_match_3;
	(* syn_preserve = "true" *) reg lct_1;
	(* syn_preserve = "true" *) reg lct_2;
	(* syn_preserve = "true" *) reg lct_3;
	(* syn_preserve = "true" *) reg resync_1;
	(* syn_preserve = "true" *) reg resync_2;
	(* syn_preserve = "true" *) reg resync_3;
	(* syn_preserve = "true" *) reg [11:0] bc0cnt_1;
	(* syn_preserve = "true" *) reg [11:0] bc0cnt_2;
	(* syn_preserve = "true" *) reg [11:0] bc0cnt_3;
	(* syn_preserve = "true" *) reg bc0_1;
	(* syn_preserve = "true" *) reg bc0_2;
	(* syn_preserve = "true" *) reg bc0_3;
	
	(* syn_keep = "true" *) wire [11:0] vt_bc0cnt_1;
	(* syn_keep = "true" *) wire [11:0] vt_bc0cnt_2;
	(* syn_keep = "true" *) wire [11:0] vt_bc0cnt_3;
	(* syn_keep = "true" *) wire vt_bc0_1;
	(* syn_keep = "true" *) wire vt_bc0_2;
	(* syn_keep = "true" *) wire vt_bc0_3;

	assign vt_bc0cnt_1    = (bc0cnt_1    & bc0cnt_2   ) | (bc0cnt_2    & bc0cnt_3   ) | (bc0cnt_1    & bc0cnt_3   ); // Majority logic
	assign vt_bc0cnt_2    = (bc0cnt_1    & bc0cnt_2   ) | (bc0cnt_2    & bc0cnt_3   ) | (bc0cnt_1    & bc0cnt_3   ); // Majority logic
	assign vt_bc0cnt_3    = (bc0cnt_1    & bc0cnt_2   ) | (bc0cnt_2    & bc0cnt_3   ) | (bc0cnt_1    & bc0cnt_3   ); // Majority logic
	assign vt_bc0_1       = (bc0_1       & bc0_2      ) | (bc0_2       & bc0_3      ) | (bc0_1       & bc0_3      ); // Majority logic
	assign vt_bc0_2       = (bc0_1       & bc0_2      ) | (bc0_2       & bc0_3      ) | (bc0_1       & bc0_3      ); // Majority logic
	assign vt_bc0_3       = (bc0_1       & bc0_2      ) | (bc0_2       & bc0_3      ) | (bc0_1       & bc0_3      ); // Majority logic

	assign L1A       = (l1a_1       & l1a_2      ) | (l1a_2       & l1a_3      ) | (l1a_1       & l1a_3      ); // Majority logic
	assign L1A_MATCH = (l1a_match_1 & l1a_match_2) | (l1a_match_2 & l1a_match_3) | (l1a_match_1 & l1a_match_3); // Majority logic
	assign LCT       = (lct_1       & lct_2      ) | (lct_2       & lct_3      ) | (lct_1       & lct_3      ); // Majority logic
	assign RESYNC    = (resync_1    & resync_2   ) | (resync_2    & resync_3   ) | (resync_1    & resync_3   ); // Majority logic
	assign BC0CNT    = vt_bc0cnt_1;
	assign BC0       = vt_bc0_1;

	always @(posedge CLK40) begin
		lct_1 <= skw_rw_l1a_match;  // for use with old DMB's
		lct_2 <= skw_rw_l1a_match;  // for use with old DMB's
		lct_3 <= skw_rw_l1a_match;  // for use with old DMB's
		case(TTC_SRC)
			Skew_Clr_mode : begin
				l1a_1       <= skw_rw_l1a;
				l1a_2       <= skw_rw_l1a;
				l1a_3       <= skw_rw_l1a;
				if(USE_ANY_L1A)
					l1a_match_1   <= skw_rw_l1a; //Send data on all L1A's
				else
					l1a_match_1   <= skw_rw_l1a_match; //Send data only on matched L1A's
				if(USE_ANY_L1A)
					l1a_match_2   <= skw_rw_l1a; //Send data on all L1A's
				else
					l1a_match_2   <= skw_rw_l1a_match; //Send data only on matched L1A's
				if(USE_ANY_L1A)
					l1a_match_3   <= skw_rw_l1a; //Send data on all L1A's
				else
					l1a_match_3   <= skw_rw_l1a_match; //Send data only on matched L1A's
				resync_1    <= skw_rw_resync || CSP_RESYNC;
				resync_2    <= skw_rw_resync || CSP_RESYNC;
				resync_3    <= skw_rw_resync || CSP_RESYNC;
				bc0_1	      <= skw_rw_bc0;
				bc0_2	      <= skw_rw_bc0;
				bc0_3	      <= skw_rw_bc0;
			end
			default: begin
				l1a_1       <= skw_rw_l1a;
				l1a_2       <= skw_rw_l1a;
				l1a_3       <= skw_rw_l1a;
				l1a_match_1 <= skw_rw_l1a_match;
				l1a_match_2 <= skw_rw_l1a_match;
				l1a_match_3 <= skw_rw_l1a_match;
				resync_1    <= skw_rw_resync;
				resync_2    <= skw_rw_resync;
				resync_3    <= skw_rw_resync;
				bc0_1	      <= skw_rw_bc0;
				bc0_2	      <= skw_rw_bc0;
				bc0_3	      <= skw_rw_bc0;
			end
			
		endcase
	end
	
	
	always @(posedge CLK40 or posedge RST_RESYNC) begin
		if(RST_RESYNC) begin
			bc0cnt_1 <= 12'h000;
			bc0cnt_2 <= 12'h000;
			bc0cnt_3 <= 12'h000;
		end
		else begin
			bc0cnt_1 <= vt_bc0_1 ? vt_bc0cnt_1 + 1 : vt_bc0cnt_1;
			bc0cnt_2 <= vt_bc0_2 ? vt_bc0cnt_2 + 1 : vt_bc0cnt_2;
			bc0cnt_3 <= vt_bc0_3 ? vt_bc0cnt_3 + 1 : vt_bc0cnt_3;
		end
	end
	
end
else 
begin : TRG_logic

	reg l1a_r;
	reg l1a_match_r;
	reg lct_r;
	reg resync_r;
	reg [11:0] bc0cnt_r;
	reg bc0_r;

	assign L1A       = l1a_r;
	assign L1A_MATCH = l1a_match_r;
	assign LCT       = lct_r;
	assign RESYNC    = resync_r;
	assign BC0CNT    = bc0cnt_r;
	assign BC0       = bc0_r;

	always @(posedge CLK40) begin
		lct_r <= skw_rw_l1a_match;  // for use with old DMB's
		case(TTC_SRC)
			Skew_Clr_mode : begin
				l1a_r       <= skw_rw_l1a;
				if(USE_ANY_L1A)
					l1a_match_r   <= skw_rw_l1a; //Send data on all L1A's
				else
					l1a_match_r   <= skw_rw_l1a_match; //Send data only on matched L1A's
				resync_r    <= skw_rw_resync || CSP_RESYNC;
				bc0_r	      <= skw_rw_bc0;
			end
			default: begin
				l1a_r       <= skw_rw_l1a;
				l1a_match_r <= skw_rw_l1a_match;
				resync_r    <= skw_rw_resync;
				bc0_r	      <= skw_rw_bc0;
			end
			
		endcase
	end
	
	
	always @(posedge CLK40 or posedge RST_RESYNC) begin
		if(RST_RESYNC) begin
			bc0cnt_r <= 12'h000;
		end
		else begin
			bc0cnt_r <= bc0_r ? bc0cnt_r + 1 : bc0cnt_r;
		end
	end
	
end
endgenerate

endmodule
