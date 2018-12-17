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
module xfer2ringbuf #(
	parameter USE_CHIPSCOPE = 1,
	parameter TMR = 0,
	parameter TMR_Err_Det = 0
	)(
	 inout [35:0] LA_CNTRL,
    input CLK,
    input RST,
    input JTAG_MODE,
    input J_RD_FIFO,
    input [191:0] DIN_16CH,
    input RDY,
    input [15:0] F16_MT,
	 input TRIG_IN,
	 output TRIG_OUT,
    output [15:0] RD_ENA,
	 output L1A_RD_EN,
	 output WREN,
	 output [11:0] DMUX,
	 output [15:0] XF2RB_ERRCNT
    );

// signals for FIFO1 (16 channel FIFO)
	wire re;
	wire [3:0]channel;
	wire [2:0] xstate;
	
	wire re_r_i;
	wire [3:0]channel_r_i;

	
generate
if(USE_CHIPSCOPE==1) 
begin : chipscope_xfer2ring
//
// Logic analyzer for readout FIFO
wire [121:0] xfer2ring_la_data;
wire [11:0] xfer2ring_la_trig;

xfer2ring_la xfer2ring_la_i (
    .CONTROL(LA_CNTRL),
    .CLK(CLK),
    .DATA(xfer2ring_la_data),  // IN BUS [121:0]
    .TRIG0(xfer2ring_la_trig),  // IN BUS [11:0]
    .TRIG_OUT(TRIG_OUT) // OUT
);
		

// LA Data [121:0]
	assign xfer2ring_la_data[11:0]   = DIN_16CH[11:0];    //channel 0 data
	assign xfer2ring_la_data[23:12]  = DIN_16CH[23:12];   //channel 1 data
	assign xfer2ring_la_data[35:24]  = DIN_16CH[107:96];  //channel 8 data
	assign xfer2ring_la_data[47:36]  = DIN_16CH[119:108]; //channel 9 data
	assign xfer2ring_la_data[63:48]  = F16_MT;
	assign xfer2ring_la_data[79:64]  = RD_ENA;
	assign xfer2ring_la_data[91:80]  = DMUX;
	assign xfer2ring_la_data[95:92]  = channel;
	assign xfer2ring_la_data[98:96]  = 3'b000;
	assign xfer2ring_la_data[100:99] = 2'b00;
	assign xfer2ring_la_data[103:101]= xstate;
	assign xfer2ring_la_data[104]    = RDY;
	assign xfer2ring_la_data[105]    = L1A_RD_EN;
	assign xfer2ring_la_data[106]    = WREN;
	assign xfer2ring_la_data[107]    = re;
	assign xfer2ring_la_data[108]    = 1'b0;
	assign xfer2ring_la_data[109]    = 1'b0;
	assign xfer2ring_la_data[110]    = 1'b0;
	assign xfer2ring_la_data[111]    = 1'b0;
	assign xfer2ring_la_data[112]    = 1'b0;
	assign xfer2ring_la_data[113]    = 1'b0;
	assign xfer2ring_la_data[114]    = 1'b0;
	assign xfer2ring_la_data[115]    = TRIG_IN;
	assign xfer2ring_la_data[116]    = TRIG_OUT;
	assign xfer2ring_la_data[117]    = re_r_i;
	assign xfer2ring_la_data[121:118]= channel_r_i;

// LA Trigger [11:0]
	assign xfer2ring_la_trig[2:0]    = xstate;
	assign xfer2ring_la_trig[3]      = F16_MT[0];
	assign xfer2ring_la_trig[4]      = F16_MT[1];
	assign xfer2ring_la_trig[5]      = F16_MT[8];
	assign xfer2ring_la_trig[6]      = F16_MT[9];
	assign xfer2ring_la_trig[7]      = RDY;
	assign xfer2ring_la_trig[8]      = L1A_RD_EN;
	assign xfer2ring_la_trig[9]      = re;
	assign xfer2ring_la_trig[10]     = 1'b0;
	assign xfer2ring_la_trig[11]     = TRIG_IN;
	
end
else
begin
	assign TRIG_OUT = 0;
end
endgenerate

