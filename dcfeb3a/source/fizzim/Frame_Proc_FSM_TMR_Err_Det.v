
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:34:13 (www.fizzim.com)

module Frame_Proc_FSM_TMR_Err_Det (
  output CLR_CRC,
  output CRC_DV,
  output wire [2:0] ROM_ADDR,
  output TX_ACK,
  output wire [3:0] FRM_STATE,
  output wire [15:0] TMR_ERR_COUNT,
  input CLK,
  input RST,
  input VALID 
);

  // state bits
  parameter 
  Idle       = 4'b0000, 
  CRC        = 4'b0001, 
  Data       = 4'b0010, 
  EOP        = 4'b0011, 
  Preamble_1 = 4'b0100, 
  Preamble_2 = 4'b0101, 
  Preamble_3 = 4'b0110, 
  SOF_TX_Ack = 4'b0111, 
  SOP        = 4'b1000, 
  Strt_Data  = 4'b1001; 

  (* syn_preserve = "true" *) reg [3:0] state_1;
  (* syn_preserve = "true" *) reg [3:0] state_2;
  (* syn_preserve = "true" *) reg [3:0] state_3;

  (* syn_keep = "true" *) wire [3:0] voted_state_1;
  (* syn_keep = "true" *) wire [3:0] voted_state_2;
  (* syn_keep = "true" *) wire [3:0] voted_state_3;

  (* syn_keep = "true" *) wire err_det_state_1;
  (* syn_keep = "true" *) wire err_det_state_2;
  (* syn_keep = "true" *) wire err_det_state_3;

  (* syn_preserve = "true" *) reg [15:0] ed_cnt_1;
  (* syn_preserve = "true" *) reg [15:0] ed_cnt_2;
  (* syn_preserve = "true" *) reg [15:0] ed_cnt_3;

  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_1;
  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_2;
  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_3;

  assign voted_state_1    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_2    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_3    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic

  assign err_det_state_1    = |(~((~state_1    & ~state_2    & ~state_3   ) | (state_1    & state_2    & state_3   ))); // error detection logic
  assign err_det_state_2    = |(~((~state_1    & ~state_2    & ~state_3   ) | (state_1    & state_2    & state_3   ))); // error detection logic
  assign err_det_state_3    = |(~((~state_1    & ~state_2    & ~state_3   ) | (state_1    & state_2    & state_3   ))); // error detection logic

  assign voted_ed_cnt_1   = (ed_cnt_1   & ed_cnt_2  ) | (ed_cnt_2   & ed_cnt_3  ) | (ed_cnt_1   & ed_cnt_3  ); // Majority logic
  assign voted_ed_cnt_2   = (ed_cnt_1   & ed_cnt_2  ) | (ed_cnt_2   & ed_cnt_3  ) | (ed_cnt_1   & ed_cnt_3  ); // Majority logic
  assign voted_ed_cnt_3   = (ed_cnt_1   & ed_cnt_2  ) | (ed_cnt_2   & ed_cnt_3  ) | (ed_cnt_1   & ed_cnt_3  ); // Majority logic

  assign FRM_STATE = voted_state_1;
  assign TMR_ERR_COUNT = voted_ed_cnt_1;

  (* syn_keep = "true" *) reg [3:0] nextstate_1;
  (* syn_keep = "true" *) reg [3:0] nextstate_2;
  (* syn_keep = "true" *) reg [3:0] nextstate_3;

  (* syn_preserve = "true" *)  reg CLR_CRC_1;
  (* syn_preserve = "true" *)  reg CLR_CRC_2;
  (* syn_preserve = "true" *)  reg CLR_CRC_3;
  (* syn_preserve = "true" *)  reg CRC_DV_1;
  (* syn_preserve = "true" *)  reg CRC_DV_2;
  (* syn_preserve = "true" *)  reg CRC_DV_3;
  (* syn_preserve = "true" *)  reg [2:0] ROM_ADDR_1;
  (* syn_preserve = "true" *)  reg [2:0] ROM_ADDR_2;
  (* syn_preserve = "true" *)  reg [2:0] ROM_ADDR_3;
  (* syn_preserve = "true" *)  reg TX_ACK_1;
  (* syn_preserve = "true" *)  reg TX_ACK_2;
  (* syn_preserve = "true" *)  reg TX_ACK_3;
  (* syn_preserve = "true" *)  reg [2:0] addr_1;
  (* syn_preserve = "true" *)  reg [2:0] addr_2;
  (* syn_preserve = "true" *)  reg [2:0] addr_3;
  (* syn_keep = "true" *)      wire [2:0] voted_addr_1;
  (* syn_keep = "true" *)      wire [2:0] voted_addr_2;
  (* syn_keep = "true" *)      wire [2:0] voted_addr_3;
  (* syn_keep = "true" *)  wire err_det_CLR_CRC_1;
  (* syn_keep = "true" *)  wire err_det_CLR_CRC_2;
  (* syn_keep = "true" *)  wire err_det_CLR_CRC_3;
  (* syn_keep = "true" *)  wire err_det_CRC_DV_1;
  (* syn_keep = "true" *)  wire err_det_CRC_DV_2;
  (* syn_keep = "true" *)  wire err_det_CRC_DV_3;
  (* syn_keep = "true" *)  wire err_det_ROM_ADDR_1;
  (* syn_keep = "true" *)  wire err_det_ROM_ADDR_2;
  (* syn_keep = "true" *)  wire err_det_ROM_ADDR_3;
  (* syn_keep = "true" *)  wire err_det_TX_ACK_1;
  (* syn_keep = "true" *)  wire err_det_TX_ACK_2;
  (* syn_keep = "true" *)  wire err_det_TX_ACK_3;
  (* syn_keep = "true" *)  wire err_det_addr_1;
  (* syn_keep = "true" *)  wire err_det_addr_2;
  (* syn_keep = "true" *)  wire err_det_addr_3;
  (* syn_keep = "true" *)  wire err_det_1;
  (* syn_keep = "true" *)  wire err_det_2;
  (* syn_keep = "true" *)  wire err_det_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign CLR_CRC  = (CLR_CRC_1  & CLR_CRC_2 ) | (CLR_CRC_2  & CLR_CRC_3 ) | (CLR_CRC_1  & CLR_CRC_3 ); // Majority logic
  assign CRC_DV   = (CRC_DV_1   & CRC_DV_2  ) | (CRC_DV_2   & CRC_DV_3  ) | (CRC_DV_1   & CRC_DV_3  ); // Majority logic
  assign ROM_ADDR = (ROM_ADDR_1 & ROM_ADDR_2) | (ROM_ADDR_2 & ROM_ADDR_3) | (ROM_ADDR_1 & ROM_ADDR_3); // Majority logic
  assign TX_ACK   = (TX_ACK_1   & TX_ACK_2  ) | (TX_ACK_2   & TX_ACK_3  ) | (TX_ACK_1   & TX_ACK_3  ); // Majority logic
  assign voted_addr_1     = (addr_1     & addr_2    ) | (addr_2     & addr_3    ) | (addr_1     & addr_3    ); // Majority logic
  assign voted_addr_2     = (addr_1     & addr_2    ) | (addr_2     & addr_3    ) | (addr_1     & addr_3    ); // Majority logic
  assign voted_addr_3     = (addr_1     & addr_2    ) | (addr_2     & addr_3    ) | (addr_1     & addr_3    ); // Majority logic

  // Assignment of error detection logic to replicated signals
  assign err_det_CLR_CRC_1  =  (~((~CLR_CRC_1  & ~CLR_CRC_2  & ~CLR_CRC_3 ) | (CLR_CRC_1  & CLR_CRC_2  & CLR_CRC_3 ))); // error detection logic
  assign err_det_CLR_CRC_2  =  (~((~CLR_CRC_1  & ~CLR_CRC_2  & ~CLR_CRC_3 ) | (CLR_CRC_1  & CLR_CRC_2  & CLR_CRC_3 ))); // error detection logic
  assign err_det_CLR_CRC_3  =  (~((~CLR_CRC_1  & ~CLR_CRC_2  & ~CLR_CRC_3 ) | (CLR_CRC_1  & CLR_CRC_2  & CLR_CRC_3 ))); // error detection logic
  assign err_det_CRC_DV_1   =  (~((~CRC_DV_1   & ~CRC_DV_2   & ~CRC_DV_3  ) | (CRC_DV_1   & CRC_DV_2   & CRC_DV_3  ))); // error detection logic
  assign err_det_CRC_DV_2   =  (~((~CRC_DV_1   & ~CRC_DV_2   & ~CRC_DV_3  ) | (CRC_DV_1   & CRC_DV_2   & CRC_DV_3  ))); // error detection logic
  assign err_det_CRC_DV_3   =  (~((~CRC_DV_1   & ~CRC_DV_2   & ~CRC_DV_3  ) | (CRC_DV_1   & CRC_DV_2   & CRC_DV_3  ))); // error detection logic
  assign err_det_ROM_ADDR_1 = |(~((~ROM_ADDR_1 & ~ROM_ADDR_2 & ~ROM_ADDR_3) | (ROM_ADDR_1 & ROM_ADDR_2 & ROM_ADDR_3))); // error detection logic
  assign err_det_ROM_ADDR_2 = |(~((~ROM_ADDR_1 & ~ROM_ADDR_2 & ~ROM_ADDR_3) | (ROM_ADDR_1 & ROM_ADDR_2 & ROM_ADDR_3))); // error detection logic
  assign err_det_ROM_ADDR_3 = |(~((~ROM_ADDR_1 & ~ROM_ADDR_2 & ~ROM_ADDR_3) | (ROM_ADDR_1 & ROM_ADDR_2 & ROM_ADDR_3))); // error detection logic
  assign err_det_TX_ACK_1   =  (~((~TX_ACK_1   & ~TX_ACK_2   & ~TX_ACK_3  ) | (TX_ACK_1   & TX_ACK_2   & TX_ACK_3  ))); // error detection logic
  assign err_det_TX_ACK_2   =  (~((~TX_ACK_1   & ~TX_ACK_2   & ~TX_ACK_3  ) | (TX_ACK_1   & TX_ACK_2   & TX_ACK_3  ))); // error detection logic
  assign err_det_TX_ACK_3   =  (~((~TX_ACK_1   & ~TX_ACK_2   & ~TX_ACK_3  ) | (TX_ACK_1   & TX_ACK_2   & TX_ACK_3  ))); // error detection logic
  assign err_det_addr_1     = |(~((~addr_1     & ~addr_2     & ~addr_3    ) | (addr_1     & addr_2     & addr_3    ))); // error detection logic
  assign err_det_addr_2     = |(~((~addr_1     & ~addr_2     & ~addr_3    ) | (addr_1     & addr_2     & addr_3    ))); // error detection logic
  assign err_det_addr_3     = |(~((~addr_1     & ~addr_2     & ~addr_3    ) | (addr_1     & addr_2     & addr_3    ))); // error detection logic


  // Assign 'OR' of all error detection signals
  assign err_det_1 = err_det_state_1   | err_det_CLR_CRC_1   | err_det_CRC_DV_1   | err_det_ROM_ADDR_1   | err_det_TX_ACK_1   | err_det_addr_1  ;
  assign err_det_2 = err_det_state_2   | err_det_CLR_CRC_2   | err_det_CRC_DV_2   | err_det_ROM_ADDR_2   | err_det_TX_ACK_2   | err_det_addr_2  ;
  assign err_det_3 = err_det_state_3   | err_det_CLR_CRC_3   | err_det_CRC_DV_3   | err_det_ROM_ADDR_3   | err_det_TX_ACK_3   | err_det_addr_3  ;

  // comb always block
  always @* begin
    nextstate_1 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_2 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_3 = 4'bxxxx; // default to x because default_state_is_x is set
    ROM_ADDR_1 = voted_addr_1; // default
    ROM_ADDR_2 = voted_addr_2; // default
    ROM_ADDR_3 = voted_addr_3; // default
    case (voted_state_1)
      Idle      : if (VALID)                 nextstate_1 = SOP;
                  else                       nextstate_1 = Idle;
      CRC       :                            nextstate_1 = EOP;
      Data      : if (!VALID)                nextstate_1 = CRC;
                  else                       nextstate_1 = Data;
      EOP       : if (voted_addr_1 == 3'd6)  nextstate_1 = Idle;
                  else                       nextstate_1 = EOP;
      Preamble_1:                            nextstate_1 = Preamble_2;
      Preamble_2:                            nextstate_1 = Preamble_3;
      Preamble_3:                            nextstate_1 = SOF_TX_Ack;
      SOF_TX_Ack:                            nextstate_1 = Strt_Data;
      SOP       :                            nextstate_1 = Preamble_1;
      Strt_Data :                            nextstate_1 = Data;
    endcase
    case (voted_state_2)
      Idle      : if (VALID)                 nextstate_2 = SOP;
                  else                       nextstate_2 = Idle;
      CRC       :                            nextstate_2 = EOP;
      Data      : if (!VALID)                nextstate_2 = CRC;
                  else                       nextstate_2 = Data;
      EOP       : if (voted_addr_2 == 3'd6)  nextstate_2 = Idle;
                  else                       nextstate_2 = EOP;
      Preamble_1:                            nextstate_2 = Preamble_2;
      Preamble_2:                            nextstate_2 = Preamble_3;
      Preamble_3:                            nextstate_2 = SOF_TX_Ack;
      SOF_TX_Ack:                            nextstate_2 = Strt_Data;
      SOP       :                            nextstate_2 = Preamble_1;
      Strt_Data :                            nextstate_2 = Data;
    endcase
    case (voted_state_3)
      Idle      : if (VALID)                 nextstate_3 = SOP;
                  else                       nextstate_3 = Idle;
      CRC       :                            nextstate_3 = EOP;
      Data      : if (!VALID)                nextstate_3 = CRC;
                  else                       nextstate_3 = Data;
      EOP       : if (voted_addr_3 == 3'd6)  nextstate_3 = Idle;
                  else                       nextstate_3 = EOP;
      Preamble_1:                            nextstate_3 = Preamble_2;
      Preamble_2:                            nextstate_3 = Preamble_3;
      Preamble_3:                            nextstate_3 = SOF_TX_Ack;
      SOF_TX_Ack:                            nextstate_3 = Strt_Data;
      SOP       :                            nextstate_3 = Preamble_1;
      Strt_Data :                            nextstate_3 = Data;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= Idle;
      state_2 <= Idle;
      state_3 <= Idle;
      ed_cnt_1 <= 0;
      ed_cnt_2 <= 0;
      ed_cnt_3 <= 0;
    end
    else begin
      state_1 <= nextstate_1;
      state_2 <= nextstate_2;
      state_3 <= nextstate_3;
      ed_cnt_1 <= err_det_1 ? voted_ed_cnt_1 + 1 : voted_ed_cnt_1;
      ed_cnt_2 <= err_det_2 ? voted_ed_cnt_2 + 1 : voted_ed_cnt_2;
      ed_cnt_3 <= err_det_3 ? voted_ed_cnt_3 + 1 : voted_ed_cnt_3;
    end
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      CLR_CRC_1 <= 0;
      CLR_CRC_2 <= 0;
      CLR_CRC_3 <= 0;
      CRC_DV_1 <= 0;
      CRC_DV_2 <= 0;
      CRC_DV_3 <= 0;
      TX_ACK_1 <= 0;
      TX_ACK_2 <= 0;
      TX_ACK_3 <= 0;
      addr_1 <= 3'd0;
      addr_2 <= 3'd0;
      addr_3 <= 3'd0;
    end
    else begin
      CLR_CRC_1 <= 0; // default
      CLR_CRC_2 <= 0; // default
      CLR_CRC_3 <= 0; // default
      CRC_DV_1 <= 0; // default
      CRC_DV_2 <= 0; // default
      CRC_DV_3 <= 0; // default
      TX_ACK_1 <= 0; // default
      TX_ACK_2 <= 0; // default
      TX_ACK_3 <= 0; // default
      addr_1 <= 3'd0; // default
      addr_2 <= 3'd0; // default
      addr_3 <= 3'd0; // default
      case (nextstate_1)
        CRC       :        addr_1 <= voted_addr_1;
        Data      : begin
                           CRC_DV_1 <= 1;
                           addr_1 <= voted_addr_1;
        end
        EOP       :        addr_1 <= voted_addr_1 + 1;
        Preamble_1: begin
                           CLR_CRC_1 <= 1;
                           addr_1 <= voted_addr_1 + 1;
        end
        Preamble_2: begin
                           CLR_CRC_1 <= 1;
                           addr_1 <= voted_addr_1;
        end
        Preamble_3: begin
                           CLR_CRC_1 <= 1;
                           addr_1 <= voted_addr_1;
        end
        SOF_TX_Ack: begin
                           CLR_CRC_1 <= 1;
                           TX_ACK_1 <= 1;
                           addr_1 <= voted_addr_1 + 1;
        end
        SOP       : begin
                           CLR_CRC_1 <= 1;
                           addr_1 <= voted_addr_1 + 1;
        end
        Strt_Data : begin
                           CRC_DV_1 <= 1;
                           addr_1 <= voted_addr_1 + 1;
        end
      endcase
      case (nextstate_2)
        CRC       :        addr_2 <= voted_addr_2;
        Data      : begin
                           CRC_DV_2 <= 1;
                           addr_2 <= voted_addr_2;
        end
        EOP       :        addr_2 <= voted_addr_2 + 1;
        Preamble_1: begin
                           CLR_CRC_2 <= 1;
                           addr_2 <= voted_addr_2 + 1;
        end
        Preamble_2: begin
                           CLR_CRC_2 <= 1;
                           addr_2 <= voted_addr_2;
        end
        Preamble_3: begin
                           CLR_CRC_2 <= 1;
                           addr_2 <= voted_addr_2;
        end
        SOF_TX_Ack: begin
                           CLR_CRC_2 <= 1;
                           TX_ACK_2 <= 1;
                           addr_2 <= voted_addr_2 + 1;
        end
        SOP       : begin
                           CLR_CRC_2 <= 1;
                           addr_2 <= voted_addr_2 + 1;
        end
        Strt_Data : begin
                           CRC_DV_2 <= 1;
                           addr_2 <= voted_addr_2 + 1;
        end
      endcase
      case (nextstate_3)
        CRC       :        addr_3 <= voted_addr_3;
        Data      : begin
                           CRC_DV_3 <= 1;
                           addr_3 <= voted_addr_3;
        end
        EOP       :        addr_3 <= voted_addr_3 + 1;
        Preamble_1: begin
                           CLR_CRC_3 <= 1;
                           addr_3 <= voted_addr_3 + 1;
        end
        Preamble_2: begin
                           CLR_CRC_3 <= 1;
                           addr_3 <= voted_addr_3;
        end
        Preamble_3: begin
                           CLR_CRC_3 <= 1;
                           addr_3 <= voted_addr_3;
        end
        SOF_TX_Ack: begin
                           CLR_CRC_3 <= 1;
                           TX_ACK_3 <= 1;
                           addr_3 <= voted_addr_3 + 1;
        end
        SOP       : begin
                           CLR_CRC_3 <= 1;
                           addr_3 <= voted_addr_3 + 1;
        end
        Strt_Data : begin
                           CRC_DV_3 <= 1;
                           addr_3 <= voted_addr_3 + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [79:0] statename;
  always @* begin
    case (state_1)
      Idle      : statename = "Idle";
      CRC       : statename = "CRC";
      Data      : statename = "Data";
      EOP       : statename = "EOP";
      Preamble_1: statename = "Preamble_1";
      Preamble_2: statename = "Preamble_2";
      Preamble_3: statename = "Preamble_3";
      SOF_TX_Ack: statename = "SOF_TX_Ack";
      SOP       : statename = "SOP";
      Strt_Data : statename = "Strt_Data";
      default   : statename = "XXXXXXXXXX";
    endcase
  end
  `endif

endmodule

