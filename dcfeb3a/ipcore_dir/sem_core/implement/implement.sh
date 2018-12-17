#!/bin/sh

# Do not continue unless chipscope files present
echo 'Checking for required files before starting'
if test -f ../example_design/chipscope_icon.ngc
then
  echo '  Chipscope ICON netlist present...'
else
  echo '  Error: Chipscope ICON netlist required, consult SEM user guide.'
  exit
fi
if test -f ../example_design/chipscope_vio.ngc
then
  echo '  Chipscope VIO netlist present...'
else
  echo '  Error: Chipscope VIO netlist required, consult SEM user guide.'
  exit
fi
if test -f ../example_design/chipscope_icon.v
then
  echo '  Chipscope ICON wrapper present...'
else
  echo '  Error: Chipscope ICON wrapper required, consult SEM user guide.'
  exit
fi
if test -f ../example_design/chipscope_vio.v
then
  echo '  Chipscope VIO wrapper present...'
else
  echo '  Error: Chipscope VIO wrapper required, consult SEM user guide.'
  exit
fi

# Purge the results directory from previous run
echo 'Removing results from previous run'
if test -d results
then
  rm -rf results
  mkdir results
else
  mkdir results
fi

# Synthesize the example design
echo 'Synthesizing example design with XST'
if test -d xst
then
  rm -rf xst
  mkdir xst
else
  mkdir xst
fi
if test -f xst.srp
then
  rm -rf xst.srp
fi
xst -ifn xst.scr
if test -d _xmsgs
then
  rm -rf _xmsgs
fi
if test -f sem_example.lso
then
  rm -rf sem_example.lso
fi
if test -f sem_example_xst.xrpt
then
  rm -rf sem_example_xst.xrpt
fi
if test -f sem_example.ngc
then
  mv sem_example.ngc results/sem_example.ngc
fi
cd results

# Build the design from component netlists
echo 'Running ngdbuild'
ngdbuild -sd ../../.. -sd ../../example_design -uc ../../example_design/sem_core_sem_example.ucf sem_example.ngc

# Map the design into the target device
echo 'Running map'
map sem_example.ngd -detail -o mapped.ncd mapped.pcf

# Place and route the design
echo 'Running par'
par mapped.ncd routed mapped.pcf

# Perform static timing analysis
echo 'Running trce'
trce -fastpaths -u 16 -v 16 routed.ncd mapped.pcf

# Generate annotated simulation model
echo 'Running netgen'
netgen -ofmt verilog -sim -sdf_anno false routed.ncd routed.v

# Generate design output products
echo 'Running bitgen'
bitgen routed.ncd routed mapped.pcf

# Clean up the results directory and return
echo 'Cleaning up the results directory'
if test -d xlnx_auto_0_xdb
then
  rm -rf xlnx_auto_0_xdb
fi
if test -d _xmsgs
then
  rm -rf _xmsgs
fi
if test -f netlist.lst
then
  rm -rf netlist.lst
fi
if test -f par_usage_statistics.html
then
  rm -rf par_usage_statistics.html
fi
if test -f usage_statistics_webtalk.html
then
  rm -rf usage_statistics_webtalk.html
fi
cd ..
