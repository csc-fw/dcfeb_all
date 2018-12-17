-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: Xilinx CORE Generator
--  /   /         Filename   : CSP_comp_daq_cntrl.vho
-- /___/   /\     Timestamp  : Wed Sep 18 12:00:39 Eastern Daylight Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: ISE Instantiation template
-- Component Identifier: xilinx.com:ip:chipscope_icon:1.04.a
-------------------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component CSP_comp_daq_cntrl
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL1 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL2 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL3 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL4 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL5 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL6 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL7 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL8 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL9 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

end component;

-- Synplicity black box declaration
attribute syn_black_box : boolean;
attribute syn_black_box of CSP_comp_daq_cntrl: component is true;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG

your_instance_name : CSP_comp_daq_cntrl
  port map (
    CONTROL0 => CONTROL0,
    CONTROL1 => CONTROL1,
    CONTROL2 => CONTROL2,
    CONTROL3 => CONTROL3,
    CONTROL4 => CONTROL4,
    CONTROL5 => CONTROL5,
    CONTROL6 => CONTROL6,
    CONTROL7 => CONTROL7,
    CONTROL8 => CONTROL8,
    CONTROL9 => CONTROL9);

-- INST_TAG_END ------ End INSTANTIATION Template ------------
