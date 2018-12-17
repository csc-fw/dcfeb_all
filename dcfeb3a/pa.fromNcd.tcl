
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name dcfeb3a -dir "C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/planAhead_run_2" -part xc6vlx130tff1156-1
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "dcfeb3a.edn" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a} {ipcore_dir} {ipcore_dir/TRG_TX_BUF_BYPASS/implement} }
add_files [list {ipcore_dir/adc_cnfg_mem_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/adc_mem_vio.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/al_debug_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/al_debug_vio.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/bpi_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/bpi_vio.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/chnlnk_fifo_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ch_fifo_ecc.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/cmp_tx_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/cmp_tx_vio.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/CSP_AL_debug.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/CSP_comp_cntrl.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/CSP_comp_daq_cntrl.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/CSP_daq_cntrl.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/CSP_deser_cntrl.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/CSP_pipe_cntrl.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/CSP_rngbuf_cntrl.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/CSP_sem_cntrl.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/daq_tx_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/daq_tx_vio.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/deser_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/deser_vio.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/eth_fifo_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/evt_buf.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo1_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/l1a_buf.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/l1a_smp_fifo.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/pipeline_ecc.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/pipe_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/pipe_vio_in.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/pipe_vio_out.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/readout_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ring_buf.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ring_buf_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ring_l1a_buf.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/sem_core.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/sem_la.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/sem_vio.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/dcfeb3a.ucf" [current_fileset -constrset]
add_files [list {C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/source/dcfeb3a.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/dcfeb3a.ncd"
if {[catch {read_twx -name results_1 -file "C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/dcfeb3a.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/bylsma/Projects/DCFEB/firmware/ISE_14.7/dcfeb3a/dcfeb3a.twx\": $eInfo"
}
