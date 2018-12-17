
// Created by fizzim.pl version 4.41 on 2013:08:22 at 15:44:40 (www.fizzim.com)

module sem_cmds (
  output reg READY,
  output [1:0] SEM_STATE,
  input ACK,
  input CLK,
  input RST,
  input SEND 
);
  
  // state bits
  parameter 
  Idle  = 2'b00, 
  Empty = 2'b01, 
  Ready = 2'b10; 
  
  reg [1:0] state;
  reg [1:0] nextstate;
  
  assign SEM_STATE = state;
  
  // comb always block
  always @* begin
    nextstate = 2'bxx; // default to x because default_state_is_x is set
    READY = 0; // default
    case (state)
      Idle : if (SEND)   nextstate = Ready;
             else        nextstate = Idle;
      Empty: if (!SEND)  nextstate = Idle;
             else        nextstate = Empty;
      Ready: begin
                         READY = 1;
        if      (ACK)    nextstate = Empty;
        else             nextstate = Ready;
      end
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
  
  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [39:0] statename;
  always @* begin
    case (state)
      Idle :   statename = "Idle";
      Empty:   statename = "Empty";
      Ready:   statename = "Ready";
      default: statename = "XXXXX";
    endcase
  end
  `endif

endmodule

