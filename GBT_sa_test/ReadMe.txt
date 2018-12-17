Use Xilinx ISE 14.7
Start a new project using the properties seen in Docs\Design_Properties.PNG
Configuration properties are in Docs\Config_properties.PNG
Default properties are probably okay for all other options.

Files and folders:
Docs\
	Contains configuation option settings
source\
	Contains the main HDL code that has an active role in the GBTX loopback testing firmware.
	Also contains the constraints file (.ucf) and a data file.
source\IO_only\
	Contains HDL code for IBUFs and OBUFs for the xDCFEB with reasonable values set for the outputs.
	These modules do not have any direct connection to the GBTX loopback test function.
source\fizzim\
	Contains 3 state machines used in the code.
	The verilog code is generated from the graphical description using a Perl script.
	If you have a Java run time engine you can view and edit the graphical version of the state machines
	using fizzim_v14.02.18.jar.  
ipcore_dir\
	There are 3 Xilinx cores in the design: A built-in FIFO, a ChipScopePro(CSP) Control, and a CSP logic analyzer.
PROM\
	Contains bit file and PROM files (.mcs) for version 02.

Other Notes:
To program the PROMs with firmware use the Xilinx programmer.  There are 5 devices in the JTAG chain.
The first device is a non Xilinx chip and require you supply the boundry scan description file (ds4550.bsd).
The second device in the chain is the first `32P PROM and requires the "*_0.mcs" prom file.
The third device in the chain is the second `32P PROM and requires the "*_1.mcs" prom file.
The forth device is the `08P PROM that contains the parameters loaded after configuration with the normal firmware.
The fifth device is the FPGA itself.


Description of the GBTX loopback test firmware:
The inputs from the GBTX (16 bits of data, rx_rdy, and rxdatavalid) are register using the DeskewClock0 from the GBTX.
When rx_rdy and rxdatavalid are true the data are writen into a FIFO on the rising edge of the GBTX clock.
A state machine controls the readout of the FIFO.  The state machine starts when "n" words are written to the FIFO.
"n" is programmable (programmable almost empty) and is currently set to 10.  The state machine waits another
five clock cycles and then starts reading the FIFO (using the 40MHz system clock).  The output of the FIFO is
register before being sent to the GBTX inputs.  A tx_valid signal mirrors the read enable for the FIFO.
When the FIFO is empty, the state machine returns to idle.  Due to the latency of the empty, there may be
some data read while the FIFO is empty creating a couple of junk words.  I'm not sure of the timing.

About the clock:
The first 10 boards produced did not have a clock from the GBTX to the FPGA.  So these first 10 boards have a patch
from the DeskewClock0 to a spare differential input on the FPGA.  The remaining 560 production boards have this
connection patch built in.
Due to another oversight on my part, the clock input uses a regular differential I/O and not a "Clock Capable" I/O.
This means that there is not a dedicated path from the clock input to a clock buffer.  Therefore a line has been
added to the constaints file to instruct the mapper to not use dedicated clock routing on that signal.  This means
that the clock timing can change slightly each time the firmware is recompiled.  However we have control over the 
phase of the DeskewClock and we intend to only run at 40 MHz.  So there should be a large enough sweet spot to
avoid any problems from routing variabilities.  We may need to look at the clock-to-data timing on the scope to 
set the optimum phase of the DskewClock.

Features:
I have brought most of the relevant signals out to test points.  But there are limited test points so if you need
to change which signals are brought out you will have to make the change and recompile.
In addition to test points, I have added a ChipScopePro logic analyzer to the module.  Essentially all the signals
can be accessed this way.  To enable or disable the logic analyzer, there is a parameter for the gbt_test module
that needs to be set to 1 or 0 (USE_GBTX_CHIPSCOPE) before compiling.
I connected ChipScopePro to this firmware and have saved the project with the signals renamed to match the 
signal names in the firmware.  The project filename is gbt_test_V02.cpj.  You can load this file when you open
ChipScopePro before connecting to the FPGA.




