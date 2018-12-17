`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:42:56 07/17/2014
// Design Name:   Frame_Proc_FSM
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/DAQ/Frame_Proc_FSM_sim_tf.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Frame_Proc_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Frame_Proc_FSM_sim_tf;

	// Inputs
	reg CLK;
	reg [2:0] rom_addr;
	reg RST;
	reg VALID;

	// Outputs
	wire CLR_CRC;
	wire CRC_DV;
	wire INC_ROM;
	wire RST_ROM;
	wire TX_ACK;
	wire [3:0] FRM_STATE;
wire 	CLR_CRC_trial;
wire 	CRC_DV_trial;
wire 	[2:0] ROM_ADDR_trial;
wire 	TX_ACK_trial;
wire 	[3:0] FRM_STATE_trial;

wire rst_rom_addr;
assign rst_rom_addr = RST | RST_ROM;

always @(posedge CLK or posedge rst_rom_addr)
begin
	if(rst_rom_addr)
		rom_addr <= 3'd0;
	else
		if(INC_ROM)
			rom_addr <= rom_addr + 1;
		else
			rom_addr <= rom_addr;
end

	// Instantiate the Unit Under Test (UUT)
	Frame_Proc_FSM uut (
		.CLR_CRC(CLR_CRC), 
		.CRC_DV(CRC_DV), 
		.INC_ROM(INC_ROM), 
		.RST_ROM(RST_ROM), 
		.TX_ACK(TX_ACK), 
		.FRM_STATE(FRM_STATE), 
		.CLK(CLK), 
		.ROM_ADDR(rom_addr), 
		.RST(RST), 
		.VALID(VALID)
	);

	Frame_Proc_FSM_trial Frame_Proc_FSM_trial_i	(
		.CLR_CRC(CLR_CRC_trial), 
		.CRC_DV(CRC_DV_trial), 
		.ROM_ADDR(ROM_ADDR_trial), 
		.TX_ACK(TX_ACK_trial), 
		.FRM_STATE(FRM_STATE_trial), 
		.CLK(CLK), 
		.RST(RST), 
		.VALID(VALID)
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
		RST = 1;
		VALID = 0;

		// Wait 100 ns for global reset to finish
		#(5*CMS_PERIOD);
		#1;
		RST = 0;
		#(5*CMS_PERIOD);
		VALID = 1;
		#(810*C160_PERIOD);
		VALID = 0;
        
		// Add stimulus here

	end
      
endmodule

