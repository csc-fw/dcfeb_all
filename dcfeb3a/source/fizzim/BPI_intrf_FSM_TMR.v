
// Created by fizzim_tmr.pl version $Revision: 4.44 on 2014:08:25 at 17:16:57 (www.fizzim.com)

module BPI_intrf_FSM_TMR (
  output BUSY,
  output CAP,
  output E,
  output G,
  output L,
  output LOAD,
  output W,
  input CLK,
  input EXECUTE,
  input READ,
  input RST,
  input WRITE 
);

  // state bits
  parameter 
  Standby    = 4'b0000, 
  Capture    = 4'b0001, 
  Latch_Addr = 4'b0010, 
  Load       = 4'b0011, 
  WE1        = 4'b0100, 
  WE2        = 4'b0101, 
  Wait1      = 4'b0110, 
  Wait2      = 4'b0111, 
  Wait3      = 4'b1000, 
  Wait4      = 4'b1001; 

  (* syn_preserve = "true" *) reg [3:0] state_1;
  (* syn_preserve = "true" *) reg [3:0] state_2;
  (* syn_preserve = "true" *) reg [3:0] state_3;

  (* syn_keep = "true" *) wire [3:0] voted_state_1;
  (* syn_keep = "true" *) wire [3:0] voted_state_2;
  (* syn_keep = "true" *) wire [3:0] voted_state_3;

  assign voted_state_1 = (state_1 & state_2) | (state_2 & state_3) | (state_1 & state_3); // Majority logic
  assign voted_state_2 = (state_1 & state_2) | (state_2 & state_3) | (state_1 & state_3); // Majority logic
  assign voted_state_3 = (state_1 & state_2) | (state_2 & state_3) | (state_1 & state_3); // Majority logic

  (* syn_keep = "true" *) reg [3:0] nextstate_1;
  (* syn_keep = "true" *) reg [3:0] nextstate_2;
  (* syn_keep = "true" *) reg [3:0] nextstate_3;

  (* syn_preserve = "true" *)  reg BUSY_1;
  (* syn_preserve = "true" *)  reg BUSY_2;
  (* syn_preserve = "true" *)  reg BUSY_3;
  (* syn_preserve = "true" *)  reg CAP_1;
  (* syn_preserve = "true" *)  reg CAP_2;
  (* syn_preserve = "true" *)  reg CAP_3;
  (* syn_preserve = "true" *)  reg E_1;
  (* syn_preserve = "true" *)  reg E_2;
  (* syn_preserve = "true" *)  reg E_3;
  (* syn_preserve = "true" *)  reg G_1;
  (* syn_preserve = "true" *)  reg G_2;
  (* syn_preserve = "true" *)  reg G_3;
  (* syn_preserve = "true" *)  reg L_1;
  (* syn_preserve = "true" *)  reg L_2;
  (* syn_preserve = "true" *)  reg L_3;
  (* syn_preserve = "true" *)  reg LOAD_1;
  (* syn_preserve = "true" *)  reg LOAD_2;
  (* syn_preserve = "true" *)  reg LOAD_3;
  (* syn_preserve = "true" *)  reg W_1;
  (* syn_preserve = "true" *)  reg W_2;
  (* syn_preserve = "true" *)  reg W_3;

  // Assignment of outputs and flags to voted majority logic of replicated registers
  assign BUSY = (BUSY_1 & BUSY_2) | (BUSY_2 & BUSY_3) | (BUSY_1 & BUSY_3); // Majority logic
  assign CAP  = (CAP_1  & CAP_2 ) | (CAP_2  & CAP_3 ) | (CAP_1  & CAP_3 ); // Majority logic
  assign E    = (E_1    & E_2   ) | (E_2    & E_3   ) | (E_1    & E_3   ); // Majority logic
  assign G    = (G_1    & G_2   ) | (G_2    & G_3   ) | (G_1    & G_3   ); // Majority logic
  assign L    = (L_1    & L_2   ) | (L_2    & L_3   ) | (L_1    & L_3   ); // Majority logic
  assign LOAD = (LOAD_1 & LOAD_2) | (LOAD_2 & LOAD_3) | (LOAD_1 & LOAD_3); // Majority logic
  assign W    = (W_1    & W_2   ) | (W_2    & W_3   ) | (W_1    & W_3   ); // Majority logic

  // Assignment of error detection logic to replicated signals

  // comb always block
  always @* begin
    nextstate_1 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_2 = 4'bxxxx; // default to x because default_state_is_x is set
    nextstate_3 = 4'bxxxx; // default to x because default_state_is_x is set
    case (voted_state_1)
      Standby   : if      (EXECUTE)          nextstate_1 = Capture;
                  else                       nextstate_1 = Standby;
      Capture   :                            nextstate_1 = Latch_Addr;
      Latch_Addr: if      (READ && WRITE)    nextstate_1 = Standby;
                  else if (WRITE)            nextstate_1 = WE1;
                  else if (READ)             nextstate_1 = Wait1;
                  else if (!READ && !WRITE)  nextstate_1 = Standby;
      Load      :                            nextstate_1 = Wait4;
      WE1       :                            nextstate_1 = WE2;
      WE2       :                            nextstate_1 = Standby;
      Wait1     :                            nextstate_1 = Wait2;
      Wait2     :                            nextstate_1 = Wait3;
      Wait3     :                            nextstate_1 = Load;
      Wait4     :                            nextstate_1 = Standby;
    endcase
    case (voted_state_2)
      Standby   : if      (EXECUTE)          nextstate_2 = Capture;
                  else                       nextstate_2 = Standby;
      Capture   :                            nextstate_2 = Latch_Addr;
      Latch_Addr: if      (READ && WRITE)    nextstate_2 = Standby;
                  else if (WRITE)            nextstate_2 = WE1;
                  else if (READ)             nextstate_2 = Wait1;
                  else if (!READ && !WRITE)  nextstate_2 = Standby;
      Load      :                            nextstate_2 = Wait4;
      WE1       :                            nextstate_2 = WE2;
      WE2       :                            nextstate_2 = Standby;
      Wait1     :                            nextstate_2 = Wait2;
      Wait2     :                            nextstate_2 = Wait3;
      Wait3     :                            nextstate_2 = Load;
      Wait4     :                            nextstate_2 = Standby;
    endcase
    case (voted_state_3)
      Standby   : if      (EXECUTE)          nextstate_3 = Capture;
                  else                       nextstate_3 = Standby;
      Capture   :                            nextstate_3 = Latch_Addr;
      Latch_Addr: if      (READ && WRITE)    nextstate_3 = Standby;
                  else if (WRITE)            nextstate_3 = WE1;
                  else if (READ)             nextstate_3 = Wait1;
                  else if (!READ && !WRITE)  nextstate_3 = Standby;
      Load      :                            nextstate_3 = Wait4;
      WE1       :                            nextstate_3 = WE2;
      WE2       :                            nextstate_3 = Standby;
      Wait1     :                            nextstate_3 = Wait2;
      Wait2     :                            nextstate_3 = Wait3;
      Wait3     :                            nextstate_3 = Load;
      Wait4     :                            nextstate_3 = Standby;
    endcase
  end

  // Assign reg'd outputs to state bits

  // sequential always block
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      state_1 <= Standby;
      state_2 <= Standby;
      state_3 <= Standby;
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
      BUSY_1 <= 0;
      BUSY_2 <= 0;
      BUSY_3 <= 0;
      CAP_1 <= 0;
      CAP_2 <= 0;
      CAP_3 <= 0;
      E_1 <= 0;
      E_2 <= 0;
      E_3 <= 0;
      G_1 <= 0;
      G_2 <= 0;
      G_3 <= 0;
      L_1 <= 0;
      L_2 <= 0;
      L_3 <= 0;
      LOAD_1 <= 0;
      LOAD_2 <= 0;
      LOAD_3 <= 0;
      W_1 <= 0;
      W_2 <= 0;
      W_3 <= 0;
    end
    else begin
      BUSY_1 <= 1; // default
      BUSY_2 <= 1; // default
      BUSY_3 <= 1; // default
      CAP_1 <= 0; // default
      CAP_2 <= 0; // default
      CAP_3 <= 0; // default
      E_1 <= 0; // default
      E_2 <= 0; // default
      E_3 <= 0; // default
      G_1 <= 0; // default
      G_2 <= 0; // default
      G_3 <= 0; // default
      L_1 <= 0; // default
      L_2 <= 0; // default
      L_3 <= 0; // default
      LOAD_1 <= 0; // default
      LOAD_2 <= 0; // default
      LOAD_3 <= 0; // default
      W_1 <= 0; // default
      W_2 <= 0; // default
      W_3 <= 0; // default
      case (nextstate_1)
        Standby   :        BUSY_1 <= 0;
        Capture   :        CAP_1 <= 1;
        Latch_Addr: begin
                           E_1 <= 1;
                           L_1 <= 1;
        end
        Load      : begin
                           E_1 <= 1;
                           G_1 <= 1;
                           LOAD_1 <= 1;
        end
        WE1       : begin
                           E_1 <= 1;
                           W_1 <= 1;
        end
        WE2       : begin
                           E_1 <= 1;
                           W_1 <= 1;
        end
        Wait1     : begin
                           E_1 <= 1;
                           G_1 <= 1;
        end
        Wait2     : begin
                           E_1 <= 1;
                           G_1 <= 1;
        end
        Wait3     : begin
                           E_1 <= 1;
                           G_1 <= 1;
        end
        Wait4     : begin
                           E_1 <= 1;
                           G_1 <= 1;
        end
      endcase
      case (nextstate_2)
        Standby   :        BUSY_2 <= 0;
        Capture   :        CAP_2 <= 1;
        Latch_Addr: begin
                           E_2 <= 1;
                           L_2 <= 1;
        end
        Load      : begin
                           E_2 <= 1;
                           G_2 <= 1;
                           LOAD_2 <= 1;
        end
        WE1       : begin
                           E_2 <= 1;
                           W_2 <= 1;
        end
        WE2       : begin
                           E_2 <= 1;
                           W_2 <= 1;
        end
        Wait1     : begin
                           E_2 <= 1;
                           G_2 <= 1;
        end
        Wait2     : begin
                           E_2 <= 1;
                           G_2 <= 1;
        end
        Wait3     : begin
                           E_2 <= 1;
                           G_2 <= 1;
        end
        Wait4     : begin
                           E_2 <= 1;
                           G_2 <= 1;
        end
      endcase
      case (nextstate_3)
        Standby   :        BUSY_3 <= 0;
        Capture   :        CAP_3 <= 1;
        Latch_Addr: begin
                           E_3 <= 1;
                           L_3 <= 1;
        end
        Load      : begin
                           E_3 <= 1;
                           G_3 <= 1;
                           LOAD_3 <= 1;
        end
        WE1       : begin
                           E_3 <= 1;
                           W_3 <= 1;
        end
        WE2       : begin
                           E_3 <= 1;
                           W_3 <= 1;
        end
        Wait1     : begin
                           E_3 <= 1;
                           G_3 <= 1;
        end
        Wait2     : begin
                           E_3 <= 1;
                           G_3 <= 1;
        end
        Wait3     : begin
                           E_3 <= 1;
                           G_3 <= 1;
        end
        Wait4     : begin
                           E_3 <= 1;
                           G_3 <= 1;
        end
      endcase
    end
  end

  // This code allows you to see state names in simulation
  `ifndef SYNTHESIS
  reg [79:0] statename;
  always @* begin
    case (state_1)
      Standby   : statename = "Standby";
      Capture   : statename = "Capture";
      Latch_Addr: statename = "Latch_Addr";
      Load      : statename = "Load";
      WE1       : statename = "WE1";
      WE2       : statename = "WE2";
      Wait1     : statename = "Wait1";
      Wait2     : statename = "Wait2";
      Wait3     : statename = "Wait3";
      Wait4     : statename = "Wait4";
      default   : statename = "XXXXXXXXXX";
    endcase
  end
  `endif

endmodule

