
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:10:02 at 17:21:11 (www.fizzim.com)

module FIFO_Load_FSM_TMR_Err_Det (
  output wire [2:0] SEL,
  output WRENA,
  output wire [15:0] TMR_ERR_COUNT,
  input CLK,
  input RST,
  input wire [6:0] SAMP_MAX,
  input START 
);

  // state bits
  parameter 
  Idle     = 2'b00, 
  Nxt_Samp = 2'b01, 
  Rst_Samp = 2'b10, 
  Transfer = 2'b11; 

  (* syn_preserve = "true" *) reg [1:0] state_1;
  (* syn_preserve = "true" *) reg [1:0] state_2;
  (* syn_preserve = "true" *) reg [1:0] state_3;

  (* syn_keep = "true" *) wire [1:0] voted_state_1;
  (* syn_keep = "true" *) wire [1:0] voted_state_2;
  (* syn_keep = "true" *) wire [1:0] voted_state_3;

  (* syn_keep = "true" *) wire err_det_state_1;
  (* syn_keep = "true" *) wire err_det_state_2;
  (* syn_keep = "true" *) wire err_det_state_3;

  (* syn_preserve = "true" *) reg [15:0] ed_cnt_1;
  (* syn_preserve = "true" *) reg [15:0] ed_cnt_2;
  (* syn_preserve = "true" *) reg [15:0] ed_cnt_3;

  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_1;
  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_2;
  (* syn_keep = "true" *) wire [15:0] voted_ed_cnt_3;

  assign voted_state_1  = (state_1  & state_2 ) | (state_2  & state_3 ) | (state_1  & state_3 ); // Majority logic
  assign voted_state_2  = (state_1  & state_2 ) | (state_2  & state_3 ) | (state_1  & state_3 ); // Majority logic
  assign voted_state_3  = (state_1  & state_2 ) | (state_2  & state_3 ) | (state_1  & state_3 ); // Majority logic

  assign err_det_state_1  = |(~((~state_1  & ~state_2  & ~state_3 ) | (state_1  & state_2  & state_3 ))); // error detection logic
  assign err_det_state_2  = |(~((~state_1  & ~state_2  & ~state_3 ) | (state_1  & state_2  & state_3 ))); // error detection logic
  assign err_det_state_3  = |(~((~state_1  & ~state_2  & ~state_3 ) | (state_1  & state_2  & state_3 ))); // error detection logic

  assign voted_ed_cnt_1 = (ed_cnt_1 & ed_cnt_2) | (ed_cnt_2 & ed_cnt_3) | (ed_cnt_1 & ed_cnt_3); // Majority logic
  assign voted_ed_cnt_2 = (ed_cnt_1 & ed_cnt_2) | (ed_cnt_2 & ed_cnt_3) | (ed_cnt_1 & ed_cnt_3); // Majority logic
  assign voted_ed_cnt_3 = (ed_cnt_1 & ed_cnt_2) | (ed_cnt_2 & ed_cnt_3) | (ed_cnt_1 & ed_cnt_3); // Majority logic

  assign TMR_ERR_COUNT = voted_ed_cnt_1;

  (* syn_keep = "true" *) reg [1:0] nextstate_1;
  (* syn_keep = "true" *) reg [1:0] nextstate_2;
  (* syn_keep = "true" *) reg [1:0] nextstate_3;


  (* syn_preserve = "true" *)  reg [2:0] SEL_1;
  (* syn_preserve = "true" *)  reg [2:0] SEL_2;
  (* syn_preserve = "true" *)  reg [2:0] SEL_3;
  (* syn_preserve = "true" *)  reg WRENA_1;
  (* syn_preserve = "true" *)  reg WRENA_2;
  (* syn_preserve = "true" *)  reg WRENA_3;
  (* syn_preserve = "true" *)  reg [6:0] sample_1;
  (* syn_preserve = "true" *)  reg [6:0] sample_2;
  (* syn_preserve = "true" *)  reg [6:0] sample_3;
  (* syn_keep = "true" *)      wire [6:0] voted_sample_1;
  (* syn_keep = "true" *)      wire [6:0] voted_sample_2;
  (* syn_keep = "true" *)      wire [6:0] voted_sample_3;
  (* syn_keep = "true" *)  wire err_det_SEL_1;
  (* syn_keep = "true" *)  wire err_det_SEL_2;
  (* syn_keep = "true" *)  wire err_det_SEL_3;
  (* syn_keep = "true" *)  wire err_det_WRENA_1;
  (* syn_keep = "true" *)  wire err_det_WRENA_2;
  (* syn_keep = "true" *)  wire err_det_WRENA_3;
  (* syn_keep = "true" *)  wire err_det_sample_1;
  (* syn_keep = "true" *)  wire err_det_sample_2;
  (* syn_keep = "true" *)  wire err_det_sample_3;
  (* syn_keep = "true" *)  wire err_det_1;
  (* syn_keep = "true" *)  wire err_det_2;
  (* syn_keep = "true" *)  wire err_det_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign SEL    = (SEL_1    & SEL_2   ) | (SEL_2    & SEL_3   ) | (SEL_1    & SEL_3   ); // Majority logic
  assign WRENA  = (WRENA_1  & WRENA_2 ) | (WRENA_2  & WRENA_3 ) | (WRENA_1  & WRENA_3 ); // Majority logic
  assign voted_sample_1 = (sample_1 & sample_2) | (sample_2 & sample_3) | (sample_1 & sample_3); // Majority logic
  assign voted_sample_2 = (sample_1 & sample_2) | (sample_2 & sample_3) | (sample_1 & sample_3); // Majority logic
  assign voted_sample_3 = (sample_1 & sample_2) | (sample_2 & sample_3) | (sample_1 & sample_3); // Majority logic

  // Assignment of error detection logic to replicated signals
  assign err_det_SEL_1    = |(~((~SEL_1    & ~SEL_2    & ~SEL_3   ) | (SEL_1    & SEL_2    & SEL_3   ))); // error detection logic
  assign err_det_SEL_2    = |(~((~SEL_1    & ~SEL_2    & ~SEL_3   ) | (SEL_1    & SEL_2    & SEL_3   ))); // error detection logic
  assign err_det_SEL_3    = |(~((~SEL_1    & ~SEL_2    & ~SEL_3   ) | (SEL_1    & SEL_2    & SEL_3   ))); // error detection logic
  assign err_det_WRENA_1  =  (~((~WRENA_1  & ~WRENA_2  & ~WRENA_3 ) | (WRENA_1  & WRENA_2  & WRENA_3 ))); // error detection logic
  assign err_det_WRENA_2  =  (~((~WRENA_1  & ~WRENA_2  & ~WRENA_3 ) | (WRENA_1  & WRENA_2  & WRENA_3 ))); // error detection logic
  assign err_det_WRENA_3  =  (~((~WRENA_1  & ~WRENA_2  & ~WRENA_3 ) | (WRENA_1  & WRENA_2  & WRENA_3 ))); // error detection logic
  assign err_det_sample_1 = |(~((~sample_1 & ~sample_2 & ~sample_3) | (sample_1 & sample_2 & sample_3))); // error detection logic
  assign err_det_sample_2 = |(~((~sample_1 & ~sample_2 & ~sample_3) | (sample_1 & sample_2 & sample_3))); // error detection logic
  assign err_det_sample_3 = |(~((~sample_1 & ~sample_2 & ~sample_3) | (sample_1 & sample_2 & sample_3))); // error detection logic


  // Assign 'OR' of all error detection signals
  assign err_det_1 = err_det_state_1   | err_det_SEL_1   | err_det_WRENA_1   | err_det_sample_1  ;
  assign err_det_2 = err_det_state_2   | err_det_SEL_2   | err_det_WRENA_2   | err_det_sample_2  ;
  assign err_det_3 = err_det_state_3   | err_det_SEL_3   | err_det_WRENA_3   | err_det_sample_3  ;

  // comb always block
  always @* begin
    nextstate_1 = 2'bxx; // default to x because default_state_is_x is set
    nextstate_2 = 2'bxx; // default to x because default_state_is_x is set
    nextstate_3 = 2'bxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle    : if      (START)                                      nextstate_1 = Rst_Samp;
                else                                                 nextstate_1 = Idle;
      Nxt_Samp:                                                      nextstate_1 = Transfer;
      Rst_Samp:                                                      nextstate_1 = Transfer;
      Transfer: if      (START)                                      nextstate_1 = Rst_Samp;
                else if (voted_sample_1 == SAMP_MAX && SEL == 3'd5)  nextstate_1 = Idle;
                else if (SEL == 3'd5)                                nextstate_1 = Nxt_Samp;
                else                                                 nextstate_1 = Transfer;
    endcase
    case (voted_state_2)
      Idle    : if      (START)                                      nextstate_2 = Rst_Samp;
                else                                                 nextstate_2 = Idle;
      Nxt_Samp:                                                      nextstate_2 = Transfer;
      Rst_Samp:                                                      nextstate_2 = Transfer;
      Transfer: if      (START)                                      nextstate_2 = Rst_Samp;
                else if (voted_sample_2 == SAMP_MAX && SEL == 3'd5)  nextstate_2 = Idle;
                else if (SEL == 3'd5)                                nextstate_2 = Nxt_Samp;
                else                                                 nextstate_2 = Transfer;
    endcase
    case (voted_state_3)
      Idle    : if      (START)                                      nextstate_3 = Rst_Samp;
                else                                                 nextstate_3 = Idle;
      Nxt_Samp:                                                      nextstate_3 = Transfer;
      Rst_Samp:                                                      nextstate_3 = Transfer;
      Transfer: if      (START)                                      nextstate_3 = Rst_Samp;
                else if (voted_sample_3 == SAMP_MAX && SEL == 3'd5)  nextstate_3 = Idle;
                else if (SEL == 3'd5)                                nextstate_3 = Nxt_Samp;
                else                                                 nextstate_3 = Transfer;
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
      SEL_1 <= 3'h0;
      SEL_2 <= 3'h0;
      SEL_3 <= 3'h0;
      WRENA_1 <= 0;
      WRENA_2 <= 0;
      WRENA_3 <= 0;
      sample_1 <= 7'h00;
      sample_2 <= 7'h00;
      sample_3 <= 7'h00;
    end
    else begin
      SEL_1 <= 3'h0; // default
      SEL_2 <= 3'h0; // default
      SEL_3 <= 3'h0; // default
      WRENA_1 <= 1; // default
      WRENA_2 <= 1; // default
      WRENA_3 <= 1; // default
      sample_1 <= voted_sample_1; // default
      sample_2 <= voted_sample_2; // default
      sample_3 <= voted_sample_3; // default
      case (nextstate_1)
        Idle    : begin
                         WRENA_1 <= 0;
                         sample_1 <= 7'h00;
        end
        Nxt_Samp:        sample_1 <= voted_sample_1 + 1;
        Rst_Samp:        sample_1 <= 7'h00;
        Transfer:        SEL_1 <= SEL + 1;
      endcase
      case (nextstate_2)
        Idle    : begin
                         WRENA_2 <= 0;
                         sample_2 <= 7'h00;
        end
        Nxt_Samp:        sample_2 <= voted_sample_2 + 1;
        Rst_Samp:        sample_2 <= 7'h00;
        Transfer:        SEL_2 <= SEL + 1;
      endcase
      case (nextstate_3)
        Idle    : begin
                         WRENA_3 <= 0;
                         sample_3 <= 7'h00;
        end
        Nxt_Samp:        sample_3 <= voted_sample_3 + 1;
        Rst_Samp:        sample_3 <= 7'h00;
        Transfer:        SEL_3 <= SEL + 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [63:0] statename;
  always @* begin
    case (state_1)
      Idle    : statename = "Idle";
      Nxt_Samp: statename = "Nxt_Samp";
      Rst_Samp: statename = "Rst_Samp";
      Transfer: statename = "Transfer";
      default : statename = "XXXXXXXX";
    endcase
  end
  `endif

endmodule

