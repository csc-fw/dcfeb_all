
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 15:30:17 (www.fizzim.com)

module ADC_Config_FSM 
  #(
    parameter Last_Addr = 5'h10
  )(
  output reg [4:0] ADR,
  output reg DONE,
  output reg LOAD,
  output reg SCKEN,
  output reg SHEN,
  input CLK,
  input INIT,
  input RST 
);

  // state bits
  parameter 
  Idle         = 3'b000, 
  Done         = 3'b001, 
  End_Seq      = 3'b010, 
  Incr_Addr    = 3'b011, 
  Load         = 3'b100, 
  Shift_Enable = 3'b101, 
  Start_Seq    = 3'b110; 

  reg [2:0] state;

  reg [2:0] nextstate;

  reg [4:0] addr;
  reg [5:0] scntr;

  // comb always block
  always @* begin
    nextstate = 3'bxxx; // default to x because default_state_is_x is set
    ADR = addr; // default
    case (state)
      Idle        : if      (INIT)                                     nextstate = Start_Seq;
                    else                                               nextstate = Idle;
      Done        : if      (~INIT)                                    nextstate = Idle;
                    else                                               nextstate = Done;
      End_Seq     :                                                    nextstate = Done;
      Incr_Addr   :                                                    nextstate = Load;
      Load        :                                                    nextstate = Shift_Enable;
      Shift_Enable: if      ((scntr == 6'd46) && (addr == Last_Addr))  nextstate = End_Seq;
                    else if ((scntr == 6'd46) && (addr < Last_Addr))   nextstate = Incr_Addr;
                    else                                               nextstate = Shift_Enable;
      Start_Seq   :                                                    nextstate = Shift_Enable;
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
      DONE <= 0;
      LOAD <= 0;
      SCKEN <= 0;
      SHEN <= 0;
      addr <= 5'h00;
      scntr <= 6'h00;
    end
    else begin
      DONE <= 0; // default
      LOAD <= 0; // default
      SCKEN <= 0; // default
      SHEN <= 0; // default
      addr <= 5'h00; // default
      scntr <= 6'h00; // default
      case (nextstate)
        Done        :        DONE <= 1;
        End_Seq     : begin
                             SCKEN <= 1;
                             addr <= addr;
        end
        Incr_Addr   : begin
                             SCKEN <= 1;
                             SHEN <= 1;
                             addr <= addr + 1;
        end
        Load        : begin
                             LOAD <= 1;
                             SCKEN <= 1;
                             SHEN <= 1;
                             addr <= addr;
        end
        Shift_Enable: begin
                             SCKEN <= 1;
                             SHEN <= 1;
                             addr <= addr;
                             scntr <= scntr + 1;
        end
        Start_Seq   : begin
                             LOAD <= 1;
                             SCKEN <= 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [95:0] statename;
  always @* begin
    case (state)
      Idle        : statename = "Idle";
      Done        : statename = "Done";
      End_Seq     : statename = "End_Seq";
      Incr_Addr   : statename = "Incr_Addr";
      Load        : statename = "Load";
      Shift_Enable: statename = "Shift_Enable";
      Start_Seq   : statename = "Start_Seq";
      default     : statename = "XXXXXXXXXXXX";
    endcase
  end
  `endif

endmodule

