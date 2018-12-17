
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:25 at 17:16:35 (www.fizzim.com)

module BPI_ctrl_FSM_TMR (
  output CYCLE2,
  output DECR,
  output EXECUTE,
  output LOAD_N,
  output NEXT,
  output SEQ_DONE,
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

  (* syn_preserve = "true" *) reg [3:0] state_1;
  (* syn_preserve = "true" *) reg [3:0] state_2;
  (* syn_preserve = "true" *) reg [3:0] state_3;

  (* syn_keep = "true" *) wire [3:0] voted_state_1;
  (* syn_keep = "true" *) wire [3:0] voted_state_2;
  (* syn_keep = "true" *) wire [3:0] voted_state_3;

  assign voted_state_1    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_2    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_3    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic

  assign OUT_STATE = voted_state_1;

  (* syn_keep = "true" *) reg [3:0] nextstate_1;
  (* syn_keep = "true" *) reg [3:0] nextstate_2;
  (* syn_keep = "true" *) reg [3:0] nextstate_3;

  (* syn_preserve = "true" *)  reg CYCLE2_1;
  (* syn_preserve = "true" *)  reg CYCLE2_2;
  (* syn_preserve = "true" *)  reg CYCLE2_3;
  (* syn_preserve = "true" *)  reg DECR_1;
  (* syn_preserve = "true" *)  reg DECR_2;
  (* syn_preserve = "true" *)  reg DECR_3;
  (* syn_preserve = "true" *)  reg EXECUTE_1;
  (* syn_preserve = "true" *)  reg EXECUTE_2;
  (* syn_preserve = "true" *)  reg EXECUTE_3;
  (* syn_preserve = "true" *)  reg LOAD_N_1;
  (* syn_preserve = "true" *)  reg LOAD_N_2;
  (* syn_preserve = "true" *)  reg LOAD_N_3;
  (* syn_preserve = "true" *)  reg NEXT_1;
  (* syn_preserve = "true" *)  reg NEXT_2;
  (* syn_preserve = "true" *)  reg NEXT_3;
  (* syn_preserve = "true" *)  reg SEQ_DONE_1;
  (* syn_preserve = "true" *)  reg SEQ_DONE_2;
  (* syn_preserve = "true" *)  reg SEQ_DONE_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign CYCLE2   = (CYCLE2_1   & CYCLE2_2  ) | (CYCLE2_2   & CYCLE2_3  ) | (CYCLE2_1   & CYCLE2_3  ); // Majority logic
  assign DECR     = (DECR_1     & DECR_2    ) | (DECR_2     & DECR_3    ) | (DECR_1     & DECR_3    ); // Majority logic
  assign EXECUTE  = (EXECUTE_1  & EXECUTE_2 ) | (EXECUTE_2  & EXECUTE_3 ) | (EXECUTE_1  & EXECUTE_3 ); // Majority logic
  assign LOAD_N   = (LOAD_N_1   & LOAD_N_2  ) | (LOAD_N_2   & LOAD_N_3  ) | (LOAD_N_1   & LOAD_N_3  ); // Majority logic
  assign NEXT     = (NEXT_1     & NEXT_2    ) | (NEXT_2     & NEXT_3    ) | (NEXT_1     & NEXT_3    ); // Majority logic
  assign SEQ_DONE = (SEQ_DONE_1 & SEQ_DONE_2) | (SEQ_DONE_2 & SEQ_DONE_3) | (SEQ_DONE_1 & SEQ_DONE_3); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_2 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_3 = 4'bxxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle          : if      (WRITE_N || READ_N)     nextstate_1 = Load_n;
                      else if (OTHER)                 nextstate_1 = Wait4Rdy1;
                      else                            nextstate_1 = Idle;
      Decr          :                                 nextstate_1 = Next;
      Ex_2nd_Cycle  : if      (BUSY)                  nextstate_1 = Seq_Done;
                      else                            nextstate_1 = Ex_2nd_Cycle;
      Ex_First_Cycle: if      (BUSY && TWO_CYCLE)     nextstate_1 = Wait4Rdy2;
                      else if (BUSY && READ_1)        nextstate_1 = Wait4Data;
                      else if (BUSY)                  nextstate_1 = Seq_Done;
                      else                            nextstate_1 = Ex_First_Cycle;
      Ex_RW         : if      (BUSY && READ_N)        nextstate_1 = Wait4Data;
                      else if (BUSY)                  nextstate_1 = Decr;
                      else                            nextstate_1 = Ex_RW;
      Load_n        :                                 nextstate_1 = Wait4RdyRW;
      Next          : if      (TERM_CNT)              nextstate_1 = Seq_Done;
                      else                            nextstate_1 = Wait4RdyRW;
      Seq_Done      : if      (NOOP)                  nextstate_1 = Idle;
                      else                            nextstate_1 = Seq_Done;
      Wait4Data     : if      (LD_DAT && READ_N)      nextstate_1 = Decr;
                      else if (LD_DAT && READ_1)      nextstate_1 = Seq_Done;
                      else                            nextstate_1 = Wait4Data;
      Wait4Rdy1     : if      (RDY)                   nextstate_1 = Ex_First_Cycle;
                      else                            nextstate_1 = Wait4Rdy1;
      Wait4Rdy2     : if      (RDY)                   nextstate_1 = Ex_2nd_Cycle;
                      else                            nextstate_1 = Wait4Rdy2;
      Wait4RdyRW    : if      (RDY && READ_N)         nextstate_1 = Ex_RW;
                      else if (RDY & WRITE_N && !MT)  nextstate_1 = Ex_RW;
                      else                            nextstate_1 = Wait4RdyRW;
    endcase
    case (voted_state_2)
      Idle          : if      (WRITE_N || READ_N)     nextstate_2 = Load_n;
                      else if (OTHER)                 nextstate_2 = Wait4Rdy1;
                      else                            nextstate_2 = Idle;
      Decr          :                                 nextstate_2 = Next;
      Ex_2nd_Cycle  : if      (BUSY)                  nextstate_2 = Seq_Done;
                      else                            nextstate_2 = Ex_2nd_Cycle;
      Ex_First_Cycle: if      (BUSY && TWO_CYCLE)     nextstate_2 = Wait4Rdy2;
                      else if (BUSY && READ_1)        nextstate_2 = Wait4Data;
                      else if (BUSY)                  nextstate_2 = Seq_Done;
                      else                            nextstate_2 = Ex_First_Cycle;
      Ex_RW         : if      (BUSY && READ_N)        nextstate_2 = Wait4Data;
                      else if (BUSY)                  nextstate_2 = Decr;
                      else                            nextstate_2 = Ex_RW;
      Load_n        :                                 nextstate_2 = Wait4RdyRW;
      Next          : if      (TERM_CNT)              nextstate_2 = Seq_Done;
                      else                            nextstate_2 = Wait4RdyRW;
      Seq_Done      : if      (NOOP)                  nextstate_2 = Idle;
                      else                            nextstate_2 = Seq_Done;
      Wait4Data     : if      (LD_DAT && READ_N)      nextstate_2 = Decr;
                      else if (LD_DAT && READ_1)      nextstate_2 = Seq_Done;
                      else                            nextstate_2 = Wait4Data;
      Wait4Rdy1     : if      (RDY)                   nextstate_2 = Ex_First_Cycle;
                      else                            nextstate_2 = Wait4Rdy1;
      Wait4Rdy2     : if      (RDY)                   nextstate_2 = Ex_2nd_Cycle;
                      else                            nextstate_2 = Wait4Rdy2;
      Wait4RdyRW    : if      (RDY && READ_N)         nextstate_2 = Ex_RW;
                      else if (RDY & WRITE_N && !MT)  nextstate_2 = Ex_RW;
                      else                            nextstate_2 = Wait4RdyRW;
    endcase
    case (voted_state_3)
      Idle          : if      (WRITE_N || READ_N)     nextstate_3 = Load_n;
                      else if (OTHER)                 nextstate_3 = Wait4Rdy1;
                      else                            nextstate_3 = Idle;
      Decr          :                                 nextstate_3 = Next;
      Ex_2nd_Cycle  : if      (BUSY)                  nextstate_3 = Seq_Done;
                      else                            nextstate_3 = Ex_2nd_Cycle;
      Ex_First_Cycle: if      (BUSY && TWO_CYCLE)     nextstate_3 = Wait4Rdy2;
                      else if (BUSY && READ_1)        nextstate_3 = Wait4Data;
                      else if (BUSY)                  nextstate_3 = Seq_Done;
                      else                            nextstate_3 = Ex_First_Cycle;
      Ex_RW         : if      (BUSY && READ_N)        nextstate_3 = Wait4Data;
                      else if (BUSY)                  nextstate_3 = Decr;
                      else                            nextstate_3 = Ex_RW;
      Load_n        :                                 nextstate_3 = Wait4RdyRW;
      Next          : if      (TERM_CNT)              nextstate_3 = Seq_Done;
                      else                            nextstate_3 = Wait4RdyRW;
      Seq_Done      : if      (NOOP)                  nextstate_3 = Idle;
                      else                            nextstate_3 = Seq_Done;
      Wait4Data     : if      (LD_DAT && READ_N)      nextstate_3 = Decr;
                      else if (LD_DAT && READ_1)      nextstate_3 = Seq_Done;
                      else                            nextstate_3 = Wait4Data;
      Wait4Rdy1     : if      (RDY)                   nextstate_3 = Ex_First_Cycle;
                      else                            nextstate_3 = Wait4Rdy1;
      Wait4Rdy2     : if      (RDY)                   nextstate_3 = Ex_2nd_Cycle;
                      else                            nextstate_3 = Wait4Rdy2;
      Wait4RdyRW    : if      (RDY && READ_N)         nextstate_3 = Ex_RW;
                      else if (RDY & WRITE_N && !MT)  nextstate_3 = Ex_RW;
                      else                            nextstate_3 = Wait4RdyRW;
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
      CYCLE2_1 <= 0;
      CYCLE2_2 <= 0;
      CYCLE2_3 <= 0;
      DECR_1 <= 0;
      DECR_2 <= 0;
      DECR_3 <= 0;
      EXECUTE_1 <= 0;
      EXECUTE_2 <= 0;
      EXECUTE_3 <= 0;
      LOAD_N_1 <= 0;
      LOAD_N_2 <= 0;
      LOAD_N_3 <= 0;
      NEXT_1 <= 0;
      NEXT_2 <= 0;
      NEXT_3 <= 0;
      SEQ_DONE_1 <= 0;
      SEQ_DONE_2 <= 0;
      SEQ_DONE_3 <= 0;
    end
    else begin
      CYCLE2_1 <= 0; // default
      CYCLE2_2 <= 0; // default
      CYCLE2_3 <= 0; // default
      DECR_1 <= 0; // default
      DECR_2 <= 0; // default
      DECR_3 <= 0; // default
      EXECUTE_1 <= 0; // default
      EXECUTE_2 <= 0; // default
      EXECUTE_3 <= 0; // default
      LOAD_N_1 <= 0; // default
      LOAD_N_2 <= 0; // default
      LOAD_N_3 <= 0; // default
      NEXT_1 <= 0; // default
      NEXT_2 <= 0; // default
      NEXT_3 <= 0; // default
      SEQ_DONE_1 <= 0; // default
      SEQ_DONE_2 <= 0; // default
      SEQ_DONE_3 <= 0; // default
      case (nextstate_1)
        Decr          :        DECR_1 <= 1;
        Ex_2nd_Cycle  : begin
                               CYCLE2_1 <= 1;
                               EXECUTE_1 <= 1;
        end
        Ex_First_Cycle:        EXECUTE_1 <= 1;
        Ex_RW         :        EXECUTE_1 <= 1;
        Load_n        :        LOAD_N_1 <= 1;
        Next          :        NEXT_1 <= 1;
        Seq_Done      :        SEQ_DONE_1 <= 1;
        Wait4Rdy2     :        CYCLE2_1 <= 1;
      endcase
      case (nextstate_2)
        Decr          :        DECR_2 <= 1;
        Ex_2nd_Cycle  : begin
                               CYCLE2_2 <= 1;
                               EXECUTE_2 <= 1;
        end
        Ex_First_Cycle:        EXECUTE_2 <= 1;
        Ex_RW         :        EXECUTE_2 <= 1;
        Load_n        :        LOAD_N_2 <= 1;
        Next          :        NEXT_2 <= 1;
        Seq_Done      :        SEQ_DONE_2 <= 1;
        Wait4Rdy2     :        CYCLE2_2 <= 1;
      endcase
      case (nextstate_3)
        Decr          :        DECR_3 <= 1;
        Ex_2nd_Cycle  : begin
                               CYCLE2_3 <= 1;
                               EXECUTE_3 <= 1;
        end
        Ex_First_Cycle:        EXECUTE_3 <= 1;
        Ex_RW         :        EXECUTE_3 <= 1;
        Load_n        :        LOAD_N_3 <= 1;
        Next          :        NEXT_3 <= 1;
        Seq_Done      :        SEQ_DONE_3 <= 1;
        Wait4Rdy2     :        CYCLE2_3 <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [111:0] statename;
  always @* begin
    case (state_1)
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

