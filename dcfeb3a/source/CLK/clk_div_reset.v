`timescale 1ns / 1ps

module clk_div_reset #(
	parameter TMR = 0
)
(
	input  	CLK,
	input  	PLLLKDET,
	input  	TX_RATE,
	input  	INIT,
   output   GTXTEST_DONE,
	output 	GTXTEST_BIT1
);


generate
if(TMR==1) 
begin : ClkDivRst_TMR
	
	(* syn_preserve = "true" *) reg         plllkdet_sync_1;
	(* syn_preserve = "true" *) reg         plllkdet_sync_2;
	(* syn_preserve = "true" *) reg         plllkdet_sync_3;
	(* syn_preserve = "true" *) reg         plllkdet_1;
	(* syn_preserve = "true" *) reg         plllkdet_2;
	(* syn_preserve = "true" *) reg         plllkdet_3;
	(* syn_preserve = "true" *) reg  [10:0] reset_dly_ctr_1;
	(* syn_preserve = "true" *) reg  [10:0] reset_dly_ctr_2;
	(* syn_preserve = "true" *) reg  [10:0] reset_dly_ctr_3;
	(* syn_preserve = "true" *) reg         reset_dly_done_1;
	(* syn_preserve = "true" *) reg         reset_dly_done_2;
	(* syn_preserve = "true" *) reg         reset_dly_done_3;
	(* syn_preserve = "true" *) reg  [3:0]  testdone_f_1;
	(* syn_preserve = "true" *) reg  [3:0]  testdone_f_2;
	(* syn_preserve = "true" *) reg  [3:0]  testdone_f_3;
	
	(* syn_keep = "true" *) wire          vt_plllkdet_sync_1;
	(* syn_keep = "true" *) wire          vt_plllkdet_sync_2;
	(* syn_keep = "true" *) wire          vt_plllkdet_sync_3;
	(* syn_keep = "true" *) wire          vt_plllkdet_1;
	(* syn_keep = "true" *) wire          vt_plllkdet_2;
	(* syn_keep = "true" *) wire          vt_plllkdet_3;
	(* syn_keep = "true" *) wire   [10:0] vt_reset_dly_ctr_1;
	(* syn_keep = "true" *) wire   [10:0] vt_reset_dly_ctr_2;
	(* syn_keep = "true" *) wire   [10:0] vt_reset_dly_ctr_3;
	(* syn_keep = "true" *) wire          vt_reset_dly_done_1;
	(* syn_keep = "true" *) wire          vt_reset_dly_done_2;
	(* syn_keep = "true" *) wire          vt_reset_dly_done_3;
	
	(* syn_keep = "true" *) wire          vt_testdone_f;
	
	(* syn_keep = "true" *) wire zero_match_1;
	(* syn_keep = "true" *) wire zero_match_2;
	(* syn_keep = "true" *) wire zero_match_3;
	(* syn_keep = "true" *) wire hbit_zero_1;
	(* syn_keep = "true" *) wire hbit_zero_2;
	(* syn_keep = "true" *) wire hbit_zero_3;
	(* syn_keep = "true" *) wire rst_bit_1;
	(* syn_keep = "true" *) wire rst_bit_2;
	(* syn_keep = "true" *) wire rst_bit_3;

	assign vt_plllkdet_sync_1  = (plllkdet_sync_1  & plllkdet_sync_2 ) | (plllkdet_sync_2  & plllkdet_sync_3 ) | (plllkdet_sync_1  & plllkdet_sync_3 ); // Majority logic
	assign vt_plllkdet_sync_2  = (plllkdet_sync_1  & plllkdet_sync_2 ) | (plllkdet_sync_2  & plllkdet_sync_3 ) | (plllkdet_sync_1  & plllkdet_sync_3 ); // Majority logic
	assign vt_plllkdet_sync_3  = (plllkdet_sync_1  & plllkdet_sync_2 ) | (plllkdet_sync_2  & plllkdet_sync_3 ) | (plllkdet_sync_1  & plllkdet_sync_3 ); // Majority logic
	assign vt_plllkdet_1       = (plllkdet_1       & plllkdet_2      ) | (plllkdet_2       & plllkdet_3      ) | (plllkdet_1       & plllkdet_3      ); // Majority logic
	assign vt_plllkdet_2       = (plllkdet_1       & plllkdet_2      ) | (plllkdet_2       & plllkdet_3      ) | (plllkdet_1       & plllkdet_3      ); // Majority logic
	assign vt_plllkdet_3       = (plllkdet_1       & plllkdet_2      ) | (plllkdet_2       & plllkdet_3      ) | (plllkdet_1       & plllkdet_3      ); // Majority logic
	assign vt_reset_dly_ctr_1  = (reset_dly_ctr_1  & reset_dly_ctr_2 ) | (reset_dly_ctr_2  & reset_dly_ctr_3 ) | (reset_dly_ctr_1  & reset_dly_ctr_3 ); // Majority logic
	assign vt_reset_dly_ctr_2  = (reset_dly_ctr_1  & reset_dly_ctr_2 ) | (reset_dly_ctr_2  & reset_dly_ctr_3 ) | (reset_dly_ctr_1  & reset_dly_ctr_3 ); // Majority logic
	assign vt_reset_dly_ctr_3  = (reset_dly_ctr_1  & reset_dly_ctr_2 ) | (reset_dly_ctr_2  & reset_dly_ctr_3 ) | (reset_dly_ctr_1  & reset_dly_ctr_3 ); // Majority logic
	assign vt_reset_dly_done_1 = (reset_dly_done_1 & reset_dly_done_2) | (reset_dly_done_2 & reset_dly_done_3) | (reset_dly_done_1 & reset_dly_done_3); // Majority logic
	assign vt_reset_dly_done_2 = (reset_dly_done_1 & reset_dly_done_2) | (reset_dly_done_2 & reset_dly_done_3) | (reset_dly_done_1 & reset_dly_done_3); // Majority logic
	assign vt_reset_dly_done_3 = (reset_dly_done_1 & reset_dly_done_2) | (reset_dly_done_2 & reset_dly_done_3) | (reset_dly_done_1 & reset_dly_done_3); // Majority logic
	
	assign vt_testdone_f       = (testdone_f_1[0]  & testdone_f_2[0] ) | (testdone_f_2[0]  & testdone_f_3[0] ) | (testdone_f_1[0]  & testdone_f_3[0] ); // Majority logic

	assign GTXTEST_BIT1  = vt_reset_dly_done_1; 
   assign GTXTEST_DONE  = zero_match_1 ? vt_testdone_f : 1'b0;
	
	assign zero_match_1 = (TX_RATE == 1'b0) ? (vt_reset_dly_ctr_1 == 11'd0)    : (vt_reset_dly_ctr_1[6:0] == 7'h00);
	assign zero_match_2 = (TX_RATE == 1'b0) ? (vt_reset_dly_ctr_2 == 11'd0)    : (vt_reset_dly_ctr_2[6:0] == 7'h00);
	assign zero_match_3 = (TX_RATE == 1'b0) ? (vt_reset_dly_ctr_3 == 11'd0)    : (vt_reset_dly_ctr_3[6:0] == 7'h00);
	assign hbit_zero_1  = (TX_RATE == 1'b0) ? (vt_reset_dly_ctr_1[10] == 1'b0) : (vt_reset_dly_ctr_1[6] == 1'b0);
	assign hbit_zero_2  = (TX_RATE == 1'b0) ? (vt_reset_dly_ctr_2[10] == 1'b0) : (vt_reset_dly_ctr_2[6] == 1'b0);
	assign hbit_zero_3  = (TX_RATE == 1'b0) ? (vt_reset_dly_ctr_3[10] == 1'b0) : (vt_reset_dly_ctr_3[6] == 1'b0);
	assign rst_bit_1    = (TX_RATE == 1'b0) ?  vt_reset_dly_ctr_1[8]            : vt_reset_dly_ctr_1[5];
	assign rst_bit_2    = (TX_RATE == 1'b0) ?  vt_reset_dly_ctr_2[8]            : vt_reset_dly_ctr_2[5];
	assign rst_bit_3    = (TX_RATE == 1'b0) ?  vt_reset_dly_ctr_3[8]            : vt_reset_dly_ctr_3[5];

	always @(posedge CLK)
	begin
		plllkdet_1    	  <=   PLLLKDET;
		plllkdet_2    	  <=   PLLLKDET;
		plllkdet_3    	  <=   PLLLKDET;
		plllkdet_sync_1  <=   vt_plllkdet_1;
		plllkdet_sync_2  <=   vt_plllkdet_2;
		plllkdet_sync_3  <=   vt_plllkdet_3;
		reset_dly_ctr_1  <= (!vt_plllkdet_sync_1 || INIT) ? 11'h7FF : (!zero_match_1 ? vt_reset_dly_ctr_1 - 1'b1 : vt_reset_dly_ctr_1);
		reset_dly_ctr_2  <= (!vt_plllkdet_sync_2 || INIT) ? 11'h7FF : (!zero_match_2 ? vt_reset_dly_ctr_2 - 1'b1 : vt_reset_dly_ctr_2);
		reset_dly_ctr_3  <= (!vt_plllkdet_sync_3 || INIT) ? 11'h7FF : (!zero_match_3 ? vt_reset_dly_ctr_3 - 1'b1 : vt_reset_dly_ctr_3);
		reset_dly_done_1 <= (!vt_plllkdet_sync_1 || INIT) ? 1'b0    : ( hbit_zero_1  ? rst_bit_1              : vt_reset_dly_done_1);
		reset_dly_done_2 <= (!vt_plllkdet_sync_2 || INIT) ? 1'b0    : ( hbit_zero_2  ? rst_bit_2              : vt_reset_dly_done_2);
		reset_dly_done_3 <= (!vt_plllkdet_sync_3 || INIT) ? 1'b0    : ( hbit_zero_3  ? rst_bit_3              : vt_reset_dly_done_3);
		testdone_f_1     <= !zero_match_1 ? 4'b1111 : {1'b0, testdone_f_1[3:1]};
		testdone_f_2     <= !zero_match_2 ? 4'b1111 : {1'b0, testdone_f_2[3:1]};
		testdone_f_3     <= !zero_match_3 ? 4'b1111 : {1'b0, testdone_f_3[3:1]};
	end
end
else 
begin : ClkDivRst
	
   reg        plllkdet_sync;
   reg        plllkdet_r;
   reg [10:0] reset_dly_ctr;
   reg        reset_dly_done;
   reg [3:0]  testdone_f;
	
	wire zero_match;
	wire hbit_zero;
	wire rst_bit;

	assign GTXTEST_BIT1  = reset_dly_done; 
   assign GTXTEST_DONE  = zero_match ? testdone_f[0] : 1'b0;
	
	assign zero_match = (TX_RATE == 1'b0) ? (reset_dly_ctr == 11'd0) : (reset_dly_ctr[6:0] == 7'h00);
	assign hbit_zero  = (TX_RATE == 1'b0) ? (reset_dly_ctr[10] == 1'b0) : (reset_dly_ctr[6] == 1'b0);
	assign rst_bit    = (TX_RATE == 1'b0) ? reset_dly_ctr[8] : reset_dly_ctr[5];

	always @(posedge CLK)
	begin
		plllkdet_r    	<= PLLLKDET;
		plllkdet_sync 	<= plllkdet_r;
		reset_dly_ctr 	<= (!plllkdet_sync || INIT) ? 11'h7FF : (!zero_match ? reset_dly_ctr - 1'b1 : reset_dly_ctr);
		reset_dly_done	<= (!plllkdet_sync || INIT) ? 1'b0    : ( hbit_zero  ? rst_bit              : reset_dly_done);
		testdone_f     <= !zero_match ? 4'b1111 : {1'b0, testdone_f[3:1]};
	end
end
endgenerate

endmodule

