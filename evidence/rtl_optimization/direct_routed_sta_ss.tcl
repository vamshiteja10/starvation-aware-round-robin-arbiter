read_lef /openLANE_flow/designs/arbiter_pointer_opt/runs/21-10_07-31/tmp/merged_unpadded.lef
read_liberty /pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v28.lib
set_operating_conditions ss_n40C_1v28
read_def /openLANE_flow/designs/arbiter_pointer_opt/runs/21-10_07-31/results/routing/starvation_aware_arbiter.def

create_clock -name clk -period 10.0 [get_ports clk]
set_input_delay 1.0 -clock clk [get_ports {req[0] req[1] req[2] req[3] rst ready}]
set_output_delay 1.0 -clock clk [get_ports {grant[0] grant[1] grant[2] grant[3]}]

read_spef /openLANE_flow/designs/arbiter_pointer_opt/runs/21-10_07-31/results/routing/starvation_aware_arbiter.spef

puts "\n===== UNCONSTRAINED PATH CHECK ====="
report_checks -unconstrained

puts "\n===== MAXIMUM-DELAY PATHS ====="
report_checks -path_delay max -format full_clock_expanded

puts "\n===== MINIMUM-DELAY PATHS ====="
report_checks -path_delay min -format full_clock_expanded

puts "\n===== WORST SLACK AND TNS ====="
puts "\n===== WORST SLACK SUMMARY ====="
report_worst_slack
report_tns
exit
