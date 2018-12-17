`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:00 07/12/2011 
// Design Name: 
// Module Name:    LFSR_R24 
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
module lfsr_R24 #(
	parameter init_fill = 24'h4DB62E,
	parameter TMR = 0
)(
    input CLK,
    input RST,
    output [23:0] LFSR1,
    output [23:0] LFSR2,
    output [23:0] LFSR3
    );
	 
//
// Linear Feedback Shift Register
// [24,23,22,17] Fibonacci Implementation
//


generate
if(TMR==1) 
begin : LFSR_logic_TMR

	(* syn_preserve = "true" *) reg [23:0] lfsr_1;
	(* syn_preserve = "true" *) reg [23:0] lfsr_2;
	(* syn_preserve = "true" *) reg [23:0] lfsr_3;

	(* syn_keep = "true" *) wire [23:0] vt_lfsr_1;
	(* syn_keep = "true" *) wire [23:0] vt_lfsr_2;
	(* syn_keep = "true" *) wire [23:0] vt_lfsr_3;

	assign vt_lfsr_1 = (lfsr_1 & lfsr_2) | (lfsr_2 & lfsr_3) | (lfsr_1 & lfsr_3); // Majority logic
	assign vt_lfsr_2 = (lfsr_1 & lfsr_2) | (lfsr_2 & lfsr_3) | (lfsr_1 & lfsr_3); // Majority logic
	assign vt_lfsr_3 = (lfsr_1 & lfsr_2) | (lfsr_2 & lfsr_3) | (lfsr_1 & lfsr_3); // Majority logic

	assign LFSR1 = vt_lfsr_1;
	assign LFSR2 = vt_lfsr_2;
	assign LFSR3 = vt_lfsr_3;

	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			lfsr_1 <= init_fill;
			lfsr_2 <= init_fill;
			lfsr_3 <= init_fill;
		end
		else
			begin
				lfsr_1[0] <= vt_lfsr_1[10]^vt_lfsr_1[17]^vt_lfsr_1[20]^vt_lfsr_1[23]^vt_lfsr_1[0];
				lfsr_1[1] <= vt_lfsr_1[11]^vt_lfsr_1[17]^vt_lfsr_1[18]^vt_lfsr_1[21]^vt_lfsr_1[22]^vt_lfsr_1[23]^vt_lfsr_1[0]^vt_lfsr_1[1];
				lfsr_1[2] <= vt_lfsr_1[12]^vt_lfsr_1[17]^vt_lfsr_1[18]^vt_lfsr_1[19]^vt_lfsr_1[0]^vt_lfsr_1[1]^vt_lfsr_1[2];
				lfsr_1[3] <= vt_lfsr_1[13]^vt_lfsr_1[18]^vt_lfsr_1[19]^vt_lfsr_1[20]^vt_lfsr_1[1]^vt_lfsr_1[2]^vt_lfsr_1[3];
				lfsr_1[4] <= vt_lfsr_1[14]^vt_lfsr_1[19]^vt_lfsr_1[20]^vt_lfsr_1[21]^vt_lfsr_1[2]^vt_lfsr_1[3]^vt_lfsr_1[4];
				lfsr_1[5] <= vt_lfsr_1[15]^vt_lfsr_1[20]^vt_lfsr_1[21]^vt_lfsr_1[22]^vt_lfsr_1[3]^vt_lfsr_1[4]^vt_lfsr_1[5];
				lfsr_1[6] <= vt_lfsr_1[16]^vt_lfsr_1[21]^vt_lfsr_1[22]^vt_lfsr_1[23]^vt_lfsr_1[4]^vt_lfsr_1[5]^vt_lfsr_1[6];
				lfsr_1[7] <= vt_lfsr_1[0]^vt_lfsr_1[5]^vt_lfsr_1[6]^vt_lfsr_1[7];
				lfsr_1[8] <= vt_lfsr_1[1]^vt_lfsr_1[6]^vt_lfsr_1[7]^vt_lfsr_1[8];
				lfsr_1[9] <= vt_lfsr_1[2]^vt_lfsr_1[7]^vt_lfsr_1[8]^vt_lfsr_1[9];
				lfsr_1[10] <= vt_lfsr_1[3]^vt_lfsr_1[8]^vt_lfsr_1[9]^vt_lfsr_1[10];
				lfsr_1[11] <= vt_lfsr_1[4]^vt_lfsr_1[9]^vt_lfsr_1[10]^vt_lfsr_1[11];
				lfsr_1[12] <= vt_lfsr_1[5]^vt_lfsr_1[10]^vt_lfsr_1[11]^vt_lfsr_1[12];
				lfsr_1[13] <= vt_lfsr_1[6]^vt_lfsr_1[11]^vt_lfsr_1[12]^vt_lfsr_1[13];
				lfsr_1[14] <= vt_lfsr_1[7]^vt_lfsr_1[12]^vt_lfsr_1[13]^vt_lfsr_1[14];
				lfsr_1[15] <= vt_lfsr_1[8]^vt_lfsr_1[13]^vt_lfsr_1[14]^vt_lfsr_1[15];
				lfsr_1[16] <= vt_lfsr_1[9]^vt_lfsr_1[14]^vt_lfsr_1[15]^vt_lfsr_1[16];
				lfsr_1[17] <= vt_lfsr_1[10]^vt_lfsr_1[15]^vt_lfsr_1[16]^vt_lfsr_1[17];
				lfsr_1[18] <= vt_lfsr_1[11]^vt_lfsr_1[16]^vt_lfsr_1[17]^vt_lfsr_1[18];
				lfsr_1[19] <= vt_lfsr_1[12]^vt_lfsr_1[17]^vt_lfsr_1[18]^vt_lfsr_1[19];
				lfsr_1[20] <= vt_lfsr_1[13]^vt_lfsr_1[18]^vt_lfsr_1[19]^vt_lfsr_1[20];
				lfsr_1[21] <= vt_lfsr_1[14]^vt_lfsr_1[19]^vt_lfsr_1[20]^vt_lfsr_1[21];
				lfsr_1[22] <= vt_lfsr_1[15]^vt_lfsr_1[20]^vt_lfsr_1[21]^vt_lfsr_1[22];
				lfsr_1[23] <= vt_lfsr_1[16]^vt_lfsr_1[21]^vt_lfsr_1[22]^vt_lfsr_1[23];

				lfsr_2[0] <= vt_lfsr_2[10]^vt_lfsr_2[17]^vt_lfsr_2[20]^vt_lfsr_2[23]^vt_lfsr_2[0];
				lfsr_2[1] <= vt_lfsr_2[11]^vt_lfsr_2[17]^vt_lfsr_2[18]^vt_lfsr_2[21]^vt_lfsr_2[22]^vt_lfsr_2[23]^vt_lfsr_2[0]^vt_lfsr_2[1];
				lfsr_2[2] <= vt_lfsr_2[12]^vt_lfsr_2[17]^vt_lfsr_2[18]^vt_lfsr_2[19]^vt_lfsr_2[0]^vt_lfsr_2[1]^vt_lfsr_2[2];
				lfsr_2[3] <= vt_lfsr_2[13]^vt_lfsr_2[18]^vt_lfsr_2[19]^vt_lfsr_2[20]^vt_lfsr_2[1]^vt_lfsr_2[2]^vt_lfsr_2[3];
				lfsr_2[4] <= vt_lfsr_2[14]^vt_lfsr_2[19]^vt_lfsr_2[20]^vt_lfsr_2[21]^vt_lfsr_2[2]^vt_lfsr_2[3]^vt_lfsr_2[4];
				lfsr_2[5] <= vt_lfsr_2[15]^vt_lfsr_2[20]^vt_lfsr_2[21]^vt_lfsr_2[22]^vt_lfsr_2[3]^vt_lfsr_2[4]^vt_lfsr_2[5];
				lfsr_2[6] <= vt_lfsr_2[16]^vt_lfsr_2[21]^vt_lfsr_2[22]^vt_lfsr_2[23]^vt_lfsr_2[4]^vt_lfsr_2[5]^vt_lfsr_2[6];
				lfsr_2[7] <= vt_lfsr_2[0]^vt_lfsr_2[5]^vt_lfsr_2[6]^vt_lfsr_2[7];
				lfsr_2[8] <= vt_lfsr_2[1]^vt_lfsr_2[6]^vt_lfsr_2[7]^vt_lfsr_2[8];
				lfsr_2[9] <= vt_lfsr_2[2]^vt_lfsr_2[7]^vt_lfsr_2[8]^vt_lfsr_2[9];
				lfsr_2[10] <= vt_lfsr_2[3]^vt_lfsr_2[8]^vt_lfsr_2[9]^vt_lfsr_2[10];
				lfsr_2[11] <= vt_lfsr_2[4]^vt_lfsr_2[9]^vt_lfsr_2[10]^vt_lfsr_2[11];
				lfsr_2[12] <= vt_lfsr_2[5]^vt_lfsr_2[10]^vt_lfsr_2[11]^vt_lfsr_2[12];
				lfsr_2[13] <= vt_lfsr_2[6]^vt_lfsr_2[11]^vt_lfsr_2[12]^vt_lfsr_2[13];
				lfsr_2[14] <= vt_lfsr_2[7]^vt_lfsr_2[12]^vt_lfsr_2[13]^vt_lfsr_2[14];
				lfsr_2[15] <= vt_lfsr_2[8]^vt_lfsr_2[13]^vt_lfsr_2[14]^vt_lfsr_2[15];
				lfsr_2[16] <= vt_lfsr_2[9]^vt_lfsr_2[14]^vt_lfsr_2[15]^vt_lfsr_2[16];
				lfsr_2[17] <= vt_lfsr_2[10]^vt_lfsr_2[15]^vt_lfsr_2[16]^vt_lfsr_2[17];
				lfsr_2[18] <= vt_lfsr_2[11]^vt_lfsr_2[16]^vt_lfsr_2[17]^vt_lfsr_2[18];
				lfsr_2[19] <= vt_lfsr_2[12]^vt_lfsr_2[17]^vt_lfsr_2[18]^vt_lfsr_2[19];
				lfsr_2[20] <= vt_lfsr_2[13]^vt_lfsr_2[18]^vt_lfsr_2[19]^vt_lfsr_2[20];
				lfsr_2[21] <= vt_lfsr_2[14]^vt_lfsr_2[19]^vt_lfsr_2[20]^vt_lfsr_2[21];
				lfsr_2[22] <= vt_lfsr_2[15]^vt_lfsr_2[20]^vt_lfsr_2[21]^vt_lfsr_2[22];
				lfsr_2[23] <= vt_lfsr_2[16]^vt_lfsr_2[21]^vt_lfsr_2[22]^vt_lfsr_2[23];

				lfsr_3[0] <= vt_lfsr_3[10]^vt_lfsr_3[17]^vt_lfsr_3[20]^vt_lfsr_3[23]^vt_lfsr_3[0];
				lfsr_3[1] <= vt_lfsr_3[11]^vt_lfsr_3[17]^vt_lfsr_3[18]^vt_lfsr_3[21]^vt_lfsr_3[22]^vt_lfsr_3[23]^vt_lfsr_3[0]^vt_lfsr_3[1];
				lfsr_3[2] <= vt_lfsr_3[12]^vt_lfsr_3[17]^vt_lfsr_3[18]^vt_lfsr_3[19]^vt_lfsr_3[0]^vt_lfsr_3[1]^vt_lfsr_3[2];
				lfsr_3[3] <= vt_lfsr_3[13]^vt_lfsr_3[18]^vt_lfsr_3[19]^vt_lfsr_3[20]^vt_lfsr_3[1]^vt_lfsr_3[2]^vt_lfsr_3[3];
				lfsr_3[4] <= vt_lfsr_3[14]^vt_lfsr_3[19]^vt_lfsr_3[20]^vt_lfsr_3[21]^vt_lfsr_3[2]^vt_lfsr_3[3]^vt_lfsr_3[4];
				lfsr_3[5] <= vt_lfsr_3[15]^vt_lfsr_3[20]^vt_lfsr_3[21]^vt_lfsr_3[22]^vt_lfsr_3[3]^vt_lfsr_3[4]^vt_lfsr_3[5];
				lfsr_3[6] <= vt_lfsr_3[16]^vt_lfsr_3[21]^vt_lfsr_3[22]^vt_lfsr_3[23]^vt_lfsr_3[4]^vt_lfsr_3[5]^vt_lfsr_3[6];
				lfsr_3[7] <= vt_lfsr_3[0]^vt_lfsr_3[5]^vt_lfsr_3[6]^vt_lfsr_3[7];
				lfsr_3[8] <= vt_lfsr_3[1]^vt_lfsr_3[6]^vt_lfsr_3[7]^vt_lfsr_3[8];
				lfsr_3[9] <= vt_lfsr_3[2]^vt_lfsr_3[7]^vt_lfsr_3[8]^vt_lfsr_3[9];
				lfsr_3[10] <= vt_lfsr_3[3]^vt_lfsr_3[8]^vt_lfsr_3[9]^vt_lfsr_3[10];
				lfsr_3[11] <= vt_lfsr_3[4]^vt_lfsr_3[9]^vt_lfsr_3[10]^vt_lfsr_3[11];
				lfsr_3[12] <= vt_lfsr_3[5]^vt_lfsr_3[10]^vt_lfsr_3[11]^vt_lfsr_3[12];
				lfsr_3[13] <= vt_lfsr_3[6]^vt_lfsr_3[11]^vt_lfsr_3[12]^vt_lfsr_3[13];
				lfsr_3[14] <= vt_lfsr_3[7]^vt_lfsr_3[12]^vt_lfsr_3[13]^vt_lfsr_3[14];
				lfsr_3[15] <= vt_lfsr_3[8]^vt_lfsr_3[13]^vt_lfsr_3[14]^vt_lfsr_3[15];
				lfsr_3[16] <= vt_lfsr_3[9]^vt_lfsr_3[14]^vt_lfsr_3[15]^vt_lfsr_3[16];
				lfsr_3[17] <= vt_lfsr_3[10]^vt_lfsr_3[15]^vt_lfsr_3[16]^vt_lfsr_3[17];
				lfsr_3[18] <= vt_lfsr_3[11]^vt_lfsr_3[16]^vt_lfsr_3[17]^vt_lfsr_3[18];
				lfsr_3[19] <= vt_lfsr_3[12]^vt_lfsr_3[17]^vt_lfsr_3[18]^vt_lfsr_3[19];
				lfsr_3[20] <= vt_lfsr_3[13]^vt_lfsr_3[18]^vt_lfsr_3[19]^vt_lfsr_3[20];
				lfsr_3[21] <= vt_lfsr_3[14]^vt_lfsr_3[19]^vt_lfsr_3[20]^vt_lfsr_3[21];
				lfsr_3[22] <= vt_lfsr_3[15]^vt_lfsr_3[20]^vt_lfsr_3[21]^vt_lfsr_3[22];
				lfsr_3[23] <= vt_lfsr_3[16]^vt_lfsr_3[21]^vt_lfsr_3[22]^vt_lfsr_3[23];
			end
	end
	
end
else 
begin : LFSR_logic

	reg [23:0] lfsr_r;

	assign LFSR1 = lfsr_r;
	assign LFSR2 = lfsr_r;
	assign LFSR3 = lfsr_r;

	always @(posedge CLK or posedge RST) begin
		if(RST)
			lfsr_r <= init_fill;
		else
			begin
				lfsr_r[0] <= lfsr_r[10]^lfsr_r[17]^lfsr_r[20]^lfsr_r[23]^lfsr_r[0];
				lfsr_r[1] <= lfsr_r[11]^lfsr_r[17]^lfsr_r[18]^lfsr_r[21]^lfsr_r[22]^lfsr_r[23]^lfsr_r[0]^lfsr_r[1];
				lfsr_r[2] <= lfsr_r[12]^lfsr_r[17]^lfsr_r[18]^lfsr_r[19]^lfsr_r[0]^lfsr_r[1]^lfsr_r[2];
				lfsr_r[3] <= lfsr_r[13]^lfsr_r[18]^lfsr_r[19]^lfsr_r[20]^lfsr_r[1]^lfsr_r[2]^lfsr_r[3];
				lfsr_r[4] <= lfsr_r[14]^lfsr_r[19]^lfsr_r[20]^lfsr_r[21]^lfsr_r[2]^lfsr_r[3]^lfsr_r[4];
				lfsr_r[5] <= lfsr_r[15]^lfsr_r[20]^lfsr_r[21]^lfsr_r[22]^lfsr_r[3]^lfsr_r[4]^lfsr_r[5];
				lfsr_r[6] <= lfsr_r[16]^lfsr_r[21]^lfsr_r[22]^lfsr_r[23]^lfsr_r[4]^lfsr_r[5]^lfsr_r[6];
				lfsr_r[7] <= lfsr_r[0]^lfsr_r[5]^lfsr_r[6]^lfsr_r[7];
				lfsr_r[8] <= lfsr_r[1]^lfsr_r[6]^lfsr_r[7]^lfsr_r[8];
				lfsr_r[9] <= lfsr_r[2]^lfsr_r[7]^lfsr_r[8]^lfsr_r[9];
				lfsr_r[10] <= lfsr_r[3]^lfsr_r[8]^lfsr_r[9]^lfsr_r[10];
				lfsr_r[11] <= lfsr_r[4]^lfsr_r[9]^lfsr_r[10]^lfsr_r[11];
				lfsr_r[12] <= lfsr_r[5]^lfsr_r[10]^lfsr_r[11]^lfsr_r[12];
				lfsr_r[13] <= lfsr_r[6]^lfsr_r[11]^lfsr_r[12]^lfsr_r[13];
				lfsr_r[14] <= lfsr_r[7]^lfsr_r[12]^lfsr_r[13]^lfsr_r[14];
				lfsr_r[15] <= lfsr_r[8]^lfsr_r[13]^lfsr_r[14]^lfsr_r[15];
				lfsr_r[16] <= lfsr_r[9]^lfsr_r[14]^lfsr_r[15]^lfsr_r[16];
				lfsr_r[17] <= lfsr_r[10]^lfsr_r[15]^lfsr_r[16]^lfsr_r[17];
				lfsr_r[18] <= lfsr_r[11]^lfsr_r[16]^lfsr_r[17]^lfsr_r[18];
				lfsr_r[19] <= lfsr_r[12]^lfsr_r[17]^lfsr_r[18]^lfsr_r[19];
				lfsr_r[20] <= lfsr_r[13]^lfsr_r[18]^lfsr_r[19]^lfsr_r[20];
				lfsr_r[21] <= lfsr_r[14]^lfsr_r[19]^lfsr_r[20]^lfsr_r[21];
				lfsr_r[22] <= lfsr_r[15]^lfsr_r[20]^lfsr_r[21]^lfsr_r[22];
				lfsr_r[23] <= lfsr_r[16]^lfsr_r[21]^lfsr_r[22]^lfsr_r[23];
			end
	end

end
endgenerate

endmodule
