-- file: sysmon_tb.vhd
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
-- System Monitor wizard demonstration testbench
------------------------------------------------------------------------------
-- This demonstration testbench instantiates the example design for the 
--   System Monitor wizard. Input clock is generated in this testbench.
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
library std;
use std.textio.all;
library work;
use work.all;

-- This testbench does not implement checking averaging and calibration
-- Bipolar signals are applied with Vn = 0

entity sysmon_tb is
end sysmon_tb;
architecture test of sysmon_tb is
  constant PER1        : time := 20 ns;
  -- Declare the input clock signals
  signal DCLK_TB       : std_logic := '1';
  signal RESET_TB      : std_logic;
  signal VCCAUX_ALARM_TB : std_logic;
  signal VCCINT_ALARM_TB : std_logic;
  signal USER_TEMP_ALARM_TB : std_logic;
  signal USER_TEMP_ALARM_TB_OLD1 : std_logic;
  signal USER_TEMP_ALARM_TB_OLD2 : std_logic;
  signal OT_TB        : std_logic;
component sysmon_exdes
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
end component;
begin
  -- DCLK clock generation
  --------------------------------------
  process begin
    DCLK_TB <= not DCLK_TB; wait for (PER1/2);
  end process;
  RESET_TB <= '0';
  -- Test Sequence Begin
  -----------------------------------------------------------
  process begin
    report "Averaging is enabled for the core" severity NOTE;
    report "Please edit the simulation script to change the simulation time" severity note;
    wait;
  end process;
  -- Test Sequence End
  -- Instantiation of the example design
  -----------------------------------------------------------
  dut : sysmon_exdes
  port map (
      DCLK_IN                 => DCLK_TB,
      RESET_IN                => RESET_TB,
      VAUXP0                  => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN0                  => '0',
      VAUXP1                  => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN1                  => '0',
      VAUXP2                  => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN2                  => '0',
      VAUXP3                  => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN3                  => '0',
      VAUXP4                  => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN4                  => '0',
      VAUXP5                  => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN5                  => '0',
      VAUXP6                  => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN6                  => '0',
      VAUXP8                  => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN8                  => '0',
      VAUXP9                  => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN9                  => '0',
      VAUXP10                 => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN10                 => '0',
      VAUXP11                 => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN11                 => '0',
      VAUXP13                 => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN13                 => '0',
      VAUXP14                 => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN14                 => '0',
      VAUXP15                 => '0', -- Stimulus applied from SIM_MONITOR_FILE
      VAUXN15                 => '0',
      VCCAUX_ALARM_OUT        => VCCAUX_ALARM_TB,
      VCCINT_ALARM_OUT        => VCCINT_ALARM_TB,
      USER_TEMP_ALARM_OUT     => USER_TEMP_ALARM_TB,
      OT_OUT                  => OT_TB,
      VP_IN                   => '0',   -- Stimulus applied from SIM_MONITOR_FILE
      VN_IN                   => '0'
         );
end test;
