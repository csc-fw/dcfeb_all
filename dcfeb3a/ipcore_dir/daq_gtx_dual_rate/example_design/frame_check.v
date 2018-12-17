///////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 1.12
//  \   \         Application : Virtex-6 FPGA GTX Transceiver Wizard  
//  /   /         Filename : frame_check.v
// /___/   /\      
// \   \  /  \ 
//  \___\/\___\ 
//
//
// Module FRAME_CHECK
// Generated by Xilinx Virtex-6 FPGA GTX Transceiver Wizard
// 
// 
// (c) Copyright 2009-2011 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 


`timescale 1ns / 1ps
`define DLY #1

//***********************************Entity Declaration************************

module FRAME_CHECK #
(
    // parameter to set the number of words in the BRAM
    parameter   RX_DATA_WIDTH            =   16,
    parameter   NONE_MSB_FIRST_DEC       =   0,
    parameter   COMMA_DOUBLE_DEC         =   0,
    parameter   CHANBOND_SEQ_LEN         =   1,
    parameter   USE_COMMA                =   1,
    parameter   WORDS_IN_BRAM            =   256,
    parameter   CONFIG_INDEPENDENT_LANES =   0,
    parameter   START_OF_PACKET_CHAR     =  16'h55fb,
    parameter   COMMA_DOUBLE             =  16'hf628,
    parameter   MEM_00   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_01   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_02   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_03   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_04   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_05   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_06   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_07   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_08   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_09   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_0A   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_0B   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_0C   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_0D   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_0E   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_0F   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_10   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_11   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_12   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_13   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_14   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_15   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_16   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_17   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_18   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_19   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_1A   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_1B   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_1C   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_1D   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_1E   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_1F   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_20   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_21   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_22   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_23   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_24   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_25   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_26   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_27   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_28   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_29   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_2A   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_2B   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_2C   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_2D   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_2E   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_2F   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_30   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_31   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_32   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_33   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_34   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_35   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_36   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_37   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_38   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_39   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_3A   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_3B   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_3C   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_3D   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_3E   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEM_3F   =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEMP_00  =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEMP_01  =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEMP_02  =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEMP_03  =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEMP_04  =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEMP_05  =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEMP_06  =   256'h0000000000000000000000000000000000000000000000000000000000000000,
    parameter   MEMP_07  =   256'h0000000000000000000000000000000000000000000000000000000000000000
)                            
(
    // User Interface
    input  wire [(RX_DATA_WIDTH-1):0] RX_DATA,
    output reg          RX_ENMCOMMA_ALIGN,
    output reg          RX_ENPCOMMA_ALIGN,
    
    // Error Monitoring
    output wire [7:0]   ERROR_COUNT,
    
    // Track Data
    output wire         TRACK_DATA,
   
    // System Interface
    input  wire         USER_CLK,
    input  wire         SYSTEM_RESET
 
);


//***************************Internal Register Declarations******************** 

    reg             begin_r;
    reg             data_error_detected_r;
    reg     [8:0]   error_count_r;
    reg             error_detected_r;
    reg     [8:0]   read_counter_i;    
    reg             rx_chanbond_seq_r;
    reg             rx_chanbond_seq_r2;
    reg             rx_chanbond_seq_r3;   
    reg     [(RX_DATA_WIDTH-1):0] rx_data_r;
    reg     [(RX_DATA_WIDTH-1):0] rx_data_r2;
    reg     [(RX_DATA_WIDTH-1):0] rx_data_r3;
    reg     [(RX_DATA_WIDTH-1):0] rx_data_r4;
    reg     [(RX_DATA_WIDTH-1):0] rx_data_r5;
    reg     [(RX_DATA_WIDTH-1):0] rx_data_r6;
    reg     [(RX_DATA_WIDTH-1):0] rx_data_r7;
    reg     [(RX_DATA_WIDTH-1):0] rx_data_r_track;
    reg             start_of_packet_detected_r;    
    reg             track_data_r;
    reg             track_data_r2;
    reg             track_data_r3;
    reg             track_data_r4;
    reg     [1:0]   sel;
    reg     [31:0]  bram_data_r;
     
 
