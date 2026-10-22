set_cmd_units -time ns -capacitance pF -current mA -voltage V -resistance kOhm -distance um

read_liberty /pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib
set_operating_conditions -analysis_type single -library sky130_fd_sc_hd__ss_100C_1v60 ss_100C_1v60
read_verilog /openLANE_flow/designs/arbiter_age_width_opt/runs/21-10_15-43/results/synthesis/starvation_aware_arbiter_age_width_opt.synthesis_cts.v
link_design starvation_aware_arbiter_age_width_opt
read_spef /openLANE_flow/designs/arbiter_age_width_opt/runs/21-10_15-43/results/routing/starvation_aware_arbiter_age_width_opt.spef
read_sdc /arbiter_project/evidence/multicorner_sta/tt_sta.sdc

puts "\n===== CLOCKS ====="
report_checks -unconstrained
puts "\n===== SETUP PATHS ====="
report_checks -path_delay max -group_count 10
puts "\n===== HOLD PATHS ====="
report_checks -path_delay min -group_count 10
puts "\n===== WNS AND TNS ====="
report_worst_slack
report_tns
puts "\n===== CONSTRAINT CHECK ====="
check_setup -verbose
exit
