gui_open_window Wave
gui_sg_create clkadj_med_group
gui_list_add_group -id Wave.1 {clkadj_med_group}
gui_sg_addsignal -group clkadj_med_group {clkadj_med_tb.test_phase}
gui_set_radix -radix {ascii} -signals {clkadj_med_tb.test_phase}
gui_sg_addsignal -group clkadj_med_group {{Input_clocks}} -divider
gui_sg_addsignal -group clkadj_med_group {clkadj_med_tb.CLK_IN1}
gui_sg_addsignal -group clkadj_med_group {{clkadj_med_tb.CLK_IN2} {clkadj_med_tb.CLK_IN_SEL}}
gui_sg_addsignal -group clkadj_med_group {{Output_clocks}} -divider
gui_sg_addsignal -group clkadj_med_group {clkadj_med_tb.dut.clk}
gui_list_expand -id Wave.1 clkadj_med_tb.dut.clk
gui_sg_addsignal -group clkadj_med_group {{Status_control}} -divider
gui_sg_addsignal -group clkadj_med_group {clkadj_med_tb.RESET}
gui_sg_addsignal -group clkadj_med_group {{Counters}} -divider
gui_sg_addsignal -group clkadj_med_group {clkadj_med_tb.COUNT}
gui_sg_addsignal -group clkadj_med_group {clkadj_med_tb.dut.counter}
gui_list_expand -id Wave.1 clkadj_med_tb.dut.counter
gui_zoom -window Wave.1 -full
