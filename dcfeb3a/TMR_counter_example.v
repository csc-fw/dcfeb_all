	(* syn_preserve = "true" *) reg [11:0] bc0cnt_1;
	(* syn_preserve = "true" *) reg [11:0] bc0cnt_2;
	(* syn_preserve = "true" *) reg [11:0] bc0cnt_3;
	(* syn_preserve = "true" *) reg bc0_1;
	(* syn_preserve = "true" *) reg bc0_2;
	(* syn_preserve = "true" *) reg bc0_3;
	
	(* syn_keep = "true" *) wire vt_bc0cnt_1;
	(* syn_keep = "true" *) wire vt_bc0cnt_2;
	(* syn_keep = "true" *) wire vt_bc0cnt_3;
	(* syn_keep = "true" *) wire vt_bc0_1;
	(* syn_keep = "true" *) wire vt_bc0_2;
	(* syn_keep = "true" *) wire vt_bc0_3;

	assign vt_bc0cnt_1    = (bc0cnt_1    & bc0cnt_2   ) | (bc0cnt_2    & bc0cnt_3   ) | (bc0cnt_1    & bc0cnt_3   ); // Majority logic
	assign vt_bc0cnt_2    = (bc0cnt_1    & bc0cnt_2   ) | (bc0cnt_2    & bc0cnt_3   ) | (bc0cnt_1    & bc0cnt_3   ); // Majority logic
	assign vt_bc0cnt_3    = (bc0cnt_1    & bc0cnt_2   ) | (bc0cnt_2    & bc0cnt_3   ) | (bc0cnt_1    & bc0cnt_3   ); // Majority logic
	assign vt_bc0_1       = (bc0_1       & bc0_2      ) | (bc0_2       & bc0_3      ) | (bc0_1       & bc0_3      ); // Majority logic
	assign vt_bc0_2       = (bc0_1       & bc0_2      ) | (bc0_2       & bc0_3      ) | (bc0_1       & bc0_3      ); // Majority logic
	assign vt_bc0_3       = (bc0_1       & bc0_2      ) | (bc0_2       & bc0_3      ) | (bc0_1       & bc0_3      ); // Majority logic

	assign BC0CNT    = vt_bc0cnt_1;

	
	always @(posedge CLK40 or posedge RST_RESYNC) begin
		if(RST_RESYNC) begin
			bc0cnt_1 <= 12'h000;
			bc0cnt_2 <= 12'h000;
			bc0cnt_3 <= 12'h000;
		end
		else begin
			if(vt_bc0_1)
				bc0cnt_1 <= vt_bc0cnt_1 + 1
			else 
				bc0cnt_1 <= vt_bc0cnt_1;
			//
			if(vt_bc0_2)
				bc0cnt_2 <= vt_bc0cnt_2 + 1
			else 
				bc0cnt_2 <= vt_bc0cnt_2;
			//
			if(vt_bc0_3)
				bc0cnt_3 <= vt_bc0cnt_3 + 1
			else 
				bc0cnt_3 <= vt_bc0cnt_3;
		end
	end
	