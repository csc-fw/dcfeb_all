--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2013 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--    Generated from core with identifier: xilinx.com:ip:sem:3.6              --
--                                                                            --
--    The Xilinx Soft Error Mitigation IP solution provides a pre-verified    --
--    design which can detect and optionally correct and classify soft        --
--    errors in Configuration Memory.  A soft error is an unintended change   --
--    to the state of memory bits caused by ionizing radiation.  The          --
--    solution does not prevent soft errors; rather, it provides users with   --
--    a method to better manage the system-level effects of these events.     --
--    Intelligent management of these events can increase reliability and     --
--    availability, and reduce system maintenance and downtime costs.         --
--------------------------------------------------------------------------------

-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT sem_core
  PORT (
    status_heartbeat : OUT STD_LOGIC;
    status_initialization : OUT STD_LOGIC;
    status_observation : OUT STD_LOGIC;
    status_correction : OUT STD_LOGIC;
    status_classification : OUT STD_LOGIC;
    status_injection : OUT STD_LOGIC;
    status_essential : OUT STD_LOGIC;
    status_uncorrectable : OUT STD_LOGIC;
    monitor_txdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    monitor_txwrite : OUT STD_LOGIC;
    monitor_txfull : IN STD_LOGIC;
    monitor_rxdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    monitor_rxread : OUT STD_LOGIC;
    monitor_rxempty : IN STD_LOGIC;
    inject_strobe : IN STD_LOGIC;
    inject_address : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
    icap_busy : IN STD_LOGIC;
    icap_o : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    icap_csb : OUT STD_LOGIC;
    icap_rdwrb : OUT STD_LOGIC;
    icap_i : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    icap_clk : IN STD_LOGIC;
    icap_request : OUT STD_LOGIC;
    icap_grant : IN STD_LOGIC;
    fecc_crcerr : IN STD_LOGIC;
    fecc_eccerr : IN STD_LOGIC;
    fecc_eccerrsingle : IN STD_LOGIC;
    fecc_syndromevalid : IN STD_LOGIC;
    fecc_syndrome : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    fecc_far : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    fecc_synbit : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    fecc_synword : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : sem_core
  PORT MAP (
    status_heartbeat => status_heartbeat,
    status_initialization => status_initialization,
    status_observation => status_observation,
    status_correction => status_correction,
    status_classification => status_classification,
    status_injection => status_injection,
    status_essential => status_essential,
    status_uncorrectable => status_uncorrectable,
    monitor_txdata => monitor_txdata,
    monitor_txwrite => monitor_txwrite,
    monitor_txfull => monitor_txfull,
    monitor_rxdata => monitor_rxdata,
    monitor_rxread => monitor_rxread,
    monitor_rxempty => monitor_rxempty,
    inject_strobe => inject_strobe,
    inject_address => inject_address,
    icap_busy => icap_busy,
    icap_o => icap_o,
    icap_csb => icap_csb,
    icap_rdwrb => icap_rdwrb,
    icap_i => icap_i,
    icap_clk => icap_clk,
    icap_request => icap_request,
    icap_grant => icap_grant,
    fecc_crcerr => fecc_crcerr,
    fecc_eccerr => fecc_eccerr,
    fecc_eccerrsingle => fecc_eccerrsingle,
    fecc_syndromevalid => fecc_syndromevalid,
    fecc_syndrome => fecc_syndrome,
    fecc_far => fecc_far,
    fecc_synbit => fecc_synbit,
    fecc_synword => fecc_synword
  );
-- INST_TAG_END ------ End INSTANTIATION Template ------------

-- You must compile the wrapper file sem_core.vhd when simulating
-- the core, sem_core. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

