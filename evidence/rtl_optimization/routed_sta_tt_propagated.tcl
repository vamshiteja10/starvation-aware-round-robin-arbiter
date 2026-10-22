read_lef /openLANE_flow/designs/arbiter_pointer_opt/runs/21-10_07-31/tmp/merged_unpadded.lef
read_liberty /pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_def /openLANE_flow/designs/arbiter_pointer_opt/runs/21-10_07-31/results/routing/starvation_aware_arbiter.def
read_spef /openLANE_flow/designs/arbiter_pointer_opt/runs/21-10_07-31/results/routing/starvation_aware_arbiter.spef

create_clock -name clk -period 10.0 [get_ports clk]
set_input_delay 1.0 -clock clk [get_ports {req[0] req[1] req[2] req[3] ready rst}]
set_output_delay 1.0 -clock clk [get_ports {grant[0] grant[1] grant[2] grant[3]}]
set_propagated_clock [get_clocks clk]

puts "===== TT CORNER: REGISTER-TO-REGISTER SETUP ====="
report_checks -path_delay max -from [all_registers -clock_pins] -to [all_registers -data_pins] -group_count 10 -format full_clock_expanded

puts "===== TT CORNER: REGISTER-TO-REGISTER HOLD ====="
report_checks -path_delay min -from [all_registers -clock_pins] -to [all_registers -data_pins] -group_count 10 -format full_clock_expanded

puts "===== CLOCK SKEW ====="
report_clock_skew -setup -clock clk
report_clock_skew -hold -clock clk

puts "===== SUMMARY ====="
report_worst_slack
report_tns
exit
