`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:57:40 07/17/2014
// Design Name:   Sample_Proc_FSM
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/DAQ/Sample_Proc_FSM_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sample_Proc_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sample_Proc_FSM_sim_tf;

	// Inputs
	reg CLK;
	reg FAMT;
	reg L1A_BUF_MT;
	reg L1A_HEAD;
	reg RST;
	reg [6:0] SAMP_MAX;
	reg [6:0] seq;
	reg [6:0] smp;
	reg TXACK;

	// Outputs
	wire CE;
	wire CLR_CRC;
	wire INC_SEQ;
	wire INC_SMP;
	wire LAST_WRD;
	wire LD_L1A_H;
	wire LD_L1A_L;
	wire RD;
	wire RST_SEQ;
	wire RST_SMP;
	wire VALID;
	wire [3:0] SMP_STATE;
wire 	CE_trial;
wire 	CLR_CRC_trial;
wire 	LAST_WRD_trial;
wire 	LD_L1A_H_trial;
wire 	LD_L1A_L_trial;
wire 	RD_trial;
wire 	[6:0] seq_trial;
wire 	VALID_trial;
wire 	[3:0] SMP_STATE_trial;


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
	Sample_Proc_FSM uut (
		.CE(CE), 
		.CLR_CRC(CLR_CRC), 
		.INC_SEQ(INC_SEQ), 
		.INC_SMP(INC_SMP), 
		.LAST_WRD(LAST_WRD), 
		.LD_L1A_H(LD_L1A_H), 
		.LD_L1A_L(LD_L1A_L), 
		.RD(RD), 
		.RST_SEQ(RST_SEQ), 
		.RST_SMP(RST_SMP), 
		.VALID(VALID), 
		.SMP_STATE(SMP_STATE), 
		.CLK(CLK), 
		.FAMT(FAMT), 
		.L1A_BUF_MT(L1A_BUF_MT), 
		.L1A_HEAD(L1A_HEAD), 
		.RST(RST), 
		.SAMP_MAX(SAMP_MAX), 
		.SEQ(seq), 
		.SMP(smp), 
		.TXACK(TXACK)
	);

	Sample_Proc_FSM_trial Sample_Proc_FSM_trial_i (
		.CE(CE_trial), 
		.CLR_CRC(CLR_CRC_trial), 
		.LAST_WRD(LAST_WRD_trial), 
		.LD_L1A_H(LD_L1A_H_trial), 
		.LD_L1A_L(LD_L1A_L_trial), 
		.RD(RD_trial), 
		.SEQ(seq_trial), 
		.VALID(VALID_trial), 
		.SMP_STATE(SMP_STATE_trial), 
		.CLK(CLK), 
		.FAMT(FAMT), 
		.L1A_BUF_MT(L1A_BUF_MT), 
		.L1A_HEAD(L1A_HEAD), 
		.RST(RST), 
		.SAMP_MAX(SAMP_MAX), 
		.TXACK(TXACK)
	);


   parameter CMS_PERIOD = 24;
   parameter C160_PERIOD = 6;

	initial begin
		// Initialize Inputs
      CLK = 1'b1;
      forever
         #(CMS_PERIOD/8) CLK = ~CLK;
	end

	initial begin
		// Initialize Inputs
		FAMT = 1;
		L1A_BUF_MT = 1;
		L1A_HEAD = 1;
		RST = 1;
		SAMP_MAX = 7'd7;
		TXACK = 0;

		// Wait 100 ns for global reset to finish
		#(5*CMS_PERIOD);
		#1;
		RST = 0;
		#(5*CMS_PERIOD);
		L1A_BUF_MT = 0;
		#(10*CMS_PERIOD);
		FAMT = 0;
		#(5*CMS_PERIOD);
		L1A_BUF_MT = 1;
		#(10*CMS_PERIOD);
		TXACK = 1;
		#(1*C160_PERIOD);
		TXACK = 0;
        
		// Add stimulus here

	end
      
endmodule

