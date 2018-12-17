`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:53 03/04/2011 
// Design Name: 
// Module Name:    ADC_data_sim_top 
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
module ADC_data_sim_top(
    input ALTXO_CLK_AC_P,
    input ALTXO_CLK_AC_N,
    input G1ADCLK0P,
    input G1ADCLK0N,
    input G1LCLK0P,
    input G1LCLK0N,
    input [15:0] G1AD_P,
    input [15:0] G1AD_N,
    input RST,
	 output [191:0] G1DAQ16CH
    );
  wire [15:0] g1ad, g1ad_d;
  wire g1adclk0,g1lclk0;
  wire clk200,clk100;
  wire frame_clock,bit_clk_odd,bit_clk_even;
  wire frm_lock;
  wire rdy;
  wire [4:0] cntvalueout;
  wire [11:0] dout [15:0];
  
  assign G1DAQ16CH = {dout[15],dout[14],dout[13],dout[12],dout[11],dout[10],dout[9],dout[8],dout[7],dout[6],dout[5],dout[4],dout[3],dout[2],dout[1],dout[0]};
  
  IBUFDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFDS_G1AD[15:0] (.O(g1ad),.I(G1AD_P),.IB(G1AD_N));
  
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G1ADCLK0 (.O(g1adclk0),.I(G1ADCLK0P),.IB(G1ADCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G1LCLK0 (.O(g1lclk0),.I(G1LCLK0P),.IB(G1LCLK0N));
  IBUFDS_GTXE1 q4_clk0_refclk_ibufds_i (.O(clk200),.ODIV2(clk100),.CEB(1'b0),.I(ALTXO_CLK_AC_P),.IB(ALTXO_CLK_AC_N));

  adc_frame_clk adc_frame_mmcm (.CLK_IN1(g1adclk0),.CLK_OUT1(frame_clock),.CLK_OUT2(bit_clk_odd),.CLK_OUT3(bit_clk_even),.RESET(RST),.LOCKED(frm_lock));
	 
	
	generate
      genvar ch;
		for (ch=0; ch<16; ch=ch+1) begin : g1a
		   deserializer serdes(.BIT_CLK_ODD(bit_clk_odd),.BIT_CLK_EVEN(bit_clk_even),.FRAME_CLK(frame_clock),.RST(~frm_lock),.D(g1ad_d[ch]),.Q(dout[ch]));
		end
	endgenerate
	
//   deserializer g1a_ch1 (
//    .BIT_CLK_ODD(bit_clk_odd),
//    .BIT_CLK_EVEN(bit_clk_even),
//    .FRAME_CLK(frame_clock),
//    .RST(~frm_lock),
//    .D(g1ad_d[1]),      // serial data in
//    .Q(PAR_OUT1)       // parallel data out
//    );

   // IDELAYCTRL: IDELAY Tap Delay Value Control
   //             Virtex-6
   // Xilinx HDL Language Template, version 12.4

   (* IODELAY_GROUP = "<adc_input_group_1>" *) // Specifies group name for associated IODELAYs and IDELAYCTRL
   IDELAYCTRL IDELAYCTRL_inst (
      .RDY(rdy),       // 1-bit Indicates the validity of the reference clock input, REFCLK. When REFCLK
                       // disappears (i.e., REFCLK is held High or Low for one clock period or more), the RDY
                       // signal is deasserted.
      .REFCLK(clk200), // 1-bit Provides a voltage bias, independent of process, voltage, and temperature
                       // variations, to the tap-delay lines in the IOBs. The frequency of REFCLK must be 200
                       // MHz to guarantee the tap-delay value specified in the applicable data sheet.
      .RST(RST)        // 1-bit Resets the IDELAYCTRL circuitry. The RST signal is an active-high asynchronous
                       // reset. To reset the IDELAYCTRL, assert it High for at least 50 ns.
   );
   // IODELAYE1: Input / Output Fixed or Variable Delay Element
   //            Virtex-6
   // Xilinx HDL Language Template, version 12.4

   (* IODELAY_GROUP = "<adc_input_group_1>" *) // Specifies group name for associated IODELAYs and IDELAYCTRL
   IODELAYE1 #(
      .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion ("TRUE"/"FALSE") 
      .DELAY_SRC("I"),                 // Delay input ("I", "CLKIN", "DATAIN", "IO", "O")
      .HIGH_PERFORMANCE_MODE("FALSE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("FIXED"),         // "DEFAULT", "FIXED", "VARIABLE", or "VAR_LOADABLE" 
      .IDELAY_VALUE(25),                // Input delay tap setting (0-32)
      .ODELAY_TYPE("FIXED"),           // "FIXED", "VARIABLE", or "VAR_LOADABLE" 
      .ODELAY_VALUE(0),                // Output delay tap setting (0-32)
      .REFCLK_FREQUENCY(200.0),        // IDELAYCTRL clock input frequency in MHz
      .SIGNAL_PATTERN("DATA")          // "DATA" or "CLOCK" input signal
   )
   dly_g1ad[15:0] (
      .CNTVALUEOUT(cntvalueout), // 5-bit output - Counter value for monitoring purpose
      .DATAOUT(g1ad_d),       // 1-bit output - Delayed data output
      .C(1'b0),                  // 1-bit input - Clock input
      .CE(1'b0),                 // 1-bit input - Active high enable increment/decrement function
      .CINVCTRL(1'b0),           // 1-bit input - Dynamically inverts the Clock (C) polarity
      .CLKIN(1'b0),              // 1-bit input - Clock Access into the IODELAY
      .CNTVALUEIN(5'b00000),     // 5-bit input - Counter value for loadable counter application
      .DATAIN(1'b0),             // 1-bit input - Internal delay data
      .IDATAIN(g1ad),         // 1-bit input - Delay data input
      .INC(1'b0),                // 1-bit input - Increment / Decrement tap delay
      .ODATAIN(1'b0),            // 1-bit input - Data input for the output datapath from the device
      .RST(RST),                 // 1-bit input - Active high, synchronous reset, resets delay chain to IDELAY_VALUE/
                                 // ODELAY_VALUE tap. If no value is specified, the default is 0.
      .T(1'b1)                   // 1-bit input - 3-state input control. Tie high for input-only or internal delay or
                                 // tie low for output only.
   );
	
endmodule
