read_liberty /pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v28.lib

puts "===== TEST 1: Explicit library and operating condition ====="
set_operating_conditions -analysis_type single \
    -library sky130_fd_sc_hd__ss_n40C_1v28 \
    ss_n40C_1v28

puts "===== OPERATING CONDITION COMMAND COMPLETED ====="
exit
