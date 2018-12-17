`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:32 07/16/2014
// Design Name:   Frame_Seq_FSM
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/DAQ/Frame_Seq_FSM_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Frame_Seq_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Frame_Seq_FSM_sim_tf;

	// Inputs
	reg CLK;
	reg FAMT;
	reg L1A_BUF_MT;
	reg RST;
	reg [6:0] SAMP_MAX;
	reg [6:0] seq;
	reg [6:0] smp;

	// Outputs
	wire CLR_CRC;
	wire INC_SEQ;
	wire INC_SMP;
	wire LAST_WRD;
	wire RD;
	wire RST_SEQ;
	wire RST_SMP;
	wire VALID;
	wire [2:0] FRM_STATE;
	wire CLR_CRC_trial;
	wire LAST_WRD_trial;
	wire RD_trial;
	wire [6:0] seq_trial;
	wire VALID_trial;
	wire [2:0] FRM_STATE_trial;


always @(posedge CLK or posedge RST) begin
	if(RST)
		smp <= 7'h00;
	else
		if(INC_SMP)
			smp <= smp +1;
		else if(RST_SMP)
			smp <= 7'h00;
		else
			smp <= smp;
end
always @(posedge CLK or posedge RST) begin
	if(RST)
		seq <= 7'h00;
	else
		if(INC_SEQ)
			seq <= seq +1;
		else if(RST_SEQ)
			seq <= 7'h00;
		else
			seq <= seq;
end


	// Instantiate the Unit Under Test (UUT)
	Frame_Seq_FSM uut (
		.CLR_CRC(CLR_CRC), 
		.INC_SEQ(INC_SEQ), 
		.INC_SMP(INC_SMP), 
		.LAST_WRD(LAST_WRD), 
		.RD(RD), 
		.RST_SEQ(RST_SEQ), 
		.RST_SMP(RST_SMP), 
		.VALID(VALID), 
		.FRM_STATE(FRM_STATE), 
		.CLK(CLK), 
		.FAMT(FAMT), 
		.L1A_BUF_MT(L1A_BUF_MT), 
		.RST(RST), 
		.SAMP_MAX(SAMP_MAX), 
		.SEQ(seq), 
		.SMP(smp)
	);
	
	Frame_Seq_FSM_trial uut_trial (
		.CLR_CRC(CLR_CRC_trial), 
		.LAST_WRD(LAST_WRD_trial), 
		.RD(RD_trial), 
		.SEQ(seq_trial),
		.VALID(VALID_trial), 
		.FRM_STATE(FRM_STATE_trial), 
		.CLK(CLK), 
		.FAMT(FAMT), 
		.L1A_BUF_MT(L1A_BUF_MT), 
		.RST(RST), 
		.SAMP_MAX(SAMP_MAX) 
	);


   parameter CMS_PERIOD = 24;

	initial begin
		// Initialize Inputs
      CLK = 1'b1;
      forever
         #(CMS_PERIOD/2) CLK = ~CLK;
	end

	initial begin
		// Initialize Inputs
		FAMT = 0;
		L1A_BUF_MT = 1;
		RST = 1;
		SAMP_MAX = 7'd7;

		// Wait 100 ns for global reset to finish
		#(5*CMS_PERIOD);
		#1;
		RST = 0;
		#(5*CMS_PERIOD);
		L1A_BUF_MT = 0;
		#(5*CMS_PERIOD);
		L1A_BUF_MT = 1;
        
		// Add stimulus here

	end
      
endmodule

