
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:25 at 17:16:46 (www.fizzim.com)

module BPI_ctrl_FSM (
  output reg CYCLE2,
  output reg DECR,
  output reg EXECUTE,
  output reg LOAD_N,
  output reg NEXT,
  output reg SEQ_DONE,
  output wire [3:0] OUT_STATE,
  input BUSY,
  input CLK,
  input LD_DAT,
  input MT,
  input NOOP,
  input OTHER,
  input RDY,
  input READ_1,
  input READ_N,
  input RST,
  input TERM_CNT,
  input TWO_CYCLE,
  input WRITE_N 
);

  // state bits
  parameter 
  Idle           = 4'b0000, 
  Decr           = 4'b0001, 
  Ex_2nd_Cycle   = 4'b0010, 
  Ex_First_Cycle = 4'b0011, 
  Ex_RW          = 4'b0100, 
  Load_n         = 4'b0101, 
  Next           = 4'b0110, 
  Seq_Done       = 4'b0111, 
  Wait4Data      = 4'b1000, 
  Wait4Rdy1      = 4'b1001, 
  Wait4Rdy2      = 4'b1010, 
  Wait4RdyRW     = 4'b1011; 

  reg [3:0] state;

  assign OUT_STATE = state;

  reg [3:0] nextstate;


  // comb always block
  always @* begin
    nextstate = 4'bxxxx; // default to x because default_state_is_x is set
    case (state)
      Idle          : if      (WRITE_N || READ_N)     nextstate = Load_n;
                      else if (OTHER)                 nextstate = Wait4Rdy1;
                      else                            nextstate = Idle;
      Decr          :                                 nextstate = Next;
      Ex_2nd_Cycle  : if      (BUSY)                  nextstate = Seq_Done;
                      else                            nextstate = Ex_2nd_Cycle;
      Ex_First_Cycle: if      (BUSY && TWO_CYCLE)     nextstate = Wait4Rdy2;
                      else if (BUSY && READ_1)        nextstate = Wait4Data;
                      else if (BUSY)                  nextstate = Seq_Done;
                      else                            nextstate = Ex_First_Cycle;
      Ex_RW         : if      (BUSY && READ_N)        nextstate = Wait4Data;
                      else if (BUSY)                  nextstate = Decr;
                      else                            nextstate = Ex_RW;
      Load_n        :                                 nextstate = Wait4RdyRW;
      Next          : if      (TERM_CNT)              nextstate = Seq_Done;
                      else                            nextstate = Wait4RdyRW;
      Seq_Done      : if      (NOOP)                  nextstate = Idle;
                      else                            nextstate = Seq_Done;
      Wait4Data     : if      (LD_DAT && READ_N)      nextstate = Decr;
                      else if (LD_DAT && READ_1)      nextstate = Seq_Done;
                      else                            nextstate = Wait4Data;
      Wait4Rdy1     : if      (RDY)                   nextstate = Ex_First_Cycle;
                      else                            nextstate = Wait4Rdy1;
      Wait4Rdy2     : if      (RDY)                   nextstate = Ex_2nd_Cycle;
                      else                            nextstate = Wait4Rdy2;
      Wait4RdyRW    : if      (RDY && READ_N)         nextstate = Ex_RW;
                      else if (RDY & WRITE_N && !MT)  nextstate = Ex_RW;
                      else                            nextstate = Wait4RdyRW;
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
      CYCLE2 <= 0;
      DECR <= 0;
      EXECUTE <= 0;
      LOAD_N <= 0;
      NEXT <= 0;
      SEQ_DONE <= 0;
    end
    else begin
      CYCLE2 <= 0; // default
      DECR <= 0; // default
      EXECUTE <= 0; // default
      LOAD_N <= 0; // default
      NEXT <= 0; // default
      SEQ_DONE <= 0; // default
      case (nextstate)
        Decr          :        DECR <= 1;
        Ex_2nd_Cycle  : begin
                               CYCLE2 <= 1;
                               EXECUTE <= 1;
        end
        Ex_First_Cycle:        EXECUTE <= 1;
        Ex_RW         :        EXECUTE <= 1;
        Load_n        :        LOAD_N <= 1;
        Next          :        NEXT <= 1;
        Seq_Done      :        SEQ_DONE <= 1;
        Wait4Rdy2     :        CYCLE2 <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [111:0] statename;
  always @* begin
    case (state)
      Idle          : statename = "Idle";
      Decr          : statename = "Decr";
      Ex_2nd_Cycle  : statename = "Ex_2nd_Cycle";
      Ex_First_Cycle: statename = "Ex_First_Cycle";
      Ex_RW         : statename = "Ex_RW";
      Load_n        : statename = "Load_n";
      Next          : statename = "Next";
      Seq_Done      : statename = "Seq_Done";
      Wait4Data     : statename = "Wait4Data";
      Wait4Rdy1     : statename = "Wait4Rdy1";
      Wait4Rdy2     : statename = "Wait4Rdy2";
      Wait4RdyRW    : statename = "Wait4RdyRW";
      default       : statename = "XXXXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

