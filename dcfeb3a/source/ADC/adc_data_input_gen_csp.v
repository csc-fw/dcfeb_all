//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:55 03/09/2011 
// Design Name: 
// Module Name:    adc_data_input 
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

module adc_data_input_gen_csp #(
	parameter USE_CHIPSCOPE = 1,
	parameter TMR = 0
	)(
    inout [35:0] CSP_G1LA0_CNTRL,
    inout [35:0] CSP_G1VIO0_CNTRL,
	 output CSP_DSR_SYS_RST,
	 output CSP_RESYNC,
	 output bit_slip_odd_out,
	 output bit_slip_evn_out,
	 output ALG_GD,
	 input ADC_INIT,
	 input ADC_INIT_DONE,
	 
    // Differential Serial Data Inputs
    input [15:0] G1AD_N,
    input [15:0] G1AD_P,
    input [15:0] G2AD_N,
    input [15:0] G2AD_P,
    input [15:0] G3AD_N,
    input [15:0] G3AD_P,
    input [15:0] G4AD_N,
    input [15:0] G4AD_P,
    input [15:0] G5AD_N,
    input [15:0] G5AD_P,
    input [15:0] G6AD_N,
    input [15:0] G6AD_P,
    // Differential Frame Clock Inputs
    input G1ADCLK0N,
    input G1ADCLK0P,
    input G1ADCLK1N,
    input G1ADCLK1P,
    input G2ADCLK0N,
    input G2ADCLK0P,
    input G2ADCLK1N,
    input G2ADCLK1P,
    input G3ADCLK0N,
    input G3ADCLK0P,
    input G3ADCLK1N,
    input G3ADCLK1P,
    input G4ADCLK0N,
    input G4ADCLK0P,
    input G4ADCLK1N,
    input G4ADCLK1P,
    input G5ADCLK0N,
    input G5ADCLK0P,
    input G5ADCLK1N,
    input G5ADCLK1P,
    input G6ADCLK0N,
    input G6ADCLK0P,
    input G6ADCLK1N,
    input G6ADCLK1P,
    // Differential Bit Clock Inputs
    input G1LCLK0N,
    input G1LCLK0P,
    input G1LCLK1N,
    input G1LCLK1P,
    input G2LCLK0N,
    input G2LCLK0P,
    input G2LCLK1N,
    input G2LCLK1P,
    input G3LCLK0N,
    input G3LCLK0P,
    input G3LCLK1N,
    input G3LCLK1P,
    input G4LCLK0N,
    input G4LCLK0P,
    input G4LCLK1N,
    input G4LCLK1P,
    input G5LCLK0N,
    input G5LCLK0P,
    input G5LCLK1N,
    input G5LCLK1P,
    input G6LCLK0N,
    input G6LCLK0P,
    input G6LCLK1N,
    input G6LCLK1P,
	 // Clocks and Resets
	 input RST,
	 input SYS_RST,
	 input DSR_RESYNC,

	 output [11:0] FRM_CLKS,   // packed Frame Clocks 
	 //
	 output [11:0] RESTARTPS,		// packed restart signals for pipelines
	 output DSR_ALIGNED,
    // Deserialized outputs - 8 channels of 12 bits flattend into single vectors (channel 7 in high order bits, 0 in low)
    output [95:0] G1DAQ8CH_0,
    output [95:0] G1DAQ8CH_1,
    output [95:0] G2DAQ8CH_0,
    output [95:0] G2DAQ8CH_1,
    output [95:0] G3DAQ8CH_0,
    output [95:0] G3DAQ8CH_1,
    output [95:0] G4DAQ8CH_0,
    output [95:0] G4DAQ8CH_1,
    output [95:0] G5DAQ8CH_0,
    output [95:0] G5DAQ8CH_1,
    output [95:0] G6DAQ8CH_0,
    output [95:0] G6DAQ8CH_1,
	 //
	 input RESYNC,
	input resync_d1,
	input lead_edg_resync,
	input lead_edg_resync_d1,
	input cap_phase,
	input [7:0] rst_mmcm_pipe
    );

	wire frm_clk[6:1][1:0];
	wire restartp[6:1][1:0];
   wire [95:0] daq8ch[6:1][1:0];

  wire [7:0] ad[6:1][1:0];
  wire [7:0] ad_b[6:1][1:0];
  
  wire adclk[6:1][1:0];
  wire lclk[6:1][1:0],bitclk[6:1][1:0];
  
  wire [11:0] dout[6:1][1:0][7:0];
  
  wire [5:0] qodd[6:1][1:0][7:0];
  
  wire [5:0] qevn[6:1][1:0][7:0];
  
  wire sd_rst[6:1][1:0];
   
  wire bit_slip_odd[6:1][1:0], bit_slip_evn[6:1][1:0];
  
  wire dsr_algnd[6:1][1:0];


  
  wire csp_dsr_rst;
  wire csp_even;
  wire csp_odd;
  wire csp_var5;
  wire csp_var6;
  wire csp_var7;
  
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G1AD0[7:0] (.O(ad[1][0]),.OB(ad_b[1][0]),.I(G1AD_P[7:0]),.IB(G1AD_N[7:0]));
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G1AD1[15:8] (.O(ad[1][1]),.OB(ad_b[1][1]),.I(G1AD_P[15:8]),.IB(G1AD_N[15:8]));
  
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G2AD0[7:0] (.O(ad[2][0]),.OB(ad_b[2][0]),.I(G2AD_P[7:0]),.IB(G2AD_N[7:0]));
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G2AD1[15:8] (.O(ad[2][1]),.OB(ad_b[2][1]),.I(G2AD_P[15:8]),.IB(G2AD_N[15:8]));
  
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G3AD0[7:0] (.O(ad[3][0]),.OB(ad_b[3][0]),.I(G3AD_P[7:0]),.IB(G3AD_N[7:0]));
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G3AD1[15:8] (.O(ad[3][1]),.OB(ad_b[3][1]),.I(G3AD_P[15:8]),.IB(G3AD_N[15:8]));
  
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G4AD0[7:0] (.O(ad[4][0]),.OB(ad_b[4][0]),.I(G4AD_P[7:0]),.IB(G4AD_N[7:0]));
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G4AD1[15:8] (.O(ad[4][1]),.OB(ad_b[4][1]),.I(G4AD_P[15:8]),.IB(G4AD_N[15:8]));
  
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G5AD0[7:0] (.O(ad[5][0]),.OB(ad_b[5][0]),.I(G5AD_P[7:0]),.IB(G5AD_N[7:0]));
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G5AD1[15:8] (.O(ad[5][1]),.OB(ad_b[5][1]),.I(G5AD_P[15:8]),.IB(G5AD_N[15:8]));
  
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G6AD0[7:0] (.O(ad[6][0]),.OB(ad_b[6][0]),.I(G6AD_P[7:0]),.IB(G6AD_N[7:0]));
   IBUFDS_DIFF_OUT #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("TRUE"),.IOSTANDARD("DEFAULT"))
	IBUFDS_DIFF_OUT_G6AD1[15:8] (.O(ad[6][1]),.OB(ad_b[6][1]),.I(G6AD_P[15:8]),.IB(G6AD_N[15:8]));

  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G1ADCLK0 (.O(adclk[1][0]),.I(G1ADCLK0P),.IB(G1ADCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G1ADCLK1 (.O(adclk[1][1]),.I(G1ADCLK1P),.IB(G1ADCLK1N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G1LCLK0 (.O(lclk[1][0]),.I(G1LCLK0P),.IB(G1LCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G1LCLK1 (.O(lclk[1][1]),.I(G1LCLK1P),.IB(G1LCLK1N));

  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G2ADCLK0 (.O(adclk[2][0]),.I(G2ADCLK0P),.IB(G2ADCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G2ADCLK1 (.O(adclk[2][1]),.I(G2ADCLK1P),.IB(G2ADCLK1N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G2LCLK0 (.O(lclk[2][0]),.I(G2LCLK0P),.IB(G2LCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G2LCLK1 (.O(lclk[2][1]),.I(G2LCLK1P),.IB(G2LCLK1N));

  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G3ADCLK0 (.O(adclk[3][0]),.I(G3ADCLK0P),.IB(G3ADCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G3ADCLK1 (.O(adclk[3][1]),.I(G3ADCLK1P),.IB(G3ADCLK1N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G3LCLK0 (.O(lclk[3][0]),.I(G3LCLK0P),.IB(G3LCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G3LCLK1 (.O(lclk[3][1]),.I(G3LCLK1P),.IB(G3LCLK1N));

  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G4ADCLK0 (.O(adclk[4][0]),.I(G4ADCLK0P),.IB(G4ADCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G4ADCLK1 (.O(adclk[4][1]),.I(G4ADCLK1P),.IB(G4ADCLK1N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G4LCLK0 (.O(lclk[4][0]),.I(G4LCLK0P),.IB(G4LCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G4LCLK1 (.O(lclk[4][1]),.I(G4LCLK1P),.IB(G4LCLK1N));

  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G5ADCLK0 (.O(adclk[5][0]),.I(G5ADCLK0P),.IB(G5ADCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G5ADCLK1 (.O(adclk[5][1]),.I(G5ADCLK1P),.IB(G5ADCLK1N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G5LCLK0 (.O(lclk[5][0]),.I(G5LCLK0P),.IB(G5LCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G5LCLK1 (.O(lclk[5][1]),.I(G5LCLK1P),.IB(G5LCLK1N));

  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G6ADCLK0 (.O(adclk[6][0]),.I(G6ADCLK0P),.IB(G6ADCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G6ADCLK1 (.O(adclk[6][1]),.I(G6ADCLK1P),.IB(G6ADCLK1N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G6LCLK0 (.O(lclk[6][0]),.I(G6LCLK0P),.IB(G6LCLK0N));
  IBUFGDS #(.DIFF_TERM("TRUE"),.IOSTANDARD("DEFAULT")) IBUFGDS_G6LCLK1 (.O(lclk[6][1]),.I(G6LCLK1P),.IB(G6LCLK1N));

generate
if(USE_CHIPSCOPE==1) 
begin : chipscope_deserializer
//
// Logic analyzer for deserializer
wire [95:0] deser_g1la0_data;
wire [8:0] deser_g1la0_trig;

deser_la g1la0_deser (
    .CONTROL(CSP_G1LA0_CNTRL),
    .CLK(frm_clk[1][1]),
    .DATA(deser_g1la0_data),  // IN BUS [95:0]
    .TRIG0(deser_g1la0_trig)  // IN BUS [8:0]
);

// LA Data [95:0]
	assign deser_g1la0_data[11:0]    = dout[1][1][0];
	assign deser_g1la0_data[23:12]   = dout[1][1][1];
	assign deser_g1la0_data[29:24]   = qodd[1][1][0];
	assign deser_g1la0_data[35:30]   = qevn[1][1][0];
	assign deser_g1la0_data[41:36]   = qodd[1][1][1];
	assign deser_g1la0_data[47:42]   = qevn[1][1][1];
//	assign deser_g1la0_data[51:48]   = g1_dsr_state_1;
	assign deser_g1la0_data[51:48]   = 4'h0;
//	assign deser_g1la0_data[54:52]   = g1wcnt1;
	assign deser_g1la0_data[54:52]   = 3'b000;
//	assign deser_g1la0_data[58:55]   = g1slip_cnt1;
	assign deser_g1la0_data[58:55]   = 4'h0;
	assign deser_g1la0_data[59]      = bit_slip_odd[1][1];
	assign deser_g1la0_data[60]      = bit_slip_evn[1][1];
	assign deser_g1la0_data[61]      = sd_rst[1][1];
//	assign deser_g1la0_data[62]      = g1winc1;
//	assign deser_g1la0_data[63]      = g1wrst1;
	assign deser_g1la0_data[62]      = 1'b0;
	assign deser_g1la0_data[63]      = 1'b0;
//	assign deser_g1la0_data[64]      = dsr_algnd[1][1];
	assign deser_g1la0_data[64]      = 1'b0;
	assign deser_g1la0_data[65]      = ADC_INIT;
	assign deser_g1la0_data[66]      = ADC_INIT_DONE;
	assign deser_g1la0_data[67]      = RST;
	assign deser_g1la0_data[68]      = CSP_DSR_SYS_RST;
	assign deser_g1la0_data[69]      = DSR_RESYNC;
	assign deser_g1la0_data[70]      = dsr_rst;
	assign deser_g1la0_data[71]      = RESYNC;
	assign deser_g1la0_data[79:72]   = rst_mmcm_pipe;
	assign deser_g1la0_data[80]      = CSP_RESYNC;
	assign deser_g1la0_data[81]      = SYS_RST;
	assign deser_g1la0_data[82]      = resync_d1;
	assign deser_g1la0_data[83]      = lead_edg_resync;
	assign deser_g1la0_data[84]      = lead_edg_resync_d1;
	assign deser_g1la0_data[85]      = cap_phase;
	assign deser_g1la0_data[86]      = ALG_GD;
	assign deser_g1la0_data[87]      = csp_even;
	assign deser_g1la0_data[88]      = csp_odd;
	assign deser_g1la0_data[89]      = 1'b0;
	assign deser_g1la0_data[90]      = 1'b0;
	assign deser_g1la0_data[91]      = 1'b0;
	assign deser_g1la0_data[92]      = 1'b0;
	assign deser_g1la0_data[93]      = 1'b0;
	assign deser_g1la0_data[94]      = 1'b0;
	assign deser_g1la0_data[95]      = 1'b0;

// LA Trigger [8:0]
	assign deser_g1la0_trig[0]       = RST;
	assign deser_g1la0_trig[1]       = csp_dsr_rst;
	assign deser_g1la0_trig[2]       = CSP_DSR_SYS_RST;
	assign deser_g1la0_trig[3]       = DSR_RESYNC;
	assign deser_g1la0_trig[4]       = RESYNC;
	assign deser_g1la0_trig[5]       = CSP_RESYNC;
	assign deser_g1la0_trig[6]       = dsr_rst;
	assign deser_g1la0_trig[7]       = SYS_RST;
	assign deser_g1la0_trig[8]       = ALG_GD;

// Virtual I/O for deserializer
wire [47:0] deser_g1vio0_sync_in;
wire [7:0] deser_g1vio0_sync_out;
	
deser_vio g1vio0_deser (
    .CONTROL(CSP_G1VIO0_CNTRL), // INOUT BUS [35:0]
    .CLK(frm_clk[1][1]),
    .SYNC_IN(deser_g1vio0_sync_in), // IN BUS [47:0]
    .SYNC_OUT(deser_g1vio0_sync_out) // OUT BUS [7:0]
);

// VIO Sync In Data [47:0]
	assign deser_g1vio0_sync_in[11:0]       = dout[1][1][0];
	assign deser_g1vio0_sync_in[23:12]      = dout[1][1][1];
	assign deser_g1vio0_sync_in[29:24]      = qodd[1][1][0];
	assign deser_g1vio0_sync_in[35:30]      = qevn[1][1][0];
	assign deser_g1vio0_sync_in[41:36]      = qodd[1][1][1];
	assign deser_g1vio0_sync_in[47:42]      = qevn[1][1][1];

// VIO Sync Out Data [7:0]
	assign csp_dsr_rst = deser_g1vio0_sync_out[0];
	assign CSP_DSR_SYS_RST = deser_g1vio0_sync_out[1];
	assign CSP_RESYNC = deser_g1vio0_sync_out[2];
	assign csp_even   = deser_g1vio0_sync_out[3];
	assign csp_odd    = deser_g1vio0_sync_out[4];
	assign csp_var5   = deser_g1vio0_sync_out[5];
	assign csp_var6   = deser_g1vio0_sync_out[6];
	assign csp_var7   = deser_g1vio0_sync_out[7];
	
end

else
begin
	assign csp_dsr_rst = 1'b0;
	assign CSP_DSR_SYS_RST = 1'b0;
	assign CSP_RESYNC = 1'b0;
	assign csp_even = 1'b0;
	assign csp_odd = 1'b0;
	assign csp_var5 = 1'b0;
	assign csp_var6 = 1'b0;
	assign csp_var7 = 1'b0;
end
endgenerate

assign FRM_CLKS = {frm_clk[6][1],frm_clk[6][0],frm_clk[5][1],frm_clk[5][0],frm_clk[4][1],frm_clk[4][0],frm_clk[3][1],frm_clk[3][0],frm_clk[2][1],frm_clk[2][0],frm_clk[1][1],frm_clk[1][0]};
assign RESTARTPS = {restartp[6][1],restartp[6][0],restartp[5][1],restartp[5][0],restartp[4][1],restartp[4][0],restartp[3][1],restartp[3][0],restartp[2][1],restartp[2][0],restartp[1][1],restartp[1][0]};
assign G1DAQ8CH_0 = daq8ch[1][0];
assign G1DAQ8CH_1 = daq8ch[1][1];
assign G2DAQ8CH_0 = daq8ch[2][0];
assign G2DAQ8CH_1 = daq8ch[2][1];
assign G3DAQ8CH_0 = daq8ch[3][0];
assign G3DAQ8CH_1 = daq8ch[3][1];
assign G4DAQ8CH_0 = daq8ch[4][0];
assign G4DAQ8CH_1 = daq8ch[4][1];
assign G5DAQ8CH_0 = daq8ch[5][0];
assign G5DAQ8CH_1 = daq8ch[5][1];
assign G6DAQ8CH_0 = daq8ch[6][0];
assign G6DAQ8CH_1 = daq8ch[6][1];


assign bit_slip_odd_out = bit_slip_odd[1][1];
assign bit_slip_evn_out = bit_slip_evn[1][1];
assign DSR_ALIGNED = dsr_algnd[1][0] & dsr_algnd[1][1] & dsr_algnd[2][0] & dsr_algnd[2][1] & dsr_algnd[3][0] & dsr_algnd[3][1] & dsr_algnd[4][0] & dsr_algnd[4][1] & dsr_algnd[5][0] & dsr_algnd[5][1] & dsr_algnd[6][0] & dsr_algnd[6][1];
assign dsr_rst = csp_dsr_rst || RST || DSR_RESYNC;
assign ALG_GD = (dout[1][1][0] == 12'h463);

genvar G,S,ch;
  
generate
	for (G=1; G<=6; G=G+1) begin : grp
		for (S=0; S<2; S=S+1) begin : seg
			BUFR #(.BUFR_DIVIDE("BYPASS"),.SIM_DEVICE("VIRTEX6")) BUFR_FRM (.O(frm_clk[G][S]),.CE(1'b1),.CLR(1'b0),.I(adclk[G][S]));
			BUFIO BUFIO_BITP (.O(bitclk[G][S]),.I(lclk[G][S]));
			
			assign daq8ch[G][S] = { dout[G][S][7],dout[G][S][6],dout[G][S][5],dout[G][S][4],
											dout[G][S][3],dout[G][S][2],dout[G][S][1],dout[G][S][0]};

			for (ch=0; ch<8; ch=ch+1) begin : chan
				deserializer serdes(.BIT_CLK_ODD(~bitclk[G][S]),.BIT_CLK_EVEN(bitclk[G][S]),.FRAME_CLK(frm_clk[G][S]),.RST(sd_rst[G][S]),
											.D(ad[G][S][ch]),.DDLY(1'b0),.DB(ad_b[G][S][ch]),.DBDLY(1'b1),.BIT_SLIP_ODD(bit_slip_odd[G][S]),.BIT_SLIP_EVN(bit_slip_evn[G][S]),
											.Q(dout[G][S][ch]),.QODD(qodd[G][S][ch]),.QEVN(qevn[G][S][ch]));
			end
		end
	end
endgenerate

// State machines for alignment; separate one for each ADC
generate
if(TMR==1) 
begin : DSR_align_FSMs_TMR
	for (G=1; G<=6; G=G+1) begin : grp
		for (S=0; S<2; S=S+1) begin : seg
			DSR_align_FSM_TMR 	DSR_align_FSM_i(.ALIGNED(dsr_algnd[G][S]),.BIT_SLIP_EVN(bit_slip_evn[G][S]),.BIT_SLIP_ODD(bit_slip_odd[G][S]),.DSR_RST(sd_rst[G][S]),.STRT_PIPE(restartp[G][S]),.CLK(frm_clk[G][S]),.RST(dsr_rst));
		end
	end
end
else 
begin : DSR_align_FSMs
	for (G=1; G<=6; G=G+1) begin : grp
		for (S=0; S<2; S=S+1) begin : seg
			DSR_align_FSM 	DSR_align_FSM_i(.ALIGNED(dsr_algnd[G][S]),.BIT_SLIP_EVN(bit_slip_evn[G][S]),.BIT_SLIP_ODD(bit_slip_odd[G][S]),.DSR_RST(sd_rst[G][S]),.STRT_PIPE(restartp[G][S]),.CLK(frm_clk[G][S]),.RST(dsr_rst));
		end
	end
end
endgenerate

	
endmodule
