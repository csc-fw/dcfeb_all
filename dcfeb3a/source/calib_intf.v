`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07/27/2012 
// Design Name: 
// Module Name:    calib_intf 
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
module calib_intf #(
	parameter TMR = 0
)
(
	input CLK40,
	input RST_RESYNC,
	// external connections
	input SKW_EXTPLS_P,
	input SKW_EXTPLS_N,
	input SKW_INJPLS_P,
	input SKW_INJPLS_N,
	input INJPLS_LV,
	input EXTPLS_LV,
	// internal signals
	input [1:0] TTC_SRC,
	input CAL_MODE,
	// common signals
	output INJPULSE_P,
	output INJPULSE_N,
	output EXTPULSE_P,
	output EXTPULSE_N,
	output reg TRG_PULSE,
	// counters
	output [11:0] INJPLSCNT,
	output [11:0] EXTPLSCNT
	);
  // TTC configuration modes
  parameter 
  FF_EMU_mode    = 2'b00,  // mode not used
  FF_EEM_mode    = 2'b01,  // mode not used
  Skew_Clr_mode  = 2'b10;

wire skw_rw_extpls;
wire skw_rw_injpls;
wire trg_extpls;
wire trg_injpls;

reg ext_pulse;
reg inj_pulse;

  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_EXP (.O(skw_rw_extpls),.I(SKW_EXTPLS_P),.IB(SKW_EXTPLS_N));
  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_SKW_IJP (.O(skw_rw_injpls),.I(SKW_INJPLS_P),.IB(SKW_INJPLS_N));
  IBUF IBUF_TRG_EXP (.O(trg_extpls),.I(EXTPLS_LV));
  IBUF IBUF_TRG_IJP (.O(trg_injpls),.I(INJPLS_LV));
  OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_EXP (.O(EXTPULSE_P),.OB(EXTPULSE_N),.I(ext_pulse));
  OBUFDS #(.IOSTANDARD("DEFAULT")) OBUFDS_IJP (.O(INJPULSE_P),.OB(INJPULSE_N),.I(inj_pulse));

	always @* begin		// These are not clocked, just passed through to preserve timing.
		TRG_PULSE = trg_extpls | trg_injpls;
		case(TTC_SRC)
			Skew_Clr_mode : begin
				ext_pulse = skw_rw_extpls;
				inj_pulse = skw_rw_injpls;
			end
			default: begin
				ext_pulse = skw_rw_extpls;
				inj_pulse = skw_rw_injpls;
			end
		endcase
	end

generate
if(TMR==1) 
begin : Cal_logic_TMR
	
	(* syn_preserve = "true" *) reg ext_pulse_r1_1;
	(* syn_preserve = "true" *) reg ext_pulse_r1_2;
	(* syn_preserve = "true" *) reg ext_pulse_r1_3;
	(* syn_preserve = "true" *) reg inj_pulse_r1_1;
	(* syn_preserve = "true" *) reg inj_pulse_r1_2;
	(* syn_preserve = "true" *) reg inj_pulse_r1_3;
	(* syn_preserve = "true" *) reg [11:0] injplscnt_r_1;
	(* syn_preserve = "true" *) reg [11:0] injplscnt_r_2;
	(* syn_preserve = "true" *) reg [11:0] injplscnt_r_3;
	(* syn_preserve = "true" *) reg [11:0] extplscnt_r_1;
	(* syn_preserve = "true" *) reg [11:0] extplscnt_r_2;
	(* syn_preserve = "true" *) reg [11:0] extplscnt_r_3;
	
	(* syn_keep = "true" *) wire vt_ext_pulse_r1_1;
	(* syn_keep = "true" *) wire vt_ext_pulse_r1_2;
	(* syn_keep = "true" *) wire vt_ext_pulse_r1_3;
	(* syn_keep = "true" *) wire vt_inj_pulse_r1_1;
	(* syn_keep = "true" *) wire vt_inj_pulse_r1_2;
	(* syn_keep = "true" *) wire vt_inj_pulse_r1_3;
	(* syn_keep = "true" *) wire [11:0] vt_injplscnt_r_1;
	(* syn_keep = "true" *) wire [11:0] vt_injplscnt_r_2;
	(* syn_keep = "true" *) wire [11:0] vt_injplscnt_r_3;
	(* syn_keep = "true" *) wire [11:0] vt_extplscnt_r_1;
	(* syn_keep = "true" *) wire [11:0] vt_extplscnt_r_2;
	(* syn_keep = "true" *) wire [11:0] vt_extplscnt_r_3;
	
	(* syn_keep = "true" *) wire inc_ext_1;
	(* syn_keep = "true" *) wire inc_ext_2;
	(* syn_keep = "true" *) wire inc_ext_3;
	(* syn_keep = "true" *) wire inc_inj_1;
	(* syn_keep = "true" *) wire inc_inj_2;
	(* syn_keep = "true" *) wire inc_inj_3;

	assign vt_ext_pulse_r1_1    = (ext_pulse_r1_1 & ext_pulse_r1_2) | (ext_pulse_r1_2 & ext_pulse_r1_3) | (ext_pulse_r1_1 & ext_pulse_r1_3); // Majority logic
	assign vt_inj_pulse_r1_1    = (inj_pulse_r1_1 & inj_pulse_r1_2) | (inj_pulse_r1_2 & inj_pulse_r1_3) | (inj_pulse_r1_1 & inj_pulse_r1_3); // Majority logic
	assign vt_injplscnt_r_1     = (injplscnt_r_1  & injplscnt_r_2 ) | (injplscnt_r_2  & injplscnt_r_3 ) | (injplscnt_r_1  & injplscnt_r_3 ); // Majority logic
	assign vt_extplscnt_r_1     = (extplscnt_r_1  & extplscnt_r_2 ) | (extplscnt_r_2  & extplscnt_r_3 ) | (extplscnt_r_1  & extplscnt_r_3 ); // Majority logic

	assign INJPLSCNT = vt_injplscnt_r_1;
	assign EXTPLSCNT = vt_extplscnt_r_1;
	
	assign inc_ext_1 = ext_pulse & ~vt_ext_pulse_r1_1;
	assign inc_ext_2 = ext_pulse & ~vt_ext_pulse_r1_2;
	assign inc_ext_3 = ext_pulse & ~vt_ext_pulse_r1_3;
	assign inc_inj_1 = inj_pulse & ~vt_inj_pulse_r1_1;
	assign inc_inj_2 = inj_pulse & ~vt_inj_pulse_r1_2;
	assign inc_inj_3 = inj_pulse & ~vt_inj_pulse_r1_3;

	always @(posedge CLK40) begin
		ext_pulse_r1_1 <= ext_pulse;
		ext_pulse_r1_2 <= ext_pulse;
		ext_pulse_r1_3 <= ext_pulse;
		inj_pulse_r1_1 <= inj_pulse;
		inj_pulse_r1_2 <= inj_pulse;
		inj_pulse_r1_3 <= inj_pulse;
	end
	
	always @(posedge CLK40 or posedge RST_RESYNC) begin
		if(RST_RESYNC) begin
			extplscnt_r_1 <= 12'h000;
			extplscnt_r_2 <= 12'h000;
			extplscnt_r_3 <= 12'h000;
			injplscnt_r_1 <= 12'h000;
			injplscnt_r_2 <= 12'h000;
			injplscnt_r_3 <= 12'h000;
		end
		else begin
			extplscnt_r_1 <= inc_ext_1 ? vt_extplscnt_r_1 + 1 : vt_extplscnt_r_1;
			extplscnt_r_2 <= inc_ext_2 ? vt_extplscnt_r_2 + 1 : vt_extplscnt_r_2;
			extplscnt_r_3 <= inc_ext_3 ? vt_extplscnt_r_3 + 1 : vt_extplscnt_r_3;
			injplscnt_r_1 <= inc_inj_1 ? vt_injplscnt_r_1 + 1 : vt_injplscnt_r_1;
			injplscnt_r_2 <= inc_inj_2 ? vt_injplscnt_r_2 + 1 : vt_injplscnt_r_2;
			injplscnt_r_3 <= inc_inj_3 ? vt_injplscnt_r_3 + 1 : vt_injplscnt_r_3;
		end
	end

end
else 
begin : Cal_logic

	reg ext_pulse_r1;
	reg inj_pulse_r1;
	reg [11:0] injplscnt_r;
	reg [11:0] extplscnt_r;
	
	wire inc_ext;
	wire inc_inj;

	assign INJPLSCNT = injplscnt_r;
	assign EXTPLSCNT = extplscnt_r;
	
	assign inc_ext = ext_pulse & ~ext_pulse_r1;
	assign inc_inj = inj_pulse & ~inj_pulse_r1;

	always @(posedge CLK40) begin
		ext_pulse_r1 <= ext_pulse;
		inj_pulse_r1 <= inj_pulse;
	end
	
	always @(posedge CLK40 or posedge RST_RESYNC) begin
		if(RST_RESYNC) begin
			extplscnt_r <= 12'h000;
			injplscnt_r <= 12'h000;
		end
		else begin
			extplscnt_r <= inc_ext ? extplscnt_r + 1 : extplscnt_r;
			injplscnt_r <= inc_inj ? injplscnt_r + 1 : injplscnt_r;
		end
	end

end
endgenerate

endmodule
