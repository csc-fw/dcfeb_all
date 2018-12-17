-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : cmp_tx_vio.vhd
-- /___/   /\     Timestamp  : Wed Sep 18 12:17:40 Eastern Daylight Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY cmp_tx_vio IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    ASYNC_IN: in std_logic_vector(31 downto 0);
    ASYNC_OUT: out std_logic_vector(7 downto 0);
    SYNC_OUT: out std_logic_vector(3 downto 0));
END cmp_tx_vio;

ARCHITECTURE cmp_tx_vio_a OF cmp_tx_vio IS
BEGIN

END cmp_tx_vio_a;
