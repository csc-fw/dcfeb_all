`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:06:39 07/18/2014
// Design Name:   ADC_Init_FSM
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/RESET/ADC_Init_FSM_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADC_Init_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ADC_Init_FSM_sim_tf;

	// Inputs
	reg CLK;
	reg CLK100KHZ;
	reg [4:0] awcnt;
	reg INIT_DONE;
	reg RST;
	reg [11:0] dsr_tmr;
	reg [11:0] dsr_tmr_trial;

	// Outputs
	wire ADC_INIT;
	wire ADC_RST;
	wire awrst;
	wire ainc;
	wire RUN;
	wire ADC_INIT_trial;
	wire ADC_RST_trial;
	wire inc_tmr;
	wire RUN_trial;
	
	localparam ADC_Init_tmo = 12'd5;

always @(posedge CLK or posedge awrst) begin
   if(awrst)
	   awcnt <= 5'h00;
	else
	   if(ainc)
		   awcnt <= awcnt +1;
		else
		   awcnt <= awcnt;
end

always @(posedge CLK100KHZ or posedge ADC_RST) begin
   if(ADC_RST)
	   dsr_tmr <= 12'h000;
	else
	   if(ainc || ADC_INIT)
		   dsr_tmr <= dsr_tmr +1;
		else
		   dsr_tmr <= dsr_tmr;
end

always @(posedge CLK100KHZ or posedge RST) begin
   if(RST)
	   dsr_tmr_trial <= 12'h000;
	else
	   if(inc_tmr)
		   dsr_tmr_trial <= dsr_tmr_trial +1;
		else
		   dsr_tmr_trial <= dsr_tmr_trial;
end

	// Instantiate the Unit Under Test (UUT)
	ADC_Init_FSM  #(.TIME_OUT(ADC_Init_tmo))
	uut (
		.ADC_INIT(ADC_INIT), 
		.ADC_RST(ADC_RST), 
		.CRST(awrst), 
		.INC(ainc), 
		.RUN(RUN), 
		.CLK(CLK), 
		.CNT(awcnt), 
		.INIT_DONE(INIT_DONE), 
		.RST(RST), 
		.SLOW_CNT(dsr_tmr)
	);
	
	ADC_Init_FSM_trial  #(.TIME_OUT(ADC_Init_tmo))
	ADC_Init_FSM_trial_i (
		.ADC_INIT(ADC_INIT_trial), 
		.ADC_RST(ADC_RST_trial), 
		.INC_TMR(inc_tmr), 
		.RUN(RUN_trial), 
		.CLK(CLK), 
		.INIT_DONE(INIT_DONE), 
		.RST(RST), 
		.SLOW_CNT(dsr_tmr_trial)
	);


   parameter CMS_PERIOD = 24;
   parameter C100K_PERIOD = 750;

	initial begin
		// Initialize Inputs
      CLK = 1'b1;
      forever
         #(CMS_PERIOD/2) CLK = ~CLK;
	end

	initial begin
		// Initialize Inputs
      CLK100KHZ = 1'b1;
      forever
         #(C100K_PERIOD/2) CLK100KHZ = ~CLK100KHZ;
	end
	
	initial begin
		// Initialize Inputs
		INIT_DONE = 0;
		RST = 1;

		// Wait 100 ns for global reset to finish
		#121;
		RST = 0;
		#120;
		#(25*CMS_PERIOD);
      INIT_DONE = 1;
		// Add stimulus here

	end
      
endmodule

