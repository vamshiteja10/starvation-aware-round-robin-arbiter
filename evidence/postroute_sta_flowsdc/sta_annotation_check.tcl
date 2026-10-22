source $::env(EVID)/sta_ss_n40C_1v28.tcl

puts "\n===== PARASITIC ANNOTATION SUMMARY ====="
report_parasitic_annotation

puts "\n===== WORST MAX TIMING PATH ====="
report_checks -path_delay max -format full_clock_expanded -fields {slew cap fanout input nets} -digits 4 -group_count 3
