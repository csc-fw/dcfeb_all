-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : adc_cnfg_mem_la.vhd
-- /___/   /\     Timestamp  : Wed Sep 18 12:07:47 Eastern Daylight Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY adc_cnfg_mem_la IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    DATA: in std_logic_vector(95 downto 0);
    TRIG0: in std_logic_vector(23 downto 0);
    TRIG_OUT: out std_logic);
END adc_cnfg_mem_la;

ARCHITECTURE adc_cnfg_mem_la_a OF adc_cnfg_mem_la IS
BEGIN

END adc_cnfg_mem_la_a;
