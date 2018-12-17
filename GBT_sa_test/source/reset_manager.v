`timescale 1ns / 1ps


module reset_manager #(
	parameter Strt_dly = 20'h7FFFF,
	parameter POR_tmo = 7'd120
)(
    input STUP_CLK,
    input CLK,
    input EOS,
    input DAQ_MMCM_LOCK,
    input QP_ERROR,
    input QP_LOCKED,
	 
    output MMCM_RST,
    output SYS_RST,
	 output RUN,
	 output V15GBT_ENA
    );

wire por_i;  
wire run_i;  


wire qpll_error;
wire qpll_lock;
wire  ena_gbt;
assign ena_gbt = 1'b1;

 IBUF IBUF_QP_ERROR (.O(qpll_error),.I(QP_ERROR));
 IBUF IBUF_QP_LOCKED (.O(qpll_lock),.I(QP_LOCKED));
 OBUF #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) OBUF_GBT_ENA (.O(V15GBT_ENA),.I(ena_gbt));



	reg daq_mmcm_lock_r1;
	reg daq_mmcm_lock_r2;
	reg qpll_lock_r1;
	reg qpll_lock_r2;
	reg por_r1;  
	reg por_r2;  
	reg run_r1;
	reg run_r2;

	assign SYS_RST      = por_r2;
	assign RUN          = run_r2;

		
	// Synchronize inputs to startup clock for POR state machine

	always @(posedge STUP_CLK) begin
		daq_mmcm_lock_r1 <= DAQ_MMCM_LOCK;
		qpll_lock_r1     <= qpll_lock;
		
		daq_mmcm_lock_r2 <= daq_mmcm_lock_r1;
		qpll_lock_r2     <= qpll_lock_r1;
	end

	// Synchronize outputs to 40MHz clock 

	always @(posedge CLK or negedge EOS) begin
		if(!EOS) begin
			por_r1           <= 1'b1;
			run_r1           <= 1'b0;
			por_r2           <= 1'b1;
			run_r2           <= 1'b0;
		end
		else begin
			por_r1           <= por_i;
			run_r1           <= run_i;
			
			por_r2           <= por_r1;
			run_r2           <= run_r1;
		end
	end




	Pow_on_Rst_FSM #(
			.Strt_dly(Strt_dly),
			.POR_tmo(POR_tmo)
	)
	POW_on_Reset_FSM_gbtx_sa_test_i (
		 // Outputs
		.MMCM_RST(MMCM_RST),
		.POR(por_i),
		.RUN(run_i),
		// Inputs
		.CLK(STUP_CLK),
		.EOS(EOS),
		.MMCM_LOCK(daq_mmcm_lock_r2),
		.QPLL_LOCK(qpll_lock_r2)
	);
													 

endmodule
