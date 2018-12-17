`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:31 03/11/2011 
// Design Name: 
// Module Name:    pipeline_gen_csp 
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
module pipeline_gen_csp #(
	parameter USE_CHIPSCOPE = 1,
	parameter TMR = 0
	)(
    inout [35:0] CSP_LA0_CNTRL,
    inout [35:0] CSP_VIO0_CNTRL,
    inout [35:0] CSP_VIO1_CNTRL,
    input CLK160,
    input [11:0] WRCLKS,
    input RDCLK,
    input RST,
    input JRESTART,
	 input [11:0] RESTARTPS,
    input [8:0] PDEPTH,
    input [95:0] G1DAQ8CH_0,
    input [95:0] G1DAQ8CH_1,
    input [95:0] G2DAQ8CH_0,
    input [95:0] G2DAQ8CH_1,
    input [95:0] G3DAQ8CH_0,
    input [95:0] G3DAQ8CH_1,
    input [95:0] G4DAQ8CH_0,
    input [95:0] G4DAQ8CH_1,
    input [95:0] G5DAQ8CH_0,
    input [95:0] G5DAQ8CH_1,
    input [95:0] G6DAQ8CH_0,
    input [95:0] G6DAQ8CH_1,
    output reg [191:0] G1PIPOUT,
    output reg [191:0] G2PIPOUT,
    output reg [191:0] G3PIPOUT,
    output reg [191:0] G4PIPOUT,
    output reg [191:0] G5PIPOUT,
    output reg [191:0] G6PIPOUT
    );
	 
	wire wrclk[6:1][1:0];
	wire restartp[6:1][1:0];
	wire [95:0] daq8ch[6:1][1:0];
	wire fifo_tst_in[6:1][1:0];
	
	wire injectsbiterr;
	wire injectdbiterr;
	wire  sbiterr_a[6:1][1:0], sbiterr_b[6:1][1:0];
	wire  dbiterr_a[6:1][1:0], dbiterr_b[6:1][1:0];
	wire  mt_a[6:1][1:0], mt_b[6:1][1:0];
	wire  fl_a[6:1][1:0], fl_b[6:1][1:0];


	wire pipe_reset[6:1][1:0];
	wire rena[6:1][1:0];
   wire wena[6:1][1:0];

	wire re_sync_i[6:1][1:0];

   wire  [95:0] po[6:1][1:0];
	
	reg [9:0] tcnt[6:1][1:0];

	wire trst[6:1][1:0];
	wire [31:0] dummy[6:1][1:0];

	wire csp_restart;
	wire csp_inj_pulse;
	wire csp_sel_tpls;
	wire csp_var3;


generate
if(USE_CHIPSCOPE==1) 
begin : chipscope_pipeline
//
// Logic analyzer for pipeline
wire [204:0] pipe_la0_data;
wire [4:0] pipe_la0_trig;

pipe_la pipe_la0 (
    .CONTROL(CSP_LA0_CNTRL),
    .CLK(CLK160),
    .DATA(pipe_la0_data),  // IN BUS [204:0]
    .TRIG0(pipe_la0_trig)  // IN BUS [4:0]
);

// LA Data [95:0]
	assign pipe_la0_data[9:0]        = tcnt[1][0];
	assign pipe_la0_data[19:10]      = tcnt[1][1];
	assign pipe_la0_data[29:20]      = tcnt[2][0];
	assign pipe_la0_data[39:30]      = tcnt[2][1];
	assign pipe_la0_data[49:40]      = tcnt[3][0];
	assign pipe_la0_data[59:50]      = tcnt[3][1];
	assign pipe_la0_data[69:60]      = tcnt[4][0];
	assign pipe_la0_data[79:70]      = tcnt[4][1];
	assign pipe_la0_data[89:80]      = tcnt[5][0];
	assign pipe_la0_data[99:90]      = tcnt[5][1];
	assign pipe_la0_data[109:100]    = tcnt[6][0];
	assign pipe_la0_data[119:110]    = tcnt[6][1];
//	assign pipe_la0_data[137:129]    = rdcnt_a[5][1];
	assign pipe_la0_data[128:120]    = 9'h000;
	assign pipe_la0_data[137:129]    = 9'h000;
	assign pipe_la0_data[146:138]    = PDEPTH;
	assign pipe_la0_data[147]        = 1'b0;
	assign pipe_la0_data[148]        = 1'b0;
	assign pipe_la0_data[149]        = 1'b0;
	assign pipe_la0_data[150]        = RDCLK;
	assign pipe_la0_data[151]        = wena[1][0];
	assign pipe_la0_data[152]        = wena[1][1];
	assign pipe_la0_data[153]        = wena[2][0];
	assign pipe_la0_data[154]        = wena[2][1];
	assign pipe_la0_data[155]        = wena[3][0];
	assign pipe_la0_data[156]        = wena[3][1];
	assign pipe_la0_data[157]        = wena[4][0];
	assign pipe_la0_data[158]        = wena[4][1];
	assign pipe_la0_data[159]        = wena[5][0];
	assign pipe_la0_data[160]        = wena[5][1];
	assign pipe_la0_data[161]        = wena[6][0];
	assign pipe_la0_data[162]        = wena[6][1];
	assign pipe_la0_data[163]        = re_sync_i[1][0];
	assign pipe_la0_data[164]        = re_sync_i[1][1];
	assign pipe_la0_data[165]        = re_sync_i[2][0];
	assign pipe_la0_data[166]        = re_sync_i[2][1];
	assign pipe_la0_data[167]        = re_sync_i[3][0];
	assign pipe_la0_data[168]        = re_sync_i[3][1];
	assign pipe_la0_data[169]        = re_sync_i[4][0];
	assign pipe_la0_data[170]        = re_sync_i[4][1];
	assign pipe_la0_data[171]        = re_sync_i[5][0];
	assign pipe_la0_data[172]        = re_sync_i[5][1];
	assign pipe_la0_data[173]        = re_sync_i[6][0];
	assign pipe_la0_data[174]        = re_sync_i[6][1];
	assign pipe_la0_data[175]        = fifo_tst_in[1][0];
	assign pipe_la0_data[176]        = po[1][0][0];
	assign pipe_la0_data[177]        = po[1][1][0];
	assign pipe_la0_data[178]        = po[2][0][0];
	assign pipe_la0_data[179]        = po[2][1][0];
	assign pipe_la0_data[180]        = po[3][0][0];
	assign pipe_la0_data[181]        = po[3][1][0];
	assign pipe_la0_data[182]        = po[4][0][0];
	assign pipe_la0_data[183]        = po[4][1][0];
	assign pipe_la0_data[184]        = po[5][0][0];
	assign pipe_la0_data[185]        = po[5][1][0];
	assign pipe_la0_data[186]        = po[6][0][0];
	assign pipe_la0_data[187]        = po[6][1][0];
	assign pipe_la0_data[196:188]    = 9'h000;
	assign pipe_la0_data[197]        = RST;
	assign pipe_la0_data[198]        = csp_restart;
	assign pipe_la0_data[199]        = JRESTART;
	assign pipe_la0_data[200]        = csp_inj_pulse;
	assign pipe_la0_data[201]        = csp_sel_tpls;
	assign pipe_la0_data[202]        = restartp[1][0];
	assign pipe_la0_data[203]        = 1'b0;
	assign pipe_la0_data[204]        = 1'b0;

// LA Trigger [4:0]
	assign pipe_la0_trig[0]       = RST;
	assign pipe_la0_trig[1]       = csp_restart;
	assign pipe_la0_trig[2]       = JRESTART;
	assign pipe_la0_trig[3]       = csp_inj_pulse;
	assign pipe_la0_trig[4]       = restartp[1][0];

// Virtual I/O for pipeline
wire [128:0] pipe_vio0_sync_in;
	
pipe_vio_in pipe_vio_in0 (
    .CONTROL(CSP_VIO0_CNTRL), // INOUT BUS [35:0]
    .CLK(CLK160),
    .SYNC_IN(pipe_vio0_sync_in) // IN BUS [128:0]
);

// VIO Sync In Data [128:0]
	assign pipe_vio0_sync_in[9:0]        = tcnt[1][0];
	assign pipe_vio0_sync_in[19:10]      = tcnt[1][1];
	assign pipe_vio0_sync_in[29:20]      = tcnt[2][0];
	assign pipe_vio0_sync_in[39:30]      = tcnt[2][1];
	assign pipe_vio0_sync_in[49:40]      = tcnt[3][0];
	assign pipe_vio0_sync_in[59:50]      = tcnt[3][1];
	assign pipe_vio0_sync_in[69:60]      = tcnt[4][0];
	assign pipe_vio0_sync_in[79:70]      = tcnt[4][1];
	assign pipe_vio0_sync_in[89:80]      = tcnt[5][0];
	assign pipe_vio0_sync_in[99:90]      = tcnt[5][1];
	assign pipe_vio0_sync_in[109:100]    = tcnt[6][0];
	assign pipe_vio0_sync_in[119:110]    = tcnt[6][1];
	assign pipe_vio0_sync_in[128:120]    = PDEPTH;


wire [3:0] pipe_vio0_sync_out;
	
pipe_vio_out pipe_vio_out1 (
    .CONTROL(CSP_VIO1_CNTRL), // INOUT BUS [35:0]
    .CLK(RDCLK),
    .SYNC_OUT(pipe_vio0_sync_out) // OUT BUS [3:0]
);


// VIO Sync Out Data [3:0]
	assign csp_restart   = pipe_vio0_sync_out[0];
	assign csp_inj_pulse = pipe_vio0_sync_out[1];
	assign csp_sel_tpls  = pipe_vio0_sync_out[2];
	assign csp_var3      = pipe_vio0_sync_out[3];
	
end

else
begin
	assign csp_restart   = 1'b0;
	assign csp_inj_pulse = 1'b0;
	assign csp_sel_tpls  = 1'b0;
	assign csp_var3      = 1'b0;
end
endgenerate


assign injectsbiterr = 1'b0;
assign injectdbiterr = 1'b0;


assign {wrclk[6][1],wrclk[6][0],wrclk[5][1],wrclk[5][0],wrclk[4][1],wrclk[4][0],wrclk[3][1],wrclk[3][0],wrclk[2][1],wrclk[2][0],wrclk[1][1],wrclk[1][0]} = WRCLKS;
assign {restartp[6][1],restartp[6][0],restartp[5][1],restartp[5][0],restartp[4][1],restartp[4][0],restartp[3][1],restartp[3][0],restartp[2][1],restartp[2][0],restartp[1][1],restartp[1][0]} = RESTARTPS;
assign daq8ch[1][0] = G1DAQ8CH_0;
assign daq8ch[1][1] = G1DAQ8CH_1;
assign daq8ch[2][0] = G2DAQ8CH_0;
assign daq8ch[2][1] = G2DAQ8CH_1;
assign daq8ch[3][0] = G3DAQ8CH_0;
assign daq8ch[3][1] = G3DAQ8CH_1;
assign daq8ch[4][0] = G4DAQ8CH_0;
assign daq8ch[4][1] = G4DAQ8CH_1;
assign daq8ch[5][0] = G5DAQ8CH_0;
assign daq8ch[5][1] = G5DAQ8CH_1;
assign daq8ch[6][0] = G6DAQ8CH_0;
assign daq8ch[6][1] = G6DAQ8CH_1;

	always @(posedge RDCLK) begin
		G1PIPOUT[191:0] <= {po[1][1],po[1][0]};
		G2PIPOUT[191:0] <= {po[2][1],po[2][0]};
		G3PIPOUT[191:0] <= {po[3][1],po[3][0]};
		G4PIPOUT[191:0] <= {po[4][1],po[4][0]};
		G5PIPOUT[191:0] <= {po[5][1],po[5][0]};
		G6PIPOUT[191:0] <= {po[6][1],po[6][0]};
	end


genvar G,S;

generate
if(TMR==1) 
begin : Pipeline_logic_TMR
	(* syn_preserve = "true" *) reg re_s1_1[6:1][1:0];
	(* syn_preserve = "true" *) reg re_s1_2[6:1][1:0];
	(* syn_preserve = "true" *) reg re_s1_3[6:1][1:0];
	(* syn_preserve = "true" *) reg re_s2_1[6:1][1:0];
	(* syn_preserve = "true" *) reg re_s2_2[6:1][1:0];
	(* syn_preserve = "true" *) reg re_s2_3[6:1][1:0];
	(* syn_preserve = "true" *) reg re_sync_1[6:1][1:0];
	(* syn_preserve = "true" *) reg re_sync_2[6:1][1:0];
	(* syn_preserve = "true" *) reg re_sync_3[6:1][1:0];
	
	(* syn_keep = "true" *) wire vt_re_s1_1[6:1][1:0];
	(* syn_keep = "true" *) wire vt_re_s1_2[6:1][1:0];
	(* syn_keep = "true" *) wire vt_re_s1_3[6:1][1:0];
	(* syn_keep = "true" *) wire vt_re_s2_1[6:1][1:0];
	(* syn_keep = "true" *) wire vt_re_s2_2[6:1][1:0];
	(* syn_keep = "true" *) wire vt_re_s2_3[6:1][1:0];
	(* syn_keep = "true" *) wire vt_re_sync_1[6:1][1:0];
	(* syn_keep = "true" *) wire vt_re_sync_2[6:1][1:0];
	(* syn_keep = "true" *) wire vt_re_sync_3[6:1][1:0];
	
	for (G=1; G<=6; G=G+1) begin : grp
		for (S=0; S<2; S=S+1) begin : seg
	
			assign vt_re_s1_1[G][S]   = (re_s1_1[G][S]     & re_s1_2[G][S]    ) | (re_s1_2[G][S]     & re_s1_3[G][S]    ) | (re_s1_1[G][S]     & re_s1_3[G][S]    ); // Majority logic
			assign vt_re_s1_2[G][S]   = (re_s1_1[G][S]     & re_s1_2[G][S]    ) | (re_s1_2[G][S]     & re_s1_3[G][S]    ) | (re_s1_1[G][S]     & re_s1_3[G][S]    ); // Majority logic
			assign vt_re_s1_3[G][S]   = (re_s1_1[G][S]     & re_s1_2[G][S]    ) | (re_s1_2[G][S]     & re_s1_3[G][S]    ) | (re_s1_1[G][S]     & re_s1_3[G][S]    ); // Majority logic
			assign vt_re_s2_1[G][S]   = (re_s2_1[G][S]     & re_s2_2[G][S]    ) | (re_s2_2[G][S]     & re_s2_3[G][S]    ) | (re_s2_1[G][S]     & re_s2_3[G][S]    ); // Majority logic
			assign vt_re_s2_2[G][S]   = (re_s2_1[G][S]     & re_s2_2[G][S]    ) | (re_s2_2[G][S]     & re_s2_3[G][S]    ) | (re_s2_1[G][S]     & re_s2_3[G][S]    ); // Majority logic
			assign vt_re_s2_3[G][S]   = (re_s2_1[G][S]     & re_s2_2[G][S]    ) | (re_s2_2[G][S]     & re_s2_3[G][S]    ) | (re_s2_1[G][S]     & re_s2_3[G][S]    ); // Majority logic
			assign vt_re_sync_1[G][S] = (re_sync_1[G][S]   & re_sync_2[G][S]  ) | (re_sync_2[G][S]   & re_sync_3[G][S]  ) | (re_sync_1[G][S]   & re_sync_3[G][S]  ); // Majority logic
			assign vt_re_sync_2[G][S] = (re_sync_1[G][S]   & re_sync_2[G][S]  ) | (re_sync_2[G][S]   & re_sync_3[G][S]  ) | (re_sync_1[G][S]   & re_sync_3[G][S]  ); // Majority logic
			assign vt_re_sync_3[G][S] = (re_sync_1[G][S]   & re_sync_2[G][S]  ) | (re_sync_2[G][S]   & re_sync_3[G][S]  ) | (re_sync_1[G][S]   & re_sync_3[G][S]  ); // Majority logic
		
			assign fifo_tst_in[G][S] = csp_sel_tpls ? csp_inj_pulse : daq8ch[G][S][0];
		
			pipeline_ecc Pipeline_a (              // 36Kb FIFOs with ECC protection
			  .rst(pipe_reset[G][S] || RST),              // input rst
			  .wr_clk(wrclk[G][S]),                // input wr_clk
			  .rd_clk(RDCLK),                      // input rd_clk
			  .din({daq8ch[G][S][63:1],fifo_tst_in[G][S]}),  // input [63 : 0] din
			  .wr_en(wena[G][S]),                  // input wr_en
			  .rd_en(vt_re_sync_1[G][S]),          // input rd_en
			  .injectdbiterr(injectdbiterr),       // input injectdbiterr
			  .injectsbiterr(injectsbiterr),       // input injectsbiterr
			  .dout({po[G][S][63:0]}),             // output [63 : 0] dout
			  .full(fl_a[G][S]),                   // output full
			  .empty(mt_a[G][S]),                  // output empty
			  .sbiterr(sbiterr_a[G][S]),           // output sbiterr
			  .dbiterr(dbiterr_a[G][S])            // output dbiterr
			);
			
			pipeline_ecc Pipeline_b (              // 36Kb FIFOs with ECC protection
			  .rst(pipe_reset[G][S] || RST),              // input rst
			  .wr_clk(wrclk[G][S]),                // input wr_clk
			  .rd_clk(RDCLK),                      // input rd_clk
			  .din({32'h00000000,daq8ch[G][S][95:64]}), // input [63 : 0] din
			  .wr_en(wena[G][S]),                  // input wr_en
			  .rd_en(vt_re_sync_1[G][S]),          // input rd_en
			  .injectdbiterr(injectdbiterr),       // input injectdbiterr
			  .injectsbiterr(injectsbiterr),       // input injectsbiterr
			  .dout({dummy[G][S],po[G][S][95:64]}),// output [63 : 0] dout
			  .full(fl_b[G][S]),                   // output full
			  .empty(mt_b[G][S]),                  // output empty
			  .sbiterr(sbiterr_b[G][S]),           // output sbiterr
			  .dbiterr(dbiterr_b[G][S])            // output dbiterr
			);
			

			assign trst[G][S] = RST | pipe_reset[G][S];
			
			always @(posedge CLK160 or posedge trst[G][S]) begin
				if(trst[G][S])
					tcnt[G][S] <= 10'h000;
				else
					case({vt_re_sync_1[G][S],wena[G][S]})
						2'b00:	tcnt[G][S] <= tcnt[G][S];
						2'b01:	tcnt[G][S] <= tcnt[G][S] + 1;
						2'b10:	tcnt[G][S] <= tcnt[G][S] - 1;
						2'b11:	tcnt[G][S] <= tcnt[G][S];
						default:	tcnt[G][S] <= tcnt[G][S];
					endcase
			end
			
			always @(posedge CLK160) begin
				re_s1_1[G][S] <= rena[G][S];
				re_s1_2[G][S] <= rena[G][S];
				re_s1_3[G][S] <= rena[G][S];
				re_s2_1[G][S] <= vt_re_s1_1[G][S];
				re_s2_2[G][S] <= vt_re_s1_2[G][S];
				re_s2_3[G][S] <= vt_re_s1_3[G][S];
			end
			always @(posedge RDCLK) begin
				re_sync_1[G][S] <= vt_re_s2_1[G][S];
				re_sync_2[G][S] <= vt_re_s2_2[G][S];
				re_sync_3[G][S] <= vt_re_s2_3[G][S];
			end
			
			Pipe_Start_FSM_TMR 
			Pipe_Start_FSM (
			  .PIP_RST(pipe_reset[G][S]),          // Reset for pipeline
			  .RE(rena[G][S]),                     // Read enable
			  .WE(wena[G][S]),                     // Write enable
			  .CLK(wrclk[G][S]),                   // Clock
			  .PDEPTH(PDEPTH),                     // Pipeline depth from JTAG register
			  .RESTART(JRESTART | restartp[G][S] | csp_restart),  // Restart pipeline signal from JTAG command or from DSR state machine
			  .RST(RST)                          // Reset
			);
			
			assign re_sync_i[G][S] = vt_re_sync_1[G][S];
				
		end
	end
end
else 
begin : Pipeline_logic
	reg re_s1[6:1][1:0];
	reg re_s2[6:1][1:0];
	reg re_sync[6:1][1:0];
	
	for (G=1; G<=6; G=G+1) begin : grp
		for (S=0; S<2; S=S+1) begin : seg
		
			assign fifo_tst_in[G][S] = csp_sel_tpls ? csp_inj_pulse : daq8ch[G][S][0];
		
			pipeline_ecc Pipeline_a (              // 36Kb FIFOs with ECC protection
			  .rst(pipe_reset[G][S] || RST),              // input rst
			  .wr_clk(wrclk[G][S]),                // input wr_clk
			  .rd_clk(RDCLK),                      // input rd_clk
			  .din({daq8ch[G][S][63:1],fifo_tst_in[G][S]}),  // input [63 : 0] din
			  .wr_en(wena[G][S]),                  // input wr_en
			  .rd_en(re_sync[G][S]),             // input rd_en
			  .injectdbiterr(injectdbiterr),       // input injectdbiterr
			  .injectsbiterr(injectsbiterr),       // input injectsbiterr
			  .dout({po[G][S][63:0]}),             // output [63 : 0] dout
			  .full(fl_a[G][S]),                   // output full
			  .empty(mt_a[G][S]),                  // output empty
			  .sbiterr(sbiterr_a[G][S]),           // output sbiterr
			  .dbiterr(dbiterr_a[G][S])            // output dbiterr
			);
			
			pipeline_ecc Pipeline_b (              // 36Kb FIFOs with ECC protection
			  .rst(pipe_reset[G][S] || RST),              // input rst
			  .wr_clk(wrclk[G][S]),                // input wr_clk
			  .rd_clk(RDCLK),                      // input rd_clk
			  .din({32'h00000000,daq8ch[G][S][95:64]}), // input [63 : 0] din
			  .wr_en(wena[G][S]),                  // input wr_en
			  .rd_en(re_sync[G][S]),             // input rd_en
			  .injectdbiterr(injectdbiterr),       // input injectdbiterr
			  .injectsbiterr(injectsbiterr),       // input injectsbiterr
			  .dout({dummy[G][S],po[G][S][95:64]}),// output [63 : 0] dout
			  .full(fl_b[G][S]),                   // output full
			  .empty(mt_b[G][S]),                  // output empty
			  .sbiterr(sbiterr_b[G][S]),           // output sbiterr
			  .dbiterr(dbiterr_b[G][S])            // output dbiterr
			);
			

			assign trst[G][S] = RST | pipe_reset[G][S];
			
			always @(posedge CLK160 or posedge trst[G][S]) begin
				if(trst[G][S])
					tcnt[G][S] <= 10'h000;
				else
					case({re_sync[G][S],wena[G][S]})
						2'b00:	tcnt[G][S] <= tcnt[G][S];
						2'b01:	tcnt[G][S] <= tcnt[G][S] + 1;
						2'b10:	tcnt[G][S] <= tcnt[G][S] - 1;
						2'b11:	tcnt[G][S] <= tcnt[G][S];
						default:	tcnt[G][S] <= tcnt[G][S];
					endcase
			end
	
			always @(posedge CLK160) begin
				re_s1[G][S] <= rena[G][S];
				re_s2[G][S] <= re_s1[G][S];
			end
			always @(posedge RDCLK) begin
				re_sync[G][S] <= re_s2[G][S];
			end
			
			Pipe_Start_FSM 
			Pipe_Start_FSM (
			  .PIP_RST(pipe_reset[G][S]),          // Reset for pipeline
			  .RE(rena[G][S]),                     // Read enable
			  .WE(wena[G][S]),                     // Write enable
			  .CLK(wrclk[G][S]),                   // Clock
			  .PDEPTH(PDEPTH),                     // Pipeline depth from JTAG register
			  .RESTART(JRESTART | restartp[G][S] | csp_restart),  // Restart pipeline signal from JTAG command or from DSR state machine
			  .RST(RST)                          // Reset
			);
			
			assign re_sync_i[G][S] = re_sync[G][S];
			
		end
	end
end
endgenerate

endmodule
