-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.6
--  \   \         Application: Xilinx CORE Generator
--  /   /         Filename   : adc_cnfg_mem_la.vho
-- /___/   /\     Timestamp  : Wed Sep 18 12:07:47 Eastern Daylight Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: ISE Instantiation template
-- Component Identifier: xilinx.com:ip:chipscope_ila:1.03.a
-------------------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component adc_cnfg_mem_la
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    DATA : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
    TRIG0 : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    TRIG_OUT : OUT STD_LOGIC);

end component;

-- Synplicity black box declaration
attribute syn_black_box : boolean;
attribute syn_black_box of adc_cnfg_mem_la: component is true;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG

your_instance_name : adc_cnfg_mem_la
  port map (
    CONTROL => CONTROL,
    CLK => CLK,
    DATA => DATA,
    TRIG0 => TRIG0,
    TRIG_OUT => TRIG_OUT);

-- INST_TAG_END ------ End INSTANTIATION Template ------------
