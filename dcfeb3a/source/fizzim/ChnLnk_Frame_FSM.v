
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:05:59 (www.fizzim.com)

module ChnLnk_Frame_FSM (
  output reg CLR_CRC,
  output reg LAST_WRD,
  output reg RD,
  output reg [6:0] SEQ,
  output reg VALID,
  output wire [2:0] FRM_STATE,
  input CLK,
  input END_EVT,
  input F_MT,
  input L1A_BUF_MT,
  input RST 
);

  // state bits
  parameter 
  Idle        = 3'b000, 
  Last_Word   = 3'b001, 
  Read        = 3'b010, 
  Strt_Sample = 3'b011, 
  Tail_End    = 3'b100, 
  Tail_No_End = 3'b101, 
  W4Data      = 3'b110; 

  reg [2:0] state;

  assign FRM_STATE = state;

  reg [2:0] nextstate;

  reg [6:0] seqn;

  // comb always block
  always @* begin
    nextstate = 3'bxxx; // default to x because default_state_is_x is set
    SEQ = seqn; // default
    case (state)
      Idle       : if      (!L1A_BUF_MT)               nextstate = W4Data;
                   else                                nextstate = Idle;
      Last_Word  :                                     nextstate = Idle;
      Read       : if      (seqn == 7'd95 && END_EVT)  nextstate = Tail_End;
                   else if (seqn == 7'd95)             nextstate = Tail_No_End;
                   else                                nextstate = Read;
      Strt_Sample:                                     nextstate = Read;
      Tail_End   : if      (seqn == 7'd99)             nextstate = Last_Word;
                   else                                nextstate = Tail_End;
      Tail_No_End: if      (seqn == 7'd99)             nextstate = W4Data;
                   else                                nextstate = Tail_No_End;
      W4Data     : if      (!F_MT)                     nextstate = Strt_Sample;
                   else                                nextstate = W4Data;
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
      CLR_CRC <= 0;
      LAST_WRD <= 0;
      RD <= 0;
      VALID <= 0;
      seqn <= 7'h00;
    end
    else begin
      CLR_CRC <= 0; // default
      LAST_WRD <= 0; // default
      RD <= 0; // default
      VALID <= 0; // default
      seqn <= 7'h00; // default
      case (nextstate)
        Last_Word  :        LAST_WRD <= 1;
        Read       : begin
                            RD <= 1;
                            VALID <= 1;
                            seqn <= seqn + 1;
        end
        Strt_Sample: begin
                            RD <= 1;
                            VALID <= 1;
        end
        Tail_End   : begin
                            VALID <= 1;
                            seqn <= seqn + 1;
        end
        Tail_No_End: begin
                            VALID <= 1;
                            seqn <= seqn + 1;
        end
        W4Data     :        CLR_CRC <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [87:0] statename;
  always @* begin
    case (state)
      Idle       : statename = "Idle";
      Last_Word  : statename = "Last_Word";
      Read       : statename = "Read";
      Strt_Sample: statename = "Strt_Sample";
      Tail_End   : statename = "Tail_End";
      Tail_No_End: statename = "Tail_No_End";
      W4Data     : statename = "W4Data";
      default    : statename = "XXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

