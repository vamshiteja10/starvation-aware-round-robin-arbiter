read_liberty $::env(LIB)
read_verilog synth/arbiter_sky130.v
link_design starvation_aware_arbiter
read_sdc timing/arbiter.sdc

puts "\n========== DESIGN CHECK =========="
check_setup

puts "\n========== MAXIMUM DELAY PATH =========="
report_checks -path_delay max

puts "\n========== MINIMUM DELAY PATH =========="
report_checks -path_delay min

puts "\n========== WORST MAXIMUM SLACK =========="
report_worst_slack -max

puts "\n========== WORST MINIMUM SLACK =========="
report_worst_slack -min

exit
