reg cew0_r1;
reg cew1_r1;
reg cew2_r1;
reg cew3_r1;
reg link_err_r1;
wire ce_pipes;
reg [7:0] link_err_pipe;
reg [79:0] mon_pipe;
reg [79:0] cew_pipe;
reg [39:0] rx_tbl_pipe;
reg [19:0] rx_sync_pipe;
reg [47:0] data_pipe_0;
reg [47:0] data_pipe_1;
reg [47:0] data_pipe_2;
reg [47:0] data_pipe_3;
reg [47:0] data_pipe_4;

	assign ce_pipes = ~link_err_pipe[7];  //keeps clock enable for two 40MHz clocks after err

	always @(posedge CMP_RX_CLK160) begin
	   cew0_r1 <= CEW0;
	   cew1_r1 <= CEW1;
	   cew2_r1 <= CEW2;
	   cew3_r1 <= CEW3;
		link_err_pipe <= {link_err_pipe[7:1],link_err};
		if(ce_pipes) begin
			mon_pipe <= {mon_pipe[79:4],mon_in};
			cew_pipe <= {cew_pipe[79:4],cew3_r1,cew2_r1,cew1_r1,cew0_r1};
			rx_tbl_pipe <= {rx_tbl_pipe[39:2],cmp_rx_notintable[1,0]};
			rx_sync_pipe <= {rx_sync_pipe[19:1],cmp_rx_lossofsync[1]};
		end
		if(ce_pipes && CEW0) begin
			data_pipe_0 <= RCV_DATA;
			data_pipe_1 <= data_pipe_0;
			data_pipe_2 <= data_pipe_1;
			data_pipe_3 <= data_pipe_2;
			data_pipe_4 <= data_pipe_3;
		end
	end