generate
if(TMR==1) 
begin : XF2RB_logic_TMR

	(* syn_preserve = "true" *) reg wren_1;
	(* syn_preserve = "true" *) reg wren_2;
	(* syn_preserve = "true" *) reg wren_3;
	(* syn_preserve = "true" *) reg [15:0] rd_ena_1;
	(* syn_preserve = "true" *) reg [15:0] rd_ena_2;
	(* syn_preserve = "true" *) reg [15:0] rd_ena_3;
	(* syn_preserve = "true" *) reg re_r_1;
	(* syn_preserve = "true" *) reg re_r_2;
	(* syn_preserve = "true" *) reg re_r_3;
	(* syn_preserve = "true" *) reg [3:0] channel_r_1;
	(* syn_preserve = "true" *) reg [3:0] channel_r_2;
	(* syn_preserve = "true" *) reg [3:0] channel_r_3;
	(* syn_preserve = "true" *) reg [11:0] dmux_1;
	(* syn_preserve = "true" *) reg [11:0] dmux_2;
	(* syn_preserve = "true" *) reg [11:0] dmux_3;

	(* syn_keep = "true" *) wire  vt_wren_1;
	(* syn_keep = "true" *) wire  vt_wren_2;
	(* syn_keep = "true" *) wire  vt_wren_3;
	(* syn_keep = "true" *) wire  [15:0] vt_rd_ena_1;
	(* syn_keep = "true" *) wire  [15:0] vt_rd_ena_2;
	(* syn_keep = "true" *) wire  [15:0] vt_rd_ena_3;
	(* syn_keep = "true" *) wire  vt_re_r_1;
	(* syn_keep = "true" *) wire  vt_re_r_2;
	(* syn_keep = "true" *) wire  vt_re_r_3;
	(* syn_keep = "true" *) wire  [3:0] vt_channel_r_1;
	(* syn_keep = "true" *) wire  [3:0] vt_channel_r_2;
	(* syn_keep = "true" *) wire  [3:0] vt_channel_r_3;
	(* syn_keep = "true" *) wire  [11:0] vt_dmux_1;
	(* syn_keep = "true" *) wire  [11:0] vt_dmux_2;
	(* syn_keep = "true" *) wire  [11:0] vt_dmux_3;

	assign vt_wren_1      = (wren_1      & wren_2     ) | (wren_2      & wren_3     ) | (wren_1      & wren_3     ); // Majority logic
	assign vt_wren_2      = (wren_1      & wren_2     ) | (wren_2      & wren_3     ) | (wren_1      & wren_3     ); // Majority logic
	assign vt_wren_3      = (wren_1      & wren_2     ) | (wren_2      & wren_3     ) | (wren_1      & wren_3     ); // Majority logic
	assign vt_rd_ena_1    = (rd_ena_1    & rd_ena_2   ) | (rd_ena_2    & rd_ena_3   ) | (rd_ena_1    & rd_ena_3   ); // Majority logic
	assign vt_rd_ena_2    = (rd_ena_1    & rd_ena_2   ) | (rd_ena_2    & rd_ena_3   ) | (rd_ena_1    & rd_ena_3   ); // Majority logic
	assign vt_rd_ena_3    = (rd_ena_1    & rd_ena_2   ) | (rd_ena_2    & rd_ena_3   ) | (rd_ena_1    & rd_ena_3   ); // Majority logic
	assign vt_re_r_1      = (re_r_1      & re_r_2     ) | (re_r_2      & re_r_3     ) | (re_r_1      & re_r_3     ); // Majority logic
	assign vt_re_r_2      = (re_r_1      & re_r_2     ) | (re_r_2      & re_r_3     ) | (re_r_1      & re_r_3     ); // Majority logic
	assign vt_re_r_3      = (re_r_1      & re_r_2     ) | (re_r_2      & re_r_3     ) | (re_r_1      & re_r_3     ); // Majority logic
	assign vt_channel_r_1 = (channel_r_1 & channel_r_2) | (channel_r_2 & channel_r_3) | (channel_r_1 & channel_r_3); // Majority logic
	assign vt_channel_r_2 = (channel_r_1 & channel_r_2) | (channel_r_2 & channel_r_3) | (channel_r_1 & channel_r_3); // Majority logic
	assign vt_channel_r_3 = (channel_r_1 & channel_r_2) | (channel_r_2 & channel_r_3) | (channel_r_1 & channel_r_3); // Majority logic
	assign vt_dmux_1      = (dmux_1      & dmux_2     ) | (dmux_2      & dmux_3     ) | (dmux_1      & dmux_3     ); // Majority logic
	assign vt_dmux_2      = (dmux_1      & dmux_2     ) | (dmux_2      & dmux_3     ) | (dmux_1      & dmux_3     ); // Majority logic
	assign vt_dmux_3      = (dmux_1      & dmux_2     ) | (dmux_2      & dmux_3     ) | (dmux_1      & dmux_3     ); // Majority logic

	assign WREN   = vt_wren_1;
	assign RD_ENA = vt_rd_ena_1;
	assign DMUX   = vt_dmux_1;

	assign re_r_i      = vt_re_r_1;
	assign channel_r_i = vt_channel_r_1;

	always @(posedge CLK) begin
		re_r_1 <= re;
		re_r_2 <= re;
		re_r_3 <= re;
		wren_1 <= vt_re_r_1;
		wren_2 <= vt_re_r_2;
		wren_3 <= vt_re_r_3;
		channel_r_1 <= channel;
		channel_r_2 <= channel;
		channel_r_3 <= channel;
	end

	always @(posedge CLK) begin
	   if(JTAG_MODE) begin
		   rd_ena_1 <= {{16{J_RD_FIFO}}};
		   rd_ena_2 <= {{16{J_RD_FIFO}}};
		   rd_ena_3 <= {{16{J_RD_FIFO}}};
		end
		else
			case (channel)
				4'h0: rd_ena_1 <= {15'h0000,re};
				4'h1: rd_ena_1 <= {14'h0000,re,1'h0};
				4'h2: rd_ena_1 <= {13'h0000,re,2'h0};
				4'h3: rd_ena_1 <= {12'h000,re,3'h0};
				4'h4: rd_ena_1 <= {11'h000,re,4'h0};
				4'h5: rd_ena_1 <= {10'h000,re,5'h00};
				4'h6: rd_ena_1 <= {9'h000,re,6'h00};
				4'h7: rd_ena_1 <= {8'h00,re,7'h00};
				4'h8: rd_ena_1 <= {7'h00,re,8'h00};
				4'h9: rd_ena_1 <= {6'h00,re,9'h000};
				4'hA: rd_ena_1 <= {5'h00,re,10'h000};
				4'hB: rd_ena_1 <= {4'h0,re,11'h000};
				4'hC: rd_ena_1 <= {3'h0,re,12'h000};
				4'hD: rd_ena_1 <= {2'h0,re,13'h0000};
				4'hE: rd_ena_1 <= {1'h0,re,14'h0000};
				4'hF: rd_ena_1 <= {re,15'h0000};
				default: rd_ena_1 <= 0;
			endcase
			case (channel)
				4'h0: rd_ena_2 <= {15'h0000,re};
				4'h1: rd_ena_2 <= {14'h0000,re,1'h0};
				4'h2: rd_ena_2 <= {13'h0000,re,2'h0};
				4'h3: rd_ena_2 <= {12'h000,re,3'h0};
				4'h4: rd_ena_2 <= {11'h000,re,4'h0};
				4'h5: rd_ena_2 <= {10'h000,re,5'h00};
				4'h6: rd_ena_2 <= {9'h000,re,6'h00};
				4'h7: rd_ena_2 <= {8'h00,re,7'h00};
				4'h8: rd_ena_2 <= {7'h00,re,8'h00};
				4'h9: rd_ena_2 <= {6'h00,re,9'h000};
				4'hA: rd_ena_2 <= {5'h00,re,10'h000};
				4'hB: rd_ena_2 <= {4'h0,re,11'h000};
				4'hC: rd_ena_2 <= {3'h0,re,12'h000};
				4'hD: rd_ena_2 <= {2'h0,re,13'h0000};
				4'hE: rd_ena_2 <= {1'h0,re,14'h0000};
				4'hF: rd_ena_2 <= {re,15'h0000};
				default: rd_ena_2 <= 0;
			endcase
			case (channel)
				4'h0: rd_ena_3 <= {15'h0000,re};
				4'h1: rd_ena_3 <= {14'h0000,re,1'h0};
				4'h2: rd_ena_3 <= {13'h0000,re,2'h0};
				4'h3: rd_ena_3 <= {12'h000,re,3'h0};
				4'h4: rd_ena_3 <= {11'h000,re,4'h0};
				4'h5: rd_ena_3 <= {10'h000,re,5'h00};
				4'h6: rd_ena_3 <= {9'h000,re,6'h00};
				4'h7: rd_ena_3 <= {8'h00,re,7'h00};
				4'h8: rd_ena_3 <= {7'h00,re,8'h00};
				4'h9: rd_ena_3 <= {6'h00,re,9'h000};
				4'hA: rd_ena_3 <= {5'h00,re,10'h000};
				4'hB: rd_ena_3 <= {4'h0,re,11'h000};
				4'hC: rd_ena_3 <= {3'h0,re,12'h000};
				4'hD: rd_ena_3 <= {2'h0,re,13'h0000};
				4'hE: rd_ena_3 <= {1'h0,re,14'h0000};
				4'hF: rd_ena_3 <= {re,15'h0000};
				default: rd_ena_3 <= 0;
			endcase
	end
	
	always @(posedge CLK) begin
		case (vt_channel_r_1)
			4'h0: dmux_1 <= DIN_16CH[11:0];
			4'h1: dmux_1 <= DIN_16CH[23:12];
			4'h2: dmux_1 <= DIN_16CH[35:24];
			4'h3: dmux_1 <= DIN_16CH[47:36];
			4'h4: dmux_1 <= DIN_16CH[59:48];
			4'h5: dmux_1 <= DIN_16CH[71:60];
			4'h6: dmux_1 <= DIN_16CH[83:72];
			4'h7: dmux_1 <= DIN_16CH[95:84];
			4'h8: dmux_1 <= DIN_16CH[107:96];
			4'h9: dmux_1 <= DIN_16CH[119:108];
			4'hA: dmux_1 <= DIN_16CH[131:120];
			4'hB: dmux_1 <= DIN_16CH[143:132];
			4'hC: dmux_1 <= DIN_16CH[155:144];
			4'hD: dmux_1 <= DIN_16CH[167:156];
			4'hE: dmux_1 <= DIN_16CH[179:168];
			4'hF: dmux_1 <= DIN_16CH[191:180];
			default: dmux_1 <= 0;
		endcase
		case (vt_channel_r_2)
			4'h0: dmux_2 <= DIN_16CH[11:0];
			4'h1: dmux_2 <= DIN_16CH[23:12];
			4'h2: dmux_2 <= DIN_16CH[35:24];
			4'h3: dmux_2 <= DIN_16CH[47:36];
			4'h4: dmux_2 <= DIN_16CH[59:48];
			4'h5: dmux_2 <= DIN_16CH[71:60];
			4'h6: dmux_2 <= DIN_16CH[83:72];
			4'h7: dmux_2 <= DIN_16CH[95:84];
			4'h8: dmux_2 <= DIN_16CH[107:96];
			4'h9: dmux_2 <= DIN_16CH[119:108];
			4'hA: dmux_2 <= DIN_16CH[131:120];
			4'hB: dmux_2 <= DIN_16CH[143:132];
			4'hC: dmux_2 <= DIN_16CH[155:144];
			4'hD: dmux_2 <= DIN_16CH[167:156];
			4'hE: dmux_2 <= DIN_16CH[179:168];
			4'hF: dmux_2 <= DIN_16CH[191:180];
			default: dmux_2 <= 0;
		endcase
		case (vt_channel_r_3)
			4'h0: dmux_3 <= DIN_16CH[11:0];
			4'h1: dmux_3 <= DIN_16CH[23:12];
			4'h2: dmux_3 <= DIN_16CH[35:24];
			4'h3: dmux_3 <= DIN_16CH[47:36];
			4'h4: dmux_3 <= DIN_16CH[59:48];
			4'h5: dmux_3 <= DIN_16CH[71:60];
			4'h6: dmux_3 <= DIN_16CH[83:72];
			4'h7: dmux_3 <= DIN_16CH[95:84];
			4'h8: dmux_3 <= DIN_16CH[107:96];
			4'h9: dmux_3 <= DIN_16CH[119:108];
			4'hA: dmux_3 <= DIN_16CH[131:120];
			4'hB: dmux_3 <= DIN_16CH[143:132];
			4'hC: dmux_3 <= DIN_16CH[155:144];
			4'hD: dmux_3 <= DIN_16CH[167:156];
			4'hE: dmux_3 <= DIN_16CH[179:168];
			4'hF: dmux_3 <= DIN_16CH[191:180];
			default: dmux_3 <= 0;
		endcase
	end
	
