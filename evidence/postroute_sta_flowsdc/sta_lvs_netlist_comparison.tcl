read_liberty /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v28.lib
read_verilog /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/starvation_aware_arbiter_run7/runs/arbiter_run7_fix1/results/lvs/starvation_aware_arbiter_run7.lvs.powered.v
link_design starvation_aware_arbiter_run7
read_sdc /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/starvation_aware_arbiter_run7/src/arbiter.sdc
read_spef /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/starvation_aware_arbiter_run7/runs/arbiter_run7_fix1/results/routing/starvation_aware_arbiter_run7.spef
set_propagated_clock [all_clocks]
puts "===== LVS NETLIST SETUP PATH ====="
report_checks -path_delay max -format full_clock_expanded -fields {slew cap fanout input_pin nets} -digits 4
puts "===== LVS NETLIST HOLD PATH ====="
report_checks -path_delay min -format full_clock_expanded -digits 4
puts "===== LVS NETLIST SUMMARY ====="
puts "SETUP_WNS=[sta::worst_slack -max]"
puts "HOLD_WNS=[sta::worst_slack -min]"
puts "===== PARASITIC ANNOTATION ====="
report_parasitic_annotation -report_unannotated
exit
