`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:16:54 02/25/2011 
// Design Name: 
// Module Name:    adc_config 
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
module adc_config #(
	parameter TMR = 0
)(
    input CLK,         // Clock
    input RST,         // Reset
    input INIT,        // Command to initialize the ADC's (on power up or on command)
	 input JCTRL,       // Selects JWE and JDATA as source for writing memory
    input JWE,          // JTAG Write enable for the memory
    input [25:0] JDATA,// Parallel data to be written to memory from JTAG
	 input [3:0] CSP_WE, // Write enables from chip scope pro control
	 input [23:0] CSP_WR_DATA, // Data to be written to memory from chip scope pro
	 input [4:0] CSP_WR_ADDR, // Address to write to memory from chip scope pro
	 input CSP_RD_CTRL,       // Selects CSP_RD_ADDR as source of address
	 output [23:0] CSP_RD_DATA, // Data to be written to memory from chip scope pro
	 input [4:0] CSP_RD_ADDR, // Address to write to memory from chip scope pro
	 input [1:0] CSP_MSEL, // memory select from chip scope pro
	 input [11:0] MASK, // Mask for which ADC to talk to
    output [11:0] CS,  // Chip selects for all 12 ADC's
    output SCLK,       // Serial clock to ADC's
    output SDATA,      // Serial data to ADC's
    output DONE,        // Done signal when initialization is complete
	 output [1:0] la_msel,
	 output [4:0] la_rd_addr,
	 output [4:0] la_wr_addr
    );

	wire [23:0] mem_in;
	wire we;
   reg  [4:0] jaddr;
   wire [4:0] waddr;


	wire load;
	wire scken;
	wire shen;
	wire csel;
	wire [11:0] cs_mask;
	wire [4:0] raddr;
	wire [4:0] addr;


	assign la_msel = 4'h0;
	assign la_rd_addr = raddr;
	assign la_wr_addr = waddr;

	assign CS = {12{csel}} & cs_mask;
	assign cs_mask = MASK;
	
//
// source multiplexer for memory reads
//
	assign raddr = CSP_RD_CTRL ? CSP_RD_ADDR : addr;
//
// Data/addr/we source multiplexer for memory writes
//
	assign waddr  = JCTRL ? jaddr       : CSP_WR_ADDR;
	assign mem_in = JCTRL ? JDATA[23:0] : CSP_WR_DATA;
	assign we     = JCTRL ? JWE         : CSP_WE[0];
	
//
// Decode address and write enable to write from JTAG data
//
	always @(JDATA) begin
		case(JDATA[23:16])
			8'h00: jaddr = 5'h00;
			8'h01: jaddr = 5'h01;
			8'h0f: jaddr = 5'h02;
			8'h11: jaddr = 5'h03;
			8'h12: jaddr = 5'h04;
			8'h14: jaddr = 5'h05;
			8'h24: jaddr = 5'h06;
			8'h25: jaddr = 5'h07;
			8'h26: jaddr = 5'h08;
			8'h27: jaddr = 5'h09;
			8'h2a: jaddr = 5'h0a;
			8'h2b: jaddr = 5'h0b;
			8'h42: jaddr = 5'h0c;
			8'h45: jaddr = 5'h0d;
			8'h46: jaddr = 5'h0e;
			8'he2: jaddr = 5'h0f;
			8'he3: jaddr = 5'h10;
			default: jaddr = 5'h1f;
		endcase
	end
	
  
generate
if(TMR==1) 
begin : ADC_Cnfg_logic_TMR

	(* syn_preserve = "true" *) reg [23:0] ram_1 [31:0];
	(* syn_preserve = "true" *) reg [23:0] ram_2 [31:0];
	(* syn_preserve = "true" *) reg [23:0] ram_3 [31:0];
	(* syn_preserve = "true" *) reg [23:0] shreg_1;
	(* syn_preserve = "true" *) reg [23:0] shreg_2;
	(* syn_preserve = "true" *) reg [23:0] shreg_3;
	(* syn_preserve = "true" *) reg sclk_r_1;
	(* syn_preserve = "true" *) reg sclk_r_2;
	(* syn_preserve = "true" *) reg sclk_r_3;
	(* syn_preserve = "true" *) reg dscken_1;
	(* syn_preserve = "true" *) reg dscken_2;
	(* syn_preserve = "true" *) reg dscken_3;

	(* syn_keep = "true" *) wire [23:0] mem_out_1;
	(* syn_keep = "true" *) wire [23:0] mem_out_2;
	(* syn_keep = "true" *) wire [23:0] mem_out_3;

	(* syn_keep = "true" *) wire [23:0] vt_mem_out_1;
	(* syn_keep = "true" *) wire [23:0] vt_mem_out_2;
	(* syn_keep = "true" *) wire [23:0] vt_mem_out_3;
	(* syn_keep = "true" *) wire [23:0] vt_shreg_1;
	(* syn_keep = "true" *) wire [23:0] vt_shreg_2;
	(* syn_keep = "true" *) wire [23:0] vt_shreg_3;
	(* syn_keep = "true" *) wire vt_sclk_r_1;
	(* syn_keep = "true" *) wire vt_sclk_r_2;
	(* syn_keep = "true" *) wire vt_sclk_r_3;
	(* syn_keep = "true" *) wire vt_dscken_1;
	(* syn_keep = "true" *) wire vt_dscken_2;
	(* syn_keep = "true" *) wire vt_dscken_3;
	
	assign vt_mem_out_1 = (mem_out_1 & mem_out_2) | (mem_out_2 & mem_out_3) | (mem_out_1 & mem_out_3); // Majority logic
	assign vt_mem_out_2 = (mem_out_1 & mem_out_2) | (mem_out_2 & mem_out_3) | (mem_out_1 & mem_out_3); // Majority logic
	assign vt_mem_out_3 = (mem_out_1 & mem_out_2) | (mem_out_2 & mem_out_3) | (mem_out_1 & mem_out_3); // Majority logic
	assign vt_shreg_1   = (shreg_1   & shreg_2  ) | (shreg_2   & shreg_3  ) | (shreg_1   & shreg_3  ); // Majority logic
	assign vt_shreg_2   = (shreg_1   & shreg_2  ) | (shreg_2   & shreg_3  ) | (shreg_1   & shreg_3  ); // Majority logic
	assign vt_shreg_3   = (shreg_1   & shreg_2  ) | (shreg_2   & shreg_3  ) | (shreg_1   & shreg_3  ); // Majority logic
	assign vt_sclk_r_1  = (sclk_r_1  & sclk_r_2 ) | (sclk_r_2  & sclk_r_3 ) | (sclk_r_1  & sclk_r_3 ); // Majority logic
	assign vt_sclk_r_2  = (sclk_r_1  & sclk_r_2 ) | (sclk_r_2  & sclk_r_3 ) | (sclk_r_1  & sclk_r_3 ); // Majority logic
	assign vt_sclk_r_3  = (sclk_r_1  & sclk_r_2 ) | (sclk_r_2  & sclk_r_3 ) | (sclk_r_1  & sclk_r_3 ); // Majority logic
	assign vt_dscken_1  = (dscken_1  & dscken_2 ) | (dscken_2  & dscken_3 ) | (dscken_1  & dscken_3 ); // Majority logic
	assign vt_dscken_2  = (dscken_1  & dscken_2 ) | (dscken_2  & dscken_3 ) | (dscken_1  & dscken_3 ); // Majority logic
	assign vt_dscken_3  = (dscken_1  & dscken_2 ) | (dscken_2  & dscken_3 ) | (dscken_1  & dscken_3 ); // Majority logic

	initial begin
	   $readmemh ("ADC_ram_contents", ram_1, 0, 31);
	   $readmemh ("ADC_ram_contents", ram_2, 0, 31);
	   $readmemh ("ADC_ram_contents", ram_3, 0, 31);
	end
	
   assign mem_out_1 = ram_1[raddr];
   assign mem_out_2 = ram_2[raddr];
   assign mem_out_3 = ram_3[raddr];
	assign CSP_RD_DATA = vt_mem_out_1;
	assign SCLK = vt_sclk_r_1;
	assign SDATA = vt_shreg_1[23]; // Majority logic
	assign csel = scken | vt_dscken_1; // stretch the clock enable by 1 clock
	
	always @(posedge CLK) begin
		dscken_1 <= scken;
		dscken_2 <= scken;
		dscken_3 <= scken;
	end
	
//
// Infer distributed RAM for storing ADC configuration memory
//
   always @(posedge CLK) begin
	   if(we) begin
		   ram_1[waddr] <= mem_in;
		   ram_2[waddr] <= mem_in;
		   ram_3[waddr] <= mem_in;
		end
	end
	
//
// Shift register for serial data to ADCs 
//
	always @(posedge CLK) begin
		if (load) begin
			shreg_1 <= vt_mem_out_1;              // load with value from memory
			shreg_2 <= vt_mem_out_2;              // load with value from memory
			shreg_3 <= vt_mem_out_3;              // load with value from memory
		end
		else begin
			shreg_1 <= (shen & vt_sclk_r_1) ? {vt_shreg_1[22:0],1'b0} : vt_shreg_1; // shift left
			shreg_2 <= (shen & vt_sclk_r_2) ? {vt_shreg_2[22:0],1'b0} : vt_shreg_2; // shift left
			shreg_3 <= (shen & vt_sclk_r_3) ? {vt_shreg_3[22:0],1'b0} : vt_shreg_3; // shift left
		end
	end
	
//
// SCLK generator (lives high)
//
	always @(posedge CLK) begin
	   if(!scken) begin
		   sclk_r_1 <= 1'b1;  // When not enabled the clock lives high
		   sclk_r_2 <= 1'b1;  // When not enabled the clock lives high
		   sclk_r_3 <= 1'b1;  // When not enabled the clock lives high
		end
	   else begin
		   sclk_r_1 <= ~vt_sclk_r_1; // The serial clock is half the frequency of CLK
		   sclk_r_2 <= ~vt_sclk_r_2; // The serial clock is half the frequency of CLK
		   sclk_r_3 <= ~vt_sclk_r_3; // The serial clock is half the frequency of CLK
		end
	end
	
end
else 
begin : ADC_Cnfg_logic

	reg [23:0] ram0 [31:0];
	reg [23:0] shreg;
	reg  sclk_r;
	reg  dscken;
	wire [23:0] mem_out;
	
	initial begin
	   $readmemh ("ADC_ram_contents", ram0, 0, 31);
	end
	
   assign mem_out = ram0[raddr];
	assign CSP_RD_DATA = mem_out;
	assign SCLK = sclk_r;
	assign SDATA = shreg[23];
	assign csel = scken | dscken; // stretch the clock enable by 1 clock
	
	always @(posedge CLK)  dscken <= scken;
	
//
// Infer distributed RAM for storing ADC configuration memory
//
   always @(posedge CLK) begin
	   if(we)
		   ram0[waddr] <= mem_in;
	end
	
//
// Shift register for serial data to ADCs 
//
	always @(posedge CLK) begin
		if (load) begin
			shreg <= mem_out;              // load with value from memory
		end
		else begin
			shreg <= (shen & sclk_r) ? {shreg[22:0],1'b0} : shreg; // shift left, maintain SRL usage
		end
	end
	
//
// SCLK generator (lives high)
//
	always @(posedge CLK) begin
	   if(!scken) begin
		   sclk_r <= 1'b1;  // When not enabled the clock lives high
		end
	   else begin
		   sclk_r <= ~sclk_r; // The serial clock is half the frequency of CLK
		end
	end
	
end
endgenerate

	
//
//  Finite State Machine for controlling the ADC configuration
//

  
generate
if(TMR==1) 
begin : ADC_Cnfg_FSM_TMR
	ADC_Config_FSM_TMR #(.Last_Addr(5'h10)) // Use address 0-16
	ADC_Config_FSM_i	(
	  .ADR(addr),            // output  -- memory address
	  .DONE(DONE),           // output -- Conifguration Done signal
	  .LOAD(load),           // output -- Load shift register
	  .SCKEN(scken),         // output -- Enable the serial clock generation and ADC chip select signals (CS)
	  .SHEN(shen),           // output -- Shift Enable
	  .CLK(CLK),             // input  -- clock
	  .INIT(INIT),           // input  -- Signal to initiate the configuration
	  .RST(RST)              // input  -- Reset 
	);
end
else 
begin : ADC_Cnfg_FSM
	ADC_Config_FSM #(.Last_Addr(5'h10)) // Use address 0-16
	ADC_Config_FSM_i	(
	  .ADR(addr),            // output  -- memory address
	  .DONE(DONE),           // output -- Conifguration Done signal
	  .LOAD(load),           // output -- Load shift register
	  .SCKEN(scken),         // output -- Enable the serial clock generation and ADC chip select signals (CS)
	  .SHEN(shen),           // output -- Shift Enable
	  .CLK(CLK),             // input  -- clock
	  .INIT(INIT),           // input  -- Signal to initiate the configuration
	  .RST(RST)              // input  -- Reset 
	);
end
endgenerate

endmodule

