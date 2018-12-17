`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:37 02/03/2015 
// Design Name: 
// Module Name:    JTAG_sim_top2 
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
module JTAG_sim_top2(
	input RST,
	output CAPTURE1,
	output DRCK1,
	output RESET1,
	output RUNTEST1,
	output SEL1,
	output SHIFT1,
	output TCK1,
	output TDI1,
	output TMS1,
	output UPDATE1,
	output CAPTURE2,
	output DRCK2,
	output RESET2,
	output RUNTEST2,
	output SEL2,
	output SHIFT2,
	output TCK2,
	output TDI2,
	output TMS2,
	output UPDATE2
);

	wire [63:0] f; //JTAG functions (one hot);
	wire dmy3;
	wire [11:0] adc_mask;
	wire tdo1;
	wire tdo2;
	
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  JTAG Access Ports for user function in the fabric (up to 4 interfaces) //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
 
 
   BSCAN_VIRTEX6 #(.DISABLE_JTAG("FALSE"),.JTAG_CHAIN(1))  // User 1 for instruction decodes
   BSCAN_user1 (
      .CAPTURE(CAPTURE1), // 1-bit output CAPTURE output from TAP controller
      .DRCK(DRCK1),       // 1-bit output Data register output for USER functions
      .RESET(RESET1),    // 1-bit output Reset output for TAP controller
      .RUNTEST(RUNTEST1), // 1-bit output State output asserted when TAP controller is in Run Test Idle state.
      .SEL(SEL1),        // 1-bit output USER active output
      .SHIFT(SHIFT1),    // 1-bit output SHIFT output from TAP controller
      .TCK(TCK1),         // 1-bit output Scan Clock output. Fabric connection to TAP Clock pin.
      .TDI(TDI1),         // 1-bit output TDI output from TAP controller
      .TMS(TMS1),         // 1-bit output Test Mode Select input. Fabric connection to TAP.
      .UPDATE(UPDATE1),   // 1-bit output UPDATE output from TAP controller
      .TDO(tdo1)          // 1-bit input Data input for USER function
   );
  
   BSCAN_VIRTEX6 #(.DISABLE_JTAG("FALSE"),.JTAG_CHAIN(2))  // User 2 for data I/O
   BSCAN_user2 (
      .CAPTURE(CAPTURE2), // 1-bit output CAPTURE output from TAP controller
      .DRCK(DRCK2),       // 1-bit output Data register output for USER functions
      .RESET(RESET2),    // 1-bit output Reset output for TAP controller
      .RUNTEST(RUNTEST2), // 1-bit output State output asserted when TAP controller is in Run Test Idle state.
      .SEL(SEL2),        // 1-bit output USER active output
      .SHIFT(SHIFT2),    // 1-bit output SHIFT output from TAP controller
      .TCK(TCK2),     // 1-bit output Scan Clock output. Fabric connection to TAP Clock pin.
      .TDI(TDI2),         // 1-bit output TDI output from TAP controller
      .TMS(TMS2),         // 1-bit output Test Mode Select input. Fabric connection to TAP.
      .UPDATE(UPDATE2),   // 1-bit output UPDATE output from TAP controller
      .TDO(tdo2)          // 1-bit input Data input for USER function
   );

//
// JTAG Instruction decode Uses User 1 BSCAN signals
//
   instr_dcd
	instr_dcd1(
	   .TCK(TCK1),         // TCK for update register
      .DRCK(DRCK1),       // Data Reg Clock
      .SEL(SEL1),        // User 1 mode active
      .TDI(TDI1),         // Serial Test Data In
      .UPDATE(UPDATE1),   // Update state
      .SHIFT(SHIFT1),    // Shift state
      .RST(RST),      // Reset default state
      .CLR(1'b0),          // Clear the current function
      .F(f),              // Function decode output (one hot)
      .TDO(tdo1));        // Serial Test Data Out


//
// ADC Mask register
//
   user_wr_reg #(.width(12), .def_value(12'hFFF), .TMR(0))
   adc_mask1(
	   .TCK(TCK2),         // TCK for update register
      .DRCK(TCK2),        // Data Reg Clock
      .FSEL(f[12]),       // Function select
      .SEL(SEL2),        // User 2 mode active
      .TDI(TDI2),          // Serial Test Data In
      .DSY_IN(1'b0),      // Serial Daisy chained data in
      .SHIFT(SHIFT2),      // Shift state
      .UPDATE(UPDATE2),    // Update state
      .RST(RST),          // Reset default state
      .DSY_CHAIN(1'b0),   // Daisy chain mode
		.LOAD(1'b0),        // Load parallel input
		.PI(12'hFFF),          // Parallel input
      .PO(adc_mask),      // Parallel output
      .TDO(tdo2),        // Serial Test Data Out
      .DSY_OUT(dmy3));    // Daisy chained serial data out



endmodule