end
else 
begin : XF2RB_logic
	reg wren_r;
	reg [15:0] rd_ena_r;
	reg re_r;
	reg [3:0]channel_r;
	reg [11:0] dmux_r;

	assign WREN   = wren_r;
	assign RD_ENA = rd_ena_r;
	assign DMUX   = dmux_r;

	assign re_r_i      = re_r;
	assign channel_r_i = channel_r;

	always @(posedge CLK) begin
		re_r <= re;
		wren_r <= re_r;
		channel_r <= channel;
	end

	always @(posedge CLK) begin
	   if(JTAG_MODE)
		   rd_ena_r <= {{16{J_RD_FIFO}}};
		else
			case (channel)
				4'h0: rd_ena_r <= {15'h0000,re};
				4'h1: rd_ena_r <= {14'h0000,re,1'h0};
				4'h2: rd_ena_r <= {13'h0000,re,2'h0};
				4'h3: rd_ena_r <= {12'h000,re,3'h0};
				4'h4: rd_ena_r <= {11'h000,re,4'h0};
				4'h5: rd_ena_r <= {10'h000,re,5'h00};
				4'h6: rd_ena_r <= {9'h000,re,6'h00};
				4'h7: rd_ena_r <= {8'h00,re,7'h00};
				4'h8: rd_ena_r <= {7'h00,re,8'h00};
				4'h9: rd_ena_r <= {6'h00,re,9'h000};
				4'hA: rd_ena_r <= {5'h00,re,10'h000};
				4'hB: rd_ena_r <= {4'h0,re,11'h000};
				4'hC: rd_ena_r <= {3'h0,re,12'h000};
				4'hD: rd_ena_r <= {2'h0,re,13'h0000};
				4'hE: rd_ena_r <= {1'h0,re,14'h0000};
				4'hF: rd_ena_r <= {re,15'h0000};
				default: rd_ena_r <= 0;
			endcase
	end
	
	always @(posedge CLK) begin
		case (channel_r)
			4'h0: dmux_r <= DIN_16CH[11:0];
			4'h1: dmux_r <= DIN_16CH[23:12];
			4'h2: dmux_r <= DIN_16CH[35:24];
			4'h3: dmux_r <= DIN_16CH[47:36];
			4'h4: dmux_r <= DIN_16CH[59:48];
			4'h5: dmux_r <= DIN_16CH[71:60];
			4'h6: dmux_r <= DIN_16CH[83:72];
			4'h7: dmux_r <= DIN_16CH[95:84];
			4'h8: dmux_r <= DIN_16CH[107:96];
			4'h9: dmux_r <= DIN_16CH[119:108];
			4'hA: dmux_r <= DIN_16CH[131:120];
			4'hB: dmux_r <= DIN_16CH[143:132];
			4'hC: dmux_r <= DIN_16CH[155:144];
			4'hD: dmux_r <= DIN_16CH[167:156];
			4'hE: dmux_r <= DIN_16CH[179:168];
			4'hF: dmux_r <= DIN_16CH[191:180];
			default: dmux_r <= 0;
		endcase
	end
	
