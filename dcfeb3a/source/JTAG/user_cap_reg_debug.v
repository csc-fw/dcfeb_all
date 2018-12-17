`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:08 02/24/2011 
// Design Name: 
// Module Name:    user_cap_reg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
//   Parallel in serial out (piso) shift register with parameterized width.
//   Capable of two functions: 1) Serial shift only (TDI in and TDO out -- no capture)
//                             2) Paralell capture of the input bus then serial shift out (LSB first)
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module user_cap_reg_debug(
    input DRCK,
    input FSH,
    input FCAP,
    input SEL,
    input TDI,
    input SHIFT,
    input CAPTURE,
    input RST,
    input [width-1:0] BUS,
    output TDO,
	 output [width-1:0] FFOUT,
	 input CLK40,
	 input FRE
    );

  parameter width = 8;
  
  reg[width-1:0] q;
  wire ce;
  
  assign TDO     = ce & q[0];
  assign ce      = SEL & (FSH & SHIFT | (FCAP & (CAPTURE | SHIFT)));
  
  always @(posedge DRCK or posedge RST) begin
  if(RST)
	   q <= {width{1'b0}};           // default
    else
	   if(ce && CAPTURE)
	     q <= BUS; // Capture Status
		else if (ce && SHIFT)
	     q <= {TDI,q[width-1:1]}; // Shift right
		else
		  q <= q;                  // Hold
  end
  
wire amt;
wire afl;
wire empty;
wire full;
wire rderr;
wire wrterr;
wire [8:0] rdcount;  
wire [8:0] wrtcount;
reg  fwe;

always @(posedge DRCK) begin
	fwe <= ce;
end
 
   FIFO_DUALCLOCK_MACRO  #(
      .ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
      .ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
      .DATA_WIDTH(24),   // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      .DEVICE("VIRTEX6"),  // Target device: "VIRTEX5", "VIRTEX6" 
      .FIFO_SIZE ("18Kb"), // Target BRAM: "18Kb" or "36Kb" 
      .FIRST_WORD_FALL_THROUGH ("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
   ) FIFO_DUALCLOCK_MACRO_inst (
      .ALMOSTEMPTY(amt), // 1-bit output almost empty
      .ALMOSTFULL(afl),   // 1-bit output almost full
      .DO(FFOUT),                   // Output data, width defined by DATA_WIDTH parameter
      .EMPTY(empty),             // 1-bit output empty
      .FULL(full),               // 1-bit output full
      .RDCOUNT(rdcount),         // Output read count, width determined by FIFO depth
      .RDERR(rderr),             // 1-bit output read error
      .WRCOUNT(wrtcount),         // Output write count, width determined by FIFO depth
      .WRERR(wrterr),             // 1-bit output write error
      .DI(q),                   // Input data, width defined by DATA_WIDTH parameter
      .RDCLK(CLK40),             // 1-bit input read clock
      .RDEN(FRE),               // 1-bit input read enable
      .RST(RST),                 // 1-bit input reset
      .WRCLK(DRCK),             // 1-bit input write clock
      .WREN(fwe)                // 1-bit input write enable
   );
  
endmodule
