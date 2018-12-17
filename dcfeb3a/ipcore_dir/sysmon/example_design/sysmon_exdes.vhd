-- file: sysmon_exdes.vhd
-- (c) Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.

------------------------------------------------------------------------------
-- Clocking wizard example design
------------------------------------------------------------------------------
-- This example design instantiates the generated VHDL file containing the
-- System Monitor instantiation.
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity sysmon_exdes is
    port (
          DCLK_IN             : in  STD_LOGIC;
          RESET_IN            : in  STD_LOGIC;
          VAUXP0              : in  STD_LOGIC;
          VAUXN0              : in  STD_LOGIC;
          VAUXP1              : in  STD_LOGIC;
          VAUXN1              : in  STD_LOGIC;
          VAUXP2              : in  STD_LOGIC;
          VAUXN2              : in  STD_LOGIC;
          VAUXP3              : in  STD_LOGIC;
          VAUXN3              : in  STD_LOGIC;
          VAUXP4              : in  STD_LOGIC;
          VAUXN4              : in  STD_LOGIC;
          VAUXP5              : in  STD_LOGIC;
          VAUXN5              : in  STD_LOGIC;
          VAUXP6              : in  STD_LOGIC;
          VAUXN6              : in  STD_LOGIC;
          VAUXP8              : in  STD_LOGIC;
          VAUXN8              : in  STD_LOGIC;
          VAUXP9              : in  STD_LOGIC;
          VAUXN9              : in  STD_LOGIC;
          VAUXP10             : in  STD_LOGIC;
          VAUXN10             : in  STD_LOGIC;
          VAUXP11             : in  STD_LOGIC;
          VAUXN11             : in  STD_LOGIC;
          VAUXP13             : in  STD_LOGIC;
          VAUXN13             : in  STD_LOGIC;
          VAUXP14             : in  STD_LOGIC;
          VAUXN14             : in  STD_LOGIC;
          VAUXP15             : in  STD_LOGIC;
          VAUXN15             : in  STD_LOGIC;
          OT_OUT              : out  STD_LOGIC;
          VCCAUX_ALARM_OUT    : out  STD_LOGIC;
          VCCINT_ALARM_OUT    : out  STD_LOGIC;
          USER_TEMP_ALARM_OUT : out  STD_LOGIC;
          VP_IN               : in  STD_LOGIC;
          VN_IN               : in  STD_LOGIC
);
end sysmon_exdes;

architecture xilinx of sysmon_exdes is

component sysmon
    port (
          DCLK_IN             : in  STD_LOGIC;                         -- Clock input for the dynamic reconfiguration port
          RESET_IN            : in  STD_LOGIC;                         -- Reset signal for the System Monitor control logic
          VAUXP0              : in  STD_LOGIC;                         -- Auxiliary Channel 0
          VAUXN0              : in  STD_LOGIC;
          VAUXP1              : in  STD_LOGIC;                         -- Auxiliary Channel 1
          VAUXN1              : in  STD_LOGIC;
          VAUXP2              : in  STD_LOGIC;                         -- Auxiliary Channel 2
          VAUXN2              : in  STD_LOGIC;
          VAUXP3              : in  STD_LOGIC;                         -- Auxiliary Channel 3
          VAUXN3              : in  STD_LOGIC;
          VAUXP4              : in  STD_LOGIC;                         -- Auxiliary Channel 4
          VAUXN4              : in  STD_LOGIC;
          VAUXP5              : in  STD_LOGIC;                         -- Auxiliary Channel 5
          VAUXN5              : in  STD_LOGIC;
          VAUXP6              : in  STD_LOGIC;                         -- Auxiliary Channel 6
          VAUXN6              : in  STD_LOGIC;
          VAUXP8              : in  STD_LOGIC;                         -- Auxiliary Channel 8
          VAUXN8              : in  STD_LOGIC;
          VAUXP9              : in  STD_LOGIC;                         -- Auxiliary Channel 9
          VAUXN9              : in  STD_LOGIC;
          VAUXP10             : in  STD_LOGIC;                         -- Auxiliary Channel 10
          VAUXN10             : in  STD_LOGIC;
          VAUXP11             : in  STD_LOGIC;                         -- Auxiliary Channel 11
          VAUXN11             : in  STD_LOGIC;
          VAUXP13             : in  STD_LOGIC;                         -- Auxiliary Channel 13
          VAUXN13             : in  STD_LOGIC;
          VAUXP14             : in  STD_LOGIC;                         -- Auxiliary Channel 14
          VAUXN14             : in  STD_LOGIC;
          VAUXP15             : in  STD_LOGIC;                         -- Auxiliary Channel 15
          VAUXN15             : in  STD_LOGIC;
          OT_OUT              : out  STD_LOGIC;                        -- Over-Temperature alarm output
          VCCAUX_ALARM_OUT    : out  STD_LOGIC;                        -- VCCAUX-sensor alarm output
          VCCINT_ALARM_OUT    : out  STD_LOGIC;                        -- VCCINT-sensor alarm output
          USER_TEMP_ALARM_OUT : out  STD_LOGIC;                        -- Temperature-sensor alarm output
          VP_IN               : in  STD_LOGIC;                         -- Dedicated Analog Input Pair
          VN_IN               : in  STD_LOGIC
);
end component;

begin

 sysmon_wiz_inst : sysmon
port map (
      DCLK_IN                 => DCLK_IN,
      RESET_IN                => RESET_IN,
      VAUXP0              => VAUXP0, 
      VAUXN0              => VAUXN0,
      VAUXP1              => VAUXP1,
      VAUXN1              => VAUXN1,
      VAUXP2              => VAUXP2,
      VAUXN2              => VAUXN2,
      VAUXP3              => VAUXP3,
      VAUXN3              => VAUXN3,
      VAUXP4              => VAUXP4,
      VAUXN4              => VAUXN4,
      VAUXP5              => VAUXP5,
      VAUXN5              => VAUXN5,
      VAUXP6              => VAUXP6,
      VAUXN6              => VAUXN6,
      VAUXP8              => VAUXP8,
      VAUXN8              => VAUXN8,
      VAUXP9              => VAUXP9,
      VAUXN9              => VAUXN9,
      VAUXP10             => VAUXP10,
      VAUXN10             => VAUXN10,
      VAUXP11             => VAUXP11,
      VAUXN11             => VAUXN11,
      VAUXP13             => VAUXP13,
      VAUXN13             => VAUXN13,
      VAUXP14             => VAUXP14,
      VAUXN14             => VAUXN14,
      VAUXP15             => VAUXP15,
      VAUXN15             => VAUXN15,
      VCCAUX_ALARM_OUT        => VCCAUX_ALARM_OUT,
      VCCINT_ALARM_OUT        => VCCINT_ALARM_OUT,
      USER_TEMP_ALARM_OUT     => USER_TEMP_ALARM_OUT,
      OT_OUT                  => OT_OUT,
      VP_IN                   => VP_IN,
      VN_IN                   => VN_IN
         );
end xilinx;
