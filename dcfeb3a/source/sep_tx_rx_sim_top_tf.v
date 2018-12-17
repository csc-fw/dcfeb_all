`timescale 1ns / 1ps
`define DELAY #12

module sep_tx_rx_sim_top_tf;

	// Inputs
	reg SYS_RST;
	reg QPLL_CLK_AC_P;
	reg QPLL_CLK_AC_N;
   reg [7:0] g1c_lv = 0;
   reg [7:0] g2c_lv = 0;
   reg [7:0] g3c_lv = 0;
   reg [7:0] g4c_lv = 0;
   reg [7:0] g5c_lv = 0;
   reg [7:0] g6c_lv = 0;
	wire cmode;
	wire ctime;
	wire lctclk;
	wire lctrst;
	wire cdac_enb_lv_b;
	wire cdac_ck_lv;
	wire cdac_dat_lv;

	// Instantiate the Unit Under Test (UUT)
	sep_tx_rx_sim_top uut (
		.SYS_RST(SYS_RST),
		.QPLL_CLK_AC_P(QPLL_CLK_AC_P), 
		.QPLL_CLK_AC_N(QPLL_CLK_AC_N),
		.G1C_LV(g1c_lv), .G2C_LV(g2c_lv), .G3C_LV(g3c_lv), .G4C_LV(g4c_lv), .G5C_LV(g5c_lv), .G6C_LV(g6c_lv),  //Comparator data inputs
		.CMODE(cmode),
		.CTIME(ctime),
		.LCTCLK(lctclk),
		.LCTRST(lctrst),
		.CDAC_ENB_LV_B(cdac_enb_lv_b), .CDAC_CK_LV(cdac_ck_lv), .CDAC_DAT_LV(cdac_dat_lv)
	);
   parameter PERIOD = 24;  // CMS clock period (40MHz)

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
	initial begin
		// Initialize Inputs
		SYS_RST = 1;
		// Wait 100 ns for global reset to finish
		#(5*PERIOD);
//		#(625*PERIOD);
		#(3000*PERIOD);
		SYS_RST = 0;
		#(150*PERIOD);
		#(150*PERIOD);
		#(400*PERIOD);
		
	end
      
	always @(posedge lctclk or posedge lctrst) begin
		if(lctrst) begin
			g1c_lv <= 8'h10;
			g2c_lv <= 8'h20;
			g3c_lv <= 8'h30;
			g4c_lv <= 8'h40;
			g5c_lv <= 8'h50;
			g6c_lv <= 8'h60;
		end
		else begin
			g1c_lv <= `DELAY (g1c_lv & 8'hF0) | ((g1c_lv+ 1) & 8'hF );
			g2c_lv <= `DELAY (g2c_lv & 8'hF0) | ((g2c_lv+ 1) & 8'hF );
			g3c_lv <= `DELAY (g3c_lv & 8'hF0) | ((g3c_lv+ 1) & 8'hF );
			g4c_lv <= `DELAY (g4c_lv & 8'hF0) | ((g4c_lv+ 1) & 8'hF );
			g5c_lv <= `DELAY (g5c_lv & 8'hF0) | ((g5c_lv+ 1) & 8'hF );
			g6c_lv <= `DELAY (g6c_lv & 8'hF0) | ((g6c_lv+ 1) & 8'hF );
		end
	end
	
endmodule

