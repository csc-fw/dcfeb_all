`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:13:58 03/16/2011
// Design Name:   Pipeline_sim_top
// Module Name:   C:/Users/bylsma/Projects/DCFEB/firmware/dcfeb_f1.0/Pipeline_sim_tf.v
// Project Name:  dcfeb_f1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline_sim_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_sim_tf;

	// Inputs
	reg CMS_CLK_P,CMS_CLK_N;
	reg CMS80_P,CMS80_N;
	reg QPLL_CLK_AC_P,QPLL_CLK_AC_N;
	reg XO_CLK_AC_P,XO_CLK_AC_N;
	reg ALTXO_CLK_AC_P,ALTXO_CLK_AC_N;
	reg TMB_CLK_P,TMB_CLK_N;
	reg G1ADCLK0P,G1ADCLK0N;
	reg G1LCLK0P,G1LCLK0N;
	reg [15:0] G1AD_P,G1AD_N;
	reg [15:0] G2AD_P,G2AD_N;
	reg [15:0] G3AD_P,G3AD_N;
	reg [15:0] G4AD_P,G4AD_N;
	reg [15:0] G5AD_P,G5AD_N;
	reg [15:0] G6AD_P,G6AD_N;
	reg RST;
	reg L1A;

	wire G2ADCLK0P,G2ADCLK0N;
	wire G2LCLK0P,G2LCLK0N;
	wire G3ADCLK0P,G3ADCLK0N;
	wire G3LCLK0P,G3LCLK0N;
	wire G4ADCLK0P,G4ADCLK0N;
	wire G4LCLK0P,G4LCLK0N;
	wire G5ADCLK0P,G5ADCLK0N;
	wire G5LCLK0P,G5LCLK0N;
	wire G6ADCLK0P,G6ADCLK0N;
	wire G6LCLK0P,G6LCLK0N;

	// Instantiate the Unit Under Test (UUT)
	Pipeline_sim_top uut (
		.CMS_CLK_P(CMS_CLK_P),.CMS_CLK_N(CMS_CLK_N), 
		.CMS80_P(CMS80_P),.CMS80_N(CMS80_N), 
		.QPLL_CLK_AC_P(QPLL_CLK_AC_P),.QPLL_CLK_AC_N(QPLL_CLK_AC_N), 
		.XO_CLK_AC_P(XO_CLK_AC_P),.XO_CLK_AC_N(XO_CLK_AC_N), 
		.ALTXO_CLK_AC_P(ALTXO_CLK_AC_P),.ALTXO_CLK_AC_N(ALTXO_CLK_AC_N), 
		.TMB_CLK_P(TMB_CLK_P),.TMB_CLK_N(TMB_CLK_N), 
		.G1ADCLK0P(G1ADCLK0P),.G1ADCLK0N(G1ADCLK0N), 
		.G1ADCLK1P(G1ADCLK1P),.G1ADCLK1N(G1ADCLK1N), 
		.G2ADCLK0P(G2ADCLK0P),.G2ADCLK0N(G2ADCLK0N), 
		.G2ADCLK1P(G2ADCLK1P),.G2ADCLK1N(G2ADCLK1N), 
		.G3ADCLK0P(G3ADCLK0P),.G3ADCLK0N(G3ADCLK0N), 
		.G3ADCLK1P(G3ADCLK1P),.G3ADCLK1N(G3ADCLK1N), 
		.G4ADCLK0P(G4ADCLK0P),.G4ADCLK0N(G4ADCLK0N), 
		.G4ADCLK1P(G4ADCLK1P),.G4ADCLK1N(G4ADCLK1N), 
		.G5ADCLK0P(G5ADCLK0P),.G5ADCLK0N(G5ADCLK0N), 
		.G5ADCLK1P(G5ADCLK1P),.G5ADCLK1N(G5ADCLK1N), 
		.G6ADCLK0P(G6ADCLK0P),.G6ADCLK0N(G6ADCLK0N), 
		.G6ADCLK1P(G6ADCLK1P),.G6ADCLK1N(G6ADCLK1N), 
		.G1LCLK0P(G1LCLK0P),.G1LCLK0N(G1LCLK0N), 
		.G1LCLK1P(G1LCLK1P),.G1LCLK1N(G1LCLK1N), 
		.G2LCLK0P(G2LCLK0P),.G2LCLK0N(G2LCLK0N), 
		.G2LCLK1P(G2LCLK1P),.G2LCLK1N(G2LCLK1N), 
		.G3LCLK0P(G3LCLK0P),.G3LCLK0N(G3LCLK0N), 
		.G3LCLK1P(G3LCLK1P),.G3LCLK1N(G3LCLK1N), 
		.G4LCLK0P(G4LCLK0P),.G4LCLK0N(G4LCLK0N), 
		.G4LCLK1P(G4LCLK1P),.G4LCLK1N(G4LCLK1N), 
		.G5LCLK0P(G5LCLK0P),.G5LCLK0N(G5LCLK0N), 
		.G5LCLK1P(G5LCLK1P),.G5LCLK1N(G5LCLK1N), 
		.G6LCLK0P(G6LCLK0P),.G6LCLK0N(G6LCLK0N), 
		.G6LCLK1P(G6LCLK1P),.G6LCLK1N(G6LCLK1N), 
		.G1AD_P(G1AD_P),.G1AD_N(G1AD_N), 
		.G2AD_P(G2AD_P),.G2AD_N(G2AD_N), 
		.G3AD_P(G3AD_P),.G3AD_N(G3AD_N), 
		.G4AD_P(G4AD_P),.G4AD_N(G4AD_N), 
		.G5AD_P(G5AD_P),.G5AD_N(G5AD_N), 
		.G6AD_P(G6AD_P),.G6AD_N(G6AD_N), 
		.RST(RST),
		.L1A(L1A)
	);

   parameter PERIOD = 24;  // CMS clock period (40MHz)
   parameter GbE_PERIOD = 8;  // 125 MHz oscillator for GbE
	parameter JPERIOD = 100;
	parameter ir_width = 10;
	parameter max_width = 300;
	integer i,j1,j2,j3,j4,j5,j6,ch1,ch2,ch3,ch4,ch5,ch6;

	reg[11:0] g1adcdata[127:0];
	reg[11:0] g2adcdata[127:0];
	reg[11:0] g3adcdata[127:0];
	reg[11:0] g4adcdata[127:0];
	reg[11:0] g5adcdata[127:0];
	reg[11:0] g6adcdata[127:0];
	
	initial begin
	   $readmemh ("G1ADC_data_stream", g1adcdata, 0, 127);
	   $readmemh ("G2ADC_data_stream", g2adcdata, 0, 127);
	   $readmemh ("G3ADC_data_stream", g3adcdata, 0, 127);
	   $readmemh ("G4ADC_data_stream", g4adcdata, 0, 127);
	   $readmemh ("G5ADC_data_stream", g5adcdata, 0, 127);
	   $readmemh ("G6ADC_data_stream", g6adcdata, 0, 127);
	end
	
	reg TMS,TDI,TCK;
	reg [7:0] jrst;
	reg [3:0] sir_hdr;
	reg [3:0] sdr_hdr;
	reg [2:0] trl;
	reg [ir_width-1:0] usr1;
	reg [ir_width-1:0] usr2;
	reg [ir_width-1:0] usr3;
	reg [ir_width-1:0] usr4;
    reg             gsr_r;
    reg             gts_r;
	
    //Simultate the global reset that occurs after configuration at the beginning
    //of the simulation. 
    assign glbl.GSR = gsr_r;
    assign glbl.GTS = gts_r;

    initial
        begin
            gts_r = 1'b0;        
            gsr_r = 1'b1;
            #(16*GbE_PERIOD);
            gsr_r = 1'b0;
    end
	initial begin  // CMS clock from QPLL 40 MHz
		CMS_CLK_P = 1;  // start high
		CMS_CLK_N = 0;
      forever begin
         #(PERIOD/2) begin
				CMS_CLK_P = ~CMS_CLK_P;  //Toggle
				CMS_CLK_N = ~CMS_CLK_N;
			end
		end
	end
	initial begin  //  80 MHz clock from QPLL
		CMS80_P = 1;  // start high
		CMS80_N = 0;
      forever begin
         #(PERIOD/4) begin
				CMS80_P = ~CMS80_P;  //Toggle
				CMS80_N = ~CMS80_N;
			end
		end
	end
	initial begin  //  160 MHz clock from QPLL
		QPLL_CLK_AC_P = 1;  // start high
		QPLL_CLK_AC_N = 0;
      forever begin
         #(PERIOD/8) begin
				QPLL_CLK_AC_P = ~QPLL_CLK_AC_P;  //Toggle
				QPLL_CLK_AC_N = ~QPLL_CLK_AC_N;
			end
		end
	end
	initial begin  //  125 MHz clock from crystal oscillator for GbE
		XO_CLK_AC_P = 1;  // start high
		XO_CLK_AC_N = 0;
      forever begin
         #(GbE_PERIOD/2) begin
				XO_CLK_AC_P = ~XO_CLK_AC_P;  //Toggle
				XO_CLK_AC_N = ~XO_CLK_AC_N;
			end
		end
	end
	initial begin  // Differential 200MHz reference clock for IODELAYs
      forever begin
         begin
				ALTXO_CLK_AC_P = 1'b1;  // start high
				ALTXO_CLK_AC_N = 1'b0;
			end
         #(2) begin
				ALTXO_CLK_AC_P = ~ALTXO_CLK_AC_P;  //Toggle
				ALTXO_CLK_AC_N = ~ALTXO_CLK_AC_N;
			end
			#(3);
		end
	end
	initial begin  // TMB CMS clock from TMB connector
   	TMB_CLK_P = 1;  // start high
		TMB_CLK_N = 0;
      forever begin
         #(PERIOD/2) begin
				TMB_CLK_P = ~TMB_CLK_P;  //Toggle
				TMB_CLK_N = ~TMB_CLK_N;
			end
		end
	end
	initial begin  // Differential Frame clock
		G1ADCLK0P = 1;  // start high
		G1ADCLK0N = 0;
      forever
         #(PERIOD) begin  // 50 ns sampling clock (20 MHz)
			   G1ADCLK0P = ~G1ADCLK0P;
			   G1ADCLK0N = ~G1ADCLK0N;
			end
	end
	initial begin  // Differential Bit clock (6X sampling frequency)
      G1LCLK0P = 1'b0; // start low
      G1LCLK0N = 1'b1;
		#(PERIOD/12);     //Offset bit clock 1/2 a cycle
      G1LCLK0P = 1'b1; // go high
      G1LCLK0N = 1'b0;
      forever
         #(PERIOD/6) begin
			   G1LCLK0P = ~G1LCLK0P;
			   G1LCLK0N = ~G1LCLK0N;
		   end
	end
	
	assign G1ADCLK1P = G1ADCLK0P;
	assign G1ADCLK1N = G1ADCLK0N;
	assign G2ADCLK0P = G1ADCLK0P;
	assign G2ADCLK0N = G1ADCLK0N;
	assign G2ADCLK1P = G1ADCLK0P;
	assign G2ADCLK1N = G1ADCLK0N;
	assign G3ADCLK0P = G1ADCLK0P;
	assign G3ADCLK0N = G1ADCLK0N;
	assign G3ADCLK1P = G1ADCLK0P;
	assign G3ADCLK1N = G1ADCLK0N;
	assign G4ADCLK0P = G1ADCLK0P;
	assign G4ADCLK0N = G1ADCLK0N;
	assign G4ADCLK1P = G1ADCLK0P;
	assign G4ADCLK1N = G1ADCLK0N;
	assign G5ADCLK0P = G1ADCLK0P;
	assign G5ADCLK0N = G1ADCLK0N;
	assign G5ADCLK1P = G1ADCLK0P;
	assign G5ADCLK1N = G1ADCLK0N;
	assign G6ADCLK0P = G1ADCLK0P;
	assign G6ADCLK0N = G1ADCLK0N;
	assign G6ADCLK1P = G1ADCLK0P;
	assign G6ADCLK1N = G1ADCLK0N;

	assign G1LCLK1P = G1LCLK0P;
	assign G1LCLK1N = G1LCLK0N;
	assign G2LCLK0P = G1LCLK0P;
	assign G2LCLK0N = G1LCLK0N;
	assign G2LCLK1P = G1LCLK0P;
	assign G2LCLK1N = G1LCLK0N;
	assign G3LCLK0P = G1LCLK0P;
	assign G3LCLK0N = G1LCLK0N;
	assign G3LCLK1P = G1LCLK0P;
	assign G3LCLK1N = G1LCLK0N;
	assign G4LCLK0P = G1LCLK0P;
	assign G4LCLK0N = G1LCLK0N;
	assign G4LCLK1P = G1LCLK0P;
	assign G4LCLK1N = G1LCLK0N;
	assign G5LCLK0P = G1LCLK0P;
	assign G5LCLK0N = G1LCLK0N;
	assign G5LCLK1P = G1LCLK0P;
	assign G5LCLK1N = G1LCLK0N;
	assign G6LCLK0P = G1LCLK0P;
	assign G6LCLK0N = G1LCLK0N;
	assign G6LCLK1P = G1LCLK0P;
	assign G6LCLK1N = G1LCLK0N;

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[2*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[2*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[3*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[3*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[4*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[4*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[5*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[5*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[6*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[6*16+ch1][j1];
				end
				#(PERIOD/6);
			end
			for(j1=0; j1<12; j1=j1+1) begin
			   for(ch1=0; ch1<16; ch1=ch1+1) begin
					G1AD_P[ch1] = g1adcdata[7*16+ch1][j1];
					G1AD_N[ch1] = ~g1adcdata[7*16+ch1][j1];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[2*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[2*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[3*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[3*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[4*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[4*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[5*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[5*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[6*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[6*16+ch2][j2];
				end
				#(PERIOD/6);
			end
			for(j2=0; j2<12; j2=j2+1) begin
			   for(ch2=0; ch2<16; ch2=ch2+1) begin
					G2AD_P[ch2] = g2adcdata[7*16+ch2][j2];
					G2AD_N[ch2] = ~g2adcdata[7*16+ch2][j2];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[2*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[2*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[3*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[3*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[4*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[4*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[5*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[5*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[6*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[6*16+ch3][j3];
				end
				#(PERIOD/6);
			end
			for(j3=0; j3<12; j3=j3+1) begin
			   for(ch3=0; ch3<16; ch3=ch3+1) begin
					G3AD_P[ch3] = g3adcdata[7*16+ch3][j3];
					G3AD_N[ch3] = ~g3adcdata[7*16+ch3][j3];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[2*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[2*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[3*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[3*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[4*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[4*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[5*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[5*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[6*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[6*16+ch4][j4];
				end
				#(PERIOD/6);
			end
			for(j4=0; j4<12; j4=j4+1) begin
			   for(ch4=0; ch4<16; ch4=ch4+1) begin
					G4AD_P[ch4] = g4adcdata[7*16+ch4][j4];
					G4AD_N[ch4] = ~g4adcdata[7*16+ch4][j4];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[2*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[2*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[3*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[3*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[4*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[4*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[5*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[5*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[6*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[6*16+ch5][j5];
				end
				#(PERIOD/6);
			end
			for(j5=0; j5<12; j5=j5+1) begin
			   for(ch5=0; ch5<16; ch5=ch5+1) begin
					G5AD_P[ch5] = g5adcdata[7*16+ch5][j5];
					G5AD_N[ch5] = ~g5adcdata[7*16+ch5][j5];
				end
				#(PERIOD/6);
			end
		end
	end

   initial begin  // data sequence; start in phase with frame clock
		forever begin
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[2*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[2*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[3*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[3*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[4*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[4*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[5*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[5*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[6*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[6*16+ch6][j6];
				end
				#(PERIOD/6);
			end
			for(j6=0; j6<12; j6=j6+1) begin
			   for(ch6=0; ch6<16; ch6=ch6+1) begin
					G6AD_P[ch6] = g6adcdata[7*16+ch6][j6];
					G6AD_N[ch6] = ~g6adcdata[7*16+ch6][j6];
				end
				#(PERIOD/6);
			end
		end
	end



	initial begin
		L1A = 0;
		RST = 1;
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
      #100; //Hold RST for an additional 4 clocks.
		RST = 0;
        
// Function  Description
// ---------------------------------------
//   0     | No Op 
//   1     | SCAM Reset (not needed in DCFEB)
//   2     | DCFEB status reg shift only
//   3     | DCFEB status reg capture and shift
//   4     | Program Comparator DAC
//   5     | Set Extra L1a Delay
//   6     | Read FIFO 1 -- ADC data (16 channels x 12 bits = 192 bits) wide X (6 chips x 8 sample)/event deep
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
		
		JTAG_reset;
		Set_Func(8'h10);           // Set Pipeline depth
		Set_User(usr2);            // User 2 for User Reg access
		Shift_Data(9,9'd68);       // shift pipe depth
		
		#(8000);                   // wait for frame clock lock
		
		Set_Func(8'h0F);           // Restart pipeline
		
		#(3980)                    // wait for pipeline to fill
		L1A = 1;                   // set L1A for one clock
      #(PERIOD)
		L1A = 0;

		#(5 * PERIOD)                    
		
		Set_Func(8'h11);           // Bit Slip Odd
		#(10 * PERIOD)                    
		Set_Func(8'h12);           // Bit Slip Even
		#(10 * PERIOD)                    
		Set_Func(8'h11);           // Bit Slip Odd
		#(10 * PERIOD)                    
		Set_Func(8'h12);           // Bit Slip Even
		#(10 * PERIOD)                    
		Set_Func(8'h11);           // Bit Slip Odd
		#(10 * PERIOD)                    
		Set_Func(8'h12);           // Bit Slip Even
		#(10 * PERIOD)                    
		Set_Func(8'h11);           // Bit Slip Odd
		#(10 * PERIOD)                    
		Set_Func(8'h12);           // Bit Slip Even
		#(10 * PERIOD)                    
		Set_Func(8'h11);           // Bit Slip Odd
		#(10 * PERIOD)                    
		Set_Func(8'h12);           // Bit Slip Even
		#(10 * PERIOD)                    
		Set_Func(8'h11);           // Bit Slip Odd
		#(10 * PERIOD)                    
		Set_Func(8'h12);           // Bit Slip Even
		#(10 * PERIOD)                    
		
		
		#(48*2*PERIOD);            // Wait for FIFO to fill (6 chips, 8 samples)
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 1 first sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 2 first sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 3 first sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 4 first sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 5 first sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 6 first sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 1 second sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 2 second sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 3 second sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 4 second sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 5 second sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 6 second sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 1 third sample
		
		#(10 * PERIOD);
		
		Set_Func(8'h06);           // read ADC sample
		Set_User(usr2);
		Shift_Data(192,192'd0);    // shift out 16 channels chip 2 third sample
		
	
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

