`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:12 03/04/2011 
// Design Name: 
// Module Name:    deserializer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module deserializer(
    input BIT_CLK_ODD,
    input BIT_CLK_EVEN,
    input FRAME_CLK,
    input RST,
    input D,
    input DDLY,
    input DB,
    input DBDLY,
	 input BIT_SLIP_ODD,
	 input BIT_SLIP_EVN,
    output reg [11:0] Q,
	 output reg [5:0] QODD,
	 output reg [5:0] QEVN
    );

//   wire dir_out_odd,dir_out_evn;
   wire soa1,soa2,sob1,sob2;
	wire qb11,q10,qb9,q8,qb7,q6,qb5,q4,qb3,q2,qb1,q0;
	reg qd10,qd8,qd6,qd4,qd2,qd0;
	
	
	always @(posedge FRAME_CLK) begin
	   {qd10,qd8,qd6,qd4,qd2,qd0} <= {q10,q8,q6,q4,q2,q0};
		Q <= {~qb11,qd10,~qb9,qd8,~qb7,qd6,~qb5,qd4,~qb3,qd2,~qb1,qd0};
		QODD <= {~qb11,~qb9,~qb7,~qb5,~qb3,~qb1};
		QEVN <= {qd10,qd8,qd6,qd4,qd2,qd0};
	end

     ISERDESE1 #(
      .DATA_RATE("SDR"),           // "SDR" or "DDR" 
      .DATA_WIDTH(6),              // Parallel data width (2-8, 10)
      .DYN_CLKDIV_INV_EN("FALSE"), // Enable DYNCLKDIVINVSEL inversion (TRUE/FALSE)
      .DYN_CLK_INV_EN("FALSE"),    // Enable DYNCLKINVSEL inversion (TRUE/FALSE)
      // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
      .INIT_Q1(1'b0),
      .INIT_Q2(1'b0),
      .INIT_Q3(1'b0),
      .INIT_Q4(1'b0),
      .INTERFACE_TYPE("NETWORKING"),   // "MEMORY", "MEMORY_DDR3", "MEMORY_QDR", "NETWORKING", or "OVERSAMPLE" 
      .IOBDELAY("NONE"),           // "NONE", "IBUF", "IFD", "BOTH" 
      .NUM_CE(1),                  // Number of clock enables (1 or 2)
      .OFB_USED("FALSE"),          // Select OFB path (TRUE/FALSE)
      .SERDES_MODE("MASTER"),      // "MASTER" or "SLAVE" 
      // SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
      .SRVAL_Q1(1'b0),
      .SRVAL_Q2(1'b0),
      .SRVAL_Q3(1'b0),
      .SRVAL_Q4(1'b0) 
   )
   deser_even (
      .O(dir_out_evn),                       // 1-bit output Combinatorial output
      // Q1 - Q6: 1-bit (each) output Registered data outputs
      .Q1(q10),
      .Q2(q8),
      .Q3(q6),
      .Q4(q4),
      .Q5(q2),
      .Q6(q0),
      // SHIFTOUT1-SHIFTOUT2: 1-bit (each) output Data width expansion output ports
      .SHIFTOUT1(soa1),
      .SHIFTOUT2(soa2),
      .BITSLIP(BIT_SLIP_EVN),           // 1-bit input Bitslip enable input
      // CE1, CE2: 1-bit (each) input Data register clock enable inputs
      .CE1(1'b1),
//      .CE2(1'b0),
      // Clocks: 1-bit (each) input ISERDESE1 clock input ports
      .CLK(BIT_CLK_EVEN),                   // 1-bit input High-speed clock input
      .CLKB(BIT_CLK_ODD),                 // 1-bit input High-speed secondary clock input
      .CLKDIV(FRAME_CLK),             // 1-bit input Divided clock input
      .OCLK(1'b0),                 // 1-bit input High speed output clock input used when
                                   // INTERFACE_TYPE="MEMORY" 

      // Dynamic Clock Inversions: 1-bit (each) input Dynamic clock inversion pins to switch clock polarity
      .DYNCLKDIVSEL(1'b0), // 1-bit input Dynamic CLKDIV inversion input
      .DYNCLKSEL(1'b0),       // 1-bit input Dynamic CLK/CLKB inversion input
      // Input Data: 1-bit (each) input ISERDESE1 data input ports
      .D(D),                       // 1-bit input Data input
      .DDLY(DDLY),                 // 1-bit input Serial input data from IODELAYE1
      .OFB(1'b0),                   // 1-bit input Data feedback input from OSERDESE1
      .RST(RST),                   // 1-bit input Active high asynchronous reset input
      // SHIFTIN1-SHIFTIN2: 1-bit (each) input Data width expansion input ports
      .SHIFTIN1(1'b0),
      .SHIFTIN2(1'b0) 
   );

     ISERDESE1 #(
      .DATA_RATE("SDR"),           // "SDR" or "DDR" 
      .DATA_WIDTH(6),              // Parallel data width (2-8, 10)
      .DYN_CLKDIV_INV_EN("FALSE"), // Enable DYNCLKDIVINVSEL inversion (TRUE/FALSE)
      .DYN_CLK_INV_EN("FALSE"),    // Enable DYNCLKINVSEL inversion (TRUE/FALSE)
      // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
      .INIT_Q1(1'b1),
      .INIT_Q2(1'b1),
      .INIT_Q3(1'b1),
      .INIT_Q4(1'b1),
      .INTERFACE_TYPE("NETWORKING"),   // "MEMORY", "MEMORY_DDR3", "MEMORY_QDR", "NETWORKING", or "OVERSAMPLE" 
      .IOBDELAY("NONE"),           // "NONE", "IBUF", "IFD", "BOTH" 
      .NUM_CE(1),                  // Number of clock enables (1 or 2)
      .OFB_USED("FALSE"),          // Select OFB path (TRUE/FALSE)
      .SERDES_MODE("MASTER"),      // "MASTER" or "SLAVE" 
      // SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
      .SRVAL_Q1(1'b1),
      .SRVAL_Q2(1'b1),
      .SRVAL_Q3(1'b1),
      .SRVAL_Q4(1'b1) 
   )
   deser_odd (
      .O(dir_out_odd),                       // 1-bit output Combinatorial output
      // Q1 - Q6: 1-bit (each) output Registered data outputs
      .Q1(qb11),
      .Q2(qb9),
      .Q3(qb7),
      .Q4(qb5),
      .Q5(qb3),
      .Q6(qb1),
      // SHIFTOUT1-SHIFTOUT2: 1-bit (each) output Data width expansion output ports
      .SHIFTOUT1(sob1),
      .SHIFTOUT2(sob2),
      .BITSLIP(BIT_SLIP_ODD),           // 1-bit input Bitslip enable input
      // CE1, CE2: 1-bit (each) input Data register clock enable inputs
      .CE1(1'b1),
//      .CE2(1'b0),
      // Clocks: 1-bit (each) input ISERDESE1 clock input ports
      .CLK(BIT_CLK_ODD),                   // 1-bit input High-speed clock input
      .CLKB(BIT_CLK_EVEN),                 // 1-bit input High-speed secondary clock input
      .CLKDIV(FRAME_CLK),             // 1-bit input Divided clock input
      .OCLK(1'b0),                 // 1-bit input High speed output clock input used when
                                   // INTERFACE_TYPE="MEMORY" 

      // Dynamic Clock Inversions: 1-bit (each) input Dynamic clock inversion pins to switch clock polarity
      .DYNCLKDIVSEL(1'b0), // 1-bit input Dynamic CLKDIV inversion input
      .DYNCLKSEL(1'b0),       // 1-bit input Dynamic CLK/CLKB inversion input
      // Input Data: 1-bit (each) input ISERDESE1 data input ports
      .D(DB),                       // 1-bit input Data input
      .DDLY(DBDLY),                 // 1-bit input Serial input data from IODELAYE1
      .OFB(1'b0),                   // 1-bit input Data feedback input from OSERDESE1
      .RST(RST),                   // 1-bit input Active high asynchronous reset input
      // SHIFTIN1-SHIFTIN2: 1-bit (each) input Data width expansion input ports
      .SHIFTIN1(1'b0),
      .SHIFTIN2(1'b0) 
   );

endmodule