end
endgenerate

generate
if(TMR==1 && TMR_Err_Det==1) 
begin : XF2RB_FSM_TMR_Err_Det
transfer_samples_FSM_TMR_Err_Det 
transfer_samples_FSM_i(
  .CHAN(channel),
  .L1A_RD_EN(L1A_RD_EN),
  .RDENA(re),
  .XSTATE(xstate),
  .TMR_ERR_COUNT(XF2RB_ERRCNT),
  .CLK(CLK),
  .JTAG_MODE(JTAG_MODE),
  .RDY(RDY),
  .RST(RST)
);
end
else if(TMR==1) 
begin : XF2RB_FSM_TMR
transfer_samples_FSM_TMR 
transfer_samples_FSM_i(
  .CHAN(channel),
  .L1A_RD_EN(L1A_RD_EN),
  .RDENA(re),
  .XSTATE(xstate),
  .CLK(CLK),
  .JTAG_MODE(JTAG_MODE),
  .RDY(RDY),
  .RST(RST)
);
assign XF2RB_ERRCNT = 0;
end
else 
begin : XF2RB_FSM
transfer_samples_FSM 
transfer_samples_FSM_i(
  .CHAN(channel),
  .L1A_RD_EN(L1A_RD_EN),
  .RDENA(re),
  .XSTATE(xstate),
  .CLK(CLK),
  .JTAG_MODE(JTAG_MODE),
  .RDY(RDY),
  .RST(RST)
);
assign XF2RB_ERRCNT = 0;
end
endgenerate
  

endmodule
