`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:03 06/02/2011 
// Design Name: 
// Module Name:    xfer2fifo 
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
module xfer2fifo(
    input CLK,
    input RST,
    input JTAG_MODE,
    input [6:0] SAMP_MAX,
    input RD_FIFO,
    input [191:0] DIN_16CH,
    input RDY,
    output reg [15:0] RD_ENA,
	 output WREN,
	 output reg [11:0] DMUX
    );

// signals for FIFO1 (16 channel FIFO)
	wire re;
	reg [3:0]rd_sel;
	reg [2:0] chip;
	reg [6:0] samp;
	wire inc_chip;
	wire inc_chan;
	wire inc_samp;
	wire rst_samp;

assign WREN = re;

	always @* begin
	   if(JTAG_MODE)
		   RD_ENA = {{16{RD_FIFO}}};
		else
			case (rd_sel)
				4'h0: RD_ENA = {15'h0000,re};
				4'h1: RD_ENA = {14'h0000,re,1'h0};
				4'h2: RD_ENA = {13'h0000,re,2'h0};
				4'h3: RD_ENA = {12'h000,re,3'h0};
				4'h4: RD_ENA = {11'h000,re,4'h0};
				4'h5: RD_ENA = {10'h000,re,5'h00};
				4'h6: RD_ENA = {9'h000,re,6'h00};
				4'h7: RD_ENA = {8'h00,re,7'h00};
				4'h8: RD_ENA = {7'h00,re,8'h00};
				4'h9: RD_ENA = {6'h00,re,9'h000};
				4'hA: RD_ENA = {5'h00,re,10'h000};
				4'hB: RD_ENA = {4'h0,re,11'h000};
				4'hC: RD_ENA = {3'h0,re,12'h000};
				4'hD: RD_ENA = {2'h0,re,13'h0000};
				4'hE: RD_ENA = {1'h0,re,14'h0000};
				4'hF: RD_ENA = {re,15'h0000};
				default: RD_ENA = 0;
			endcase
	end
	
	always @* begin
		case (rd_sel)
			4'h0: DMUX = DIN_16CH[11:0];
			4'h1: DMUX = DIN_16CH[23:12];
			4'h2: DMUX = DIN_16CH[35:24];
			4'h3: DMUX = DIN_16CH[47:36];
			4'h4: DMUX = DIN_16CH[59:48];
			4'h5: DMUX = DIN_16CH[71:60];
			4'h6: DMUX = DIN_16CH[83:72];
			4'h7: DMUX = DIN_16CH[95:84];
			4'h8: DMUX = DIN_16CH[107:96];
			4'h9: DMUX = DIN_16CH[119:108];
			4'hA: DMUX = DIN_16CH[131:120];
			4'hB: DMUX = DIN_16CH[143:132];
			4'hC: DMUX = DIN_16CH[155:144];
			4'hD: DMUX = DIN_16CH[167:156];
			4'hE: DMUX = DIN_16CH[179:168];
			4'hF: DMUX = DIN_16CH[191:180];
			default: DMUX = 0;
		endcase
	end
	
	always @(posedge CLK or posedge RST) begin
	   if(RST)
			chip <= 3'h0;
		else
			if(chip == 3'h5)
				chip <= 3'h0;
			else if(inc_chip)
			   chip <= chip +1;
			else
			   chip <= chip;
	end

	always @(posedge CLK or posedge RST) begin
	   if(RST)
			rd_sel <= 4'h0;
		else
			if(inc_chan)
			   rd_sel <= rd_sel +1;
			else
			   rd_sel <= rd_sel;
	end

	always @(posedge CLK or posedge RST) begin
	   if(RST)
			samp <= 7'h00;
		else
			if(inc_samp)
			   samp <= samp +1;
			else if(rst_samp)
			   samp <= 7'h00;
			else
			   samp <= samp;
	end
	

Readout_FIFO_FSM 
Readout_FIFO_FSM1(
  .INC_CHAN(inc_chan),
  .INC_CHIP(inc_chip),
  .INC_SAMP(inc_samp),
  .RDENA(re),
  .RST_SAMP(rst_samp),
  .CLK(CLK),
  .JTAG_MODE(JTAG_MODE),
  .RDY(RDY),
  .RST(RST),
  .CHIP(chip),
  .CHAN(rd_sel),
  .SAMP(samp),
  .SAMP_MAX(SAMP_MAX)
);

endmodule
