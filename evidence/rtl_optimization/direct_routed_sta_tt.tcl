read_lef /openLANE_flow/designs/arbiter_pointer_opt/runs/21-10_07-31/tmp/merged_unpadded.lef
read_liberty /pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_def /openLANE_flow/designs/arbiter_pointer_opt/runs/21-10_07-31/results/routing/starvation_aware_arbiter.def

create_clock -name clk -period 10.0 [get_ports clk]
set_input_delay 1.0 -clock clk [get_ports {req[0] req[1] req[2] req[3] rst ready}]
set_output_delay 1.0 -clock clk [get_ports {grant[0] grant[1] grant[2] grant[3]}]

read_spef /openLANE_flow/designs/arbiter_pointer_opt/runs/21-10_07-31/results/routing/starvation_aware_arbiter.spef

puts "\n===== TT UNCONSTRAINED CHECK ====="
report_checks -unconstrained

puts "\n===== TT WORST MAX PATH ====="
report_checks -path_delay max -format full_clock_expanded -group_count 5

puts "\n===== TT WORST MIN PATH ====="
report_checks -path_delay min -format full_clock_expanded -group_count 5

puts "\n===== TT WORST SLACK AND TNS ====="
report_worst_slack
report_tns
exit
