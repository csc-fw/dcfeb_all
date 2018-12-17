
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:14:03 (www.fizzim.com)

module Sample_Proc_FSM (
  output reg CE,
  output reg CLR_CRC,
  output reg LAST_WRD,
  output reg LD_L1A_H,
  output reg LD_L1A_L,
  output reg RD,
  output reg [6:0] SEQ,
  output reg VALID,
  output wire [3:0] SMP_STATE,
  input CLK,
  input FAMT,
  input L1A_BUF_MT,
  input L1A_HEAD,
  input RST,
  input wire [6:0] SAMP_MAX,
  input TXACK 
);

  // state bits
  parameter 
  Idle        = 4'b0000, 
  Inc_Samp    = 4'b0001, 
  Last_Word   = 4'b0010, 
  Ld_L1A_High = 4'b0011, 
  Ld_L1A_Low  = 4'b0100, 
  Read        = 4'b0101, 
  St_Data     = 4'b0110, 
  Strt_Seq    = 4'b0111, 
  Tail        = 4'b1000, 
  W4Data      = 4'b1001, 
  W4TXACK     = 4'b1010; 

  reg [3:0] state;

  assign SMP_STATE = state;

  reg [3:0] nextstate;

  reg [6:0] seqn;
  reg [6:0] smp;

  // comb always block
  always @* begin
    nextstate = 4'bxxxx; // default to x because default_state_is_x is set
    SEQ = seqn; // default
    case (state)
      Idle       : if      (!L1A_BUF_MT)                  nextstate = W4Data;
                   else                                   nextstate = Idle;
      Inc_Samp   : if      (smp == SAMP_MAX)              nextstate = Last_Word;
                   else                                   nextstate = Strt_Seq;
      Last_Word  :                                        nextstate = Idle;
      Ld_L1A_High:                                        nextstate = Ld_L1A_Low;
      Ld_L1A_Low :                                        nextstate = St_Data;
      Read       : if      (seqn == 7'd95)                nextstate = Tail;
                   else                                   nextstate = Read;
      St_Data    : if      (L1A_HEAD)                     nextstate = W4TXACK;
                   else if (!L1A_HEAD && (seqn == 7'd2))  nextstate = W4TXACK;
                   else                                   nextstate = St_Data;
      Strt_Seq   :                                        nextstate = Read;
      Tail       : if      (seqn == 7'd98)                nextstate = Inc_Samp;
                   else                                   nextstate = Tail;
      W4Data     : if      (!FAMT && L1A_HEAD)            nextstate = Ld_L1A_High;
                   else if (!FAMT && !L1A_HEAD)           nextstate = St_Data;
                   else                                   nextstate = W4Data;
      W4TXACK    : if      (TXACK)                        nextstate = Read;
                   else                                   nextstate = W4TXACK;
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
      CE <= 1;
      CLR_CRC <= 0;
      LAST_WRD <= 0;
      LD_L1A_H <= 0;
      LD_L1A_L <= 0;
      RD <= 0;
      VALID <= 0;
      seqn <= 7'h7F;
      smp <= 7'h00;
    end
    else begin
      CE <= 1; // default
      CLR_CRC <= 0; // default
      LAST_WRD <= 0; // default
      LD_L1A_H <= 0; // default
      LD_L1A_L <= 0; // default
      RD <= 0; // default
      VALID <= 0; // default
      seqn <= 7'h7F; // default
      smp <= smp; // default
      case (nextstate)
        Idle       :        smp <= 7'h00;
        Inc_Samp   : begin
                            CLR_CRC <= 1;
                            VALID <= 1;
                            seqn <= seqn + 1;
        end
        Last_Word  :        LAST_WRD <= 1;
        Ld_L1A_High: begin
                            CLR_CRC <= 1;
                            LD_L1A_H <= 1;
        end
        Ld_L1A_Low : begin
                            CLR_CRC <= 1;
                            LD_L1A_L <= 1;
        end
        Read       : begin
                            RD <= 1;
                            VALID <= 1;
                            seqn <= seqn + 1;
        end
        St_Data    : begin
                            RD <= 1;
                            VALID <= 1;
                            seqn <= seqn + 1;
        end
        Strt_Seq   : begin
                            RD <= 1;
                            VALID <= 1;
                            seqn <= 7'h00;
                            smp <= smp + 1;
        end
        Tail       : begin
                            VALID <= 1;
                            seqn <= seqn + 1;
        end
        W4Data     :        CLR_CRC <= 1;
        W4TXACK    : begin
                            CE <= 0;
                            VALID <= 1;
                            seqn <= seqn;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [87:0] statename;
  always @* begin
    case (state)
      Idle       : statename = "Idle";
      Inc_Samp   : statename = "Inc_Samp";
      Last_Word  : statename = "Last_Word";
      Ld_L1A_High: statename = "Ld_L1A_High";
      Ld_L1A_Low : statename = "Ld_L1A_Low";
      Read       : statename = "Read";
      St_Data    : statename = "St_Data";
      Strt_Seq   : statename = "Strt_Seq";
      Tail       : statename = "Tail";
      W4Data     : statename = "W4Data";
      W4TXACK    : statename = "W4TXACK";
      default    : statename = "XXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

