`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:51 02/28/2011 
// Design Name: 
// Module Name:    JTAG_sim_top 
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
module JTAG_sim_top(
    input clk20,
    input clk160,
	 input sys_rst,
	 input [6:1] bky_rtn,
	output [1:0] xl1dlyset,
	output [3:0] loadpblk,
	output [1:0] comp_mode,
	output [2:0] comp_time,
	output [8:0] pdepth,
	output rstrt_pipe,
	output cdac_enb,
	output cdac_ck,
	output cdac_dat,
	output [6:1] to_bky,
	output [6:1] bky_clk,
	output [15:0] status,
	output [11:0] adc_cs,
	output adc_sclk,
	output adc_sdata
    );
 
	wire [25:0] adc_mem;
	wire [11:0] adc_mask;
	wire adc_we;
	wire jtag_adc_init;
	wire adc_init_done;

	
 
 
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  JTAG Accessible User Registers                                         //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
 
	jtag_access
	jtag_acc1(
      .CLK20(clk20),      // 20 MHz Clock
      .CLK40(clk40),      // 40 MHz Clock
      .FSTCLK(clk160),    // 160 MHz Clock
      .RST(sys_rst),      // Reset default state
		.BKY_RTN(bky_rtn),  // Serial data returned from amplifiers
		.STATUS(status),    // Status word
		.ADCDATA(doutfifo),    // Data out of pipeline
		
		.RDFIFO(rdfifo),            // Advance fifo to next word
      .XL1DLYSET(xl1dlyset),      // Extra L1A delay setting [1:0]
      .LOADPBLK(loadpblk),        // Pre-blockend bits [3:0] not used in DCFEB
		.COMP_MODE(comp_mode),      // comparator mode bits [1:0]
		.COMP_TIME(comp_time),      // comparator timing bits [2:0]
		.CDAC_ENB(cdac_enb),        // Comparator DAC enable_bar (active low)
		.CDAC_CK(cdac_ck),          // Comparator DAC clock
		.CDAC_DAT(cdac_dat),        // Comparator DAC data
		.TO_BKY(to_bky),            // Serial data sent to amplifiers
		.BKY_CLK(bky_clk),          // Shift clock for amplifiers
		.ADC_WE(adc_we),            // Write enable for ADC configuration memory
		.ADC_MEM(adc_mem),          // Data word for ADC configuration memory
		.ADC_MASK(adc_mask),        // Mask for ADCs to configure
		.ADC_INIT(jtag_adc_init),   // ADC initialization signal
      .RSTRT_PIPE(rstrt_pipe),    // Restart pipeline on JTAG command
      .PDEPTH(pdepth)             // Pipeline Depth register (9 bits)
   );
		
 
 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  ADC configuration and initialization                                   //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

   adc_config
	adc_config1 (
		.CLK(clk20),         // 20 MHz Clock
		.RST(sys_rst),       // Reset
		.INIT(jtag_adc_init),// Command to initialize the ADC's (on power up or on command)
		.WE(adc_we),         // Write enable for the memory
		.JDATA(adc_mem),     // Parallel data to be written to memory from JTAG
		.MASK(adc_mask),     // Mask for which ADC to talk to
		.CS(adc_cs),         // Chip selects for all 12 ADC's
		.SCLK(adc_sclk),     // Serial clock to ADC's
		.SDATA(adc_sdata),   // Serial data to ADC's
		.DONE(adc_init_done) // Done signal when initialization is complete
	);

endmodule
