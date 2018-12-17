`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:29:50 03/04/2011
// Design Name:   ADC_data_sim_top
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f1.0/ADC_data_sim.v
// Project Name:  dcfeb_f1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADC_data_sim_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ADC_data_sim;

	// Inputs
	reg ALTXO_CLK_AC_P;
	reg ALTXO_CLK_AC_N;
	reg G1ADCLK0P;
	reg G1ADCLK0N;
	reg G1LCLK0P;
	reg G1LCLK0N;
	reg [15:0] G1AD_P;
	reg [15:0] G1AD_N;
	reg RST;
//	reg d_fclk;
	
	// Outputs
	wire [191:0] g1daq16ch;
	wire [11:0] g1daq_ch[15:0];

	// Instantiate the Unit Under Test (UUT)
	ADC_data_sim_top uut (
      .ALTXO_CLK_AC_P(ALTXO_CLK_AC_P),
      .ALTXO_CLK_AC_N(ALTXO_CLK_AC_N),
		.G1ADCLK0P(G1ADCLK0P), 
		.G1ADCLK0N(G1ADCLK0N), 
		.G1LCLK0P(G1LCLK0P), 
		.G1LCLK0N(G1LCLK0N), 
		.G1AD_P(G1AD_P), 
		.G1AD_N(G1AD_N), 
		.RST(RST), 
		.G1DAQ16CH(g1daq16ch)
	);
	
	assign {g1daq_ch[15],
	        g1daq_ch[14],
	        g1daq_ch[13],
	        g1daq_ch[12],
	        g1daq_ch[11],
	        g1daq_ch[10],
	        g1daq_ch[9],
	        g1daq_ch[8],
	        g1daq_ch[7],
	        g1daq_ch[6],
	        g1daq_ch[5],
	        g1daq_ch[4],
	        g1daq_ch[3],
	        g1daq_ch[2],
	        g1daq_ch[1],
	        g1daq_ch[0]} = g1daq16ch;
			  
			  
   parameter PERIOD = 48;  // Sampling period
	integer i,ch;

	reg[11:0] sample2 = 12'hC59;
	reg[11:0] sample1 = 12'h106;
	
	initial begin  // Differential 200MHz reference clock for IODELAYs
      forever begin
         begin
				ALTXO_CLK_AC_P = 1'b1;  // start high
				ALTXO_CLK_AC_N = 1'b0;
			end
         #(2) begin
				ALTXO_CLK_AC_P = 1'b0;  // go low
				ALTXO_CLK_AC_N = 1'b1;
			end
			#(3);
		end
	end
	initial begin  // Differential Bit clock (6X sampling frequency)
      G1LCLK0P = 1'b1; // start high
      G1LCLK0N = 1'b0;
//		#(PERIOD/24);    // set phase relative to Frame clock
//      G1LCLK0P = 1'b0; // go low
//      G1LCLK0N = 1'b1;
      forever
         #(PERIOD/12) begin
			   G1LCLK0P = ~G1LCLK0P;
			   G1LCLK0N = ~G1LCLK0N;
		   end
	end
	initial begin  // Differential Frame clock
//      G1ADCLK0P = 1'b0;  // start low
//      G1ADCLK0N = 1'b1;
//		#(4.5*PERIOD/6);     // offset rising edge by 4.5 bit clocks
      G1ADCLK0P = 1'b1;  // go high
      G1ADCLK0N = 1'b0;
      forever
         #(PERIOD/2) begin
			   G1ADCLK0P = ~G1ADCLK0P;
			   G1ADCLK0N = ~G1ADCLK0N;
			end
	end
//	initial begin  // Differential Frame clock
//      d_fclk = 1'b0;  // start low
//		#(4.5*PERIOD/6);     // offset rising edge by 4.5 bit clocks
//      d_fclk = 1'b1;  // go high
//      forever
//         #(PERIOD/2) begin
//			   d_fclk = ~d_fclk;
//			end
//	end

   initial begin  // data sequence; start in phase with frame clock
//		#(PERIOD/24);    // set phase relative to Frame clock
		G1AD_P = 0;
		G1AD_N = 1;
		forever begin
			for(i=0; i<12; i=i+1) begin
			   for(ch=0; ch<16; ch=ch+1) begin
					G1AD_P[ch] = sample1[i];
					G1AD_N[ch] = ~sample1[i];
				end
				#(PERIOD/12);
			end
			for(i=0; i<12; i=i+1) begin
			   for(ch=0; ch<16; ch=ch+1) begin
					G1AD_P[ch] = sample2[i];
					G1AD_N[ch] = ~sample2[i];
				end
				#(PERIOD/12);
			end
		end
	end
	initial begin
		// Initialize Inputs
		RST = 1;

		// Wait 100 ns for global reset to finish
		#100;
      #100; //Hold RST for an additional 4 clocks.
		RST = 0;
		// Add stimulus here

	end
      
endmodule

