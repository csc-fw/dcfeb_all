gui_open_window Wave
gui_sg_create clkadj_fine_group
gui_list_add_group -id Wave.1 {clkadj_fine_group}
gui_sg_addsignal -group clkadj_fine_group {clkadj_fine_tb.test_phase}
gui_set_radix -radix {ascii} -signals {clkadj_fine_tb.test_phase}
gui_sg_addsignal -group clkadj_fine_group {{Input_clocks}} -divider
gui_sg_addsignal -group clkadj_fine_group {clkadj_fine_tb.CLK_IN1}
gui_sg_addsignal -group clkadj_fine_group {{clkadj_fine_tb.CLK_IN2} {clkadj_fine_tb.CLK_IN_SEL}}
gui_sg_addsignal -group clkadj_fine_group {{Output_clocks}} -divider
gui_sg_addsignal -group clkadj_fine_group {clkadj_fine_tb.dut.clk}
gui_list_expand -id Wave.1 clkadj_fine_tb.dut.clk
gui_sg_addsignal -group clkadj_fine_group {{Status_control}} -divider
gui_sg_addsignal -group clkadj_fine_group {clkadj_fine_tb.RESET}
gui_sg_addsignal -group clkadj_fine_group {clkadj_fine_tb.LOCKED}
gui_sg_addsignal -group clkadj_fine_group {{Counters}} -divider
gui_sg_addsignal -group clkadj_fine_group {clkadj_fine_tb.COUNT}
gui_sg_addsignal -group clkadj_fine_group {clkadj_fine_tb.dut.counter}
gui_list_expand -id Wave.1 clkadj_fine_tb.dut.counter
gui_zoom -window Wave.1 -full