//*********************************Wire Declarations***************************

    wire    [31:0]  bram_data_i;
    wire            error_detected_c;
    wire            next_begin_c;
    wire            next_data_error_detected_c;
    wire            next_track_data_c;
    wire            start_of_packet_detected_c;
    wire    [(RX_DATA_WIDTH-1):0]  rx_data_aligned;
    wire            rx_data_has_start_char_c;
    wire            tied_to_ground_i;
    wire    [31:0]  tied_to_ground_vec_i;
    wire            tied_to_vcc_i;


//*********************************Main Body of Code***************************

    //_______________________  Static signal Assigments _______________________   

    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 32'h00000000;
    assign tied_to_vcc_i                = 1'b1;


    //______________________ Register RXDATA once to ease timing ______________   

    always @(posedge USER_CLK)
        rx_data_r <= `DLY    RX_DATA;



    //________________________________ State machine __________________________    
    
    // State registers
    always @(posedge USER_CLK)
        if(SYSTEM_RESET)
            {begin_r,track_data_r,data_error_detected_r}  <=  `DLY    3'b100;
        else
        begin
            begin_r                <=  `DLY    next_begin_c;
            track_data_r           <=  `DLY    next_track_data_c;
            data_error_detected_r  <=  `DLY    next_data_error_detected_c;
        end

    // Next state logic
    assign  next_begin_c                =   (begin_r & !start_of_packet_detected_r)
                                            | data_error_detected_r ;

    assign  next_track_data_c           =   (begin_r & start_of_packet_detected_r)
                                            | (track_data_r && !error_detected_r);
                                      
    assign  next_data_error_detected_c  =   (track_data_r && error_detected_r);                               
    assign  start_of_packet_detected_c  =   rx_data_has_start_char_c;

    always @(posedge USER_CLK) 
        start_of_packet_detected_r    <=   `DLY  start_of_packet_detected_c;  

    // Registering for timing
    always @(posedge USER_CLK) 
        track_data_r2    <=   `DLY  track_data_r;  

    always @(posedge USER_CLK) 
        track_data_r3    <=   `DLY  track_data_r2;  
    
    always @(posedge USER_CLK) 
        track_data_r4    <=   `DLY  track_data_r3;  

    //______________________________ Capture incoming data ____________________    


generate
if ((RX_DATA_WIDTH==32) || (RX_DATA_WIDTH==40) || (RX_DATA_WIDTH==16) || (RX_DATA_WIDTH==20))
begin : datapath_width_32_or_40_or_16_or_20 
    always @(posedge USER_CLK)
    begin
        if(SYSTEM_RESET)  
        begin
            rx_data_r2      <=  `DLY   'h0;
            rx_data_r4      <=  `DLY   'h0;
            rx_data_r5      <=  `DLY   'h0;
            rx_data_r6      <=  `DLY   'h0;
            rx_data_r7      <=  `DLY   'h0;
            rx_data_r_track <=  `DLY   'h0;
        end
        else
        begin
            rx_data_r2      <=  `DLY    rx_data_r;
            rx_data_r4      <=  `DLY    rx_data_r3;
            rx_data_r5      <=  `DLY    rx_data_r4;
            rx_data_r6      <=  `DLY    rx_data_r5;
            rx_data_r7      <=  `DLY    rx_data_r6;
            rx_data_r_track <=  `DLY    rx_data_r7;
        end
    end


    assign rx_data_aligned = rx_data_r3;

end
else
begin : datapath_width_8_or_10
    always @(posedge USER_CLK)
    begin
        if(SYSTEM_RESET)  
        begin
            rx_data_r2      <=  `DLY   'h0;
            rx_data_r3      <=  `DLY   'h0;
            rx_data_r4      <=  `DLY   'h0;
            rx_data_r5      <=  `DLY   'h0;
            rx_data_r6      <=  `DLY   'h0;
            rx_data_r_track <=  `DLY   'h0;
        end
        else
        begin
            rx_data_r2      <=  `DLY    rx_data_r;
            rx_data_r3      <=  `DLY    rx_data_r2;
            rx_data_r4      <=  `DLY    rx_data_r3;
            rx_data_r5      <=  `DLY    rx_data_r4;
            rx_data_r6      <=  `DLY    rx_data_r5;
            rx_data_r_track <=  `DLY    rx_data_r6;
        end
    end

    assign rx_data_aligned = RX_DATA;
end
endgenerate

  




    //_____________________________ Assign output ports _______________________    



    assign TRACK_DATA = track_data_r;


    // Drive the enamcommaalign port of the mgt for alignment
    always @(posedge USER_CLK)
        if(SYSTEM_RESET)  RX_ENMCOMMA_ALIGN   <=  `DLY    1'b0;
        else              RX_ENMCOMMA_ALIGN   <=  `DLY    1'b1;

    // Drive the enapcommaalign port of the mgt for alignment
    always @(posedge USER_CLK)
        if(SYSTEM_RESET)  RX_ENPCOMMA_ALIGN   <=  `DLY    1'b0;
        else              RX_ENPCOMMA_ALIGN   <=  `DLY    1'b1;


    //___________________________ Check incoming data for errors ______________

    always @(posedge USER_CLK)
          bram_data_r   <=  `DLY    bram_data_i;

    //An error is detected when data read for the BRAM does not match the incoming data
