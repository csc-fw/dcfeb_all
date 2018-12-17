
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 13:14:23 (www.fizzim.com)

module transfer_samples_FSM (
  output reg [3:0] CHAN,
  output reg L1A_RD_EN,
  output reg RDENA,
  output wire [2:0] XSTATE,
  input CLK,
  input JTAG_MODE,
  input RDY,
  input RST 
);

  // state bits
  parameter 
  Idle           = 3'b000, 
  Inc_Chan_state = 3'b001, 
  L1A_Rd_two     = 3'b010, 
  Rd_Ena         = 3'b011, 
  Strt_Trns      = 3'b100, 
  Wait           = 3'b101; 

  reg [2:0] state;

  assign XSTATE = state;

  reg [2:0] nextstate;

  reg [2:0] chip;
  reg [2:0] cnt;

  // comb always block
  always @* begin
    nextstate = 3'bxxx; // default to x because default_state_is_x is set
    case (state)
      Idle          : if      (RDY && !JTAG_MODE)                  nextstate = Wait;
                      else                                         nextstate = Idle;
      Inc_Chan_state:                                              nextstate = Rd_Ena;
      L1A_Rd_two    : if      (cnt ==  6)                          nextstate = Strt_Trns;
                      else                                         nextstate = L1A_Rd_two;
      Rd_Ena        : if      (RDY && (chip == 5) && (CHAN ==15))  nextstate = Wait;
                      else if ((chip == 5) && (CHAN == 15))        nextstate = Idle;
                      else if ((chip == 5))                        nextstate = Inc_Chan_state;
                      else                                         nextstate = Rd_Ena;
      Strt_Trns     :                                              nextstate = Rd_Ena;
      Wait          : if      (cnt == 4)                           nextstate = L1A_Rd_two;
                      else                                         nextstate = Wait;
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
      CHAN <= 4'h0;
      L1A_RD_EN <= 0;
      RDENA <= 0;
      chip <= 3'h0;
      cnt <= 3'h0;
    end
    else begin
      CHAN <= 4'h0; // default
      L1A_RD_EN <= 0; // default
      RDENA <= 0; // default
      chip <= 3'h0; // default
      cnt <= 3'h0; // default
      case (nextstate)
        Inc_Chan_state: begin
                               CHAN <= CHAN + 1;
                               RDENA <= 1;
        end
        L1A_Rd_two    : begin
                               L1A_RD_EN <= 1;
                               cnt <= cnt + 1;
        end
        Rd_Ena        : begin
                               CHAN <= CHAN;
                               RDENA <= 1;
                               chip <= chip + 1;
        end
        Strt_Trns     :        RDENA <= 1;
        Wait          :        cnt <= cnt + 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [111:0] statename;
  always @* begin
    case (state)
      Idle          : statename = "Idle";
      Inc_Chan_state: statename = "Inc_Chan_state";
      L1A_Rd_two    : statename = "L1A_Rd_two";
      Rd_Ena        : statename = "Rd_Ena";
      Strt_Trns     : statename = "Strt_Trns";
      Wait          : statename = "Wait";
      default       : statename = "XXXXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

