
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:31:39 (www.fizzim.com)

module DAQ_Rate_Sel_FSM (
  output reg CDV_INIT,
  output reg [2:0] CLK_SEL,
  output reg PCSRST,
  output reg RATE_1_25,
  output reg RATE_3_2,
  output reg [1:0] RATE_SEL,
  output reg WRDCLKSEL,
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

  reg [3:0] state;

  assign DQRT_STATE = state;

  reg [3:0] nextstate;

  reg [2:0] cnt;
  reg next_WRDCLKSEL;

  // comb always block
  always @* begin
    nextstate = 4'bxxxx; // default to x because default_state_is_x is set
    next_WRDCLKSEL = WRDCLKSEL;
    case (state)
      ST_3_2_GBPS : if (!DAQ_RATE)         nextstate = RefClk125;
                    else                   nextstate = ST_3_2_GBPS;
      RefClk125   : begin
        if             (TXRATEDONE) begin
                                           nextstate = WrdClk62_5;
                                           next_WRDCLKSEL = 0;
        end
        else                               nextstate = RefClk125;
      end
      RefClk160   : begin
        if             (TXRATEDONE) begin
                                           nextstate = WrdClk160;
                                           next_WRDCLKSEL = 1;
        end
        else                               nextstate = RefClk160;
      end
      RstClkDiv125: if (CDV_DONE)          nextstate = RstPCS125;
                    else                   nextstate = RstClkDiv125;
      RstClkDiv160: if (CDV_DONE)          nextstate = RstPCS160;
                    else                   nextstate = RstClkDiv160;
      RstPCS125   : if (cnt == 3'd5)       nextstate = ST_1_25_GBPS;
                    else                   nextstate = RstPCS125;
      RstPCS160   : if (cnt == 3'd5)       nextstate = ST_3_2_GBPS;
                    else                   nextstate = RstPCS160;
      ST_1_25_GBPS: if (DAQ_RATE)          nextstate = RefClk160;
                    else                   nextstate = ST_1_25_GBPS;
      WrdClk160   : if (cnt == 3'd5)       nextstate = RstClkDiv160;
                    else                   nextstate = WrdClk160;
      WrdClk62_5  : if (cnt == 3'd5)       nextstate = RstClkDiv125;
                    else                   nextstate = WrdClk62_5;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state <= ST_3_2_GBPS;
      WRDCLKSEL <= 1;
    end
    else begin
      state <= nextstate;
      WRDCLKSEL <= next_WRDCLKSEL;
    end
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      CDV_INIT <= 0;
      CLK_SEL <= 3'b001;
      PCSRST <= 0;
      RATE_1_25 <= 0;
      RATE_3_2 <= 0;
      RATE_SEL <= 2'b11;
      cnt <= 3'h0;
    end
    else begin
      CDV_INIT <= 0; // default
      CLK_SEL <= 3'b001; // default
      PCSRST <= 0; // default
      RATE_1_25 <= 0; // default
      RATE_3_2 <= 0; // default
      RATE_SEL <= 2'b11; // default
      cnt <= 3'h0; // default
      case (nextstate)
        ST_3_2_GBPS :        RATE_3_2 <= 1;
        RefClk125   : begin
                             CDV_INIT <= 1;
                             CLK_SEL <= 3'b000;
                             RATE_SEL <= 2'b10;
        end
        RefClk160   :        CDV_INIT <= 1;
        RstClkDiv125: begin
                             CLK_SEL <= 3'b000;
                             RATE_SEL <= 2'b10;
        end
        RstPCS125   : begin
                             CLK_SEL <= 3'b000;
                             PCSRST <= 1;
                             RATE_SEL <= 2'b10;
                             cnt <= cnt + 1;
        end
        RstPCS160   : begin
                             PCSRST <= 1;
                             cnt <= cnt + 1;
        end
        ST_1_25_GBPS: begin
                             CLK_SEL <= 3'b000;
                             RATE_1_25 <= 1;
                             RATE_SEL <= 2'b10;
        end
        WrdClk160   : begin
                             CDV_INIT <= 1;
                             cnt <= cnt + 1;
        end
        WrdClk62_5  : begin
                             CDV_INIT <= 1;
                             CLK_SEL <= 3'b0000;
                             RATE_SEL <= 2'b10;
                             cnt <= cnt + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [95:0] statename;
  always @* begin
    case (state)
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

