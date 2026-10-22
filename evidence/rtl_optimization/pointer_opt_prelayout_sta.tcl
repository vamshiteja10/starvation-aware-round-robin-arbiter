read_liberty /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v28.lib
read_verilog /home/vsduser/Desktop/arbiter_project/evidence/rtl_optimization/pointer_opt_mapped.v
link_design starvation_aware_arbiter
read_sdc /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/starvation_aware_arbiter_run7/src/arbiter.sdc
puts "===== pointer_opt SLOW-CORNER PRE-LAYOUT STA ====="
report_checks -path_delay max -format full_clock_expanded
report_worst_slack -max
report_tns
exit
