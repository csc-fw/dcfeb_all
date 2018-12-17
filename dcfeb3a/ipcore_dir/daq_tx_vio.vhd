-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : daq_tx_vio.vhd
-- /___/   /\     Timestamp  : Wed Sep 18 12:21:42 Eastern Daylight Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY daq_tx_vio IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    ASYNC_IN: in std_logic_vector(15 downto 0);
    ASYNC_OUT: out std_logic_vector(7 downto 0));
END daq_tx_vio;

ARCHITECTURE daq_tx_vio_a OF daq_tx_vio IS
BEGIN

END daq_tx_vio_a;
