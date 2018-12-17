
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:12:12 at 12:14:53 (www.fizzim.com)

module bky_load_FSM (
  output reg RDENA,
  output reg SET_DONE,
  output reg SHFT_ENA,
  input CLK,
  input MT,
  input RST,
  input START 
);

  // state bits
  parameter 
  Idle      = 3'b000, 
  Read      = 3'b001, 
  Set_Done  = 3'b010, 
  Shift     = 3'b011, 
  Wait4Data = 3'b100; 

  reg [2:0] state;


  reg [2:0] nextstate;


  reg [4:0] loop;
  reg [3:0] scnt;

  // comb always block
  always @* begin
    nextstate = 3'bxxx; // default to x because default_state_is_x is set
    case (state)
      Idle     : if      (START)                              nextstate = Wait4Data;
                 else                                         nextstate = Idle;
      Read     :                                              nextstate = Shift;
      Set_Done : if      (!START)                             nextstate = Idle;
                 else                                         nextstate = Set_Done;
      Shift    : if      ((scnt == 4'hF) && (loop == 5'd18))  nextstate = Set_Done;
                 else if (scnt == 4'hF)                       nextstate = Read;
                 else                                         nextstate = Shift;
      Wait4Data: if      (!MT)                                nextstate = Read;
                 else                                         nextstate = Wait4Data;
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
      RDENA <= 0;
      SET_DONE <= 0;
      SHFT_ENA <= 0;
      loop <= 5'h00;
      scnt <= 4'h0;
    end
    else begin
      RDENA <= 0; // default
      SET_DONE <= 0; // default
      SHFT_ENA <= 0; // default
      loop <= loop; // default
      scnt <= scnt; // default
      case (nextstate)
        Read     : begin
                          RDENA <= 1;
                          loop <= loop + 1;
                          scnt <= 4'hF;
        end
        Set_Done :        SET_DONE <= 1;
        Shift    : begin
                          SHFT_ENA <= 1;
                          scnt <= scnt + 1;
        end
        Wait4Data:        loop <= 5'h00;
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [71:0] statename;
  always @* begin
    case (state)
      Idle     : statename = "Idle";
      Read     : statename = "Read";
      Set_Done : statename = "Set_Done";
      Shift    : statename = "Shift";
      Wait4Data: statename = "Wait4Data";
      default  : statename = "XXXXXXXXX";
    endcase
  end
  `endif

endmodule

