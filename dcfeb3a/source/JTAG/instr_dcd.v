`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: The Ohio State University
// Engineer: Marissa Rodenburg
// 
// Create Date:    12:30:24 10/11/2010 
// Design Name: 
// Module Name:    instr_dcd 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
//   Performs instruction register decoding (JTAG User1 register).
//
// Function  Description
// ---------------------------------------
//   0     | No Op 
//   1     | JTAG System Reset (JTAG_SYS_RST), Equivalent to power on reset without reprogramming. Instruction only, (Auto reset)
//   2     | DCFEB status reg (32 bits) shift only for reading back without updating
//   3     | DCFEB status reg (32 bits) capture and shift for updated information.
//   4     | Program Comparator DAC -- same as in old CFEB
//   5     | Set Extra L1a Delay (2 bits) -- not used on DCFEB, exist for compatability with old DMB
//   6     | Read FIFO 1 -- ADC data (16 channels x 12 bits = 192 bits) wide X (6 chips x 8 sample)/event deep
//   7     | Set F5, F8, and F9 in one serial loop (daisy chained) for compatability with old DMB
//   8     | Set Pre Block End (4 bits) (not needed in DCFEB) -- not used on DCFEB, exist for compatability with old DMB
//   9     | Set Comparator Mode and Timing (5 bits) same format as old CFEB
//  10     | Set Buckeye Mask for shifting (6 bits) (default 6'b111111) same format as old CFEB, one bit for each chip
//  11     | Shift data to/from Buckeye chips (48 bits/chip)
//  12     | Set ADC configuration MASK (12 bits)
//  13     | Command to initialize ADC -- Instruction only, (Auto reset)
//  14     | Shift data and write to ADC configuration memory (26 bits)
//  15     | Command to restart pipeline -- Instruction only, (Auto reset)
//  16     | Set pipeline depth (9 bits)
//  17     | Set TTC source (2 bits) Selects 0:FF_EMU_mode, 1:FF_EEM_mode, or 2:Skew_Clr_mode
//  18     | Set calibration mode to external. (only for optical modes) -- Instruction only
//  19     | Set calibration mode to internal. (only for optical modes) -- Instruction only
//  20     | Set number of samples to readout (7 bits).
//  21     | Write word to BPI interface write FIFO (16 bits).
//  22     | Read word from BPI readback FIFO (16 bits).
//  23     | Read status word from BPI interface (16 bits).
//  24     | Read BPI timer (32 bits).
//  25     | Reset BPI interface. -- Instruction only, (Auto reset)
//  26     | Disable BPI processing. -- Instruction only, persisting
//  27     | Enable BPI processing. -- Instruction only, persisting
//  28     | Comparator Clock phase register (4-bits, 0-15).
//  29     | TMB transmit mode (2-bits, 0: comparator data, 1: fixed patterns, 2: counters, 3: randoms, 4: comparator data, 5: half strip patterns).
//  30     | TMB half strips for injecting patterns into the optical serial data stream for transmit mode 5. (30-bits, 5 per layer) {ly6,...ly1}
//  31     | TMB layer mask to indicat the active layers for half strip patterns in transmit mode 5. (6-bits, 1 per layer)
//  32     | Set DAQ rate to 1 GbE (1.25Gbps line rate) -- Instruction only
//  33     | Set DAQ rate to 2.56 GbE (3.2Gbps line rate) -- Instruction only
//  34     | Program Calibration DAC -- same style as Comparator DAC
//  35     | Send Control Byte to the MAX 1271 ADC (and conversion clocks)
//  36     | Read back the MAX 1271 ADC conversion stored in the SPI return register.
//  37     | Read the SEM status (10 bits).
//  38     | Reset the configuration ECC error counters. -- Instruction only, (Auto reset)
//  39     | Read the ECC error counters (16-bits total, {8-bits for multi-bit error count, 8-bits for single-bit error counts})
//  40     | Set L1A_MATCH source to use only matched L1A's (skw_rw_l1a_match). Clear the USE_ANY_L1A flag. -- Instruction only
//  41     | Set L1A_MATCH source to use any L1A to send data (skw_rw_l1a). Set the USE_ANY_L1A flag. -- Instruction only
//  42     | Disable l1anum use in data to ODMB. Clear the L1A_HEAD flag. -- Instruction only
//  43     | Enable l1anum use in data to ODMB. Set the L1A_HEAD flag.  This is the default -- Instruction only
//  44     | Sampling Clock phase register (3-bits, 0-7).
//  45     | PRBS test mode for DAQ optical path (3-bits, 0-7).
//  46     | Inject error into PRBS test for DAQ optical path.
//  47     | Take control of the SEM command interface (only needs to be set after ChipScope Pro has been in control).
//  48     | Reset the double error detected flag (SEM module).
//  49     | Send ASCII command to the SEM controller (8-bits). 
//  50     | Frame Address Register (FAR) in Linear Address format indicating the frame containing the error (24-bits). 
//  51     | Frame Address Register (FAR) in Physical Address format indicating the frame containing the error (24-bits). 
//  52     | Register Selection Word (Reg_Sel_Wrd) for selecting which register to independently capture and readback (8-bits). 
//  53     | Readback Select Register: Register to capture selected register indicated in Reg_Sel_Wrd (16-bits). 
//  54     | QPLL reset: This requires a NoOp afterwards to clear the reset then a Hard reset.  All clocks stop while active. QPLL takes 0.5 seconds to lock. 
//  55     | QPLL lock lost counter (8-bits). 
//  56     | Startup Status register (16-bits).  {qpll_lock,qpll_error,qpll_cnt_ovrflw,1'b0,eos,trg_mmcm_lock,daq_mmcm_lock,adc_rdy,run,al_status[2:0],por_state[3:0]};
//  57     | Read L1A counter (24 bits).
//  58     | Read L1A_MATCH counter (12 bits).
//  59     | Read INJPLS counter (12 bits).
//  60     | Read EXTPLS counter (12 bits).
//  61     | Read BC0 counter (12 bits).
//  62     | Comparator Clock Phase Reset (CMP_PHS_JTAG_RST),  Instruction only, (Auto reset)
//  63     | Toggle transmit disable on DAQ optical transceiver
//  64     | Toggle transmit disable on TRG optical transceiver
//  65     | Enable  ECC for parameters storage in XCF08P PROM Set   the ECC flag. -- Instruction only, persisting  This is the default 
//  66     | Disable ECC for parameters storage in XCF08P PROM Clear the ECC flag. -- Instruction only, persisting
//  67     | Enable  CRC for parameters storage in XCF08P PROM Set   the CRC flag. -- Instruction only, persisting
//  68     | Disable CRC for parameters storage in XCF08P PROM Clear the CRC flag. -- Instruction only, persisting  This is the default 
//  69     | Enable  ECC Decoding for parameters readback of XCF08P PROM Set   the DECODE flag. -- Instruction only, persisting  This is the default 
//  70     | Disable ECC Decoding for parameters readback of XCF08P PROM Clear the DECODE flag. -- Instruction only, persisting
//  71     | Initiate transfer of parameters from XCF08P PROM to readback FIFO -- Instruction only,  (Auto reset)
//  72     | Read word from XCF08P PROM readback FIFO (16 bits).
//  73     | Enable  GBT Testing mode -- Instruction only, persisting 
//  74     | Disable GBT Testing mode -- Instruction only, persisting  This is the default
//  75     | Enable power to GBT -- Instruction only, persisting  This is the default 
//  76     | Disable power to GBT -- Instruction only, persisting
//  77     | Write Byte to I2C write FIFO (8 bits).
//  78     | Read Byte from I2C readback FIFO (8 bits).
//  79     | Read I2C status word from I2C interface (8 bits).
//  80     | Reset I2C interface. -- Instruction only, (Auto reset)
//  81     | Start I2C processing. -- Instruction only, persisting until new command or processing completed
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instr_dcd(
  input TCK,
  input DRCK,
  input SEL,
  input TDI,
  input UPDATE,
  input SHIFT,
  input RST,
  input CLR,            // clear current instruction
  output reg [95:0] F,
  output TDO);

  reg[7:0] d;
  wire rst_f;
  
  assign TDO = d[0];
  assign rst_f = RST | CLR;
  
  always @(posedge DRCK or posedge RST) begin
    if (RST)
	   d <= 8'h00;
	 else
      if (SEL & SHIFT)
        d <= {TDI,d[7:1]};
		else
		  d <= d;
  end
  
  always @(posedge TCK or posedge rst_f) begin
    if(rst_f)
	   F <= 96'h000000000000000000000000;
	 else
	   if(UPDATE)
		  case (d)
		    8'h00:   F <= 96'h000000000000000000000001;
		    8'h01:   F <= 96'h000000000000000000000002;
		    8'h02:   F <= 96'h000000000000000000000004;
		    8'h03:   F <= 96'h000000000000000000000008;
		    8'h04:   F <= 96'h000000000000000000000010;
		    8'h05:   F <= 96'h000000000000000000000020;
		    8'h06:   F <= 96'h000000000000000000000040;
		    8'h07:   F <= 96'h000000000000000000000080;
		    8'h08:   F <= 96'h000000000000000000000100;
		    8'h09:   F <= 96'h000000000000000000000200;
		    8'h0A:   F <= 96'h000000000000000000000400;
		    8'h0B:   F <= 96'h000000000000000000000800;
		    8'h0C:   F <= 96'h000000000000000000001000;
		    8'h0D:   F <= 96'h000000000000000000002000;
		    8'h0E:   F <= 96'h000000000000000000004000;
		    8'h0F:   F <= 96'h000000000000000000008000;
			 
		    8'h10:   F <= 96'h000000000000000000010000;
		    8'h11:   F <= 96'h000000000000000000020000;
		    8'h12:   F <= 96'h000000000000000000040000;
		    8'h13:   F <= 96'h000000000000000000080000;
		    8'h14:   F <= 96'h000000000000000000100000;
		    8'h15:   F <= 96'h000000000000000000200000;
		    8'h16:   F <= 96'h000000000000000000400000;
		    8'h17:   F <= 96'h000000000000000000800000;
		    8'h18:   F <= 96'h000000000000000001000000;
		    8'h19:   F <= 96'h000000000000000002000000;
		    8'h1A:   F <= 96'h000000000000000004000000;
		    8'h1B:   F <= 96'h000000000000000008000000;
		    8'h1C:   F <= 96'h000000000000000010000000;
		    8'h1D:   F <= 96'h000000000000000020000000;
		    8'h1E:   F <= 96'h000000000000000040000000;
		    8'h1F:   F <= 96'h000000000000000080000000;
			 
		    8'h20:   F <= 96'h000000000000000100000000;
		    8'h21:   F <= 96'h000000000000000200000000;
		    8'h22:   F <= 96'h000000000000000400000000;
		    8'h23:   F <= 96'h000000000000000800000000;
		    8'h24:   F <= 96'h000000000000001000000000;
		    8'h25:   F <= 96'h000000000000002000000000;
		    8'h26:   F <= 96'h000000000000004000000000;
		    8'h27:   F <= 96'h000000000000008000000000;
		    8'h28:   F <= 96'h000000000000010000000000;
		    8'h29:   F <= 96'h000000000000020000000000;
		    8'h2A:   F <= 96'h000000000000040000000000;
		    8'h2B:   F <= 96'h000000000000080000000000;
		    8'h2C:   F <= 96'h000000000000100000000000;
		    8'h2D:   F <= 96'h000000000000200000000000;
		    8'h2E:   F <= 96'h000000000000400000000000;
		    8'h2F:   F <= 96'h000000000000800000000000;
			 
		    8'h30:   F <= 96'h000000000001000000000000;
		    8'h31:   F <= 96'h000000000002000000000000;
		    8'h32:   F <= 96'h000000000004000000000000;
		    8'h33:   F <= 96'h000000000008000000000000;
		    8'h34:   F <= 96'h000000000010000000000000;
		    8'h35:   F <= 96'h000000000020000000000000;
		    8'h36:   F <= 96'h000000000040000000000000;
		    8'h37:   F <= 96'h000000000080000000000000;
		    8'h38:   F <= 96'h000000000100000000000000;
		    8'h39:   F <= 96'h000000000200000000000000;
		    8'h3A:   F <= 96'h000000000400000000000000;
		    8'h3B:   F <= 96'h000000000800000000000000;
		    8'h3C:   F <= 96'h000000001000000000000000;
		    8'h3D:   F <= 96'h000000002000000000000000;
		    8'h3E:   F <= 96'h000000004000000000000000;
		    8'h3F:   F <= 96'h000000008000000000000000;
			 
		    8'h40:   F <= 96'h000000010000000000000000;
		    8'h41:   F <= 96'h000000020000000000000000;
		    8'h42:   F <= 96'h000000040000000000000000;
		    8'h43:   F <= 96'h000000080000000000000000;
		    8'h44:   F <= 96'h000000100000000000000000;
		    8'h45:   F <= 96'h000000200000000000000000;
		    8'h46:   F <= 96'h000000400000000000000000;
		    8'h47:   F <= 96'h000000800000000000000000;
		    8'h48:   F <= 96'h000001000000000000000000;
		    8'h49:   F <= 96'h000002000000000000000000;
		    8'h4A:   F <= 96'h000004000000000000000000;
		    8'h4B:   F <= 96'h000008000000000000000000;
		    8'h4C:   F <= 96'h000010000000000000000000;
		    8'h4D:   F <= 96'h000020000000000000000000;
		    8'h4E:   F <= 96'h000040000000000000000000;
		    8'h4F:   F <= 96'h000080000000000000000000;
			 
		    8'h50:   F <= 96'h000100000000000000000000;
		    8'h51:   F <= 96'h000200000000000000000000;
		    8'h52:   F <= 96'h000400000000000000000000;
		    8'h53:   F <= 96'h000800000000000000000000;
		    8'h54:   F <= 96'h001000000000000000000000;
		    8'h55:   F <= 96'h002000000000000000000000;
		    8'h56:   F <= 96'h004000000000000000000000;
		    8'h57:   F <= 96'h008000000000000000000000;
		    8'h58:   F <= 96'h010000000000000000000000;
		    8'h59:   F <= 96'h020000000000000000000000;
		    8'h5A:   F <= 96'h040000000000000000000000;
		    8'h5B:   F <= 96'h080000000000000000000000;
		    8'h5C:   F <= 96'h100000000000000000000000;
		    8'h5D:   F <= 96'h200000000000000000000000;
		    8'h5E:   F <= 96'h400000000000000000000000;
		    8'h5F:   F <= 96'h800000000000000000000000;
		    default: F <= 96'h000000000000000000000000;
		  endcase
		else
		  F <= F;
  end
  
endmodule
