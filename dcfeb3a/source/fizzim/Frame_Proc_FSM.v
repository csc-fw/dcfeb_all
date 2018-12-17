
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:26 at 14:33:11 (www.fizzim.com)

module Frame_Proc_FSM (
  output reg CLR_CRC,
  output reg CRC_DV,
  output reg [2:0] ROM_ADDR,
  output reg TX_ACK,
  output wire [3:0] FRM_STATE,
  input CLK,
  input RST,
  input VALID 
);

  // state bits
  parameter 
  Idle       = 4'b0000, 
  CRC        = 4'b0001, 
  Data       = 4'b0010, 
  EOP        = 4'b0011, 
  Preamble_1 = 4'b0100, 
  Preamble_2 = 4'b0101, 
  Preamble_3 = 4'b0110, 
  SOF_TX_Ack = 4'b0111, 
  SOP        = 4'b1000, 
  Strt_Data  = 4'b1001; 

  reg [3:0] state;

  assign FRM_STATE = state;

  reg [3:0] nextstate;

  reg [2:0] addr;

  // comb always block
  always @* begin
    nextstate = 4'bxxxx; // default to x because default_state_is_x is set
    ROM_ADDR = addr; // default
    case (state)
      Idle      : if (VALID)         nextstate = SOP;
                  else               nextstate = Idle;
      CRC       :                    nextstate = EOP;
      Data      : if (!VALID)        nextstate = CRC;
                  else               nextstate = Data;
      EOP       : if (addr == 3'd6)  nextstate = Idle;
                  else               nextstate = EOP;
      Preamble_1:                    nextstate = Preamble_2;
      Preamble_2:                    nextstate = Preamble_3;
      Preamble_3:                    nextstate = SOF_TX_Ack;
      SOF_TX_Ack:                    nextstate = Strt_Data;
      SOP       :                    nextstate = Preamble_1;
      Strt_Data :                    nextstate = Data;
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
      CRC_DV <= 0;
      TX_ACK <= 0;
      addr <= 3'd0;
    end
    else begin
      CLR_CRC <= 0; // default
      CRC_DV <= 0; // default
      TX_ACK <= 0; // default
      addr <= 3'd0; // default
      case (nextstate)
        CRC       :        addr <= addr;
        Data      : begin
                           CRC_DV <= 1;
                           addr <= addr;
        end
        EOP       :        addr <= addr + 1;
        Preamble_1: begin
                           CLR_CRC <= 1;
                           addr <= addr + 1;
        end
        Preamble_2: begin
                           CLR_CRC <= 1;
                           addr <= addr;
        end
        Preamble_3: begin
                           CLR_CRC <= 1;
                           addr <= addr;
        end
        SOF_TX_Ack: begin
                           CLR_CRC <= 1;
                           TX_ACK <= 1;
                           addr <= addr + 1;
        end
        SOP       : begin
                           CLR_CRC <= 1;
                           addr <= addr + 1;
        end
        Strt_Data : begin
                           CRC_DV <= 1;
                           addr <= addr + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [79:0] statename;
  always @* begin
    case (state)
      Idle      : statename = "Idle";
      CRC       : statename = "CRC";
      Data      : statename = "Data";
      EOP       : statename = "EOP";
      Preamble_1: statename = "Preamble_1";
      Preamble_2: statename = "Preamble_2";
      Preamble_3: statename = "Preamble_3";
      SOF_TX_Ack: statename = "SOF_TX_Ack";
      SOP       : statename = "SOP";
      Strt_Data : statename = "Strt_Data";
      default   : statename = "XXXXXXXXXX";
    endcase
  end
  `endif

endmodule

