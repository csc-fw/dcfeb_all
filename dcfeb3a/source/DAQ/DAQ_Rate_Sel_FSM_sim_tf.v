`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:21:06 07/17/2014
// Design Name:   DAQ_Rate_Sel_FSM
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/DAQ/DAQ_Rate_Sel_FSM_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DAQ_Rate_Sel_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DAQ_Rate_Sel_FSM_sim_tf;

	// Inputs
	reg CDV_DONE;
	reg [3:0] count;
	reg DAQ_RATE;
	reg RST;
	reg TXRATEDONE;

	// Outputs
	wire CDV_INIT;
	wire [2:0] CLK_SEL;
	wire CLR_CNT;
	wire INC_CNT;
	wire PCSRST;
	wire RATE_1_25;
	wire RATE_3_2;
	wire [1:0] RATE_SEL;
	wire WRDCLKSEL;
	wire [3:0] DQRT_STATE;

	wire CDV_INIT_trial;
	wire [2:0] CLK_SEL_trial;
	wire PCSRST_trial;
	wire RATE_1_25_trial;
	wire RATE_3_2_trial;
	wire [1:0] RATE_SEL_trial;
	wire WRDCLKSEL_trial;
	wire [3:0] DQRT_STATE_trial;
	
	wire clr_cnt_rst;
	wire wrd_clk;
	wire wrd_clk_trial;
	reg clk160;
	reg clk125;
	
	
	assign wrd_clk = WRDCLKSEL ? clk160 : clk125;
	assign wrd_clk_trial = WRDCLKSEL_trial ? clk160 : clk125;
	assign clr_cnt_rst = CLR_CNT | RST;
	

always @(posedge wrd_clk or posedge clr_cnt_rst)
begin
	if(clr_cnt_rst)
		count <= 4'd0;
	else
		if(INC_CNT)
			count <= count + 1;
		else
			count <= count;
end


	// Instantiate the Unit Under Test (UUT)
	DAQ_Rate_Sel_FSM uut (
		.CDV_INIT(CDV_INIT), 
		.CLK_SEL(CLK_SEL), 
		.CLR_CNT(CLR_CNT), 
		.INC_CNT(INC_CNT), 
		.PCSRST(PCSRST), 
		.RATE_1_25(RATE_1_25), 
		.RATE_3_2(RATE_3_2), 
		.RATE_SEL(RATE_SEL), 
		.WRDCLKSEL(WRDCLKSEL), 
		.DQRT_STATE(DQRT_STATE), 
		.CDV_DONE(CDV_DONE), 
		.CLK(wrd_clk), 
		.CNT(count), 
		.DAQ_RATE(DAQ_RATE), 
		.RST(RST), 
		.TXRATEDONE(TXRATEDONE)
	);

	DAQ_Rate_Sel_FSM_trial DAQ_Rate_Sel_FSM_trial_i (
		.CDV_INIT(CDV_INIT_trial), 
		.CLK_SEL(CLK_SEL_trial), 
		.PCSRST(PCSRST_trial), 
		.RATE_1_25(RATE_1_25_trial), 
		.RATE_3_2(RATE_3_2_trial), 
		.RATE_SEL(RATE_SEL_trial), 
		.WRDCLKSEL(WRDCLKSEL_trial), 
		.DQRT_STATE(DQRT_STATE_trial), 
		.CDV_DONE(CDV_DONE), 
		.CLK(wrd_clk_trial), 
		.DAQ_RATE(DAQ_RATE), 
		.RST(RST), 
		.TXRATEDONE(TXRATEDONE)
	);


   parameter C125_PERIOD = 8;
   parameter C160_PERIOD = 6;

	initial begin
		// Initialize Inputs
      clk125 = 1'b1;
      forever
         #(C125_PERIOD/2) clk125 = ~clk125;
	end

	initial begin
		// Initialize Inputs
      clk160 = 1'b1;
      forever
         #(C160_PERIOD/2) clk160 = ~clk160;
	end
	
	initial begin
		// Initialize Inputs
		CDV_DONE = 0;
		DAQ_RATE = 1;
		RST = 1;
		TXRATEDONE = 0;

		// Wait 100 ns for global reset to finish
		#121;
		RST = 0;
		#120;
		DAQ_RATE = 0;
		#120;
		TXRATEDONE = 1;
		#120;
		CDV_DONE = 1;
		#120;
		TXRATEDONE = 0;
		CDV_DONE = 0;
		#120;
		DAQ_RATE = 1;
		#120;
		TXRATEDONE = 1;
		#120;
		CDV_DONE = 1;
		#120;
		TXRATEDONE = 0;
		CDV_DONE = 0;
		#120;

        
		// Add stimulus here

	end
      
endmodule

