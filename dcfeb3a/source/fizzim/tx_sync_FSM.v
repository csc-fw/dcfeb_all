
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:09:18 at 15:09:26 (www.fizzim.com)

module tx_sync_FSM 
  #(
    parameter SYNC_CNT = 8192
  )(
  output reg SYNC_DONE,
  output reg TXDLYALIGNRESET,
  output reg TXENPMAPHASEALIGN,
  output reg TXPMASETPHASE,
  input CLK,
  input RST 
);

  // state bits
  parameter 
  Idle              = 3'b000, 
  Align_Reset       = 3'b001, 
  Phase_Align       = 3'b010, 
  Ready             = 3'b011, 
  Wait_B4_Set_Phase = 3'b100; 

  reg [2:0] state;

  reg [2:0] nextstate;

  reg [4:0] acnt;
  reg [15:0] scnt;
  reg [5:0] wcnt;

  // comb always block
  always @* begin
    nextstate = 3'bxxx; // default to x because default_state_is_x is set
    case (state)
      Idle             :                        nextstate = Align_Reset;
      Align_Reset      : if (acnt == 20)        nextstate = Wait_B4_Set_Phase;
                         else                   nextstate = Align_Reset;
      Phase_Align      : if (scnt == SYNC_CNT)  nextstate = Ready;
                         else                   nextstate = Phase_Align;
      Ready            :                        nextstate = Ready;
      Wait_B4_Set_Phase: if (wcnt == 32)        nextstate = Phase_Align;
                         else                   nextstate = Wait_B4_Set_Phase;
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
      SYNC_DONE <= 0;
      TXDLYALIGNRESET <= 0;
      TXENPMAPHASEALIGN <= 0;
      TXPMASETPHASE <= 0;
      acnt <= 5'h00;
      scnt <= 16'h0000;
      wcnt <= 6'h00;
    end
    else begin
      SYNC_DONE <= 0; // default
      TXDLYALIGNRESET <= 0; // default
      TXENPMAPHASEALIGN <= 0; // default
      TXPMASETPHASE <= 0; // default
      acnt <= 5'h00; // default
      scnt <= 16'h0000; // default
      wcnt <= 6'h00; // default
      case (nextstate)
        Align_Reset      : begin
                                  TXDLYALIGNRESET <= 1;
                                  acnt <= acnt + 1;
        end
        Phase_Align      : begin
                                  TXENPMAPHASEALIGN <= 1;
                                  TXPMASETPHASE <= 1;
                                  scnt <= scnt + 1;
        end
        Ready            : begin
                                  SYNC_DONE <= 1;
                                  TXENPMAPHASEALIGN <= 1;
        end
        Wait_B4_Set_Phase: begin
                                  TXENPMAPHASEALIGN <= 1;
                                  wcnt <= wcnt + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [135:0] statename;
  always @* begin
    case (state)
      Idle             : statename = "Idle";
      Align_Reset      : statename = "Align_Reset";
      Phase_Align      : statename = "Phase_Align";
      Ready            : statename = "Ready";
      Wait_B4_Set_Phase: statename = "Wait_B4_Set_Phase";
      default          : statename = "XXXXXXXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

