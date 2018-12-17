`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:37 08/26/2011 
// Design Name: 
// Module Name:    daq_op_sim_top 
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
module daq_op_sim_top(
    input SYS_RST,
    input CMS_CLK,
    input DAQ_TX_125_REFCLK,
    input DAQ_TX_125_REFCLK_DV2,
    input TRG_TX_160_REFCLK,
	 input L1A,
	 input L1A_MATCH,
	 input L1A_PHASE,
	 input RESYNC,
	 input REFILL,
	 input JDAQ_RATE
    );


wire [35:0] rd_fifo2_la_c5;
wire [35:0] DAQ_tx_vio_c3;
wire [35:0] DAQ_tx_la_c4;

 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Readout FIFO2 to feed MAC for GbE optical path.                        //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////
	
	wire daq_data_clk;
	wire [15:0] txd;
	wire txd_vld;
	wire txack;
	reg [11:0] rdf_wdata;
	reg rdf_wren;
	reg [5:0] rst_ext;
	wire rdf_rst;
	wire [6:0] nsamp = 7'd8;
   wire [6:0] samp_max;
	
	assign samp_max = nsamp-1;
	assign rdf_rst = rst_ext[5] || REFILL;
	
	always @(posedge TRG_TX_160_REFCLK or posedge SYS_RST)
	begin
		if(SYS_RST)
			rst_ext <= 6'b111111;
		else
			rst_ext <= {rst_ext[4:0],SYS_RST};
	end

// Fill FIFO with incrementing numbers
	always @(posedge TRG_TX_160_REFCLK or posedge rdf_rst)
	begin
		if(rdf_rst)
			rdf_wdata <= 12'h000;
		else
			if(rdf_wdata < 12'd768)
				rdf_wdata <= rdf_wdata+1;
			else
				rdf_wdata <= rdf_wdata;
	end
	always @* begin
		if(rdf_rst)
			rdf_wren = 0;
		else
			if(rdf_wdata >= 12'd768)
				rdf_wren = 0;
			else
				rdf_wren =1;
	end


 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  Readout FIFO2 to feed MAC for GbE optical path.                        //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////


mac_fifo #(
	.USE_CHIPSCOPE(0)
	)
rd_fifo2(
	.CSP_CNTRL(rd_fifo2_la_c5),
   .WCLK(TRG_TX_160_REFCLK),
   .RCLK(daq_data_clk),
   .CMSCLK(CMS_CLK),
   .RST(SYS_RST),
	.SAMP_MAX(samp_max),
   .WDATA(rdf_wdata),
	.WREN(rdf_wren),
	.L1A(L1A),
	.L1A_MATCH(L1A_MATCH),
	.L1A_PHASE(L1A_PHASE),
	.RESYNC(RESYNC),
	.TXACK(txack),                     // Data acknowledge signal from frame processor
	.TXD(txd),                         // 16-bit data for frame processor
	.TXD_VLD(txd_vld)                  // data valid signal
   );


 /////////////////////////////////////////////////////////////////////////////
 //                                                                         //
 //  DAQ Path Optical Transceiver signals and GTX signals                   //
 //                                                                         //
 /////////////////////////////////////////////////////////////////////////////

daq_optical_out #(
	.USE_CHIPSCOPE(0),
	.SIM_SPEEDUP(1)
)
daq_optical_out_i (
	.DAQ_TX_VIO_CNTRL(DAQ_tx_vio_c3),
	.DAQ_TX_LA_CNTRL(DAQ_tx_la_c4),
	.RST(SYS_RST),
	// External signals
	.DAQ_RX_N(1'b1),.DAQ_RX_P(1'b0), // high speed serial input not connected on hardware 
	.DAQ_TDIS(),                     // disable optical transmission
	.DAQ_TX_N(DAQ_TX_N),.DAQ_TX_P(DAQ_TX_P), // high speed serial output
	// Internal signals
	.DAQ_TX_125REFCLK(DAQ_TX_125_REFCLK),    // 125 MHz for 1 GbE
	.DAQ_TX_125REFCLK_DV2(DAQ_TX_125_REFCLK_DV2), // 62.5 MHz user clock for 1 GbE
	.DAQ_TX_160REFCLK(TRG_TX_160_REFCLK),    // 160 MHz for  2.56 GbE
	.L1A_MATCH(L1A_MATCH),
	.TXD(txd),                         // 16-bit data for frame processor
	.TXD_VLD(txd_vld),                   // frame data valid signal
	.JDAQ_RATE(JDAQ_RATE),
	.RATE_1_25(rate_1_25),
	.RATE_3_2(rate_3_2),
	.TX_ACK(txack),
	.DAQ_DATA_CLK(daq_data_clk)
  );



endmodule
