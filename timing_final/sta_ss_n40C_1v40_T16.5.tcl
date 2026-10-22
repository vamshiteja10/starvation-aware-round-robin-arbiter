read_liberty /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v40.lib
read_verilog /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/starvation_aware_arbiter_run7/runs/arbiter_run7_fix1/results/synthesis/starvation_aware_arbiter_run7.synthesis_cts.v
link_design starvation_aware_arbiter_run7
read_spef /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/starvation_aware_arbiter_run7/runs/arbiter_run7_fix1/results/routing/starvation_aware_arbiter_run7.spef
create_clock -name clk -period 16.5 [get_ports clk]
set_propagated_clock [get_clocks clk]
set_input_delay 2.0 -clock clk [get_ports {ready rst req[0] req[1] req[2] req[3]}]
set_output_delay 2.0 -clock clk [get_ports {grant[0] grant[1] grant[2] grant[3]}]
set_load 0.05 [get_ports {grant[0] grant[1] grant[2] grant[3]}]
puts "SETUP:"; report_checks -path_delay max -format full_clock_expanded -digits 3
puts "HOLD:";  report_checks -path_delay min -format full_clock_expanded -digits 3
puts "SUMMARY setup_wns=[sta::worst_slack -max] hold_wns=[sta::worst_slack -min]"
