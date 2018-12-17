`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:33:34 02/28/2011
// Design Name:   JTAG_sim_top
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f1.0/JTAG_func_sim.tf
// Project Name:  dcfeb_f1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JTAG_sim_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module JTAG_func_sim;

	// Inputs
	reg CLK;
	reg clk160;
	reg sys_rst;
	wire [6:1] bky_rtn;

	// Outputs
	wire [1:0] xl1dlyset;
	wire [3:0] loadpblk;
	wire [1:0] comp_mode;
	wire [2:0] comp_time;
	wire cdac_enb;
	wire cdac_dat;
	wire [6:1] to_bky;
	wire [6:1] bky_clk;
	wire [15:0] status;
	wire [11:0] adc_cs;
	wire adc_sclk;
	wire adc_sdata;

	// Instantiate the Unit Under Test (UUT)
	JTAG_sim_top uut (
		.clk20(CLK), 
		.clk160(clk160), 
		.sys_rst(sys_rst), 
		.bky_rtn(bky_rtn), 
		.xl1dlyset(xl1dlyset), 
		.loadpblk(loadpblk), 
		.comp_mode(comp_mode), 
		.comp_time(comp_time), 
		.cdac_enb(cdac_enb), 
		.cdac_ck(cdac_ck), 
		.cdac_dat(cdac_dat), 
		.to_bky(to_bky), 
		.bky_clk(bky_clk), 
		.status(status), 
      .adc_cs(adc_cs),
	   .adc_sclk(adc_sclk),
	   .adc_sdata(adc_sdata)
	);
	
   parameter PERIOD = 48;
	parameter JPERIOD = 100;
	parameter ir_width = 10;
	parameter max_width = 300;

   reg [47:0] bky1sh,bky2sh,bky3sh,bky4sh,bky5sh,bky6sh;
	reg TMS,TDI,TCK;

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
		// Initialize Inputs
      CLK = 1'b0;
      forever
         #(PERIOD/2) CLK = ~CLK;
	end
	initial begin
      clk160 = 1'b0;
      forever
         #3 clk160 = ~clk160;
	end
	initial begin
		sys_rst = 1;
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
		sys_rst = 0;
		JTAG_reset;
		Set_Func(8'h0c);           // ADC Mask register
		Set_User(usr2);            // User 2 for User Reg access
//		Shift_Data(12,12'h5a9);    // ADC Mask bits
		Shift_Data(12,12'hFFF);    // ADC Mask bits
		
		Set_Func(8'h05);           // Extra L1A Delay
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(2,2'b10);       // xl1a data
		
		Set_Func(8'h08);           // Pre block end
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(4,4'b0011);       // preblock data
		
		Set_Func(8'h09);           // Comp mode and timing
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(5,5'b01001);       // Comp timing, comp mode data
		
		Set_Func(8'h07);           // daisy chained registers
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(11,11'b11010010011);   // xl1a, pblock, C timing, C mode
		
		Set_Func(8'h0A);           // Buckeye mask
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(6,6'b001000);       //buckeye mask
		
		Set_Func(8'h0B);           // Buckeye shift
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(48,48'h3F78D2BC9AE1);       // data for one chip
		
		Set_Func(8'h03);           // capture and shift status
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(32,32'h000000000000);       // return data is important
		
		Set_Func(8'h0A);           // Buckeye mask
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(6,6'b111111);       //All buckeye
		
		Set_Func(8'h0B);           // Buckeye shift
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(6*48,288'h111111111111222222222222333333333333444444444444555555555555666666666666);       // data for all chips
		
		Set_Func(8'h04);           // Program Comparator DAC
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(12,12'h35b);       // data for DAC
		
		Set_Func(8'h0E);           // Write data to ADC memory
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(26,26'h12A0506);// set gain on ch1 to 6 db and ch3 to 5 db
		
		Set_Func(8'h0E);           // Write data to ADC memory
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(26,26'h2005555);// just for simulation testing
		
		Set_Func(8'h0E);           // Write data to ADC memory
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(26,26'h3E25555);// just for simulation testing
		
		Set_Func(8'h0D);           // Configure ADC (This is an auto reset function)
		
		#(20*PERIOD);
		
		Set_Func(8'h10);           // Set Pipeline depth
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(9,9'd68);       // shift pipe depth
		
		#(5*PERIOD);
		
		Set_Func(8'h0F);           // Restart pipeline
		
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
	
	// Buckeye shift registers
	
	always @(posedge bky_clk[1])	   bky1sh <= {to_bky[1],bky1sh[47:1]};
	always @(posedge bky_clk[2])	   bky2sh <= {to_bky[2],bky2sh[47:1]};
	always @(posedge bky_clk[3])	   bky3sh <= {to_bky[3],bky3sh[47:1]};
	always @(posedge bky_clk[4])	   bky4sh <= {to_bky[4],bky4sh[47:1]};
	always @(posedge bky_clk[5])	   bky5sh <= {to_bky[5],bky5sh[47:1]};
	always @(posedge bky_clk[6])	   bky6sh <= {to_bky[6],bky6sh[47:1]};
		
   assign bky_rtn = {bky6sh[0],bky5sh[0],bky4sh[0],bky3sh[0],bky2sh[0],bky1sh[0]};
	
	
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

