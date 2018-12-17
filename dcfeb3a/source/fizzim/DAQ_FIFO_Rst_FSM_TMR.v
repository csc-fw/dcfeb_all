
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 12:35:07 (www.fizzim.com)

module DAQ_FIFO_Rst_FSM_TMR (
  output DONE,
  output FIFO_RST,
  input CLK,
  input RST 
);

  // state bits
  parameter 
  Idle        = 3'b000, 
  Clear       = 3'b001, 
  Pause       = 3'b010, 
  Reset_FIFOs = 3'b011, 
  Run         = 3'b100; 

  (* syn_preserve = "true" *) reg [2:0] state_1;
  (* syn_preserve = "true" *) reg [2:0] state_2;
  (* syn_preserve = "true" *) reg [2:0] state_3;

  (* syn_keep = "true" *) wire [2:0] voted_state_1;
  (* syn_keep = "true" *) wire [2:0] voted_state_2;
  (* syn_keep = "true" *) wire [2:0] voted_state_3;

  assign voted_state_1    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_2    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic
  assign voted_state_3    = (state_1    & state_2   ) | (state_2    & state_3   ) | (state_1    & state_3   ); // Majority logic

  (* syn_keep = "true" *) reg [2:0] nextstate_1;
  (* syn_keep = "true" *) reg [2:0] nextstate_2;
  (* syn_keep = "true" *) reg [2:0] nextstate_3;

  (* syn_preserve = "true" *)  reg DONE_1;
  (* syn_preserve = "true" *)  reg DONE_2;
  (* syn_preserve = "true" *)  reg DONE_3;
  (* syn_preserve = "true" *)  reg FIFO_RST_1;
  (* syn_preserve = "true" *)  reg FIFO_RST_2;
  (* syn_preserve = "true" *)  reg FIFO_RST_3;
  (* syn_preserve = "true" *)  reg [3:0] hold_1;
  (* syn_preserve = "true" *)  reg [3:0] hold_2;
  (* syn_preserve = "true" *)  reg [3:0] hold_3;
  (* syn_keep = "true" *)      wire [3:0] voted_hold_1;
  (* syn_keep = "true" *)      wire [3:0] voted_hold_2;
  (* syn_keep = "true" *)      wire [3:0] voted_hold_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign DONE     = (DONE_1     & DONE_2    ) | (DONE_2     & DONE_3    ) | (DONE_1     & DONE_3    ); // Majority logic
  assign FIFO_RST = (FIFO_RST_1 & FIFO_RST_2) | (FIFO_RST_2 & FIFO_RST_3) | (FIFO_RST_1 & FIFO_RST_3); // Majority logic
  assign voted_hold_1     = (hold_1     & hold_2    ) | (hold_2     & hold_3    ) | (hold_1     & hold_3    ); // Majority logic
  assign voted_hold_2     = (hold_1     & hold_2    ) | (hold_2     & hold_3    ) | (hold_1     & hold_3    ); // Majority logic
  assign voted_hold_3     = (hold_1     & hold_2    ) | (hold_2     & hold_3    ) | (hold_1     & hold_3    ); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_2 = 3'bxxx; // default to x because default_state_is_x is set
    nextstate_3 = 3'bxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Idle       :                             nextstate_1 = Clear;
      Clear      : if (voted_hold_1 == 4'd5)   nextstate_1 = Reset_FIFOs;
                   else                        nextstate_1 = Clear;
      Pause      : if (voted_hold_1 == 4'd15)  nextstate_1 = Run;
                   else                        nextstate_1 = Pause;
      Reset_FIFOs: if (voted_hold_1 == 4'd10)  nextstate_1 = Pause;
                   else                        nextstate_1 = Reset_FIFOs;
      Run        :                             nextstate_1 = Run;
    endcase
    case (voted_state_2)
      Idle       :                             nextstate_2 = Clear;
      Clear      : if (voted_hold_2 == 4'd5)   nextstate_2 = Reset_FIFOs;
                   else                        nextstate_2 = Clear;
      Pause      : if (voted_hold_2 == 4'd15)  nextstate_2 = Run;
                   else                        nextstate_2 = Pause;
      Reset_FIFOs: if (voted_hold_2 == 4'd10)  nextstate_2 = Pause;
                   else                        nextstate_2 = Reset_FIFOs;
      Run        :                             nextstate_2 = Run;
    endcase
    case (voted_state_3)
      Idle       :                             nextstate_3 = Clear;
      Clear      : if (voted_hold_3 == 4'd5)   nextstate_3 = Reset_FIFOs;
                   else                        nextstate_3 = Clear;
      Pause      : if (voted_hold_3 == 4'd15)  nextstate_3 = Run;
                   else                        nextstate_3 = Pause;
      Reset_FIFOs: if (voted_hold_3 == 4'd10)  nextstate_3 = Pause;
                   else                        nextstate_3 = Reset_FIFOs;
      Run        :                             nextstate_3 = Run;
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
      DONE_1 <= 0;
      DONE_2 <= 0;
      DONE_3 <= 0;
      FIFO_RST_1 <= 1;
      FIFO_RST_2 <= 1;
      FIFO_RST_3 <= 1;
      hold_1 <= 4'h0;
      hold_2 <= 4'h0;
      hold_3 <= 4'h0;
    end
    else begin
      DONE_1 <= 0; // default
      DONE_2 <= 0; // default
      DONE_3 <= 0; // default
      FIFO_RST_1 <= 0; // default
      FIFO_RST_2 <= 0; // default
      FIFO_RST_3 <= 0; // default
      hold_1 <= 4'h0; // default
      hold_2 <= 4'h0; // default
      hold_3 <= 4'h0; // default
      case (nextstate_1)
        Idle       :        FIFO_RST_1 <= 1;
        Clear      :        hold_1 <= voted_hold_1 + 1;
        Pause      :        hold_1 <= voted_hold_1 + 1;
        Reset_FIFOs: begin
                            FIFO_RST_1 <= 1;
                            hold_1 <= voted_hold_1 + 1;
        end
        Run        :        DONE_1 <= 1;
      endcase
      case (nextstate_2)
        Idle       :        FIFO_RST_2 <= 1;
        Clear      :        hold_2 <= voted_hold_2 + 1;
        Pause      :        hold_2 <= voted_hold_2 + 1;
        Reset_FIFOs: begin
                            FIFO_RST_2 <= 1;
                            hold_2 <= voted_hold_2 + 1;
        end
        Run        :        DONE_2 <= 1;
      endcase
      case (nextstate_3)
        Idle       :        FIFO_RST_3 <= 1;
        Clear      :        hold_3 <= voted_hold_3 + 1;
        Pause      :        hold_3 <= voted_hold_3 + 1;
        Reset_FIFOs: begin
                            FIFO_RST_3 <= 1;
                            hold_3 <= voted_hold_3 + 1;
        end
        Run        :        DONE_3 <= 1;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [87:0] statename;
  always @* begin
    case (state_1)
      Idle       : statename = "Idle";
      Clear      : statename = "Clear";
      Pause      : statename = "Pause";
      Reset_FIFOs: statename = "Reset_FIFOs";
      Run        : statename = "Run";
      default    : statename = "XXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

