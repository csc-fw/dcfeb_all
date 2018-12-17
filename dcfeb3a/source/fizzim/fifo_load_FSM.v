
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 12:51:22 (www.fizzim.com)

module FIFO_Load_FSM (
  output reg [2:0] SEL,
  output reg WRENA,
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

  reg [1:0] state;

  reg [1:0] nextstate;

  reg [6:0] sample;

  // comb always block
  always @* begin
    nextstate = 2'bxx; // default to x because default_state_is_x is set
    case (state)
      Idle    : if      (START)                              nextstate = Rst_Samp;
                else                                         nextstate = Idle;
      Nxt_Samp:                                              nextstate = Transfer;
      Rst_Samp:                                              nextstate = Transfer;
      Transfer: if      (START)                              nextstate = Rst_Samp;
                else if (sample == SAMP_MAX && SEL == 3'd5)  nextstate = Idle;
                else if (SEL == 3'd5)                        nextstate = Nxt_Samp;
                else                                         nextstate = Transfer;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST)
      state <= Idle;
    else
      state <= nextstate;
  end

  // datapath sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      SEL <= 3'h0;
      WRENA <= 0;
      sample <= 7'h00;
    end
    else begin
      SEL <= 3'h0; // default
      WRENA <= 1; // default
      sample <= sample; // default
      case (nextstate)
        Idle    : begin
                         WRENA <= 0;
                         sample <= 7'h00;
        end
        Nxt_Samp:        sample <= sample + 1;
        Rst_Samp:        sample <= 7'h00;
        Transfer:        SEL <= SEL + 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [63:0] statename;
  always @* begin
    case (state)
      Idle    : statename = "Idle";
      Nxt_Samp: statename = "Nxt_Samp";
      Rst_Samp: statename = "Rst_Samp";
      Transfer: statename = "Transfer";
      default : statename = "XXXXXXXX";
    endcase
  end
  `endif

endmodule

