-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : CSP_sem_cntrl.vhd
-- /___/   /\     Timestamp  : Wed Sep 18 12:04:41 Eastern Daylight Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY CSP_sem_cntrl IS
  port (
    CONTROL0: inout std_logic_vector(35 downto 0);
    CONTROL1: inout std_logic_vector(35 downto 0));
END CSP_sem_cntrl;

ARCHITECTURE CSP_sem_cntrl_a OF CSP_sem_cntrl IS
BEGIN

END CSP_sem_cntrl_a;
