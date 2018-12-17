`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:26:43 06/27/2016
// Design Name:   op_link_rst_FSM
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/op_link_rst_FSM_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: op_link_rst_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module op_link_rst_FSM_tf;

	// Inputs
	reg CLK;
	reg DAQ_OP_RST;
	reg RST;
	reg STRTUP_OP_RST;
	reg TRG_OP_RST;

	// Outputs
	wire DAQ_TDIS;
	wire TRG_TDIS;

	// Instantiate the Unit Under Test (UUT)
	op_link_rst_FSM #(
		.PULSE_DUR(12'd40)
	)
	uut (
		.DAQ_TDIS(DAQ_TDIS), 
		.TRG_TDIS(TRG_TDIS), 
		.CLK(CLK), 
		.DAQ_OP_RST(DAQ_OP_RST), 
		.RST(RST), 
		.STRTUP_OP_RST(STRTUP_OP_RST), 
		.TRG_OP_RST(TRG_OP_RST)
	);

   parameter PERIOD = 24;  // CMS clock period (40MHz)

	initial begin  // CMS clock from QPLL 40 MHz
		CLK = 1;  // start high
      forever begin
         #(PERIOD/2) begin
				CLK = ~CLK;  //Toggle
			end
		end
	end

	initial begin
		// Initialize Inputs
		DAQ_OP_RST = 0;
		RST = 1;
		STRTUP_OP_RST = 0;
		TRG_OP_RST = 0;

		// Wait 100 ns for global reset to finish
		#100;
      RST = 0;
      #(5*PERIOD);		
		DAQ_OP_RST = 1;
      #(11*PERIOD);		
		DAQ_OP_RST = 0;
      #(100*PERIOD);		
		TRG_OP_RST = 1;
      #(11*PERIOD);		
		TRG_OP_RST = 0;
      #(100*PERIOD);		
		STRTUP_OP_RST = 1;
      #(1100*PERIOD);		
		STRTUP_OP_RST = 0;
      #(100*PERIOD);		
      #(5*PERIOD);		
		// Add stimulus here

	end
      
endmodule