generate
if (RX_DATA_WIDTH==40) 
begin : use_40bit
    assign  error_detected_c    =  track_data_r4 && (rx_data_r_track != {tied_to_ground_vec_i[7:0],bram_data_r});   
end
else
begin : not_40bit
    assign  error_detected_c    =  track_data_r4 && (rx_data_r_track !=  bram_data_r[(RX_DATA_WIDTH-1):0]);   
end
endgenerate
    
generate
if (USE_COMMA==1) 
begin : use_comma
    //We register the error_detected signal for use with the error counter logic
    always @(posedge USER_CLK)
        if(!track_data_r)  
            error_detected_r    <=  `DLY    1'b0;
        else
            error_detected_r    <=  `DLY    error_detected_c;  

end
else 
begin: no_comma
    // Since the comma detect logic has not been enabled, the error counter has been disabled since
    // it doesnt make sense to be searching for an align character in the data. To enable the error 
    // count again, please see the code above 
    
    always @(posedge USER_CLK)
        error_detected_r    <=   1'b0;

end
endgenerate

    //We count the total number of errors we detect. By keeping a count we make it less likely that we will miss
    //errors we did not directly observe. 
    always @(posedge USER_CLK)
        if(SYSTEM_RESET)
            error_count_r       <=  `DLY    9'd0;
        else if(error_detected_r)
            error_count_r       <=  `DLY    error_count_r + 1;    
    
    //Here we connect the lower 8 bits of the count (the MSbit is used only to check when the counter reaches
    //max value) to the module output
    assign  ERROR_COUNT =   error_count_r[7:0];
    //____________________________ Counter to read from BRAM __________________________    
