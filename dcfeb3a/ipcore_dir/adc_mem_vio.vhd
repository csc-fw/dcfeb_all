-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : adc_mem_vio.vhd
-- /___/   /\     Timestamp  : Wed Sep 18 12:08:47 Eastern Daylight Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY adc_mem_vio IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    SYNC_IN: in std_logic_vector(23 downto 0);
    SYNC_OUT: out std_logic_vector(63 downto 0));
END adc_mem_vio;

ARCHITECTURE adc_mem_vio_a OF adc_mem_vio IS
BEGIN

END adc_mem_vio_a;
