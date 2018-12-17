-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : bpi_vio.vhd
-- /___/   /\     Timestamp  : Wed Sep 18 12:13:15 Eastern Daylight Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY bpi_vio IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    ASYNC_IN: in std_logic_vector(127 downto 0);
    ASYNC_OUT: out std_logic_vector(59 downto 0);
    SYNC_IN: in std_logic_vector(79 downto 0);
    SYNC_OUT: out std_logic_vector(12 downto 0));
END bpi_vio;

ARCHITECTURE bpi_vio_a OF bpi_vio IS
BEGIN

END bpi_vio_a;