generate
if (RX_DATA_WIDTH > 20) 
begin : four_byte
    always @(posedge USER_CLK)
        if(SYSTEM_RESET |  (read_counter_i == (WORDS_IN_BRAM-1)))
        begin
            read_counter_i   <=  `DLY    9'd0;
        end
        else if (start_of_packet_detected_r & !track_data_r)
        begin
            read_counter_i   <=  `DLY    9'd1;
        end
        else read_counter_i  <=  `DLY    read_counter_i + 9'd1;
end
else 
begin: one_or_two_byte
    always @(posedge USER_CLK)
        if(SYSTEM_RESET |  (read_counter_i == (WORDS_IN_BRAM-1)) | (start_of_packet_detected_r & !track_data_r))
        begin
            read_counter_i   <=  `DLY    9'd0;
        end
        else read_counter_i  <=  `DLY    read_counter_i + 9'd1;
end
endgenerate
    //________________________________ BRAM Instantiation _____________________________    

    RAMB16_S36_S36 #
    (
        .INIT_00(MEM_00),
        .INIT_01(MEM_01),
        .INIT_02(MEM_02),
        .INIT_03(MEM_03),
        .INIT_04(MEM_04),
        .INIT_05(MEM_05),
        .INIT_06(MEM_06),
        .INIT_07(MEM_07),
        .INIT_08(MEM_08),
        .INIT_09(MEM_09),
        .INIT_0A(MEM_0A),
        .INIT_0B(MEM_0B),
        .INIT_0C(MEM_0C),
        .INIT_0D(MEM_0D),
        .INIT_0E(MEM_0E),
        .INIT_0F(MEM_0F),
        .INIT_10(MEM_10),
        .INIT_11(MEM_11),
        .INIT_12(MEM_12),
        .INIT_13(MEM_13),
        .INIT_14(MEM_14),
        .INIT_15(MEM_15),
        .INIT_16(MEM_16),
        .INIT_17(MEM_17),
        .INIT_18(MEM_18),
        .INIT_19(MEM_19),
        .INIT_1A(MEM_1A),
        .INIT_1B(MEM_1B),
        .INIT_1C(MEM_1C),
        .INIT_1D(MEM_1D),
        .INIT_1E(MEM_1E),
        .INIT_1F(MEM_1F),
        .INIT_20(MEM_20),
        .INIT_21(MEM_21),
        .INIT_22(MEM_22),
        .INIT_23(MEM_23),
        .INIT_24(MEM_24),
        .INIT_25(MEM_25),
        .INIT_26(MEM_26),
        .INIT_27(MEM_27),
        .INIT_28(MEM_28),
        .INIT_29(MEM_29),
        .INIT_2A(MEM_2A),
        .INIT_2B(MEM_2B),
        .INIT_2C(MEM_2C),
        .INIT_2D(MEM_2D),
        .INIT_2E(MEM_2E),
        .INIT_2F(MEM_2F),
        .INIT_30(MEM_30),
        .INIT_31(MEM_31),
        .INIT_32(MEM_32),
        .INIT_33(MEM_33),
        .INIT_34(MEM_34),
        .INIT_35(MEM_35),
        .INIT_36(MEM_36),
        .INIT_37(MEM_37),
        .INIT_38(MEM_38),
        .INIT_39(MEM_39),
        .INIT_3A(MEM_3A),
        .INIT_3B(MEM_3B),
        .INIT_3C(MEM_3C),
        .INIT_3D(MEM_3D),
        .INIT_3E(MEM_3E),
        .INIT_3F(MEM_3F),
        .INITP_00(MEMP_00),
        .INITP_01(MEMP_01),
        .INITP_02(MEMP_02),
        .INITP_03(MEMP_03),
        .INITP_04(MEMP_04),
        .INITP_05(MEMP_05),
        .INITP_06(MEMP_06),
        .INITP_07(MEMP_07)

    )
    dual_port_block_ram_i 
    (
        .ADDRA (read_counter_i),
        .DIA   (tied_to_ground_vec_i[31:0]),
        .DIPA  (tied_to_ground_vec_i[3:0]),
        .DOA   (bram_data_i),
        .DOPA  ( ), 
        .WEA   (tied_to_ground_i),
        .ENA   (tied_to_vcc_i),
        .SSRA  (tied_to_ground_i), 
        .CLKA  (USER_CLK),
        
        .ADDRB (tied_to_ground_vec_i[8:0]),
        .DIB   (tied_to_ground_vec_i[31:0]),
        .DIPB  (tied_to_ground_vec_i[3:0]),
        .DOB   ( ),  
        .DOPB  ( ), 
        .WEB   (tied_to_ground_i),
        .ENB   (tied_to_ground_i),
        .SSRB  (tied_to_ground_i),
        .CLKB  (tied_to_ground_i)       
    );
    
    
endmodule           

