`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:11 07/08/2011 
// Design Name: 
// Module Name:    PRBS_tx 
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
module PRBS_tx #(
	parameter start_pattern = 48'hFFFFFF000000,
	parameter TMR = 0
)(
    input OUT_CLK_ENA,
    input GEN_CLK,
    input RST,
	 input INJ_ERR,
    output [47:0] PRBS,
	 output STRT_LTNCY
    );

wire rst_lfsr;

generate
if(TMR==1) 
begin : PRBS_logic_TMR

	(* syn_preserve = "true" *) reg [47:0] prbs_1;
	(* syn_preserve = "true" *) reg [47:0] prbs_2;
	(* syn_preserve = "true" *) reg [47:0] prbs_3;
	(* syn_preserve = "true" *) reg [23:0] lfsr_a_1;
	(* syn_preserve = "true" *) reg [23:0] lfsr_a_2;
	(* syn_preserve = "true" *) reg [23:0] lfsr_a_3;
	(* syn_preserve = "true" *) reg [23:0] lfsr_b_1;
	(* syn_preserve = "true" *) reg [23:0] lfsr_b_2;
	(* syn_preserve = "true" *) reg [23:0] lfsr_b_3;
	(* syn_preserve = "true" *) reg rst1_1  = 1'b1;
	(* syn_preserve = "true" *) reg rst1_2  = 1'b1;
	(* syn_preserve = "true" *) reg rst1_3  = 1'b1;
	(* syn_preserve = "true" *) reg rst2_1  = 1'b1;
	(* syn_preserve = "true" *) reg rst2_2  = 1'b1;
	(* syn_preserve = "true" *) reg rst2_3  = 1'b1;
	(* syn_preserve = "true" *) reg rst_f_1 = 1'b1;
	(* syn_preserve = "true" *) reg rst_f_2 = 1'b1;
	(* syn_preserve = "true" *) reg rst_f_3 = 1'b1;
	(* syn_preserve = "true" *) reg strt_ltncy_1;
	(* syn_preserve = "true" *) reg strt_ltncy_2;
	(* syn_preserve = "true" *) reg strt_ltncy_3;

	(* syn_keep = "true" *) wire [23:0] vt_lfsr_a_1;
	(* syn_keep = "true" *) wire [23:0] vt_lfsr_a_2;
	(* syn_keep = "true" *) wire [23:0] vt_lfsr_a_3;
	(* syn_keep = "true" *) wire [23:0] vt_lfsr_b_1;
	(* syn_keep = "true" *) wire [23:0] vt_lfsr_b_2;
	(* syn_keep = "true" *) wire [23:0] vt_lfsr_b_3;
	(* syn_keep = "true" *) wire vt_rst1_1;
	(* syn_keep = "true" *) wire vt_rst1_2;
	(* syn_keep = "true" *) wire vt_rst1_3;
	(* syn_keep = "true" *) wire vt_rst2_1;
	(* syn_keep = "true" *) wire vt_rst2_2;
	(* syn_keep = "true" *) wire vt_rst2_3;
	(* syn_keep = "true" *) wire vt_rst_f_1;
	(* syn_keep = "true" *) wire vt_rst_f_2;
	(* syn_keep = "true" *) wire vt_rst_f_3;

	(* syn_keep = "true" *) wire [23:0] lfsr_i1;
	(* syn_keep = "true" *) wire [23:0] lfsr_i2;
	(* syn_keep = "true" *) wire [23:0] lfsr_i3;

	(* syn_keep = "true" *) wire start_pat_1;
	(* syn_keep = "true" *) wire start_pat_2;
	(* syn_keep = "true" *) wire start_pat_3;


	assign vt_lfsr_a_1 = (lfsr_a_1     & lfsr_a_2    ) | (lfsr_a_2     & lfsr_a_3    ) | (lfsr_a_1     & lfsr_a_3    ); // Majority logic
	assign vt_lfsr_a_2 = (lfsr_a_1     & lfsr_a_2    ) | (lfsr_a_2     & lfsr_a_3    ) | (lfsr_a_1     & lfsr_a_3    ); // Majority logic
	assign vt_lfsr_a_3 = (lfsr_a_1     & lfsr_a_2    ) | (lfsr_a_2     & lfsr_a_3    ) | (lfsr_a_1     & lfsr_a_3    ); // Majority logic
	assign vt_lfsr_b_1 = (lfsr_b_1     & lfsr_b_2    ) | (lfsr_b_2     & lfsr_b_3    ) | (lfsr_b_1     & lfsr_b_3    ); // Majority logic
	assign vt_lfsr_b_2 = (lfsr_b_1     & lfsr_b_2    ) | (lfsr_b_2     & lfsr_b_3    ) | (lfsr_b_1     & lfsr_b_3    ); // Majority logic
	assign vt_lfsr_b_3 = (lfsr_b_1     & lfsr_b_2    ) | (lfsr_b_2     & lfsr_b_3    ) | (lfsr_b_1     & lfsr_b_3    ); // Majority logic
	assign vt_rst1_1   = (rst1_1       & rst1_2      ) | (rst1_2       & rst1_3      ) | (rst1_1       & rst1_3      ); // Majority logic
	assign vt_rst1_2   = (rst1_1       & rst1_2      ) | (rst1_2       & rst1_3      ) | (rst1_1       & rst1_3      ); // Majority logic
	assign vt_rst1_3   = (rst1_1       & rst1_2      ) | (rst1_2       & rst1_3      ) | (rst1_1       & rst1_3      ); // Majority logic
	assign vt_rst2_1   = (rst2_1       & rst2_2      ) | (rst2_2       & rst2_3      ) | (rst2_1       & rst2_3      ); // Majority logic
	assign vt_rst2_2   = (rst2_1       & rst2_2      ) | (rst2_2       & rst2_3      ) | (rst2_1       & rst2_3      ); // Majority logic
	assign vt_rst2_3   = (rst2_1       & rst2_2      ) | (rst2_2       & rst2_3      ) | (rst2_1       & rst2_3      ); // Majority logic
	assign vt_rst_f_1  = (rst_f_1      & rst_f_2     ) | (rst_f_2      & rst_f_3     ) | (rst_f_1      & rst_f_3     ); // Majority logic
	assign vt_rst_f_2  = (rst_f_1      & rst_f_2     ) | (rst_f_2      & rst_f_3     ) | (rst_f_1      & rst_f_3     ); // Majority logic
	assign vt_rst_f_3  = (rst_f_1      & rst_f_2     ) | (rst_f_2      & rst_f_3     ) | (rst_f_1      & rst_f_3     ); // Majority logic

	assign PRBS        = (prbs_1       & prbs_2      ) | (prbs_2       & prbs_3      ) | (prbs_1       & prbs_3      ); // Majority logic
	assign STRT_LTNCY  = (strt_ltncy_1 & strt_ltncy_2) | (strt_ltncy_2 & strt_ltncy_3) | (strt_ltncy_1 & strt_ltncy_3); // Majority logic
	
	assign rst_lfsr     = RST | vt_rst_f_1;
	assign start_pat_1  = RST | vt_rst2_1;
	assign start_pat_2  = RST | vt_rst2_2;
	assign start_pat_3  = RST | vt_rst2_3;

	always @(posedge GEN_CLK) begin
		if(OUT_CLK_ENA) begin
			rst1_1 <= RST;
			rst1_2 <= RST;
			rst1_3 <= RST;
			rst2_1 <= vt_rst1_1;
			rst2_2 <= vt_rst1_2;
			rst2_3 <= vt_rst1_3;
			strt_ltncy_1 <= ~start_pat_1;
			strt_ltncy_2 <= ~start_pat_2;
			strt_ltncy_3 <= ~start_pat_3;
			lfsr_a_1 <= lfsr_i1;
			lfsr_a_2 <= lfsr_i2;
			lfsr_a_3 <= lfsr_i3;
			prbs_1 <= start_pat_1 ? start_pattern : (INJ_ERR ? {vt_lfsr_a_1,vt_lfsr_b_1}^48'h608000400100 : {vt_lfsr_a_1,vt_lfsr_b_1});
			prbs_2 <= start_pat_2 ? start_pattern : (INJ_ERR ? {vt_lfsr_a_2,vt_lfsr_b_2}^48'h608000400100 : {vt_lfsr_a_2,vt_lfsr_b_2});
			prbs_3 <= start_pat_3 ? start_pattern : (INJ_ERR ? {vt_lfsr_a_3,vt_lfsr_b_3}^48'h608000400100 : {vt_lfsr_a_3,vt_lfsr_b_3});
		end
	end
	always @(posedge GEN_CLK) begin
		if(!OUT_CLK_ENA) begin
			rst_f_1 <= vt_rst1_1;
			rst_f_2 <= vt_rst1_2;
			rst_f_3 <= vt_rst1_3;
			lfsr_b_1 <= lfsr_i1;
			lfsr_b_2 <= lfsr_i2;
			lfsr_b_3 <= lfsr_i3;
		end
	end
//
// Linear Feedback Shift Register
// [24,23,22,17] Fibonacci Implementation
//
   lfsr_R24 #(
		.init_fill(24'h83B62E),
		.TMR(TMR)
	)
   tx_lfsr1(
	   .CLK(GEN_CLK),
		.RST(rst_lfsr),
		.LFSR1(lfsr_i1),
		.LFSR2(lfsr_i2),
		.LFSR3(lfsr_i3)
	);

end
else 
begin : PRBS_logic

	reg [47:0] prbs_r;
	reg [23:0] lfsr_a;
	reg [23:0] lfsr_b;
	reg rst1  = 1'b1;
	reg rst2  = 1'b1;
	reg rst_f = 1'b1;
	reg strt_ltncy;

	wire [23:0] lfsr;
	wire [23:0] dmy2;
	wire [23:0] dmy3;

	wire start_pat;

	assign PRBS = prbs_r;
	assign STRT_LTNCY = strt_ltncy;
	assign rst_lfsr = RST | rst_f;
	assign start_pat = RST | rst2;

	always @(posedge GEN_CLK) begin
		if(OUT_CLK_ENA) begin
			rst1 <= RST;
			rst2 <= rst1;
			strt_ltncy <= ~start_pat;
			lfsr_a <= lfsr;
			if(start_pat)
				prbs_r <= start_pattern;
			else
				if(INJ_ERR)
					prbs_r <= {lfsr_a,lfsr_b}^48'h608000400100;
				else
					prbs_r <= {lfsr_a,lfsr_b};
		end
	end
	always @(posedge GEN_CLK) begin
		if(!OUT_CLK_ENA) begin
			rst_f <= rst1;
			lfsr_b <= lfsr;
		end
	end
//
// Linear Feedback Shift Register
// [24,23,22,17] Fibonacci Implementation
//
   lfsr_R24 #(
		.init_fill(24'h83B62E),
		.TMR(TMR)
	)
   tx_lfsr1(
	   .CLK(GEN_CLK),
		.RST(rst_lfsr),
		.LFSR1(lfsr),
		.LFSR2(dmy2),
		.LFSR3(dmy3)
	);

end
endgenerate


endmodule
