`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:33:31 02/03/2015
// Design Name:   JTAG_sim_top2
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/JTAG_func_sim_tf2.v
// Project Name:  dcfeb3a
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JTAG_sim_top2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module JTAG_func_sim_tf2;

	// Inputs
	reg RST;

	// Outputs
	wire CAPTURE1;
	wire DRCK1;
	wire RESET1;
	wire RUNTEST1;
	wire SEL1;
	wire SHIFT1;
	wire TCK1;
	wire TDI1;
	wire TMS1;
	wire UPDATE1;
	wire CAPTURE2;
	wire DRCK2;
	wire RESET2;
	wire RUNTEST2;
	wire SEL2;
	wire SHIFT2;
	wire TCK2;
	wire TDI2;
	wire TMS2;
	wire UPDATE2;

	// Instantiate the Unit Under Test (UUT)
	JTAG_sim_top2 uut (
		.RST(RST), 
		.CAPTURE1(CAPTURE1), 
		.DRCK1(DRCK1), 
		.RESET1(RESET1), 
		.RUNTEST1(RUNTEST1), 
		.SEL1(SEL1), 
		.SHIFT1(SHIFT1), 
		.TCK1(TCK1), 
		.TDI1(TDI1), 
		.TMS1(TMS1), 
		.UPDATE1(UPDATE1), 
		.CAPTURE2(CAPTURE2), 
		.DRCK2(DRCK2), 
		.RESET2(RESET2), 
		.RUNTEST2(RUNTEST2), 
		.SEL2(SEL2), 
		.SHIFT2(SHIFT2), 
		.TCK2(TCK2), 
		.TDI2(TDI2), 
		.TMS2(TMS2), 
		.UPDATE2(UPDATE2)
	);
	
   parameter PERIOD = 48;
	parameter JPERIOD = 100;
	parameter ir_width = 10;
	parameter max_width = 20;

	reg TMS,TDI,TCK;
	wire TDO;

   integer i;
	reg [7:0] jrst;
	reg [3:0] sir_hdr;
	reg [3:0] sdr_hdr;
	reg [2:0] trl;
	reg [ir_width-1:0] usr1;
	reg [ir_width-1:0] usr2;
	reg [ir_width-1:0] usr3;
	reg [ir_width-1:0] usr4;
	
	initial begin
		RST = 0;
		TMS = 1'b1;
		TDI = 1'b0;
		TCK = 1'b0;
      jrst = 8'b00111111;
      sir_hdr = 4'b0011;
      sdr_hdr = 4'b0010;
		trl = 3'b001;
		usr1 = 10'h3c2; // usr1 instruction
		usr2 = 10'h3c3; // usr2 instruction
		usr3 = 10'h3e2; // usr3 instruction
		usr4 = 10'h3e3; // usr4 instruction

		// Wait 100 ns for global reset to finish
		#100;
		#96;
		RST = 1;
		#120;
		RST = 0;
		#120;
        
        
// Function  Description
// ---------------------------------------
//   0     | No Op 
//   1     | SCAM Reset (not needed in DCFEB)
//   2     | DCFEB status reg shift only
//   3     | DCFEB status reg capture and shift
//   4     | Program Comparator DAC
//   5     | Set Extra L1a Delay
//   6     | 
//   7     | Set F5, F8, and F9 in one serial loop (daisy chained)
//   8     | Set Pre Block End (not needed in DCFEB)
//   9     | Set Comparator Mode and Timing bits
//  10     | Set Buckeye Mask for shifting (default 6'b111111)
//  11     | Shift data to/from Buckeye chips
//  12     | Set ADC configuration MASK
//  13     | Command to initialize ADC
//  14     | Shift data and write to ADC configuration memory
//  15     | Command to restart pipeline
//  16     | Set pipeline depth
		// Add stimulus here
		#50;
		JTAG_reset;
		#(4*PERIOD);
		Set_Func(8'h0c);           // ADC Mask register
		#(4*PERIOD);
		Set_User(usr2);            // User 2 for User Reg access
		#(4*PERIOD);
		Shift_Data(12,12'h95B);    // ADC Mask bits
		#(4*PERIOD);
		
		
		#(20*PERIOD);
		
		
	end
   // JTAG_SIM_VIRTEX6: JTAG Interface Simulation Model
   //                   Virtex-6
   // Xilinx HDL Language Template, version 12.4
   
   JTAG_SIM_VIRTEX6 #(
      .PART_NAME("LX130T") // Specify target V6 device.  Possible values are:
                          // "CX130T","CX195T","CX240T","CX75T","HX250T","HX255T","HX380T","HX45T","HX565T",
                          // "LX115T","LX130T","LX130TL","LX195T","LX195TL","LX240T","LX240TL","LX365T","LX365TL",
                          // "LX40T","LX550T","LX550TL","LX75T","LX760","SX315T","SX475T" 
   ) JTAG_SIM_VIRTEX6_inst (
      .TDO(TDO), // 1-bit JTAG data output
      .TCK(TCK), // 1-bit Clock input
      .TDI(TDI), // 1-bit JTAG data input
      .TMS(TMS)  // 1-bit JTAG command input
   );
	
task JTAG_reset;
begin
	// JTAG reset
	TMS = 1'b1;
	TDI = 1'b0;
	for(i=0;i<8;i=i+1) begin
		TMS = jrst[i];
		TCK = 1'b0;
		#(JPERIOD/2) TCK = 1'b1;
		#(JPERIOD/2);
	end
end
endtask

task Set_Func;
input [7:0] func;
begin
	Set_User(usr1);       // User 1 for instruction decode
	Shift_Data(8,func);   // Shift function code
end
endtask


task Set_User;
input [ir_width-1:0] usr;
begin
	// go to sir
	TDI = 1'b0;
	for(i=0;i<4;i=i+1) begin
		TMS = sir_hdr[i];
		TCK = 1'b0;
		#(JPERIOD/2) TCK = 1'b1;
		#(JPERIOD/2);
	end
	// shift instruction
	TMS = 1'b0;
	for(i=0;i<ir_width;i=i+1) begin
		if(i==ir_width-1)TMS = 1'b1;
		TDI = usr[i];       // User 1, 2, 3, or 4 instruction
		TCK = 1'b0;
		#(JPERIOD/2) TCK = 1'b1;
		#(JPERIOD/2);
	end
	// go to rti
	TDI = 1'b0;
	for(i=0;i<3;i=i+1) begin
		TMS = trl[i];
		TCK = 1'b0;
		#(JPERIOD/2) TCK = 1'b1;
		#(JPERIOD/2);
	end
end
endtask


task Shift_Data;
input integer width;
input [max_width-1:0] d;
begin
		// go to sdr
		TDI = 1'b0;
		for(i=0;i<4;i=i+1) begin
		   TMS = sdr_hdr[i];
			TCK = 1'b0;
			#(JPERIOD/2) TCK = 1'b1;
			#(JPERIOD/2);
		end
		// shift function data 
		TMS = 1'b0;
		for(i=0;i<width;i=i+1) begin
		   if(i==(width-1))TMS = 1'b1;
			TDI = d[i];
			TCK = 1'b0;
			#(JPERIOD/2) TCK = 1'b1;
			#(JPERIOD/2);
		end
		// go to rti
		TDI = 1'b0;
		for(i=0;i<3;i=i+1) begin
		   TMS = trl[i];
			TCK = 1'b0;
			#(JPERIOD/2) TCK = 1'b1;
			#(JPERIOD/2);
		end
end
endtask

      
endmodule

