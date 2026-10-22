read_liberty /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v28.lib
read_verilog /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/starvation_aware_arbiter_run7/runs/arbiter_run7_fix1/results/synthesis/starvation_aware_arbiter_run7.synthesis_cts.v
link_design starvation_aware_arbiter_run7
read_sdc /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/starvation_aware_arbiter_run7/src/arbiter.sdc
read_spef /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/starvation_aware_arbiter_run7/runs/arbiter_run7_fix1/results/routing/starvation_aware_arbiter_run7.spef
set_propagated_clock [all_clocks]
report_checks -path_delay max -format full_clock_expanded -digits 4
report_checks -path_delay min -format full_clock_expanded -digits 4
puts "SUMMARY setup_wns=[sta::worst_slack -max] hold_wns=[sta::worst_slack -min]"
