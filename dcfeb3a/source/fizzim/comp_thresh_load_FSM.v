
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:12:12 at 12:15:07 (www.fizzim.com)

module comp_thresh_load_FSM (
  output reg SET_DONE,
  output reg SHFT_ENA,
  input CLK,
  input RST,
  input START 
);

  // state bits
  parameter 
  Idle     = 2'b00, 
  Pload    = 2'b01, 
  Set_Done = 2'b10, 
  Shift    = 2'b11; 

  reg [1:0] state;


  reg [1:0] nextstate;


  reg [3:0] scnt;

  // comb always block
  always @* begin
    nextstate = 2'bxx; // default to x because default_state_is_x is set
    case (state)
      Idle    : if (START)         nextstate = Pload;
                else               nextstate = Idle;
      Pload   :                    nextstate = Shift;
      Set_Done: if (!START)        nextstate = Idle;
                else               nextstate = Set_Done;
      Shift   : if (scnt == 4'hF)  nextstate = Set_Done;
                else               nextstate = Shift;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(negedge CLK or posedge RST) begin
    if (RST)
      state <= Idle;
    else
      state <= nextstate;
  end

  // datapath sequential always block
  always @(negedge CLK or posedge RST) begin
    if (RST) begin
      SET_DONE <= 0;
      SHFT_ENA <= 0;
      scnt <= 4'h0;
    end
    else begin
      SET_DONE <= 0; // default
      SHFT_ENA <= 0; // default
      scnt <= scnt; // default
      case (nextstate)
        Pload   :        scnt <= 4'hF;
        Set_Done:        SET_DONE <= 1;
        Shift   : begin
                         SHFT_ENA <= 1;
                         scnt <= scnt + 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [63:0] statename;
  always @* begin
    case (state)
      Idle    : statename = "Idle";
      Pload   : statename = "Pload";
      Set_Done: statename = "Set_Done";
      Shift   : statename = "Shift";
      default : statename = "XXXXXXXX";
    endcase
  end
  `endif

endmodule

