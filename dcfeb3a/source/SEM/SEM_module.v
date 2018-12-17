`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:31 02/24/2011 
// Design Name: 
// Module Name:    SEM_module 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module SEM_module #(
	parameter USE_CHIPSCOPE = 1,
	parameter TMR = 0
)(
    inout [35:0] CSP_LA0_CNTRL,
    inout [35:0] CSP_VIO0_CNTRL,
	 
    input CLK40,               // Free running 40 MHz Clock after mmcm lock.
    input ICAP_CLK,            // Clock Enabled 40MHz clock
    input RST,                 // Reset for state machines and FIFO
	 input JTAG_TK_CTRL,        // Sets csp_jtag_b signal
	 input JTAG_DED_RST,        // Reset the double error detected flag
	 input JTAG_RST_SEM_CNTRS,  // Reset the error counters
	 input JTAG_SEND_CMD,       // single pulse to execute command in JTAG_CMD_DATA
	 input [7:0] JTAG_CMD_DATA, //Data for SEM commands
	 output [23:0] SEM_FAR_PA,  //Frame Address Register - Physical Address
	 output [23:0] SEM_FAR_LA,  //Frame Address Register - Linear Address
	 output [15:0] SEM_ERRCNT,  //Error counters - {dbl,sngl} 8 bits each
	 output [15:0] SEM_STATUS   //Status states, and error flags
	 );

//
// SEM signals
//
	wire status_heartbeat;
	wire status_initialization;
	wire status_observation;
	wire status_correction;
	wire status_classification;
	wire status_injection;
	wire status_essential;
	wire status_uncorrectable;
	wire [7:0] monitor_txdata;
	wire monitor_txwrite;
	wire monitor_txfull;
	wire [7:0] monitor_rxdata; 
	wire monitor_rxread;
	wire monitor_rxempty;
	wire inject_strobe;
	wire [35:0] inject_address; 

//
// FRAME_ECC_VIRTEX6 signals
//
	wire fecc_crcerr;
	wire fecc_eccerr;
	wire fecc_eccerrsingle;
	wire [23:0] fecc_far;
	wire [4:0] fecc_synbit;
	wire [12:0] fecc_syndrome;
	wire fecc_syndromevalid;
	wire [6:0] fecc_synword;
//
// ICAP_VIRTEX6 signals
//
	wire icap_busy;
	wire [31:0] icap_o;
	wire icap_csb;
	wire [31:0] icap_i;
	wire icap_rdwrb;
	wire icap_unused;
	wire icap_grant;

//
// User signals
//
	wire csp_read;
	wire [7:0] csp_cmd_data;
	wire [7:0] cmd_data;
	wire csp_send_cmd;
	wire send_cmd;
	wire csp_tk_ctrl;
	wire rxempty_n;
	wire fifo_unused;

	wire [7:0] sngl_bit_err_cnt_i;
	wire [7:0] multi_bit_err_cnt_i;
	wire [8*9-1:0] monout_i;
	wire [23:0] far_pa_i;
	wire [23:0] far_la_i;
	wire [23:0] conv_i;
	
	wire inc_dbl_cnt_i;
	wire inc_sngl_cnt_i;
	wire ded_i;
	wire sed_i;
	wire pa_i;
	wire la_i;
	wire load_pa_i;
	wire load_la_i;


	
//
// Logic analyzer 
//
generate
if(USE_CHIPSCOPE==1) 
begin : chipscope_sem
	wire [195:0] sem_la0_data;
	wire [15:0] sem_la0_trig;

	sem_la sem_la0 (
		 .CONTROL(CSP_LA0_CNTRL),
		 .CLK(CLK40),
		 .DATA(sem_la0_data),  // IN BUS [195:0]
		 .TRIG0(sem_la0_trig)  // IN BUS [15:0]
	);


	// LA Data [195:0]
		assign sem_la0_data[7:0]        = monitor_txdata;
		assign sem_la0_data[31:8]       = fecc_far;
		assign sem_la0_data[43:32]      = fecc_syndrome;
		assign sem_la0_data[48:44]      = fecc_synbit;
		assign sem_la0_data[55:49]      = fecc_synword;
//		assign sem_la0_data[87:56]      = icap_o;
//		assign sem_la0_data[119:88]     = icap_i;
		assign sem_la0_data[79:56]      = conv_i;
		assign sem_la0_data[119:80]     = monout_i[8*5-1:0];
		assign sem_la0_data[120]        = status_heartbeat;
		assign sem_la0_data[121]        = status_initialization;
		assign sem_la0_data[122]        = status_observation;
		assign sem_la0_data[123]        = status_correction;
		assign sem_la0_data[124]        = status_classification;
		assign sem_la0_data[125]        = status_injection;
		assign sem_la0_data[126]        = status_essential;
		assign sem_la0_data[127]        = status_uncorrectable;
		assign sem_la0_data[128]        = monitor_txwrite;
		assign sem_la0_data[129]        = monitor_rxread;
		assign sem_la0_data[130]        = inject_strobe;
		assign sem_la0_data[131]        = fecc_crcerr;
		assign sem_la0_data[132]        = fecc_eccerr;
		assign sem_la0_data[133]        = fecc_eccerrsingle;
		assign sem_la0_data[134]        = fecc_syndromevalid;
		assign sem_la0_data[135]        = icap_busy;
		assign sem_la0_data[136]        = icap_csb;
		assign sem_la0_data[137]        = icap_rdwrb;
		assign sem_la0_data[138]        = monitor_txfull;
		assign sem_la0_data[139]        = monitor_rxempty;
		assign sem_la0_data[147:140]    = monitor_rxdata;
		assign sem_la0_data[148]        = csp_read;
		assign sem_la0_data[149]        = 1'b0;
		assign sem_la0_data[150]        = 1'b0;
		assign sem_la0_data[151]        = pa_i;
		assign sem_la0_data[152]        = la_i;
		assign sem_la0_data[153]        = inc_dbl_cnt_i;
		assign sem_la0_data[154]        = inc_sngl_cnt_i;
		assign sem_la0_data[155]        = load_pa_i;
		assign sem_la0_data[156]        = load_la_i;
		assign sem_la0_data[157]        = 1'b0;
		assign sem_la0_data[158]        = 1'b0;
		assign sem_la0_data[159]        = 1'b0;
		assign sem_la0_data[160]        = csp_send_cmd;
		assign sem_la0_data[161]        = RST;
		assign sem_la0_data[162]        = sed_i;
		assign sem_la0_data[163]        = ded_i;
		assign sem_la0_data[195:164]    = monout_i[8*9-1:8*5];
		
	

	// LA Trigger [15:0]
		assign sem_la0_trig[0]       = status_heartbeat;
		assign sem_la0_trig[1]       = status_initialization;
		assign sem_la0_trig[2]       = status_observation;
		assign sem_la0_trig[3]       = status_correction;
		assign sem_la0_trig[4]       = status_injection;
		assign sem_la0_trig[5]       = fecc_crcerr;
		assign sem_la0_trig[6]       = fecc_eccerr;
		assign sem_la0_trig[7]       = fecc_eccerrsingle;
		assign sem_la0_trig[8]       = icap_csb;
		assign sem_la0_trig[9]       = icap_rdwrb;
		assign sem_la0_trig[10]      = icap_busy;
		assign sem_la0_trig[11]      = monitor_txwrite;
		assign sem_la0_trig[12]      = inject_strobe;
		assign sem_la0_trig[13]      = csp_read;
		assign sem_la0_trig[14]      = csp_send_cmd;
		assign sem_la0_trig[15]      = monitor_rxread;
		

	// Virtual I/O for SEM

	wire [47:0] sem_vio0_sync_out;
	wire [71:0] sem_vio0_sync_in;
		
	sem_vio sem_vio_0 (
		 .CONTROL(CSP_VIO0_CNTRL), // INOUT BUS [35:0]
		 .CLK(CLK40),
		 .SYNC_IN(sem_vio0_sync_in), // IN BUS [71:0]
		 .SYNC_OUT(sem_vio0_sync_out) // OUT BUS [47:0]
	);


	// VIO Sync In Data [71:0]
		assign sem_vio0_sync_in[0]  = status_initialization;
		assign sem_vio0_sync_in[1]  = status_observation;
		assign sem_vio0_sync_in[2]  = status_correction;
		assign sem_vio0_sync_in[3]  = status_classification;
		assign sem_vio0_sync_in[4]  = status_injection;
		assign sem_vio0_sync_in[5]  = fecc_crcerr;
		assign sem_vio0_sync_in[6]  = fecc_eccerr;
		assign sem_vio0_sync_in[7]  = fecc_eccerrsingle;
		assign sem_vio0_sync_in[15:8] = sngl_bit_err_cnt_i;
		assign sem_vio0_sync_in[23:16] = multi_bit_err_cnt_i;
		assign sem_vio0_sync_in[47:24] = far_pa_i;
		assign sem_vio0_sync_in[71:48] = far_la_i;

	// VIO Sync Out Data [47:0]
		assign inject_address = sem_vio0_sync_out[35:0];
		assign inject_strobe  = sem_vio0_sync_out[36];
		assign csp_send_cmd   = sem_vio0_sync_out[37];
		assign csp_read       = sem_vio0_sync_out[38];
		assign csp_cmd_data   = sem_vio0_sync_out[46:39];
		assign csp_tk_ctrl    = sem_vio0_sync_out[47];


	assign icap_grant = 1'b1;
	assign monitor_txfull = 1'b0;
end
else
begin : no_chipscope_sem
	assign inject_address = 36'h000000000;
	assign inject_strobe  = 1'b0;
	assign csp_send_cmd   = 1'b0;
	assign csp_read       = 1'b0;
	assign csp_cmd_data   = 8'h00;
	assign csp_tk_ctrl    = 1'b0;

end
endgenerate

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Instantiate SEM Core generated by the Wizzard                     //
//                                                                   //
///////////////////////////////////////////////////////////////////////
sem_core sem_core1 (
	.status_heartbeat(status_heartbeat),
	.status_initialization(status_initialization),
	.status_observation(status_observation),
	.status_correction(status_correction),
	.status_classification(status_classification),
	.status_injection(status_injection),
	.status_essential(status_essential),
	.status_uncorrectable(status_uncorrectable),
	.monitor_txdata(monitor_txdata), // Bus [7 : 0] 
	.monitor_txwrite(monitor_txwrite),
	.monitor_txfull(monitor_txfull),
	.monitor_rxdata(monitor_rxdata), // Bus [7 : 0] 
	.monitor_rxread(monitor_rxread),
	.monitor_rxempty(monitor_rxempty),
	.inject_strobe(inject_strobe),
	.inject_address(inject_address), // Bus [35 : 0] 
	.icap_busy(icap_busy),
	.icap_o(icap_o), // Bus [31 : 0] 
	.icap_csb(icap_csb),
	.icap_rdwrb(icap_rdwrb),
	.icap_i(icap_i), // Bus [31 : 0] 
	.icap_clk(ICAP_CLK),
	.icap_request(icap_unused), 
	.icap_grant(icap_grant),
	.fecc_crcerr(fecc_crcerr),
	.fecc_eccerr(fecc_eccerr),
	.fecc_eccerrsingle(fecc_eccerrsingle),
	.fecc_syndromevalid(fecc_syndromevalid),
	.fecc_syndrome(fecc_syndrome), // Bus [12 : 0] 
	.fecc_far(fecc_far), // Bus [23 : 0] 
	.fecc_synbit(fecc_synbit), // Bus [4 : 0] 
	.fecc_synword(fecc_synword)); // Bus [6 : 0] 

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Instantiate Interal Configuration Access Port (ICAP) primitive    //
// Important! Change ICAP width from default ("X8") to ("X32")       //
//                                                                   //
///////////////////////////////////////////////////////////////////////
   ICAP_VIRTEX6 #(
      .DEVICE_ID(32'h0424a093),     // Specifies the pre-programmed Device ID value
      .ICAP_WIDTH("X32"),          // Specifies the input and output data width to be used with the
                                  // ICAP_VIRTEX6.
      .SIM_CFG_FILE_NAME("NONE")  // Specifies the Raw Bitstream (RBT) file to be parsed by the simulation
                                  // model
   )
   ICAP_VIRTEX6_inst (
      .BUSY(icap_busy),   // 1-bit output Busy/Ready output
      .O(icap_o),         // 32-bit output Configuration data output bus
      .CLK(ICAP_CLK),        // 1-bit input Clock Input
      .CSB(icap_csb),     // 1-bit input Active-Low ICAP input Enable
      .I(icap_i),         // 32-bit input Configuration data input bus
      .RDWRB(icap_rdwrb)  // 1-bit input Read/Write Select input
   );
	
///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Instantiate Configuration Frame Error Correction(FRAME_ECC) primitive //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
   FRAME_ECC_VIRTEX6 #(
      .FARSRC("EFAR"),                // Determines if the output of FAR[23:0] configuration register points to
                                      // the FAR or EFAR. Sets configuration option register bit CTL0[7].
      .FRAME_RBT_IN_FILENAME("NONE")  // This file is output by the ICAP_VIRTEX6 model and it contains Frame
                                      // Data information for the Raw Bitstream (RBT) file. The FRAME_ECC model
                                      // will parse this file, calculate ECC and output any error conditions.
   )
   FRAME_ECC_VIRTEX6_inst (
      .CRCERROR(fecc_crcerr),             // 1-bit output Output indicating a CRC error
      .ECCERROR(fecc_eccerr),             // 1-bit output Output indicating an ECC error
      .ECCERRORSINGLE(fecc_eccerrsingle), // 1-bit output Output Indicating single-bit Frame ECC error detected.
      .FAR(fecc_far),                       // 24-bit output Frame Address Register Value output
      .SYNBIT(fecc_synbit),                 // 5-bit output Output bit address of error
      .SYNDROME(fecc_syndrome),             // 13-bit output Output location of erroneous bit
      .SYNDROMEVALID(fecc_syndromevalid),   // 1-bit output Frame ECC output indicating the SYNDROME output is valid.
      .SYNWORD(fecc_synword)                // 7-bit output Word output in the frame where an ECC error has been detected
   );

	
generate
if(TMR==1) 
begin : SEM_logic_TMR

	(* syn_preserve = "true" *) reg csp_jtag_b_1;
	(* syn_preserve = "true" *) reg csp_jtag_b_2;
	(* syn_preserve = "true" *) reg csp_jtag_b_3;
	(* syn_preserve = "true" *) reg [7:0] sngl_bit_err_cnt_1;
	(* syn_preserve = "true" *) reg [7:0] sngl_bit_err_cnt_2;
	(* syn_preserve = "true" *) reg [7:0] sngl_bit_err_cnt_3;
	(* syn_preserve = "true" *) reg [7:0] multi_bit_err_cnt_1;
	(* syn_preserve = "true" *) reg [7:0] multi_bit_err_cnt_2;
	(* syn_preserve = "true" *) reg [7:0] multi_bit_err_cnt_3;
	(* syn_preserve = "true" *) reg dbl_err_det_1;
	(* syn_preserve = "true" *) reg dbl_err_det_2;
	(* syn_preserve = "true" *) reg dbl_err_det_3;
	(* syn_preserve = "true" *) reg [8*9-1:0] monout_1;
	(* syn_preserve = "true" *) reg [8*9-1:0] monout_2;
	(* syn_preserve = "true" *) reg [8*9-1:0] monout_3;
	(* syn_preserve = "true" *) reg ded_r1_1;
	(* syn_preserve = "true" *) reg ded_r1_2;
	(* syn_preserve = "true" *) reg ded_r1_3;
	(* syn_preserve = "true" *) reg sed_r1_1;
	(* syn_preserve = "true" *) reg sed_r1_2;
	(* syn_preserve = "true" *) reg sed_r1_3;
	(* syn_preserve = "true" *) reg pa_r1_1;
	(* syn_preserve = "true" *) reg pa_r1_2;
	(* syn_preserve = "true" *) reg pa_r1_3;
	(* syn_preserve = "true" *) reg la_r1_1;
	(* syn_preserve = "true" *) reg la_r1_2;
	(* syn_preserve = "true" *) reg la_r1_3;
	(* syn_preserve = "true" *) reg [23:0] far_pa_1;
	(* syn_preserve = "true" *) reg [23:0] far_pa_2;
	(* syn_preserve = "true" *) reg [23:0] far_pa_3;
	(* syn_preserve = "true" *) reg [23:0] far_la_1;
	(* syn_preserve = "true" *) reg [23:0] far_la_2;
	(* syn_preserve = "true" *) reg [23:0] far_la_3;
	(* syn_preserve = "true" *) reg load_pa_d1_1;
	(* syn_preserve = "true" *) reg load_pa_d1_2;
	(* syn_preserve = "true" *) reg load_pa_d1_3;
	(* syn_preserve = "true" *) reg load_la_d1_1;
	(* syn_preserve = "true" *) reg load_la_d1_2;
	(* syn_preserve = "true" *) reg load_la_d1_3;
	(* syn_preserve = "true" *) reg [23:0] conv_1;
	(* syn_preserve = "true" *) reg [23:0] conv_2;
	(* syn_preserve = "true" *) reg [23:0] conv_3;

	(* syn_keep = "true" *)     wire vt_csp_jtag_b_1;
	(* syn_keep = "true" *)     wire vt_csp_jtag_b_2;
	(* syn_keep = "true" *)     wire vt_csp_jtag_b_3;
	(* syn_keep = "true" *)     wire [7:0] vt_sngl_bit_err_cnt_1;
	(* syn_keep = "true" *)     wire [7:0] vt_sngl_bit_err_cnt_2;
	(* syn_keep = "true" *)     wire [7:0] vt_sngl_bit_err_cnt_3;
	(* syn_keep = "true" *)     wire [7:0] vt_multi_bit_err_cnt_1;
	(* syn_keep = "true" *)     wire [7:0] vt_multi_bit_err_cnt_2;
	(* syn_keep = "true" *)     wire [7:0] vt_multi_bit_err_cnt_3;
	(* syn_keep = "true" *)     wire vt_dbl_err_det_1;
	(* syn_keep = "true" *)     wire vt_dbl_err_det_2;
	(* syn_keep = "true" *)     wire vt_dbl_err_det_3;
	(* syn_keep = "true" *)     wire [8*9-1:0] vt_monout_1;
	(* syn_keep = "true" *)     wire [8*9-1:0] vt_monout_2;
	(* syn_keep = "true" *)     wire [8*9-1:0] vt_monout_3;
	(* syn_keep = "true" *)     wire vt_ded_r1_1;
	(* syn_keep = "true" *)     wire vt_ded_r1_2;
	(* syn_keep = "true" *)     wire vt_ded_r1_3;
	(* syn_keep = "true" *)     wire vt_sed_r1_1;
	(* syn_keep = "true" *)     wire vt_sed_r1_2;
	(* syn_keep = "true" *)     wire vt_sed_r1_3;
	(* syn_keep = "true" *)     wire vt_pa_r1_1;
	(* syn_keep = "true" *)     wire vt_pa_r1_2;
	(* syn_keep = "true" *)     wire vt_pa_r1_3;
	(* syn_keep = "true" *)     wire vt_la_r1_1;
	(* syn_keep = "true" *)     wire vt_la_r1_2;
	(* syn_keep = "true" *)     wire vt_la_r1_3;
	(* syn_keep = "true" *)     wire [23:0] vt_far_pa_1;
	(* syn_keep = "true" *)     wire [23:0] vt_far_pa_2;
	(* syn_keep = "true" *)     wire [23:0] vt_far_pa_3;
	(* syn_keep = "true" *)     wire [23:0] vt_far_la_1;
	(* syn_keep = "true" *)     wire [23:0] vt_far_la_2;
	(* syn_keep = "true" *)     wire [23:0] vt_far_la_3;
	(* syn_keep = "true" *)     wire vt_load_pa_d1_1;
	(* syn_keep = "true" *)     wire vt_load_pa_d1_2;
	(* syn_keep = "true" *)     wire vt_load_pa_d1_3;
	(* syn_keep = "true" *)     wire vt_load_la_d1_1;
	(* syn_keep = "true" *)     wire vt_load_la_d1_2;
	(* syn_keep = "true" *)     wire vt_load_la_d1_3;
	(* syn_keep = "true" *)     wire [23:0] vt_conv_1;
	(* syn_keep = "true" *)     wire [23:0] vt_conv_2;
	(* syn_keep = "true" *)     wire [23:0] vt_conv_3;

	assign vt_csp_jtag_b_1        = (csp_jtag_b_1        & csp_jtag_b_2       ) | (csp_jtag_b_2        & csp_jtag_b_3       ) | (csp_jtag_b_1        & csp_jtag_b_3       ); // Majority logic
	assign vt_csp_jtag_b_2        = (csp_jtag_b_1        & csp_jtag_b_2       ) | (csp_jtag_b_2        & csp_jtag_b_3       ) | (csp_jtag_b_1        & csp_jtag_b_3       ); // Majority logic
	assign vt_csp_jtag_b_3        = (csp_jtag_b_1        & csp_jtag_b_2       ) | (csp_jtag_b_2        & csp_jtag_b_3       ) | (csp_jtag_b_1        & csp_jtag_b_3       ); // Majority logic
	assign vt_sngl_bit_err_cnt_1  = (sngl_bit_err_cnt_1  & sngl_bit_err_cnt_2 ) | (sngl_bit_err_cnt_2  & sngl_bit_err_cnt_3 ) | (sngl_bit_err_cnt_1  & sngl_bit_err_cnt_3 ); // Majority logic
	assign vt_sngl_bit_err_cnt_2  = (sngl_bit_err_cnt_1  & sngl_bit_err_cnt_2 ) | (sngl_bit_err_cnt_2  & sngl_bit_err_cnt_3 ) | (sngl_bit_err_cnt_1  & sngl_bit_err_cnt_3 ); // Majority logic
	assign vt_sngl_bit_err_cnt_3  = (sngl_bit_err_cnt_1  & sngl_bit_err_cnt_2 ) | (sngl_bit_err_cnt_2  & sngl_bit_err_cnt_3 ) | (sngl_bit_err_cnt_1  & sngl_bit_err_cnt_3 ); // Majority logic
	assign vt_multi_bit_err_cnt_1 = (multi_bit_err_cnt_1 & multi_bit_err_cnt_2) | (multi_bit_err_cnt_2 & multi_bit_err_cnt_3) | (multi_bit_err_cnt_1 & multi_bit_err_cnt_3); // Majority logic
	assign vt_multi_bit_err_cnt_2 = (multi_bit_err_cnt_1 & multi_bit_err_cnt_2) | (multi_bit_err_cnt_2 & multi_bit_err_cnt_3) | (multi_bit_err_cnt_1 & multi_bit_err_cnt_3); // Majority logic
	assign vt_multi_bit_err_cnt_3 = (multi_bit_err_cnt_1 & multi_bit_err_cnt_2) | (multi_bit_err_cnt_2 & multi_bit_err_cnt_3) | (multi_bit_err_cnt_1 & multi_bit_err_cnt_3); // Majority logic
	assign vt_dbl_err_det_1       = (dbl_err_det_1       & dbl_err_det_2      ) | (dbl_err_det_2       & dbl_err_det_3      ) | (dbl_err_det_1       & dbl_err_det_3      ); // Majority logic
	assign vt_dbl_err_det_2       = (dbl_err_det_1       & dbl_err_det_2      ) | (dbl_err_det_2       & dbl_err_det_3      ) | (dbl_err_det_1       & dbl_err_det_3      ); // Majority logic
	assign vt_dbl_err_det_3       = (dbl_err_det_1       & dbl_err_det_2      ) | (dbl_err_det_2       & dbl_err_det_3      ) | (dbl_err_det_1       & dbl_err_det_3      ); // Majority logic
	assign vt_monout_1            = (monout_1            & monout_2           ) | (monout_2            & monout_3           ) | (monout_1            & monout_3           ); // Majority logic
	assign vt_monout_2            = (monout_1            & monout_2           ) | (monout_2            & monout_3           ) | (monout_1            & monout_3           ); // Majority logic
	assign vt_monout_3            = (monout_1            & monout_2           ) | (monout_2            & monout_3           ) | (monout_1            & monout_3           ); // Majority logic
	assign vt_ded_r1_1            = (ded_r1_1            & ded_r1_2           ) | (ded_r1_2            & ded_r1_3           ) | (ded_r1_1            & ded_r1_3           ); // Majority logic
	assign vt_ded_r1_2            = (ded_r1_1            & ded_r1_2           ) | (ded_r1_2            & ded_r1_3           ) | (ded_r1_1            & ded_r1_3           ); // Majority logic
	assign vt_ded_r1_3            = (ded_r1_1            & ded_r1_2           ) | (ded_r1_2            & ded_r1_3           ) | (ded_r1_1            & ded_r1_3           ); // Majority logic
	assign vt_sed_r1_1            = (sed_r1_1            & sed_r1_2           ) | (sed_r1_2            & sed_r1_3           ) | (sed_r1_1            & sed_r1_3           ); // Majority logic
	assign vt_sed_r1_2            = (sed_r1_1            & sed_r1_2           ) | (sed_r1_2            & sed_r1_3           ) | (sed_r1_1            & sed_r1_3           ); // Majority logic
	assign vt_sed_r1_3            = (sed_r1_1            & sed_r1_2           ) | (sed_r1_2            & sed_r1_3           ) | (sed_r1_1            & sed_r1_3           ); // Majority logic
	assign vt_pa_r1_1             = (pa_r1_1             & pa_r1_2            ) | (pa_r1_2             & pa_r1_3            ) | (pa_r1_1             & pa_r1_3            ); // Majority logic
	assign vt_pa_r1_2             = (pa_r1_1             & pa_r1_2            ) | (pa_r1_2             & pa_r1_3            ) | (pa_r1_1             & pa_r1_3            ); // Majority logic
	assign vt_pa_r1_3             = (pa_r1_1             & pa_r1_2            ) | (pa_r1_2             & pa_r1_3            ) | (pa_r1_1             & pa_r1_3            ); // Majority logic
	assign vt_la_r1_1             = (la_r1_1             & la_r1_2            ) | (la_r1_2             & la_r1_3            ) | (la_r1_1             & la_r1_3            ); // Majority logic
	assign vt_la_r1_2             = (la_r1_1             & la_r1_2            ) | (la_r1_2             & la_r1_3            ) | (la_r1_1             & la_r1_3            ); // Majority logic
	assign vt_la_r1_3             = (la_r1_1             & la_r1_2            ) | (la_r1_2             & la_r1_3            ) | (la_r1_1             & la_r1_3            ); // Majority logic
	assign vt_far_pa_1            = (far_pa_1            & far_pa_2           ) | (far_pa_2            & far_pa_3           ) | (far_pa_1            & far_pa_3           ); // Majority logic
	assign vt_far_pa_2            = (far_pa_1            & far_pa_2           ) | (far_pa_2            & far_pa_3           ) | (far_pa_1            & far_pa_3           ); // Majority logic
	assign vt_far_pa_3            = (far_pa_1            & far_pa_2           ) | (far_pa_2            & far_pa_3           ) | (far_pa_1            & far_pa_3           ); // Majority logic
	assign vt_far_la_1            = (far_la_1            & far_la_2           ) | (far_la_2            & far_la_3           ) | (far_la_1            & far_la_3           ); // Majority logic
	assign vt_far_la_2            = (far_la_1            & far_la_2           ) | (far_la_2            & far_la_3           ) | (far_la_1            & far_la_3           ); // Majority logic
	assign vt_far_la_3            = (far_la_1            & far_la_2           ) | (far_la_2            & far_la_3           ) | (far_la_1            & far_la_3           ); // Majority logic
	assign vt_load_pa_d1_1        = (load_pa_d1_1        & load_pa_d1_2       ) | (load_pa_d1_2        & load_pa_d1_3       ) | (load_pa_d1_1        & load_pa_d1_3       ); // Majority logic
	assign vt_load_pa_d1_2        = (load_pa_d1_1        & load_pa_d1_2       ) | (load_pa_d1_2        & load_pa_d1_3       ) | (load_pa_d1_1        & load_pa_d1_3       ); // Majority logic
	assign vt_load_pa_d1_3        = (load_pa_d1_1        & load_pa_d1_2       ) | (load_pa_d1_2        & load_pa_d1_3       ) | (load_pa_d1_1        & load_pa_d1_3       ); // Majority logic
	assign vt_load_la_d1_1        = (load_la_d1_1        & load_la_d1_2       ) | (load_la_d1_2        & load_la_d1_3       ) | (load_la_d1_1        & load_la_d1_3       ); // Majority logic
	assign vt_load_la_d1_2        = (load_la_d1_1        & load_la_d1_2       ) | (load_la_d1_2        & load_la_d1_3       ) | (load_la_d1_1        & load_la_d1_3       ); // Majority logic
	assign vt_load_la_d1_3        = (load_la_d1_1        & load_la_d1_2       ) | (load_la_d1_2        & load_la_d1_3       ) | (load_la_d1_1        & load_la_d1_3       ); // Majority logic
	assign vt_conv_1              = (conv_1              & conv_2             ) | (conv_2              & conv_3             ) | (conv_1              & conv_3             ); // Majority logic
	assign vt_conv_2              = (conv_1              & conv_2             ) | (conv_2              & conv_3             ) | (conv_1              & conv_3             ); // Majority logic
	assign vt_conv_3              = (conv_1              & conv_2             ) | (conv_2              & conv_3             ) | (conv_1              & conv_3             ); // Majority logic
	
	(* syn_keep = "true" *)     wire inc_dbl_cnt_1;
	(* syn_keep = "true" *)     wire inc_dbl_cnt_2;
	(* syn_keep = "true" *)     wire inc_dbl_cnt_3;
	(* syn_keep = "true" *)     wire inc_sngl_cnt_1;
	(* syn_keep = "true" *)     wire inc_sngl_cnt_2;
	(* syn_keep = "true" *)     wire inc_sngl_cnt_3;
	(* syn_keep = "true" *)     wire ded_1;
	(* syn_keep = "true" *)     wire ded_2;
	(* syn_keep = "true" *)     wire ded_3;
	(* syn_keep = "true" *)     wire sed_1;
	(* syn_keep = "true" *)     wire sed_2;
	(* syn_keep = "true" *)     wire sed_3;
	(* syn_keep = "true" *)     wire pa_1;
	(* syn_keep = "true" *)     wire pa_2;
	(* syn_keep = "true" *)     wire pa_3;
	(* syn_keep = "true" *)     wire la_1;
	(* syn_keep = "true" *)     wire la_2;
	(* syn_keep = "true" *)     wire la_3;
	(* syn_keep = "true" *)     wire load_pa_1;
	(* syn_keep = "true" *)     wire load_pa_2;
	(* syn_keep = "true" *)     wire load_pa_3;
	(* syn_keep = "true" *)     wire load_la_1;
	(* syn_keep = "true" *)     wire load_la_2;
	(* syn_keep = "true" *)     wire load_la_3;

// Logical matches for ASCII output
	assign ded_1 = (vt_monout_1[8*3-1:0] == "DED");
	assign ded_2 = (vt_monout_2[8*3-1:0] == "DED");
	assign ded_3 = (vt_monout_3[8*3-1:0] == "DED");
	assign sed_1 = (vt_monout_1[8*3-1:0] == "SED");
	assign sed_2 = (vt_monout_2[8*3-1:0] == "SED");
	assign sed_3 = (vt_monout_3[8*3-1:0] == "SED");
	assign pa_1  = (vt_monout_1[8*9-1:8*6] == "PA ");
	assign pa_2  = (vt_monout_2[8*9-1:8*6] == "PA ");
	assign pa_3  = (vt_monout_3[8*9-1:8*6] == "PA ");
	assign la_1  = (vt_monout_1[8*9-1:8*6] == "LA ");
	assign la_2  = (vt_monout_2[8*9-1:8*6] == "LA ");
	assign la_3  = (vt_monout_3[8*9-1:8*6] == "LA ");
	
// Generate single clock pulse for logical matches for ASCII output
	assign inc_dbl_cnt_1  = ded_1 & ~vt_ded_r1_1;
	assign inc_dbl_cnt_2  = ded_2 & ~vt_ded_r1_2;
	assign inc_dbl_cnt_3  = ded_3 & ~vt_ded_r1_3;
	assign inc_sngl_cnt_1 = sed_1 & ~vt_sed_r1_1;
	assign inc_sngl_cnt_2 = sed_2 & ~vt_sed_r1_2;
	assign inc_sngl_cnt_3 = sed_3 & ~vt_sed_r1_3;
	assign load_pa_1      = pa_1  & ~vt_pa_r1_1;
	assign load_pa_2      = pa_2  & ~vt_pa_r1_2;
	assign load_pa_3      = pa_3  & ~vt_pa_r1_3;
	assign load_la_1      = la_1  & ~vt_la_r1_1;
	assign load_la_2      = la_2  & ~vt_la_r1_2;
	assign load_la_3      = la_3  & ~vt_la_r1_3;

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Buffer for commands to SEM Controller                             //
//                                                                   //
///////////////////////////////////////////////////////////////////////
  sem_core_sem_mon_fifo_TMR example_mon_fifo_rx (
    .icap_clk(CLK40),
    .data_in(cmd_data),
    .data_out_i(monitor_rxdata),
    .write(send_cmd),
    .read(monitor_rxread),
    .full(fifo_unused),
    .data_present(rxempty_n)
    );

assign monitor_rxempty = !rxempty_n;

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Single bit error counter                                          //
// Multi bit error counter                                           //
//                                                                   //
///////////////////////////////////////////////////////////////////////
	always @(posedge CLK40  or posedge JTAG_RST_SEM_CNTRS) begin
		if(JTAG_RST_SEM_CNTRS) begin
			sngl_bit_err_cnt_1  <= 8'h00;
			sngl_bit_err_cnt_2  <= 8'h00;
			sngl_bit_err_cnt_3  <= 8'h00;
			multi_bit_err_cnt_1 <= 8'h00;
			multi_bit_err_cnt_2 <= 8'h00;
			multi_bit_err_cnt_3 <= 8'h00;
		end
		else begin
			sngl_bit_err_cnt_1  <= inc_sngl_cnt_1 ? vt_sngl_bit_err_cnt_1  + 1 : vt_sngl_bit_err_cnt_1;
			sngl_bit_err_cnt_2  <= inc_sngl_cnt_2 ? vt_sngl_bit_err_cnt_2  + 1 : vt_sngl_bit_err_cnt_2;
			sngl_bit_err_cnt_3  <= inc_sngl_cnt_3 ? vt_sngl_bit_err_cnt_3  + 1 : vt_sngl_bit_err_cnt_3;
			multi_bit_err_cnt_1 <= inc_dbl_cnt_1  ? vt_multi_bit_err_cnt_1 + 1 : vt_multi_bit_err_cnt_1;
			multi_bit_err_cnt_2 <= inc_dbl_cnt_2  ? vt_multi_bit_err_cnt_2 + 1 : vt_multi_bit_err_cnt_2;
			multi_bit_err_cnt_3 <= inc_dbl_cnt_3  ? vt_multi_bit_err_cnt_3 + 1 : vt_multi_bit_err_cnt_3;
		end
	end

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Convert ASCII to numeric                                          //
//                                                                   //
///////////////////////////////////////////////////////////////////////
	always @(posedge CLK40) begin
	   load_pa_d1_1  <= load_pa_1;
	   load_la_d1_1  <= load_la_1;
		conv_1[3:0]   <= vt_monout_1[6]  ? vt_monout_1[3:0]+9   : vt_monout_1[3:0];
		conv_1[7:4]   <= vt_monout_1[14] ? vt_monout_1[11:8]+9  : vt_monout_1[11:8];
		conv_1[11:8]  <= vt_monout_1[22] ? vt_monout_1[19:16]+9 : vt_monout_1[19:16];
		conv_1[15:12] <= vt_monout_1[30] ? vt_monout_1[27:24]+9 : vt_monout_1[27:24];
		conv_1[19:16] <= vt_monout_1[38] ? vt_monout_1[35:32]+9 : vt_monout_1[35:32];
		conv_1[23:20] <= vt_monout_1[46] ? vt_monout_1[43:40]+9 : vt_monout_1[43:40];
		ded_r1_1      <= ded_1;
		sed_r1_1      <= sed_1;
		pa_r1_1       <= pa_1;
		la_r1_1       <= la_1;

	   load_pa_d1_2  <= load_pa_2;
	   load_la_d1_2  <= load_la_2;
		conv_2[3:0]   <= vt_monout_2[6]  ? vt_monout_2[3:0]+9   : vt_monout_2[3:0];
		conv_2[7:4]   <= vt_monout_2[14] ? vt_monout_2[11:8]+9  : vt_monout_2[11:8];
		conv_2[11:8]  <= vt_monout_2[22] ? vt_monout_2[19:16]+9 : vt_monout_2[19:16];
		conv_2[15:12] <= vt_monout_2[30] ? vt_monout_2[27:24]+9 : vt_monout_2[27:24];
		conv_2[19:16] <= vt_monout_2[38] ? vt_monout_2[35:32]+9 : vt_monout_2[35:32];
		conv_2[23:20] <= vt_monout_2[46] ? vt_monout_2[43:40]+9 : vt_monout_2[43:40];
		ded_r1_2      <= ded_2;
		sed_r1_2      <= sed_2;
		pa_r1_2       <= pa_2;
		la_r1_2       <= la_2;

	   load_pa_d1_3  <= load_pa_3;
	   load_la_d1_3  <= load_la_3;
		conv_3[3:0]   <= vt_monout_3[6]  ? vt_monout_3[3:0]+9   : vt_monout_3[3:0];
		conv_3[7:4]   <= vt_monout_3[14] ? vt_monout_3[11:8]+9  : vt_monout_3[11:8];
		conv_3[11:8]  <= vt_monout_3[22] ? vt_monout_3[19:16]+9 : vt_monout_3[19:16];
		conv_3[15:12] <= vt_monout_3[30] ? vt_monout_3[27:24]+9 : vt_monout_3[27:24];
		conv_3[19:16] <= vt_monout_3[38] ? vt_monout_3[35:32]+9 : vt_monout_3[35:32];
		conv_3[23:20] <= vt_monout_3[46] ? vt_monout_3[43:40]+9 : vt_monout_3[43:40];
		ded_r1_3      <= ded_3;
		sed_r1_3      <= sed_3;
		pa_r1_3       <= pa_3;
		la_r1_3       <= la_3;
	end
	

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Register for frame address (FAR) in physical address (PA) format  //
// Register for frame address (FAR) in linear address (LA) format    //
// Captured from converted Monitor output                            //
// Control selection -- Chip Scope Pro or JTAG (default is JTAG)     //
// Save a 9 byte history of SEM monitor output                       //
//                                                                   //
///////////////////////////////////////////////////////////////////////
	always @(posedge CLK40 or posedge RST) begin
		if(RST) begin
			far_pa_1      <= 24'h000000;
			far_pa_2      <= 24'h000000;
			far_pa_3      <= 24'h000000;
			far_la_1      <= 24'h000000;
			far_la_2      <= 24'h000000;
			far_la_3      <= 24'h000000;
			dbl_err_det_1 <= 1'b0;
			dbl_err_det_2 <= 1'b0;
			dbl_err_det_3 <= 1'b0;
			csp_jtag_b_1  <= 1'b0;
			csp_jtag_b_2  <= 1'b0;
			csp_jtag_b_3  <= 1'b0;
			monout_1      <= "         ";
			monout_2      <= "         ";
			monout_3      <= "         ";
		end
		else begin
			far_pa_1      <= vt_load_pa_d1_1   ? vt_conv_1 : (JTAG_DED_RST ? 24'h000000 : vt_far_pa_1);
			far_pa_2      <= vt_load_pa_d1_2   ? vt_conv_2 : (JTAG_DED_RST ? 24'h000000 : vt_far_pa_2);
			far_pa_3      <= vt_load_pa_d1_3   ? vt_conv_3 : (JTAG_DED_RST ? 24'h000000 : vt_far_pa_3);
			far_la_1      <= vt_load_la_d1_1   ? vt_conv_1 : (JTAG_DED_RST ? 24'h000000 : vt_far_la_1);
			far_la_2      <= vt_load_la_d1_2   ? vt_conv_2 : (JTAG_DED_RST ? 24'h000000 : vt_far_la_2);
			far_la_3      <= vt_load_la_d1_3   ? vt_conv_3 : (JTAG_DED_RST ? 24'h000000 : vt_far_la_3);
			dbl_err_det_1 <= JTAG_DED_RST   ? 1'b0 : (inc_dbl_cnt_1  ? 1'b1 : vt_dbl_err_det_1);
			dbl_err_det_2 <= JTAG_DED_RST   ? 1'b0 : (inc_dbl_cnt_2  ? 1'b1 : vt_dbl_err_det_2);
			dbl_err_det_3 <= JTAG_DED_RST   ? 1'b0 : (inc_dbl_cnt_3  ? 1'b1 : vt_dbl_err_det_3);
			csp_jtag_b_1  <= csp_tk_ctrl    ? 1'b1 : (JTAG_TK_CTRL ? 1'b0 : vt_csp_jtag_b_1);
			csp_jtag_b_2  <= csp_tk_ctrl    ? 1'b1 : (JTAG_TK_CTRL ? 1'b0 : vt_csp_jtag_b_2);
			csp_jtag_b_3  <= csp_tk_ctrl    ? 1'b1 : (JTAG_TK_CTRL ? 1'b0 : vt_csp_jtag_b_3);
			monout_1      <= monitor_txwrite  ? {vt_monout_1[63:0],monitor_txdata} : vt_monout_1;
			monout_2      <= monitor_txwrite  ? {vt_monout_2[63:0],monitor_txdata} : vt_monout_2;
			monout_3      <= monitor_txwrite  ? {vt_monout_3[63:0],monitor_txdata} : vt_monout_3;
		end
	end

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Command source multiplexer                                        //
//                                                                   //
///////////////////////////////////////////////////////////////////////
assign cmd_data = vt_csp_jtag_b_1 ? csp_cmd_data : JTAG_CMD_DATA;
assign send_cmd = vt_csp_jtag_b_1 ? csp_send_cmd : JTAG_SEND_CMD;
	
// output for JTAG registers status	
	assign SEM_STATUS[0] = status_initialization;
	assign SEM_STATUS[1] = status_observation;
	assign SEM_STATUS[2] = status_correction;
	assign SEM_STATUS[3] = status_classification;
	assign SEM_STATUS[4] = status_injection;
	assign SEM_STATUS[5] = status_essential;
	assign SEM_STATUS[6] = status_uncorrectable;
	assign SEM_STATUS[7] = 1'b0;
	assign SEM_STATUS[8] = fecc_crcerr;
	assign SEM_STATUS[9] = vt_dbl_err_det_1;
	assign SEM_STATUS[15:10] = 6'h00;

	assign SEM_FAR_PA = vt_far_pa_1;
	assign SEM_FAR_LA = vt_far_la_1;
	assign SEM_ERRCNT[7:0]  = vt_sngl_bit_err_cnt_1;
	assign SEM_ERRCNT[15:8] = vt_multi_bit_err_cnt_1;

	assign sngl_bit_err_cnt_i  = vt_sngl_bit_err_cnt_1;
	assign multi_bit_err_cnt_i = vt_multi_bit_err_cnt_1;
	assign monout_i            = vt_monout_1;
	assign far_pa_i            = vt_far_pa_1;
	assign far_la_i            = vt_far_la_1;
	assign conv_i              = vt_conv_1;
	
	assign inc_dbl_cnt_i  = (inc_dbl_cnt_1  & inc_dbl_cnt_2 ) | (inc_dbl_cnt_2  & inc_dbl_cnt_3 ) | (inc_dbl_cnt_1  & inc_dbl_cnt_3 ); // Majority logic
	assign inc_sngl_cnt_i = (inc_sngl_cnt_1 & inc_sngl_cnt_2) | (inc_sngl_cnt_2 & inc_sngl_cnt_3) | (inc_sngl_cnt_1 & inc_sngl_cnt_3); // Majority logic
	assign ded_i          = (ded_1          & ded_2         ) | (ded_2          & ded_3         ) | (ded_1          & ded_3         ); // Majority logic
	assign sed_i          = (sed_1          & sed_2         ) | (sed_2          & sed_3         ) | (sed_1          & sed_3         ); // Majority logic
	assign pa_i           = (pa_1           & pa_2          ) | (pa_2           & pa_3          ) | (pa_1           & pa_3          ); // Majority logic
	assign la_i           = (la_1           & la_2          ) | (la_2           & la_3          ) | (la_1           & la_3          ); // Majority logic
	assign load_pa_i      = (load_pa_1      & load_pa_2     ) | (load_pa_2      & load_pa_3     ) | (load_pa_1      & load_pa_3     ); // Majority logic
	assign load_la_i      = (load_la_1      & load_la_2     ) | (load_la_2      & load_la_3     ) | (load_la_1      & load_la_3     ); // Majority logic
	
end
else 
begin : SEM_logic

	reg  csp_jtag_b;
	reg [7:0] sngl_bit_err_cnt;
	reg [7:0] multi_bit_err_cnt;
	reg dbl_err_det;
	reg [8*9-1:0] monout;
	reg ded_r1;
	reg sed_r1;
	reg pa_r1;
	reg la_r1;
	reg [23:0] far_pa;
	reg [23:0] far_la;
	reg load_pa_d1;
	reg load_la_d1;
	reg [23:0] conv;

	wire inc_dbl_cnt;
	wire inc_sngl_cnt;
	wire ded;
	wire sed;
	wire pa;
	wire la;
	wire load_pa;
	wire load_la;

	
// Logical matches for ASCII output
	assign ded = (monout[8*3-1:0] == "DED");
	assign sed = (monout[8*3-1:0] == "SED");
	assign pa  = (monout[8*9-1:8*6] == "PA ");
	assign la  = (monout[8*9-1:8*6] == "LA ");
	
// Generate single clock pulse for logical matches for ASCII output
	assign inc_dbl_cnt = ded & ~ded_r1;
	assign inc_sngl_cnt = sed & ~sed_r1;
	assign load_pa = pa & ~pa_r1;
	assign load_la = la & ~la_r1;

// One clock delay	
always @(posedge CLK40) begin
	ded_r1 <= ded;
	sed_r1 <= sed;
	pa_r1  <= pa;
	la_r1  <= la;
end


///////////////////////////////////////////////////////////////////////
//                                                                   //
// Save a 9 byte history of SEM monitor output                       //
//                                                                   //
///////////////////////////////////////////////////////////////////////
always @(posedge CLK40 or posedge RST) begin
	if(RST)
		monout <= "         ";
	else
		if(monitor_txwrite)
			monout <= {monout[63:0],monitor_txdata};
		else
			monout <= monout;
end
	

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Buffer for commands to SEM Controller                             //
//                                                                   //
///////////////////////////////////////////////////////////////////////
  sem_core_sem_mon_fifo example_mon_fifo_rx (
    .icap_clk(CLK40),
    .data_in(cmd_data),
    .data_out(monitor_rxdata),
    .write(send_cmd),
    .read(monitor_rxread),
    .full(fifo_unused),
    .data_present(rxempty_n)
    );

assign monitor_rxempty = !rxempty_n;

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Command source multiplexer                                        //
//                                                                   //
///////////////////////////////////////////////////////////////////////
assign cmd_data = csp_jtag_b ? csp_cmd_data : JTAG_CMD_DATA;
assign send_cmd = csp_jtag_b ? csp_send_cmd : JTAG_SEND_CMD;

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Control selection -- Chip Scope Pro or JTAG (default is JTAG)     //
//                                                                   //
///////////////////////////////////////////////////////////////////////
always @(posedge CLK40 or posedge RST) begin
	if(RST)
		csp_jtag_b <= 1'b0;
	else
		if(csp_tk_ctrl)
			csp_jtag_b <= 1'b1;
		else if (JTAG_TK_CTRL)
			csp_jtag_b <= 1'b0;
		else
			csp_jtag_b <= csp_jtag_b;
end

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Single bit error counter                                          //
//                                                                   //
///////////////////////////////////////////////////////////////////////
	always @(posedge CLK40  or posedge JTAG_RST_SEM_CNTRS) begin
		if(JTAG_RST_SEM_CNTRS)
			sngl_bit_err_cnt <= 8'h00;
		else
			if(inc_sngl_cnt)
				sngl_bit_err_cnt <= sngl_bit_err_cnt+1;
			else
				sngl_bit_err_cnt <= sngl_bit_err_cnt;			
	end
	
///////////////////////////////////////////////////////////////////////
//                                                                   //
// Multi bit error counter                                           //
//                                                                   //
///////////////////////////////////////////////////////////////////////
	always @(posedge CLK40  or posedge JTAG_RST_SEM_CNTRS) begin
		if(JTAG_RST_SEM_CNTRS)
			multi_bit_err_cnt <= 8'h00;
		else
			if(inc_dbl_cnt)
				multi_bit_err_cnt <= multi_bit_err_cnt+1;
			else
				multi_bit_err_cnt <= multi_bit_err_cnt;			
	end
	

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Convert ASCII to numeric                                          //
//                                                                   //
///////////////////////////////////////////////////////////////////////
	always @(posedge CLK40) begin
	   load_pa_d1 <= load_pa;
	   load_la_d1 <= load_la;
		conv[3:0]   <= monout[6]  ? monout[3:0]+9   : monout[3:0];
		conv[7:4]   <= monout[14] ? monout[11:8]+9  : monout[11:8];
		conv[11:8]  <= monout[22] ? monout[19:16]+9 : monout[19:16];
		conv[15:12] <= monout[30] ? monout[27:24]+9 : monout[27:24];
		conv[19:16] <= monout[38] ? monout[35:32]+9 : monout[35:32];
		conv[23:20] <= monout[46] ? monout[43:40]+9 : monout[43:40];
	end

///////////////////////////////////////////////////////////////////////
//                                                                   //
// Register for frame address (FAR) in physical address (PA) format  //
// Captured from converted Monitor output                            //
//                                                                   //
///////////////////////////////////////////////////////////////////////
	always @(posedge CLK40 or posedge RST) begin
		if(RST)
			far_pa <= 24'h000000;
		else
			if(load_pa_d1)
				far_pa <= conv;
			else if(JTAG_DED_RST)
				far_pa <= 24'h000000;
			else
				far_pa <= far_pa;
	end
	
///////////////////////////////////////////////////////////////////////
//                                                                   //
// Register for frame address (FAR) in linear address (LA) format    //
// Captured from converted Monitor output                            //
//                                                                   //
///////////////////////////////////////////////////////////////////////
	always @(posedge CLK40 or posedge RST) begin
		if(RST)
			far_la <= 24'h000000;
		else
			if(load_la_d1)
				far_la <= conv;
			else if(JTAG_DED_RST)
				far_la <= 24'h000000;
			else
				far_la <= far_la;
	end

	always @(posedge CLK40 or posedge RST) begin
		if(RST)
			dbl_err_det <= 1'b0;
		else
			if(JTAG_DED_RST)
				dbl_err_det <= 1'b0;
			else if(inc_dbl_cnt)
				dbl_err_det <= 1'b1;
			else
				dbl_err_det <= dbl_err_det;
	end
	
// output for JTAG registers status	
	assign SEM_STATUS[0] = status_initialization;
	assign SEM_STATUS[1] = status_observation;
	assign SEM_STATUS[2] = status_correction;
	assign SEM_STATUS[3] = status_classification;
	assign SEM_STATUS[4] = status_injection;
	assign SEM_STATUS[5] = status_essential;
	assign SEM_STATUS[6] = status_uncorrectable;
	assign SEM_STATUS[7] = 1'b0;
	assign SEM_STATUS[8] = fecc_crcerr;
	assign SEM_STATUS[9] = dbl_err_det;
	assign SEM_STATUS[15:10] = 6'h00;

	assign SEM_FAR_PA = far_pa;
	assign SEM_FAR_LA = far_la;
	assign SEM_ERRCNT[7:0]  = sngl_bit_err_cnt;
	assign SEM_ERRCNT[15:8] = multi_bit_err_cnt;

	assign sngl_bit_err_cnt_i  = sngl_bit_err_cnt;
	assign multi_bit_err_cnt_i = multi_bit_err_cnt;
	assign monout_i            = monout;
	assign far_pa_i            = far_pa;
	assign far_la_i            = far_la;
	assign conv_i              = conv;
	
	assign inc_dbl_cnt_i  = inc_dbl_cnt;
	assign inc_sngl_cnt_i = inc_sngl_cnt;
	assign ded_i          = ded;
	assign sed_i          = sed;
	assign pa_i           = pa;
	assign la_i           = la;
	assign load_pa_i      = load_pa;
	assign load_la_i      = load_la;
	
end
endgenerate


endmodule
