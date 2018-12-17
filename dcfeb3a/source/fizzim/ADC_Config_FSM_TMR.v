
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 15:30:03 (www.fizzim.com)

module ADC_Config_FSM_TMR 
  #(
    parameter Last_Addr = 5'h10
  )(
  output wire [4:0] ADR,
  output DONE,
  output LOAD,
  output SCKEN,
  output SHEN,
  input CLK,
  input INIT,
  input RST 
);

  // state bits
  parameter 
  Idle         = 3'b000, 
  Done         = 3'b001, 
  End_Seq      = 3'b010, 
  Incr_Addr    = 3'b011, 
  Load         = 3'b100, 
  Shift_Enable = 3'b101, 
  Start_Seq    = 3'b110; 

  (* syn_preserve = "true" *) reg [2:0] state_1;
  (* syn_preserve = "true" *) reg [2:0] state_2;
  (* syn_preserve = "true" *) reg [2:0] state_3;

  (* syn_keep = "true" *) wire [2:0] voted_state_1;
  (* syn_keep = "true" *) wire [2:0] voted_state_2;
  (* syn_keep = "true" *) wire [2:0] voted_state_3;

  assign voted_state_1 = (state_1 & state_2) | (state_2 & state_3) | (state_1 & state_3); // Majority logic
  assign voted_state_2 = (state_1 & state_2) | (state_2 & state_3) | (state_1 & state_3); // Majority logic
  assign voted_state_3 = (state_1 & state_2) | (state_2 & state_3) | (state_1 & state_3); // Majority logic

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg [4:0] ADR_1;
  (* syn_preserve = "true" *)  reg [4:0] ADR_2;
  (* syn_preserve = "true" *)  reg [4:0] ADR_3;
  (* syn_preserve = "true" *)  reg DONE_1;
  (* syn_preserve = "true" *)  reg DONE_2;
  (* syn_preserve = "true" *)  reg DONE_3;
  (* syn_preserve = "true" *)  reg LOAD_1;
  (* syn_preserve = "true" *)  reg LOAD_2;
  (* syn_preserve = "true" *)  reg LOAD_3;
  (* syn_preserve = "true" *)  reg SCKEN_1;
  (* syn_preserve = "true" *)  reg SCKEN_2;
  (* syn_preserve = "true" *)  reg SCKEN_3;
  (* syn_preserve = "true" *)  reg SHEN_1;
  (* syn_preserve = "true" *)  reg SHEN_2;
  (* syn_preserve = "true" *)  reg SHEN_3;
  (* syn_preserve = "true" *)  reg [4:0] addr_1;
  (* syn_preserve = "true" *)  reg [4:0] addr_2;
  (* syn_preserve = "true" *)  reg [4:0] addr_3;
  (* syn_keep = "true" *)      wire [4:0] voted_addr_1;
  (* syn_keep = "true" *)      wire [4:0] voted_addr_2;
  (* syn_keep = "true" *)      wire [4:0] voted_addr_3;
  (* syn_preserve = "true" *)  reg [5:0] scntr_1;
  (* syn_preserve = "true" *)  reg [5:0] scntr_2;
  (* syn_preserve = "true" *)  reg [5:0] scntr_3;
  (* syn_keep = "true" *)      wire [5:0] voted_scntr_1;
  (* syn_keep = "true" *)      wire [5:0] voted_scntr_2;
  (* syn_keep = "true" *)      wire [5:0] voted_scntr_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign ADR   = (ADR_1   & ADR_2  ) | (ADR_2   & ADR_3  ) | (ADR_1   & ADR_3  ); // Majority logic
  assign DONE  = (DONE_1  & DONE_2 ) | (DONE_2  & DONE_3 ) | (DONE_1  & DONE_3 ); // Majority logic
  assign LOAD  = (LOAD_1  & LOAD_2 ) | (LOAD_2  & LOAD_3 ) | (LOAD_1  & LOAD_3 ); // Majority logic
  assign SCKEN = (SCKEN_1 & SCKEN_2) | (SCKEN_2 & SCKEN_3) | (SCKEN_1 & SCKEN_3); // Majority logic
  assign SHEN  = (SHEN_1  & SHEN_2 ) | (SHEN_2  & SHEN_3 ) | (SHEN_1  & SHEN_3 ); // Majority logic
  assign voted_addr_1  = (addr_1  & addr_2 ) | (addr_2  & addr_3 ) | (addr_1  & addr_3 ); // Majority logic
  assign voted_addr_2  = (addr_1  & addr_2 ) | (addr_2  & addr_3 ) | (addr_1  & addr_3 ); // Majority logic
  assign voted_addr_3  = (addr_1  & addr_2 ) | (addr_2  & addr_3 ) | (addr_1  & addr_3 ); // Majority logic
  assign voted_scntr_1 = (scntr_1 & scntr_2) | (scntr_2 & scntr_3) | (scntr_1 & scntr_3); // Majority logic
  assign voted_scntr_2 = (scntr_1 & scntr_2) | (scntr_2 & scntr_3) | (scntr_1 & scntr_3); // Majority logic
  assign voted_scntr_3 = (scntr_1 & scntr_2) | (scntr_2 & scntr_3) | (scntr_1 & scntr_3); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    ADR_1 = voted_addr_1; // default
    ADR_2 = voted_addr_2; // default
    ADR_3 = voted_addr_3; // default
    case (voted_state_1)
      Idle        : if      (INIT)                                                     nextstate_1 = Start_Seq;
                    else                                                               nextstate_1 = Idle;
      Done        : if      (~INIT)                                                    nextstate_1 = Idle;
                    else                                                               nextstate_1 = Done;
      End_Seq     :                                                                    nextstate_1 = Done;
      Incr_Addr   :                                                                    nextstate_1 = Load;
      Load        :                                                                    nextstate_1 = Shift_Enable;
      Shift_Enable: if      ((voted_scntr_1 == 6'd46) && (voted_addr_1 == Last_Addr))  nextstate_1 = End_Seq;
                    else if ((voted_scntr_1 == 6'd46) && (voted_addr_1 < Last_Addr))   nextstate_1 = Incr_Addr;
                    else                                                               nextstate_1 = Shift_Enable;
      Start_Seq   :                                                                    nextstate_1 = Shift_Enable;
    endcase
    case (voted_state_2)
      Idle        : if      (INIT)                                                     nextstate_2 = Start_Seq;
                    else                                                               nextstate_2 = Idle;
      Done        : if      (~INIT)                                                    nextstate_2 = Idle;
                    else                                                               nextstate_2 = Done;
      End_Seq     :                                                                    nextstate_2 = Done;
      Incr_Addr   :                                                                    nextstate_2 = Load;
      Load        :                                                                    nextstate_2 = Shift_Enable;
      Shift_Enable: if      ((voted_scntr_2 == 6'd46) && (voted_addr_2 == Last_Addr))  nextstate_2 = End_Seq;
                    else if ((voted_scntr_2 == 6'd46) && (voted_addr_2 < Last_Addr))   nextstate_2 = Incr_Addr;
                    else                                                               nextstate_2 = Shift_Enable;
      Start_Seq   :                                                                    nextstate_2 = Shift_Enable;
    endcase
    case (voted_state_3)
      Idle        : if      (INIT)                                                     nextstate_3 = Start_Seq;
                    else                                                               nextstate_3 = Idle;
      Done        : if      (~INIT)                                                    nextstate_3 = Idle;
                    else                                                               nextstate_3 = Done;
      End_Seq     :                                                                    nextstate_3 = Done;
      Incr_Addr   :                                                                    nextstate_3 = Load;
      Load        :                                                                    nextstate_3 = Shift_Enable;
      Shift_Enable: if      ((voted_scntr_3 == 6'd46) && (voted_addr_3 == Last_Addr))  nextstate_3 = End_Seq;
                    else if ((voted_scntr_3 == 6'd46) && (voted_addr_3 < Last_Addr))   nextstate_3 = Incr_Addr;
                    else                                                               nextstate_3 = Shift_Enable;
      Start_Seq   :                                                                    nextstate_3 = Shift_Enable;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= Idle;
      state_2 <= Idle;
      state_3 <= Idle;
    end
    else begin
      state_1 <= nextstate_1;
      state_2 <= nextstate_2;
      state_3 <= nextstate_3;
    end
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      DONE_1 <= 0;
      DONE_2 <= 0;
      DONE_3 <= 0;
      LOAD_1 <= 0;
      LOAD_2 <= 0;
      LOAD_3 <= 0;
      SCKEN_1 <= 0;
      SCKEN_2 <= 0;
      SCKEN_3 <= 0;
      SHEN_1 <= 0;
      SHEN_2 <= 0;
      SHEN_3 <= 0;
      addr_1 <= 5'h00;
      addr_2 <= 5'h00;
      addr_3 <= 5'h00;
      scntr_1 <= 6'h00;
      scntr_2 <= 6'h00;
      scntr_3 <= 6'h00;
    end
    else begin
      DONE_1 <= 0; // default
      DONE_2 <= 0; // default
      DONE_3 <= 0; // default
      LOAD_1 <= 0; // default
      LOAD_2 <= 0; // default
      LOAD_3 <= 0; // default
      SCKEN_1 <= 0; // default
      SCKEN_2 <= 0; // default
      SCKEN_3 <= 0; // default
      SHEN_1 <= 0; // default
      SHEN_2 <= 0; // default
      SHEN_3 <= 0; // default
      addr_1 <= 5'h00; // default
      addr_2 <= 5'h00; // default
      addr_3 <= 5'h00; // default
      scntr_1 <= 6'h00; // default
      scntr_2 <= 6'h00; // default
      scntr_3 <= 6'h00; // default
      case (nextstate_1)
        Done        :        DONE_1 <= 1;
        End_Seq     : begin
                             SCKEN_1 <= 1;
                             addr_1 <= voted_addr_1;
        end
        Incr_Addr   : begin
                             SCKEN_1 <= 1;
                             SHEN_1 <= 1;
                             addr_1 <= voted_addr_1 + 1;
        end
        Load        : begin
                             LOAD_1 <= 1;
                             SCKEN_1 <= 1;
                             SHEN_1 <= 1;
                             addr_1 <= voted_addr_1;
        end
        Shift_Enable: begin
                             SCKEN_1 <= 1;
                             SHEN_1 <= 1;
                             addr_1 <= voted_addr_1;
                             scntr_1 <= voted_scntr_1 + 1;
        end
        Start_Seq   : begin
                             LOAD_1 <= 1;
                             SCKEN_1 <= 1;
        end
      endcase
      case (nextstate_2)
        Done        :        DONE_2 <= 1;
        End_Seq     : begin
                             SCKEN_2 <= 1;
                             addr_2 <= voted_addr_2;
        end
        Incr_Addr   : begin
                             SCKEN_2 <= 1;
                             SHEN_2 <= 1;
                             addr_2 <= voted_addr_2 + 1;
        end
        Load        : begin
                             LOAD_2 <= 1;
                             SCKEN_2 <= 1;
                             SHEN_2 <= 1;
                             addr_2 <= voted_addr_2;
        end
        Shift_Enable: begin
                             SCKEN_2 <= 1;
                             SHEN_2 <= 1;
                             addr_2 <= voted_addr_2;
                             scntr_2 <= voted_scntr_2 + 1;
        end
        Start_Seq   : begin
                             LOAD_2 <= 1;
                             SCKEN_2 <= 1;
        end
      endcase
      case (nextstate_3)
        Done        :        DONE_3 <= 1;
        End_Seq     : begin
                             SCKEN_3 <= 1;
                             addr_3 <= voted_addr_3;
        end
        Incr_Addr   : begin
                             SCKEN_3 <= 1;
                             SHEN_3 <= 1;
                             addr_3 <= voted_addr_3 + 1;
        end
        Load        : begin
                             LOAD_3 <= 1;
                             SCKEN_3 <= 1;
                             SHEN_3 <= 1;
                             addr_3 <= voted_addr_3;
        end
        Shift_Enable: begin
                             SCKEN_3 <= 1;
                             SHEN_3 <= 1;
                             addr_3 <= voted_addr_3;
                             scntr_3 <= voted_scntr_3 + 1;
        end
        Start_Seq   : begin
                             LOAD_3 <= 1;
                             SCKEN_3 <= 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [95:0] statename;
  always @* begin
    case (state_1)
      Idle        : statename = "Idle";
      Done        : statename = "Done";
      End_Seq     : statename = "End_Seq";
      Incr_Addr   : statename = "Incr_Addr";
      Load        : statename = "Load";
      Shift_Enable: statename = "Shift_Enable";
      Start_Seq   : statename = "Start_Seq";
      default     : statename = "XXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

