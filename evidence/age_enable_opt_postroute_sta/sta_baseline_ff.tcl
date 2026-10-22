read_lef /openLANE_flow/designs/arbiter_condition_opt/runs/21-10_09-05/tmp/merged_unpadded.lef
read_liberty /pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v95.lib
read_def /openLANE_flow/designs/arbiter_condition_opt/runs/21-10_09-05/results/routing/starvation_aware_arbiter.def
read_spef /openLANE_flow/designs/arbiter_condition_opt/runs/21-10_09-05/results/routing/starvation_aware_arbiter.spef

create_clock -name clk -period 10.0 [get_ports clk]
set_input_delay 1.0 -clock clk [get_ports {req[0] req[1] req[2] req[3] ready rst}]
set_output_delay 1.0 -clock clk [get_ports {grant[0] grant[1] grant[2] grant[3]}]
set_propagated_clock [get_clocks clk]

puts "===== DESIGN: baseline ====="
puts "===== CORNER: ff (sky130_fd_sc_hd__ff_n40C_1v95.lib) ====="
puts "===== MAXIMUM-DELAY PATHS ====="
report_checks -path_delay max -group_count 5 -format full_clock_expanded
puts "===== MINIMUM-DELAY PATHS ====="
report_checks -path_delay min -group_count 5 -format full_clock_expanded
puts "===== WORST SLACK ====="
report_worst_slack
puts "===== TNS ====="
report_tns
exit
