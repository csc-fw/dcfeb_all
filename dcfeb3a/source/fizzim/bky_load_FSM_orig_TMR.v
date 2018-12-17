
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:07:11 at 11:36:46 (www.fizzim.com)

module bky_load_FSM_orig (
  output CLR_CNT,
  output RDENA,
  output SET_DONE,
  output SHFT_ENA,
  input CLK,
  input wire [3:0] CNT,
  input wire [4:0] LOOP,
  input MT,
  input RST,
  input START 
);

  // state bits
  parameter 
  Idle      = 3'b000, 
  Read      = 3'b001, 
  Set_Done  = 3'b010, 
  Shift     = 3'b011, 
  Wait4Data = 3'b100; 

  (* syn_preserve = "true" *) reg [2:0] state_1;
  (* syn_preserve = "true" *) reg [2:0] state_2;
  (* syn_preserve = "true" *) reg [2:0] state_3;

  (* syn_keep = "true" *) wire [2:0] voted_state_1;
  (* syn_keep = "true" *) wire [2:0] voted_state_2;
  (* syn_keep = "true" *) wire [2:0] voted_state_3;

  assign voted_state_1 = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_2 = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_3 = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg CLR_CNT_1;
  (* syn_preserve = "true" *)  reg CLR_CNT_2;
  (* syn_preserve = "true" *)  reg CLR_CNT_3;
  (* syn_preserve = "true" *)  reg RDENA_1;
  (* syn_preserve = "true" *)  reg RDENA_2;
  (* syn_preserve = "true" *)  reg RDENA_3;
  (* syn_preserve = "true" *)  reg SET_DONE_1;
  (* syn_preserve = "true" *)  reg SET_DONE_2;
  (* syn_preserve = "true" *)  reg SET_DONE_3;
  (* syn_preserve = "true" *)  reg SHFT_ENA_1;
  (* syn_preserve = "true" *)  reg SHFT_ENA_2;
  (* syn_preserve = "true" *)  reg SHFT_ENA_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign CLR_CNT    = (CLR_CNT_1  & CLR_CNT_2 ) | (CLR_CNT_2  & CLR_CNT_3 ) | (CLR_CNT_1  & CLR_CNT_3 ); // Majority logic
  assign RDENA      = (RDENA_1    & RDENA_2   ) | (RDENA_2    & RDENA_3   ) | (RDENA_1    & RDENA_3   ); // Majority logic
  assign SET_DONE   = (SET_DONE_1 & SET_DONE_2) | (SET_DONE_2 & SET_DONE_3) | (SET_DONE_1 & SET_DONE_3); // Majority logic
  assign SHFT_ENA   = (SHFT_ENA_1 & SHFT_ENA_2) | (SHFT_ENA_2 & SHFT_ENA_3) | (SHFT_ENA_1 & SHFT_ENA_3); // Majority logic


  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle     : if      (START)                             nextstate_1 = Wait4Data;
                 else                                        nextstate_1 = Idle;
      Read     :                                             nextstate_1 = Shift;
      Set_Done : if      (!START)                            nextstate_1 = Idle;
                 else                                        nextstate_1 = Set_Done;
      Shift    : if      ((CNT == 4'hF) && (LOOP == 5'd18))  nextstate_1 = Set_Done;
                 else if (CNT == 4'hF)                       nextstate_1 = Read;
                 else                                        nextstate_1 = Shift;
      Wait4Data: if      (!MT)                               nextstate_1 = Read;
                 else                                        nextstate_1 = Wait4Data;
    endcase
    case (voted_state_2)
      Idle     : if      (START)                             nextstate_2 = Wait4Data;
                 else                                        nextstate_2 = Idle;
      Read     :                                             nextstate_2 = Shift;
      Set_Done : if      (!START)                            nextstate_2 = Idle;
                 else                                        nextstate_2 = Set_Done;
      Shift    : if      ((CNT == 4'hF) && (LOOP == 5'd18))  nextstate_2 = Set_Done;
                 else if (CNT == 4'hF)                       nextstate_2 = Read;
                 else                                        nextstate_2 = Shift;
      Wait4Data: if      (!MT)                               nextstate_2 = Read;
                 else                                        nextstate_2 = Wait4Data;
    endcase
    case (voted_state_3)
      Idle     : if      (START)                             nextstate_3 = Wait4Data;
                 else                                        nextstate_3 = Idle;
      Read     :                                             nextstate_3 = Shift;
      Set_Done : if      (!START)                            nextstate_3 = Idle;
                 else                                        nextstate_3 = Set_Done;
      Shift    : if      ((CNT == 4'hF) && (LOOP == 5'd18))  nextstate_3 = Set_Done;
                 else if (CNT == 4'hF)                       nextstate_3 = Read;
                 else                                        nextstate_3 = Shift;
      Wait4Data: if      (!MT)                               nextstate_3 = Read;
                 else                                        nextstate_3 = Wait4Data;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(negedge CLK or posedge RST) begin
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
  always @(negedge CLK or posedge RST) begin
    if (RST) begin
      CLR_CNT_1 <= 0;
      CLR_CNT_2 <= 0;
      CLR_CNT_3 <= 0;
      RDENA_1 <= 0;
      RDENA_2 <= 0;
      RDENA_3 <= 0;
      SET_DONE_1 <= 0;
      SET_DONE_2 <= 0;
      SET_DONE_3 <= 0;
      SHFT_ENA_1 <= 0;
      SHFT_ENA_2 <= 0;
      SHFT_ENA_3 <= 0;
    end
    else begin
      CLR_CNT_1 <= 0; // default
      CLR_CNT_2 <= 0; // default
      CLR_CNT_3 <= 0; // default
      RDENA_1 <= 0; // default
      RDENA_2 <= 0; // default
      RDENA_3 <= 0; // default
      SET_DONE_1 <= 0; // default
      SET_DONE_2 <= 0; // default
      SET_DONE_3 <= 0; // default
      SHFT_ENA_1 <= 0; // default
      SHFT_ENA_2 <= 0; // default
      SHFT_ENA_3 <= 0; // default
      case (nextstate_1)
        Read     : RDENA_1 <= 1;
        Set_Done : SET_DONE_1 <= 1;
        Shift    : SHFT_ENA_1 <= 1;
        Wait4Data: CLR_CNT_1 <= 1;
      endcase
      case (nextstate_2)
        Read     : RDENA_2 <= 1;
        Set_Done : SET_DONE_2 <= 1;
        Shift    : SHFT_ENA_2 <= 1;
        Wait4Data: CLR_CNT_2 <= 1;
      endcase
      case (nextstate_3)
        Read     : RDENA_3 <= 1;
        Set_Done : SET_DONE_3 <= 1;
        Shift    : SHFT_ENA_3 <= 1;
        Wait4Data: CLR_CNT_3 <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [71:0] statename;
  always @* begin
    case (state_1)
      Idle     : statename = "Idle";
      Read     : statename = "Read";
      Set_Done : statename = "Set_Done";
      Shift    : statename = "Shift";
      Wait4Data: statename = "Wait4Data";
      default  : statename = "XXXXXXXXX";
    endcase
  end
  `endif

endmodule

