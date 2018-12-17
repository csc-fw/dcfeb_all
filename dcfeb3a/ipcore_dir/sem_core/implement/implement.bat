echo off

rem Do not continue unless chipscope files present
echo 'Checking for required files before starting'
if exist ..\example_design\chipscope_icon.ngc goto csinok
  echo '  Error: Chipscope ICON netlist required, consult SEM user guide.'
  exit /B
:csinok
  echo '  Chipscope ICON netlist present...'
if exist ..\example_design\chipscope_vio.ngc goto csvnok
  echo '  Error: Chipscope VIO netlist required, consult SEM user guide.'
  exit /B
:csvnok
  echo '  Chipscope VIO netlist present...'
if exist ..\example_design\chipscope_icon.v goto csiwok
  echo '  Error: Chipscope ICON wrapper required, consult SEM user guide.'
  exit /B
:csiwok
  echo '  Chipscope ICON wrapper present...'
if exist ..\example_design\chipscope_vio.v goto csvwok
  echo '  Error: Chipscope VIO wrapper required, consult SEM user guide.'
  exit /B
:csvwok
  echo '  Chipscope VIO wrapper present...'

rem Purge the results directory from previous run
echo 'Removing results from previous run'
rmdir /S /Q results
mkdir results

rem Synthesize the example design
echo 'Synthesizing example design with XST'
rmdir /S /Q xst
mkdir xst
if not exist xst.srp goto nosrp
  erase xst.srp
:nosrp
xst -ifn xst.scr
rmdir /S /Q _xmsgs
if not exist sem_example.lso goto nolso
  erase sem_example.lso
:nolso
if not exist sem_example_xst.xrpt goto noxrp
  erase sem_example_xst.xrpt
:noxrp
if not exist sem_example.ngc goto nongc
  move /Y sem_example.ngc results\sem_example.ngc
:nongc
cd results

rem Build the design from component netlists
echo 'Running ngdbuild'
ngdbuild -sd ..\..\.. -sd ..\..\example_design -uc ..\..\example_design\sem_core_sem_example.ucf sem_example.ngc

rem Map the design into the target device
echo 'Running map'
map sem_example.ngd -detail -o mapped.ncd mapped.pcf

rem Place and route the design
echo 'Running par'
par mapped.ncd routed mapped.pcf

rem Perform static timing analysis
echo 'Running trce'
trce -fastpaths -u 16 -v 16 routed.ncd mapped.pcf

rem Generate annotated simulation model
echo 'Running netgen'
netgen -ofmt verilog -sim -sdf_anno false routed.ncd routed.v

rem Generate design output products
echo 'Running bitgen'
bitgen routed.ncd routed mapped.pcf

rem Clean up the results directory and return
echo 'Cleaning up the results directory'
rmdir /S /Q xlnx_auto_0_xdb
rmdir /S /Q _xmsgs
if not exist netlist.lst goto nolst
  erase netlist.lst
:nolst
if not exist par_usage_statistics.html goto nopus
  erase par_usage_statistics.html
:nopus
if not exist usage_statistics_webtalk.html goto nousw
  erase usage_statistics_webtalk.html
:nousw
cd ..
