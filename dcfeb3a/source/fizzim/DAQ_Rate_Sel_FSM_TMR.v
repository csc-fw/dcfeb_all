
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:32:25 (www.fizzim.com)

module DAQ_Rate_Sel_FSM_TMR (
  output CDV_INIT,
  output wire [2:0] CLK_SEL,
  output PCSRST,
  output RATE_1_25,
  output RATE_3_2,
  output wire [1:0] RATE_SEL,
  output WRDCLKSEL,
  output wire [3:0] DQRT_STATE,
  input CDV_DONE,
  input CLK,
  input DAQ_RATE,
  input RST,
  input TXRATEDONE 
);

  // state bits
  parameter 
  ST_3_2_GBPS  = 4'b0000, 
  RefClk125    = 4'b0001, 
  RefClk160    = 4'b0010, 
  RstClkDiv125 = 4'b0011, 
  RstClkDiv160 = 4'b0100, 
  RstPCS125    = 4'b0101, 
  RstPCS160    = 4'b0110, 
  ST_1_25_GBPS = 4'b0111, 
  WrdClk160    = 4'b1000, 
  WrdClk62_5   = 4'b1001; 

  (* syn_preserve = "true" *) reg [3:0] state_1;
  (* syn_preserve = "true" *) reg [3:0] state_2;
  (* syn_preserve = "true" *) reg [3:0] state_3;

  (* syn_keep = "true" *) wire [3:0] voted_state_1;
  (* syn_keep = "true" *) wire [3:0] voted_state_2;
  (* syn_keep = "true" *) wire [3:0] voted_state_3;

  assign voted_state_1           = (state_1     & state_2    ) | (state_2     & state_3    ) | (state_1     & state_3    ); // Majority logic
  assign voted_state_2           = (state_1     & state_2    ) | (state_2     & state_3    ) | (state_1     & state_3    ); // Majority logic
  assign voted_state_3           = (state_1     & state_2    ) | (state_2     & state_3    ) | (state_1     & state_3    ); // Majority logic

  assign DQRT_STATE = voted_state_1;

  (* syn_keep = "true" *) reg [3:0] nextstate_1;
  (* syn_keep = "true" *) reg [3:0] nextstate_2;
  (* syn_keep = "true" *) reg [3:0] nextstate_3;

  (* syn_preserve = "true" *)  reg CDV_INIT_1;
  (* syn_preserve = "true" *)  reg CDV_INIT_2;
  (* syn_preserve = "true" *)  reg CDV_INIT_3;
  (* syn_preserve = "true" *)  reg [2:0] CLK_SEL_1;
  (* syn_preserve = "true" *)  reg [2:0] CLK_SEL_2;
  (* syn_preserve = "true" *)  reg [2:0] CLK_SEL_3;
  (* syn_preserve = "true" *)  reg PCSRST_1;
  (* syn_preserve = "true" *)  reg PCSRST_2;
  (* syn_preserve = "true" *)  reg PCSRST_3;
  (* syn_preserve = "true" *)  reg RATE_1_25_1;
  (* syn_preserve = "true" *)  reg RATE_1_25_2;
  (* syn_preserve = "true" *)  reg RATE_1_25_3;
  (* syn_preserve = "true" *)  reg RATE_3_2_1;
  (* syn_preserve = "true" *)  reg RATE_3_2_2;
  (* syn_preserve = "true" *)  reg RATE_3_2_3;
  (* syn_preserve = "true" *)  reg [1:0] RATE_SEL_1;
  (* syn_preserve = "true" *)  reg [1:0] RATE_SEL_2;
  (* syn_preserve = "true" *)  reg [1:0] RATE_SEL_3;
  (* syn_preserve = "true" *)  reg WRDCLKSEL_1;
  (* syn_preserve = "true" *)  reg WRDCLKSEL_2;
  (* syn_preserve = "true" *)  reg WRDCLKSEL_3;
  (* syn_keep = "true" *)      wire voted_WRDCLKSEL_1;
  (* syn_keep = "true" *)      wire voted_WRDCLKSEL_2;
  (* syn_keep = "true" *)      wire voted_WRDCLKSEL_3;
  (* syn_preserve = "true" *)  reg [2:0] cnt_1;
  (* syn_preserve = "true" *)  reg [2:0] cnt_2;
  (* syn_preserve = "true" *)  reg [2:0] cnt_3;
  (* syn_keep = "true" *)      wire [2:0] voted_cnt_1;
  (* syn_keep = "true" *)      wire [2:0] voted_cnt_2;
  (* syn_keep = "true" *)      wire [2:0] voted_cnt_3;
  (* syn_keep = "true" *)      reg next_WRDCLKSEL_1;
  (* syn_keep = "true" *)      reg next_WRDCLKSEL_2;
  (* syn_keep = "true" *)      reg next_WRDCLKSEL_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign CDV_INIT        = (CDV_INIT_1  & CDV_INIT_2 ) | (CDV_INIT_2  & CDV_INIT_3 ) | (CDV_INIT_1  & CDV_INIT_3 ); // Majority logic
  assign CLK_SEL         = (CLK_SEL_1   & CLK_SEL_2  ) | (CLK_SEL_2   & CLK_SEL_3  ) | (CLK_SEL_1   & CLK_SEL_3  ); // Majority logic
  assign PCSRST          = (PCSRST_1    & PCSRST_2   ) | (PCSRST_2    & PCSRST_3   ) | (PCSRST_1    & PCSRST_3   ); // Majority logic
  assign RATE_1_25       = (RATE_1_25_1 & RATE_1_25_2) | (RATE_1_25_2 & RATE_1_25_3) | (RATE_1_25_1 & RATE_1_25_3); // Majority logic
  assign RATE_3_2        = (RATE_3_2_1  & RATE_3_2_2 ) | (RATE_3_2_2  & RATE_3_2_3 ) | (RATE_3_2_1  & RATE_3_2_3 ); // Majority logic
  assign RATE_SEL        = (RATE_SEL_1  & RATE_SEL_2 ) | (RATE_SEL_2  & RATE_SEL_3 ) | (RATE_SEL_1  & RATE_SEL_3 ); // Majority logic
  assign voted_WRDCLKSEL_1       = (WRDCLKSEL_1 & WRDCLKSEL_2) | (WRDCLKSEL_2 & WRDCLKSEL_3) | (WRDCLKSEL_1 & WRDCLKSEL_3); // Majority logic
  assign voted_WRDCLKSEL_2       = (WRDCLKSEL_1 & WRDCLKSEL_2) | (WRDCLKSEL_2 & WRDCLKSEL_3) | (WRDCLKSEL_1 & WRDCLKSEL_3); // Majority logic
  assign voted_WRDCLKSEL_3       = (WRDCLKSEL_1 & WRDCLKSEL_2) | (WRDCLKSEL_2 & WRDCLKSEL_3) | (WRDCLKSEL_1 & WRDCLKSEL_3); // Majority logic
  assign WRDCLKSEL = voted_WRDCLKSEL_1;
  assign voted_cnt_1             = (cnt_1       & cnt_2      ) | (cnt_2       & cnt_3      ) | (cnt_1       & cnt_3      ); // Majority logic
  assign voted_cnt_2             = (cnt_1       & cnt_2      ) | (cnt_2       & cnt_3      ) | (cnt_1       & cnt_3      ); // Majority logic
  assign voted_cnt_3             = (cnt_1       & cnt_2      ) | (cnt_2       & cnt_3      ) | (cnt_1       & cnt_3      ); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_2 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_3 = 4'bxxxx; // default to x because default_state_is_x is set
    next_WRDCLKSEL_1 = voted_WRDCLKSEL_1;
    next_WRDCLKSEL_2 = voted_WRDCLKSEL_2;
    next_WRDCLKSEL_3 = voted_WRDCLKSEL_3;
    case (voted_state_1)
      ST_3_2_GBPS : if (!DAQ_RATE)            nextstate_1 = RefClk125;
                    else                      nextstate_1 = ST_3_2_GBPS;
      RefClk125   : begin
        if             (TXRATEDONE) begin
                                              nextstate_1 = WrdClk62_5;
                                              next_WRDCLKSEL_1 = 0;
        end
        else                                  nextstate_1 = RefClk125;
      end
      RefClk160   : begin
        if             (TXRATEDONE) begin
                                              nextstate_1 = WrdClk160;
                                              next_WRDCLKSEL_1 = 1;
        end
        else                                  nextstate_1 = RefClk160;
      end
      RstClkDiv125: if (CDV_DONE)             nextstate_1 = RstPCS125;
                    else                      nextstate_1 = RstClkDiv125;
      RstClkDiv160: if (CDV_DONE)             nextstate_1 = RstPCS160;
                    else                      nextstate_1 = RstClkDiv160;
      RstPCS125   : if (voted_cnt_1 == 3'd5)  nextstate_1 = ST_1_25_GBPS;
                    else                      nextstate_1 = RstPCS125;
      RstPCS160   : if (voted_cnt_1 == 3'd5)  nextstate_1 = ST_3_2_GBPS;
                    else                      nextstate_1 = RstPCS160;
      ST_1_25_GBPS: if (DAQ_RATE)             nextstate_1 = RefClk160;
                    else                      nextstate_1 = ST_1_25_GBPS;
      WrdClk160   : if (voted_cnt_1 == 3'd5)  nextstate_1 = RstClkDiv160;
                    else                      nextstate_1 = WrdClk160;
      WrdClk62_5  : if (voted_cnt_1 == 3'd5)  nextstate_1 = RstClkDiv125;
                    else                      nextstate_1 = WrdClk62_5;
    endcase
    case (voted_state_2)
      ST_3_2_GBPS : if (!DAQ_RATE)            nextstate_2 = RefClk125;
                    else                      nextstate_2 = ST_3_2_GBPS;
      RefClk125   : begin
        if             (TXRATEDONE) begin
                                              nextstate_2 = WrdClk62_5;
                                              next_WRDCLKSEL_2 = 0;
        end
        else                                  nextstate_2 = RefClk125;
      end
      RefClk160   : begin
        if             (TXRATEDONE) begin
                                              nextstate_2 = WrdClk160;
                                              next_WRDCLKSEL_2 = 1;
        end
        else                                  nextstate_2 = RefClk160;
      end
      RstClkDiv125: if (CDV_DONE)             nextstate_2 = RstPCS125;
                    else                      nextstate_2 = RstClkDiv125;
      RstClkDiv160: if (CDV_DONE)             nextstate_2 = RstPCS160;
                    else                      nextstate_2 = RstClkDiv160;
      RstPCS125   : if (voted_cnt_2 == 3'd5)  nextstate_2 = ST_1_25_GBPS;
                    else                      nextstate_2 = RstPCS125;
      RstPCS160   : if (voted_cnt_2 == 3'd5)  nextstate_2 = ST_3_2_GBPS;
                    else                      nextstate_2 = RstPCS160;
      ST_1_25_GBPS: if (DAQ_RATE)             nextstate_2 = RefClk160;
                    else                      nextstate_2 = ST_1_25_GBPS;
      WrdClk160   : if (voted_cnt_2 == 3'd5)  nextstate_2 = RstClkDiv160;
                    else                      nextstate_2 = WrdClk160;
      WrdClk62_5  : if (voted_cnt_2 == 3'd5)  nextstate_2 = RstClkDiv125;
                    else                      nextstate_2 = WrdClk62_5;
    endcase
    case (voted_state_3)
      ST_3_2_GBPS : if (!DAQ_RATE)            nextstate_3 = RefClk125;
                    else                      nextstate_3 = ST_3_2_GBPS;
      RefClk125   : begin
        if             (TXRATEDONE) begin
                                              nextstate_3 = WrdClk62_5;
                                              next_WRDCLKSEL_3 = 0;
        end
        else                                  nextstate_3 = RefClk125;
      end
      RefClk160   : begin
        if             (TXRATEDONE) begin
                                              nextstate_3 = WrdClk160;
                                              next_WRDCLKSEL_3 = 1;
        end
        else                                  nextstate_3 = RefClk160;
      end
      RstClkDiv125: if (CDV_DONE)             nextstate_3 = RstPCS125;
                    else                      nextstate_3 = RstClkDiv125;
      RstClkDiv160: if (CDV_DONE)             nextstate_3 = RstPCS160;
                    else                      nextstate_3 = RstClkDiv160;
      RstPCS125   : if (voted_cnt_3 == 3'd5)  nextstate_3 = ST_1_25_GBPS;
                    else                      nextstate_3 = RstPCS125;
      RstPCS160   : if (voted_cnt_3 == 3'd5)  nextstate_3 = ST_3_2_GBPS;
                    else                      nextstate_3 = RstPCS160;
      ST_1_25_GBPS: if (DAQ_RATE)             nextstate_3 = RefClk160;
                    else                      nextstate_3 = ST_1_25_GBPS;
      WrdClk160   : if (voted_cnt_3 == 3'd5)  nextstate_3 = RstClkDiv160;
                    else                      nextstate_3 = WrdClk160;
      WrdClk62_5  : if (voted_cnt_3 == 3'd5)  nextstate_3 = RstClkDiv125;
                    else                      nextstate_3 = WrdClk62_5;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= ST_3_2_GBPS;
      state_2 <= ST_3_2_GBPS;
      state_3 <= ST_3_2_GBPS;
      WRDCLKSEL_1 <= 1;
      WRDCLKSEL_2 <= 1;
      WRDCLKSEL_3 <= 1;
    end
    else begin
      state_1 <= nextstate_1;
      state_2 <= nextstate_2;
      state_3 <= nextstate_3;
      WRDCLKSEL_1 <= next_WRDCLKSEL_1;
      WRDCLKSEL_2 <= next_WRDCLKSEL_2;
      WRDCLKSEL_3 <= next_WRDCLKSEL_3;
    end
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      CDV_INIT_1 <= 0;
      CDV_INIT_2 <= 0;
      CDV_INIT_3 <= 0;
      CLK_SEL_1 <= 3'b001;
      CLK_SEL_2 <= 3'b001;
      CLK_SEL_3 <= 3'b001;
      PCSRST_1 <= 0;
      PCSRST_2 <= 0;
      PCSRST_3 <= 0;
      RATE_1_25_1 <= 0;
      RATE_1_25_2 <= 0;
      RATE_1_25_3 <= 0;
      RATE_3_2_1 <= 0;
      RATE_3_2_2 <= 0;
      RATE_3_2_3 <= 0;
      RATE_SEL_1 <= 2'b11;
      RATE_SEL_2 <= 2'b11;
      RATE_SEL_3 <= 2'b11;
      cnt_1 <= 3'h0;
      cnt_2 <= 3'h0;
      cnt_3 <= 3'h0;
    end
    else begin
      CDV_INIT_1 <= 0; // default
      CDV_INIT_2 <= 0; // default
      CDV_INIT_3 <= 0; // default
      CLK_SEL_1 <= 3'b001; // default
      CLK_SEL_2 <= 3'b001; // default
      CLK_SEL_3 <= 3'b001; // default
      PCSRST_1 <= 0; // default
      PCSRST_2 <= 0; // default
      PCSRST_3 <= 0; // default
      RATE_1_25_1 <= 0; // default
      RATE_1_25_2 <= 0; // default
      RATE_1_25_3 <= 0; // default
      RATE_3_2_1 <= 0; // default
      RATE_3_2_2 <= 0; // default
      RATE_3_2_3 <= 0; // default
      RATE_SEL_1 <= 2'b11; // default
      RATE_SEL_2 <= 2'b11; // default
      RATE_SEL_3 <= 2'b11; // default
      cnt_1 <= 3'h0; // default
      cnt_2 <= 3'h0; // default
      cnt_3 <= 3'h0; // default
      case (nextstate_1)
        ST_3_2_GBPS :        RATE_3_2_1 <= 1;
        RefClk125   : begin
                             CDV_INIT_1 <= 1;
                             CLK_SEL_1 <= 3'b000;
                             RATE_SEL_1 <= 2'b10;
        end
        RefClk160   :        CDV_INIT_1 <= 1;
        RstClkDiv125: begin
                             CLK_SEL_1 <= 3'b000;
                             RATE_SEL_1 <= 2'b10;
        end
        RstPCS125   : begin
                             CLK_SEL_1 <= 3'b000;
                             PCSRST_1 <= 1;
                             RATE_SEL_1 <= 2'b10;
                             cnt_1 <= voted_cnt_1 + 1;
        end
        RstPCS160   : begin
                             PCSRST_1 <= 1;
                             cnt_1 <= voted_cnt_1 + 1;
        end
        ST_1_25_GBPS: begin
                             CLK_SEL_1 <= 3'b000;
                             RATE_1_25_1 <= 1;
                             RATE_SEL_1 <= 2'b10;
        end
        WrdClk160   : begin
                             CDV_INIT_1 <= 1;
                             cnt_1 <= voted_cnt_1 + 1;
        end
        WrdClk62_5  : begin
                             CDV_INIT_1 <= 1;
                             CLK_SEL_1 <= 3'b0000;
                             RATE_SEL_1 <= 2'b10;
                             cnt_1 <= voted_cnt_1 + 1;
        end
      endcase
      case (nextstate_2)
        ST_3_2_GBPS :        RATE_3_2_2 <= 1;
        RefClk125   : begin
                             CDV_INIT_2 <= 1;
                             CLK_SEL_2 <= 3'b000;
                             RATE_SEL_2 <= 2'b10;
        end
        RefClk160   :        CDV_INIT_2 <= 1;
        RstClkDiv125: begin
                             CLK_SEL_2 <= 3'b000;
                             RATE_SEL_2 <= 2'b10;
        end
        RstPCS125   : begin
                             CLK_SEL_2 <= 3'b000;
                             PCSRST_2 <= 1;
                             RATE_SEL_2 <= 2'b10;
                             cnt_2 <= voted_cnt_2 + 1;
        end
        RstPCS160   : begin
                             PCSRST_2 <= 1;
                             cnt_2 <= voted_cnt_2 + 1;
        end
        ST_1_25_GBPS: begin
                             CLK_SEL_2 <= 3'b000;
                             RATE_1_25_2 <= 1;
                             RATE_SEL_2 <= 2'b10;
        end
        WrdClk160   : begin
                             CDV_INIT_2 <= 1;
                             cnt_2 <= voted_cnt_2 + 1;
        end
        WrdClk62_5  : begin
                             CDV_INIT_2 <= 1;
                             CLK_SEL_2 <= 3'b0000;
                             RATE_SEL_2 <= 2'b10;
                             cnt_2 <= voted_cnt_2 + 1;
        end
      endcase
      case (nextstate_3)
        ST_3_2_GBPS :        RATE_3_2_3 <= 1;
        RefClk125   : begin
                             CDV_INIT_3 <= 1;
                             CLK_SEL_3 <= 3'b000;
                             RATE_SEL_3 <= 2'b10;
        end
        RefClk160   :        CDV_INIT_3 <= 1;
        RstClkDiv125: begin
                             CLK_SEL_3 <= 3'b000;
                             RATE_SEL_3 <= 2'b10;
        end
        RstPCS125   : begin
                             CLK_SEL_3 <= 3'b000;
                             PCSRST_3 <= 1;
                             RATE_SEL_3 <= 2'b10;
                             cnt_3 <= voted_cnt_3 + 1;
        end
        RstPCS160   : begin
                             PCSRST_3 <= 1;
                             cnt_3 <= voted_cnt_3 + 1;
        end
        ST_1_25_GBPS: begin
                             CLK_SEL_3 <= 3'b000;
                             RATE_1_25_3 <= 1;
                             RATE_SEL_3 <= 2'b10;
        end
        WrdClk160   : begin
                             CDV_INIT_3 <= 1;
                             cnt_3 <= voted_cnt_3 + 1;
        end
        WrdClk62_5  : begin
                             CDV_INIT_3 <= 1;
                             CLK_SEL_3 <= 3'b0000;
                             RATE_SEL_3 <= 2'b10;
                             cnt_3 <= voted_cnt_3 + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [95:0] statename;
  always @* begin
    case (state_1)
      ST_3_2_GBPS : statename = "ST_3_2_GBPS";
      RefClk125   : statename = "RefClk125";
      RefClk160   : statename = "RefClk160";
      RstClkDiv125: statename = "RstClkDiv125";
      RstClkDiv160: statename = "RstClkDiv160";
      RstPCS125   : statename = "RstPCS125";
      RstPCS160   : statename = "RstPCS160";
      ST_1_25_GBPS: statename = "ST_1_25_GBPS";
      WrdClk160   : statename = "WrdClk160";
      WrdClk62_5  : statename = "WrdClk62_5";
      default     : statename = "XXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

