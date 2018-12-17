
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:09:18 at 15:09:28 (www.fizzim.com)

module tx_sync_FSM_TMR 
  #(
    parameter SYNC_CNT = 8192
  )(
  output SYNC_DONE,
  output TXDLYALIGNRESET,
  output TXENPMAPHASEALIGN,
  output TXPMASETPHASE,
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

  (* syn_preserve = "true" *) reg [2:0] state_1;
  (* syn_preserve = "true" *) reg [2:0] state_2;
  (* syn_preserve = "true" *) reg [2:0] state_3;

  (* syn_keep = "true" *) wire [2:0] voted_state_1;
  (* syn_keep = "true" *) wire [2:0] voted_state_2;
  (* syn_keep = "true" *) wire [2:0] voted_state_3;

  assign voted_state_1             = (state_1             & state_2            ) | (state_2             & state_3            ) | (state_1             & state_3            ); // Majority logic
  assign voted_state_2             = (state_1             & state_2            ) | (state_2             & state_3            ) | (state_1             & state_3            ); // Majority logic
  assign voted_state_3             = (state_1             & state_2            ) | (state_2             & state_3            ) | (state_1             & state_3            ); // Majority logic

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg SYNC_DONE_1;
  (* syn_preserve = "true" *)  reg SYNC_DONE_2;
  (* syn_preserve = "true" *)  reg SYNC_DONE_3;
  (* syn_preserve = "true" *)  reg TXDLYALIGNRESET_1;
  (* syn_preserve = "true" *)  reg TXDLYALIGNRESET_2;
  (* syn_preserve = "true" *)  reg TXDLYALIGNRESET_3;
  (* syn_preserve = "true" *)  reg TXENPMAPHASEALIGN_1;
  (* syn_preserve = "true" *)  reg TXENPMAPHASEALIGN_2;
  (* syn_preserve = "true" *)  reg TXENPMAPHASEALIGN_3;
  (* syn_preserve = "true" *)  reg TXPMASETPHASE_1;
  (* syn_preserve = "true" *)  reg TXPMASETPHASE_2;
  (* syn_preserve = "true" *)  reg TXPMASETPHASE_3;
  (* syn_preserve = "true" *)  reg [4:0] acnt_1;
  (* syn_preserve = "true" *)  reg [4:0] acnt_2;
  (* syn_preserve = "true" *)  reg [4:0] acnt_3;
  (* syn_keep = "true" *)      wire [4:0] voted_acnt_1;
  (* syn_keep = "true" *)      wire [4:0] voted_acnt_2;
  (* syn_keep = "true" *)      wire [4:0] voted_acnt_3;
  (* syn_preserve = "true" *)  reg [15:0] scnt_1;
  (* syn_preserve = "true" *)  reg [15:0] scnt_2;
  (* syn_preserve = "true" *)  reg [15:0] scnt_3;
  (* syn_keep = "true" *)      wire [15:0] voted_scnt_1;
  (* syn_keep = "true" *)      wire [15:0] voted_scnt_2;
  (* syn_keep = "true" *)      wire [15:0] voted_scnt_3;
  (* syn_preserve = "true" *)  reg [5:0] wcnt_1;
  (* syn_preserve = "true" *)  reg [5:0] wcnt_2;
  (* syn_preserve = "true" *)  reg [5:0] wcnt_3;
  (* syn_keep = "true" *)      wire [5:0] voted_wcnt_1;
  (* syn_keep = "true" *)      wire [5:0] voted_wcnt_2;
  (* syn_keep = "true" *)      wire [5:0] voted_wcnt_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign SYNC_DONE         = (SYNC_DONE_1         & SYNC_DONE_2        ) | (SYNC_DONE_2         & SYNC_DONE_3        ) | (SYNC_DONE_1         & SYNC_DONE_3        ); // Majority logic
  assign TXDLYALIGNRESET   = (TXDLYALIGNRESET_1   & TXDLYALIGNRESET_2  ) | (TXDLYALIGNRESET_2   & TXDLYALIGNRESET_3  ) | (TXDLYALIGNRESET_1   & TXDLYALIGNRESET_3  ); // Majority logic
  assign TXENPMAPHASEALIGN = (TXENPMAPHASEALIGN_1 & TXENPMAPHASEALIGN_2) | (TXENPMAPHASEALIGN_2 & TXENPMAPHASEALIGN_3) | (TXENPMAPHASEALIGN_1 & TXENPMAPHASEALIGN_3); // Majority logic
  assign TXPMASETPHASE     = (TXPMASETPHASE_1     & TXPMASETPHASE_2    ) | (TXPMASETPHASE_2     & TXPMASETPHASE_3    ) | (TXPMASETPHASE_1     & TXPMASETPHASE_3    ); // Majority logic
  assign voted_acnt_1              = (acnt_1              & acnt_2             ) | (acnt_2              & acnt_3             ) | (acnt_1              & acnt_3             ); // Majority logic
  assign voted_acnt_2              = (acnt_1              & acnt_2             ) | (acnt_2              & acnt_3             ) | (acnt_1              & acnt_3             ); // Majority logic
  assign voted_acnt_3              = (acnt_1              & acnt_2             ) | (acnt_2              & acnt_3             ) | (acnt_1              & acnt_3             ); // Majority logic
  assign voted_scnt_1              = (scnt_1              & scnt_2             ) | (scnt_2              & scnt_3             ) | (scnt_1              & scnt_3             ); // Majority logic
  assign voted_scnt_2              = (scnt_1              & scnt_2             ) | (scnt_2              & scnt_3             ) | (scnt_1              & scnt_3             ); // Majority logic
  assign voted_scnt_3              = (scnt_1              & scnt_2             ) | (scnt_2              & scnt_3             ) | (scnt_1              & scnt_3             ); // Majority logic
  assign voted_wcnt_1              = (wcnt_1              & wcnt_2             ) | (wcnt_2              & wcnt_3             ) | (wcnt_1              & wcnt_3             ); // Majority logic
  assign voted_wcnt_2              = (wcnt_1              & wcnt_2             ) | (wcnt_2              & wcnt_3             ) | (wcnt_1              & wcnt_3             ); // Majority logic
  assign voted_wcnt_3              = (wcnt_1              & wcnt_2             ) | (wcnt_2              & wcnt_3             ) | (wcnt_1              & wcnt_3             ); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle             :                                nextstate_1 = Align_Reset;
      Align_Reset      : if (voted_acnt_1 == 20)        nextstate_1 = Wait_B4_Set_Phase;
                         else                           nextstate_1 = Align_Reset;
      Phase_Align      : if (voted_scnt_1 == SYNC_CNT)  nextstate_1 = Ready;
                         else                           nextstate_1 = Phase_Align;
      Ready            :                                nextstate_1 = Ready;
      Wait_B4_Set_Phase: if (voted_wcnt_1 == 32)        nextstate_1 = Phase_Align;
                         else                           nextstate_1 = Wait_B4_Set_Phase;
    endcase
    case (voted_state_2)
      Idle             :                                nextstate_2 = Align_Reset;
      Align_Reset      : if (voted_acnt_2 == 20)        nextstate_2 = Wait_B4_Set_Phase;
                         else                           nextstate_2 = Align_Reset;
      Phase_Align      : if (voted_scnt_2 == SYNC_CNT)  nextstate_2 = Ready;
                         else                           nextstate_2 = Phase_Align;
      Ready            :                                nextstate_2 = Ready;
      Wait_B4_Set_Phase: if (voted_wcnt_2 == 32)        nextstate_2 = Phase_Align;
                         else                           nextstate_2 = Wait_B4_Set_Phase;
    endcase
    case (voted_state_3)
      Idle             :                                nextstate_3 = Align_Reset;
      Align_Reset      : if (voted_acnt_3 == 20)        nextstate_3 = Wait_B4_Set_Phase;
                         else                           nextstate_3 = Align_Reset;
      Phase_Align      : if (voted_scnt_3 == SYNC_CNT)  nextstate_3 = Ready;
                         else                           nextstate_3 = Phase_Align;
      Ready            :                                nextstate_3 = Ready;
      Wait_B4_Set_Phase: if (voted_wcnt_3 == 32)        nextstate_3 = Phase_Align;
                         else                           nextstate_3 = Wait_B4_Set_Phase;
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
      SYNC_DONE_1 <= 0;
      SYNC_DONE_2 <= 0;
      SYNC_DONE_3 <= 0;
      TXDLYALIGNRESET_1 <= 0;
      TXDLYALIGNRESET_2 <= 0;
      TXDLYALIGNRESET_3 <= 0;
      TXENPMAPHASEALIGN_1 <= 0;
      TXENPMAPHASEALIGN_2 <= 0;
      TXENPMAPHASEALIGN_3 <= 0;
      TXPMASETPHASE_1 <= 0;
      TXPMASETPHASE_2 <= 0;
      TXPMASETPHASE_3 <= 0;
      acnt_1 <= 5'h00;
      acnt_2 <= 5'h00;
      acnt_3 <= 5'h00;
      scnt_1 <= 16'h0000;
      scnt_2 <= 16'h0000;
      scnt_3 <= 16'h0000;
      wcnt_1 <= 6'h00;
      wcnt_2 <= 6'h00;
      wcnt_3 <= 6'h00;
    end
    else begin
      SYNC_DONE_1 <= 0; // default
      SYNC_DONE_2 <= 0; // default
      SYNC_DONE_3 <= 0; // default
      TXDLYALIGNRESET_1 <= 0; // default
      TXDLYALIGNRESET_2 <= 0; // default
      TXDLYALIGNRESET_3 <= 0; // default
      TXENPMAPHASEALIGN_1 <= 0; // default
      TXENPMAPHASEALIGN_2 <= 0; // default
      TXENPMAPHASEALIGN_3 <= 0; // default
      TXPMASETPHASE_1 <= 0; // default
      TXPMASETPHASE_2 <= 0; // default
      TXPMASETPHASE_3 <= 0; // default
      acnt_1 <= 5'h00; // default
      acnt_2 <= 5'h00; // default
      acnt_3 <= 5'h00; // default
      scnt_1 <= 16'h0000; // default
      scnt_2 <= 16'h0000; // default
      scnt_3 <= 16'h0000; // default
      wcnt_1 <= 6'h00; // default
      wcnt_2 <= 6'h00; // default
      wcnt_3 <= 6'h00; // default
      case (nextstate_1)
        Align_Reset      : begin
                                  TXDLYALIGNRESET_1 <= 1;
                                  acnt_1 <= voted_acnt_1 + 1;
        end
        Phase_Align      : begin
                                  TXENPMAPHASEALIGN_1 <= 1;
                                  TXPMASETPHASE_1 <= 1;
                                  scnt_1 <= voted_scnt_1 + 1;
        end
        Ready            : begin
                                  SYNC_DONE_1 <= 1;
                                  TXENPMAPHASEALIGN_1 <= 1;
        end
        Wait_B4_Set_Phase: begin
                                  TXENPMAPHASEALIGN_1 <= 1;
                                  wcnt_1 <= voted_wcnt_1 + 1;
        end
      endcase
      case (nextstate_2)
        Align_Reset      : begin
                                  TXDLYALIGNRESET_2 <= 1;
                                  acnt_2 <= voted_acnt_2 + 1;
        end
        Phase_Align      : begin
                                  TXENPMAPHASEALIGN_2 <= 1;
                                  TXPMASETPHASE_2 <= 1;
                                  scnt_2 <= voted_scnt_2 + 1;
        end
        Ready            : begin
                                  SYNC_DONE_2 <= 1;
                                  TXENPMAPHASEALIGN_2 <= 1;
        end
        Wait_B4_Set_Phase: begin
                                  TXENPMAPHASEALIGN_2 <= 1;
                                  wcnt_2 <= voted_wcnt_2 + 1;
        end
      endcase
      case (nextstate_3)
        Align_Reset      : begin
                                  TXDLYALIGNRESET_3 <= 1;
                                  acnt_3 <= voted_acnt_3 + 1;
        end
        Phase_Align      : begin
                                  TXENPMAPHASEALIGN_3 <= 1;
                                  TXPMASETPHASE_3 <= 1;
                                  scnt_3 <= voted_scnt_3 + 1;
        end
        Ready            : begin
                                  SYNC_DONE_3 <= 1;
                                  TXENPMAPHASEALIGN_3 <= 1;
        end
        Wait_B4_Set_Phase: begin
                                  TXENPMAPHASEALIGN_3 <= 1;
                                  wcnt_3 <= voted_wcnt_3 + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [135:0] statename;
  always @* begin
    case (state_1)
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

