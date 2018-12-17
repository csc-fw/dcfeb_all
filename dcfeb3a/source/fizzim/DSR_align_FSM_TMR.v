
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 12:04:11 (www.fizzim.com)

module DSR_align_FSM_TMR (
  output ALIGNED,
  output BIT_SLIP_EVN,
  output BIT_SLIP_ODD,
  output DSR_RST,
  output STRT_PIPE,
  input CLK,
  input RST 
);

  // state bits
  parameter 
  Start       = 4'b0000, 
  Aligned     = 4'b0001, 
  BS_even_odd = 4'b0010, 
  BS_odd      = 4'b0011, 
  BSlip_Wait  = 4'b0100, 
  BSodd_Wait  = 4'b0101, 
  DSR_rst     = 4'b0110, 
  ReStartPipe = 4'b0111, 
  Wait1       = 4'b1000, 
  Wrst        = 4'b1001; 

  (* syn_preserve = "true" *) reg [3:0] state_1;
  (* syn_preserve = "true" *) reg [3:0] state_2;
  (* syn_preserve = "true" *) reg [3:0] state_3;

  (* syn_keep = "true" *) wire [3:0] voted_state_1;
  (* syn_keep = "true" *) wire [3:0] voted_state_2;
  (* syn_keep = "true" *) wire [3:0] voted_state_3;

  assign voted_state_1        = (state_1        & state_2       ) | (state_2        & state_3       ) | (state_1        & state_3       ); // Majority logic
  assign voted_state_2        = (state_1        & state_2       ) | (state_2        & state_3       ) | (state_1        & state_3       ); // Majority logic
  assign voted_state_3        = (state_1        & state_2       ) | (state_2        & state_3       ) | (state_1        & state_3       ); // Majority logic

  (* syn_keep = "true" *) reg [3:0] nextstate_1;
  (* syn_keep = "true" *) reg [3:0] nextstate_2;
  (* syn_keep = "true" *) reg [3:0] nextstate_3;

  (* syn_preserve = "true" *)  reg ALIGNED_1;
  (* syn_preserve = "true" *)  reg ALIGNED_2;
  (* syn_preserve = "true" *)  reg ALIGNED_3;
  (* syn_preserve = "true" *)  reg BIT_SLIP_EVN_1;
  (* syn_preserve = "true" *)  reg BIT_SLIP_EVN_2;
  (* syn_preserve = "true" *)  reg BIT_SLIP_EVN_3;
  (* syn_preserve = "true" *)  reg BIT_SLIP_ODD_1;
  (* syn_preserve = "true" *)  reg BIT_SLIP_ODD_2;
  (* syn_preserve = "true" *)  reg BIT_SLIP_ODD_3;
  (* syn_preserve = "true" *)  reg DSR_RST_1;
  (* syn_preserve = "true" *)  reg DSR_RST_2;
  (* syn_preserve = "true" *)  reg DSR_RST_3;
  (* syn_preserve = "true" *)  reg STRT_PIPE_1;
  (* syn_preserve = "true" *)  reg STRT_PIPE_2;
  (* syn_preserve = "true" *)  reg STRT_PIPE_3;
  (* syn_preserve = "true" *)  reg [3:0] slip_cnt_1;
  (* syn_preserve = "true" *)  reg [3:0] slip_cnt_2;
  (* syn_preserve = "true" *)  reg [3:0] slip_cnt_3;
  (* syn_keep = "true" *)      wire [3:0] voted_slip_cnt_1;
  (* syn_keep = "true" *)      wire [3:0] voted_slip_cnt_2;
  (* syn_keep = "true" *)      wire [3:0] voted_slip_cnt_3;
  (* syn_preserve = "true" *)  reg [2:0] wcnt_1;
  (* syn_preserve = "true" *)  reg [2:0] wcnt_2;
  (* syn_preserve = "true" *)  reg [2:0] wcnt_3;
  (* syn_keep = "true" *)      wire [2:0] voted_wcnt_1;
  (* syn_keep = "true" *)      wire [2:0] voted_wcnt_2;
  (* syn_keep = "true" *)      wire [2:0] voted_wcnt_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign ALIGNED      = (ALIGNED_1      & ALIGNED_2     ) | (ALIGNED_2      & ALIGNED_3     ) | (ALIGNED_1      & ALIGNED_3     ); // Majority logic
  assign BIT_SLIP_EVN = (BIT_SLIP_EVN_1 & BIT_SLIP_EVN_2) | (BIT_SLIP_EVN_2 & BIT_SLIP_EVN_3) | (BIT_SLIP_EVN_1 & BIT_SLIP_EVN_3); // Majority logic
  assign BIT_SLIP_ODD = (BIT_SLIP_ODD_1 & BIT_SLIP_ODD_2) | (BIT_SLIP_ODD_2 & BIT_SLIP_ODD_3) | (BIT_SLIP_ODD_1 & BIT_SLIP_ODD_3); // Majority logic
  assign DSR_RST      = (DSR_RST_1      & DSR_RST_2     ) | (DSR_RST_2      & DSR_RST_3     ) | (DSR_RST_1      & DSR_RST_3     ); // Majority logic
  assign STRT_PIPE    = (STRT_PIPE_1    & STRT_PIPE_2   ) | (STRT_PIPE_2    & STRT_PIPE_3   ) | (STRT_PIPE_1    & STRT_PIPE_3   ); // Majority logic
  assign voted_slip_cnt_1     = (slip_cnt_1     & slip_cnt_2    ) | (slip_cnt_2     & slip_cnt_3    ) | (slip_cnt_1     & slip_cnt_3    ); // Majority logic
  assign voted_slip_cnt_2     = (slip_cnt_1     & slip_cnt_2    ) | (slip_cnt_2     & slip_cnt_3    ) | (slip_cnt_1     & slip_cnt_3    ); // Majority logic
  assign voted_slip_cnt_3     = (slip_cnt_1     & slip_cnt_2    ) | (slip_cnt_2     & slip_cnt_3    ) | (slip_cnt_1     & slip_cnt_3    ); // Majority logic
  assign voted_wcnt_1         = (wcnt_1         & wcnt_2        ) | (wcnt_2         & wcnt_3        ) | (wcnt_1         & wcnt_3        ); // Majority logic
  assign voted_wcnt_2         = (wcnt_1         & wcnt_2        ) | (wcnt_2         & wcnt_3        ) | (wcnt_1         & wcnt_3        ); // Majority logic
  assign voted_wcnt_3         = (wcnt_1         & wcnt_2        ) | (wcnt_2         & wcnt_3        ) | (wcnt_1         & wcnt_3        ); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_2 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_3 = 4'bxxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Start      :                                                           nextstate_1 = DSR_rst;
      Aligned    :                                                           nextstate_1 = Aligned;
      BS_even_odd:                                                           nextstate_1 = BSlip_Wait;
      BS_odd     :                                                           nextstate_1 = BSodd_Wait;
      BSlip_Wait : if      ((voted_wcnt_1 == 5) && (voted_slip_cnt_1 == 4))  nextstate_1 = BS_odd;
                   else if (voted_wcnt_1 == 5)                               nextstate_1 = BS_even_odd;
                   else                                                      nextstate_1 = BSlip_Wait;
      BSodd_Wait : if      (voted_wcnt_1 == 5)                               nextstate_1 = ReStartPipe;
                   else                                                      nextstate_1 = BSodd_Wait;
      DSR_rst    : if      (voted_wcnt_1 == 6)                               nextstate_1 = Wrst;
                   else                                                      nextstate_1 = DSR_rst;
      ReStartPipe:                                                           nextstate_1 = Aligned;
      Wait1      : if      (voted_wcnt_1 == 6)                               nextstate_1 = BS_even_odd;
                   else                                                      nextstate_1 = Wait1;
      Wrst       :                                                           nextstate_1 = Wait1;
    endcase
    case (voted_state_2)
      Start      :                                                           nextstate_2 = DSR_rst;
      Aligned    :                                                           nextstate_2 = Aligned;
      BS_even_odd:                                                           nextstate_2 = BSlip_Wait;
      BS_odd     :                                                           nextstate_2 = BSodd_Wait;
      BSlip_Wait : if      ((voted_wcnt_2 == 5) && (voted_slip_cnt_2 == 4))  nextstate_2 = BS_odd;
                   else if (voted_wcnt_2 == 5)                               nextstate_2 = BS_even_odd;
                   else                                                      nextstate_2 = BSlip_Wait;
      BSodd_Wait : if      (voted_wcnt_2 == 5)                               nextstate_2 = ReStartPipe;
                   else                                                      nextstate_2 = BSodd_Wait;
      DSR_rst    : if      (voted_wcnt_2 == 6)                               nextstate_2 = Wrst;
                   else                                                      nextstate_2 = DSR_rst;
      ReStartPipe:                                                           nextstate_2 = Aligned;
      Wait1      : if      (voted_wcnt_2 == 6)                               nextstate_2 = BS_even_odd;
                   else                                                      nextstate_2 = Wait1;
      Wrst       :                                                           nextstate_2 = Wait1;
    endcase
    case (voted_state_3)
      Start      :                                                           nextstate_3 = DSR_rst;
      Aligned    :                                                           nextstate_3 = Aligned;
      BS_even_odd:                                                           nextstate_3 = BSlip_Wait;
      BS_odd     :                                                           nextstate_3 = BSodd_Wait;
      BSlip_Wait : if      ((voted_wcnt_3 == 5) && (voted_slip_cnt_3 == 4))  nextstate_3 = BS_odd;
                   else if (voted_wcnt_3 == 5)                               nextstate_3 = BS_even_odd;
                   else                                                      nextstate_3 = BSlip_Wait;
      BSodd_Wait : if      (voted_wcnt_3 == 5)                               nextstate_3 = ReStartPipe;
                   else                                                      nextstate_3 = BSodd_Wait;
      DSR_rst    : if      (voted_wcnt_3 == 6)                               nextstate_3 = Wrst;
                   else                                                      nextstate_3 = DSR_rst;
      ReStartPipe:                                                           nextstate_3 = Aligned;
      Wait1      : if      (voted_wcnt_3 == 6)                               nextstate_3 = BS_even_odd;
                   else                                                      nextstate_3 = Wait1;
      Wrst       :                                                           nextstate_3 = Wait1;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= Start;
      state_2 <= Start;
      state_3 <= Start;
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
      ALIGNED_1 <= 0;
      ALIGNED_2 <= 0;
      ALIGNED_3 <= 0;
      BIT_SLIP_EVN_1 <= 0;
      BIT_SLIP_EVN_2 <= 0;
      BIT_SLIP_EVN_3 <= 0;
      BIT_SLIP_ODD_1 <= 0;
      BIT_SLIP_ODD_2 <= 0;
      BIT_SLIP_ODD_3 <= 0;
      DSR_RST_1 <= 0;
      DSR_RST_2 <= 0;
      DSR_RST_3 <= 0;
      STRT_PIPE_1 <= 0;
      STRT_PIPE_2 <= 0;
      STRT_PIPE_3 <= 0;
      slip_cnt_1 <= 4'h0;
      slip_cnt_2 <= 4'h0;
      slip_cnt_3 <= 4'h0;
      wcnt_1 <= 3'b000;
      wcnt_2 <= 3'b000;
      wcnt_3 <= 3'b000;
    end
    else begin
      ALIGNED_1 <= 0; // default
      ALIGNED_2 <= 0; // default
      ALIGNED_3 <= 0; // default
      BIT_SLIP_EVN_1 <= 0; // default
      BIT_SLIP_EVN_2 <= 0; // default
      BIT_SLIP_EVN_3 <= 0; // default
      BIT_SLIP_ODD_1 <= 0; // default
      BIT_SLIP_ODD_2 <= 0; // default
      BIT_SLIP_ODD_3 <= 0; // default
      DSR_RST_1 <= 0; // default
      DSR_RST_2 <= 0; // default
      DSR_RST_3 <= 0; // default
      STRT_PIPE_1 <= 0; // default
      STRT_PIPE_2 <= 0; // default
      STRT_PIPE_3 <= 0; // default
      slip_cnt_1 <= voted_slip_cnt_1; // default
      slip_cnt_2 <= voted_slip_cnt_2; // default
      slip_cnt_3 <= voted_slip_cnt_3; // default
      wcnt_1 <= 3'b000; // default
      wcnt_2 <= 3'b000; // default
      wcnt_3 <= 3'b000; // default
      case (nextstate_1)
        Aligned    :        ALIGNED_1 <= 1;
        BS_even_odd: begin
                            BIT_SLIP_EVN_1 <= 1;
                            BIT_SLIP_ODD_1 <= 1;
                            slip_cnt_1 <= voted_slip_cnt_1 + 1;
        end
        BS_odd     : begin
                            BIT_SLIP_ODD_1 <= 1;
                            slip_cnt_1 <= voted_slip_cnt_1 + 1;
        end
        BSlip_Wait :        wcnt_1 <= voted_wcnt_1 + 1;
        BSodd_Wait :        wcnt_1 <= voted_wcnt_1 + 1;
        DSR_rst    : begin
                            DSR_RST_1 <= 1;
                            wcnt_1 <= voted_wcnt_1 + 1;
        end
        ReStartPipe:        STRT_PIPE_1 <= 1;
        Wait1      :        wcnt_1 <= voted_wcnt_1 + 1;
      endcase
      case (nextstate_2)
        Aligned    :        ALIGNED_2 <= 1;
        BS_even_odd: begin
                            BIT_SLIP_EVN_2 <= 1;
                            BIT_SLIP_ODD_2 <= 1;
                            slip_cnt_2 <= voted_slip_cnt_2 + 1;
        end
        BS_odd     : begin
                            BIT_SLIP_ODD_2 <= 1;
                            slip_cnt_2 <= voted_slip_cnt_2 + 1;
        end
        BSlip_Wait :        wcnt_2 <= voted_wcnt_2 + 1;
        BSodd_Wait :        wcnt_2 <= voted_wcnt_2 + 1;
        DSR_rst    : begin
                            DSR_RST_2 <= 1;
                            wcnt_2 <= voted_wcnt_2 + 1;
        end
        ReStartPipe:        STRT_PIPE_2 <= 1;
        Wait1      :        wcnt_2 <= voted_wcnt_2 + 1;
      endcase
      case (nextstate_3)
        Aligned    :        ALIGNED_3 <= 1;
        BS_even_odd: begin
                            BIT_SLIP_EVN_3 <= 1;
                            BIT_SLIP_ODD_3 <= 1;
                            slip_cnt_3 <= voted_slip_cnt_3 + 1;
        end
        BS_odd     : begin
                            BIT_SLIP_ODD_3 <= 1;
                            slip_cnt_3 <= voted_slip_cnt_3 + 1;
        end
        BSlip_Wait :        wcnt_3 <= voted_wcnt_3 + 1;
        BSodd_Wait :        wcnt_3 <= voted_wcnt_3 + 1;
        DSR_rst    : begin
                            DSR_RST_3 <= 1;
                            wcnt_3 <= voted_wcnt_3 + 1;
        end
        ReStartPipe:        STRT_PIPE_3 <= 1;
        Wait1      :        wcnt_3 <= voted_wcnt_3 + 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [87:0] statename;
  always @* begin
    case (state_1)
      Start      : statename = "Start";
      Aligned    : statename = "Aligned";
      BS_even_odd: statename = "BS_even_odd";
      BS_odd     : statename = "BS_odd";
      BSlip_Wait : statename = "BSlip_Wait";
      BSodd_Wait : statename = "BSodd_Wait";
      DSR_rst    : statename = "DSR_rst";
      ReStartPipe: statename = "ReStartPipe";
      Wait1      : statename = "Wait1";
      Wrst       : statename = "Wrst";
      default    : statename = "XXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

