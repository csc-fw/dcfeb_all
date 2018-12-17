###############################################################################
##
## (c) Copyright 2009-2011 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
## 
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.



wcfg new
divider add "Receive Ports - RX Data Path interface"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/RXRESET_IN
divider add "Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/RXN_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/RXP_IN
divider add "Receive Ports - RX PLL Ports"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/GREFCLKRX_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/NORTHREFCLKRX_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/PERFCLKRX_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/RXPLLREFSELDY_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/SOUTHREFCLKRX_IN
divider add "Transmit Ports - 8b10b Encoder Control Ports"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXCHARISK_IN
divider add "Transmit Ports - GTX Ports"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/GTXTEST_IN
divider add "Transmit Ports - TX Data Path interface"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXDATA_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXOUTCLK_OUT
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXRESET_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXUSRCLK2_IN
divider add "Transmit Ports - TX Driver and OOB signaling"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXN_OUT
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXP_OUT
divider add "Transmit Ports - TX Elastic Buffer and Phase Alignment"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXBUFSTATUS_OUT
divider add "Transmit Ports - TX PLL Ports"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/GREFCLKTX_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/GTXTXRESET_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/MGTREFCLKTX_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/NORTHREFCLKTX_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/PERFCLKTX_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/PLLTXRESET_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/SOUTHREFCLKTX_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXPLLLKDET_OUT
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXPLLREFSELDY_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXRATE_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXRATEDONE_OUT
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXRESETDONE_OUT
divider add "Transmit Ports - TX PRBS Generator"
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXENPRBSTST_IN
wave add /DEMO_TB/daq_gtx_dual_rate_top_i/daq_gtx_dual_rate_i/gtx0_daq_gtx_dual_rate_i/TXPRBSFORCEERR_IN

run 64 us
quit



