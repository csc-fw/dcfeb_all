`timescale 1ns / 1ps
module test_points(
    input CLK40,
    input GBT_DSKW_CLK,
    input GBT_RCV_RDY,
    input GBT_RCV_DATA_VLD,
    input [15:0] GBT_RCV_DATA,
    input [15:0] GBT_TRNS_DATA,
    input GBT_RCV_VLD,
    input GBT_TRNS_VLD,
    input GBT_READ_ENA,

	 //
    inout [2:0] TP_B24_,
    inout [15:0] TP_B25_,
    inout [1:0] TP_B26_,
    inout [14:1] TP_B35_ // bits 9 and 10 are skipped.
    );

  wire [2:0] tp_b24_dir,tp_b24_in,tp_b24_out,dmy24_fab;
  wire [15:0] tp_b25_dir,tp_b25_in,tp_b25_out,dmy25_fab;
  wire [1:0] tp_b26_dir,tp_b26_in,tp_b26_out,dmy26_fab;
  wire [14:1] tp_b35_dir,tp_b35_in,tp_b35_out,dmy35_fab; // note bits 1 to 14 (not 0 to 13) and bits 9 and 10 do not exist
  
  IOBUF #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) IOBUF_TP_B24_[2:0] (.O(tp_b24_in),.IO(TP_B24_),.I(tp_b24_out),.T(tp_b24_dir));
  IOBUF #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) IOBUF_TP_B25_[15:0] (.O(tp_b25_in),.IO(TP_B25_),.I(tp_b25_out),.T(tp_b25_dir));
  IOBUF #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) IOBUF_TP_B26_[1:0] (.O(tp_b26_in),.IO(TP_B26_),.I(tp_b26_out),.T(tp_b26_dir));
  IOBUF #(.DRIVE(12),.IOSTANDARD("DEFAULT"),.SLEW("SLOW")) IOBUF_TP_B35_[14:1] (.O(tp_b35_in),.IO(TP_B35_),.I(tp_b35_out),.T(tp_b35_dir));


// Direction control
// 1 is tri-state (input), 0 is drive (output)
 
assign tp_b24_dir = 3'b000;
assign tp_b25_dir = 16'h0000;
assign tp_b26_dir = 2'b11; // set as inputs
assign tp_b35_dir = 14'h0300; // bits 9 and 10 do not exist; direction set to input

// Outgoing data to testpoints
//

assign tp_b24_out = {GBT_DSKW_CLK,2'b00};
assign tp_b25_out = GBT_RCV_DATA;
assign tp_b26_out = 2'b00;
assign tp_b35_out = {4'b0,2'b0,3'b0,GBT_READ_ENA,GBT_TRNS_VLD,GBT_RCV_VLD,GBT_RCV_DATA_VLD,GBT_RCV_RDY};
//
// Incoming data to fabric
//
assign dmy24_fab = tp_b24_in;
assign dmy25_fab = tp_b25_in;
assign dmy26_fab = tp_b26_in;
assign dmy35_fab = tp_b35_in;

endmodule
