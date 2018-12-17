/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used solely      *
*     for design, simulation, implementation and creation of design files      *
*     limited to Xilinx devices or technologies. Use with non-Xilinx           *
*     devices or technologies is expressly prohibited and immediately          *
*     terminates your license.                                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY     *
*     FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY     *
*     PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE              *
*     IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS       *
*     MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY       *
*     CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY        *
*     RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY        *
*     DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE    *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A    *
*     PARTICULAR PURPOSE.                                                      *
*                                                                              *
*     Xilinx products are not intended for use in life support appliances,     *
*     devices, or systems.  Use in such applications are expressly             *
*     prohibited.                                                              *
*                                                                              *
*     (c) Copyright 1995-2013 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/

/*******************************************************************************
*     Generated from core with identifier: xilinx.com:ip:sem:3.6               *
*                                                                              *
*     The Xilinx Soft Error Mitigation IP solution provides a pre-verified     *
*     design which can detect and optionally correct and classify soft         *
*     errors in Configuration Memory.  A soft error is an unintended change    *
*     to the state of memory bits caused by ionizing radiation.  The           *
*     solution does not prevent soft errors; rather, it provides users with    *
*     a method to better manage the system-level effects of these events.      *
*     Intelligent management of these events can increase reliability and      *
*     availability, and reduce system maintenance and downtime costs.          *
*******************************************************************************/

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
sem_core your_instance_name (
  .status_heartbeat(status_heartbeat), // output status_heartbeat
  .status_initialization(status_initialization), // output status_initialization
  .status_observation(status_observation), // output status_observation
  .status_correction(status_correction), // output status_correction
  .status_classification(status_classification), // output status_classification
  .status_injection(status_injection), // output status_injection
  .status_essential(status_essential), // output status_essential
  .status_uncorrectable(status_uncorrectable), // output status_uncorrectable
  .monitor_txdata(monitor_txdata), // output [7 : 0] monitor_txdata
  .monitor_txwrite(monitor_txwrite), // output monitor_txwrite
  .monitor_txfull(monitor_txfull), // input monitor_txfull
  .monitor_rxdata(monitor_rxdata), // input [7 : 0] monitor_rxdata
  .monitor_rxread(monitor_rxread), // output monitor_rxread
  .monitor_rxempty(monitor_rxempty), // input monitor_rxempty
  .inject_strobe(inject_strobe), // input inject_strobe
  .inject_address(inject_address), // input [35 : 0] inject_address
  .icap_busy(icap_busy), // input icap_busy
  .icap_o(icap_o), // input [31 : 0] icap_o
  .icap_csb(icap_csb), // output icap_csb
  .icap_rdwrb(icap_rdwrb), // output icap_rdwrb
  .icap_i(icap_i), // output [31 : 0] icap_i
  .icap_clk(icap_clk), // input icap_clk
  .icap_request(icap_request), // output icap_request
  .icap_grant(icap_grant), // input icap_grant
  .fecc_crcerr(fecc_crcerr), // input fecc_crcerr
  .fecc_eccerr(fecc_eccerr), // input fecc_eccerr
  .fecc_eccerrsingle(fecc_eccerrsingle), // input fecc_eccerrsingle
  .fecc_syndromevalid(fecc_syndromevalid), // input fecc_syndromevalid
  .fecc_syndrome(fecc_syndrome), // input [12 : 0] fecc_syndrome
  .fecc_far(fecc_far), // input [23 : 0] fecc_far
  .fecc_synbit(fecc_synbit), // input [4 : 0] fecc_synbit
  .fecc_synword(fecc_synword) // input [6 : 0] fecc_synword
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file sem_core.v when simulating
// the core, sem_core. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

