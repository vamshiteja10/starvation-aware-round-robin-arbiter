read_liberty /pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v28.lib

puts "===== LOADED LIBRARIES ====="
report_libs

puts "===== EXPLICIT CONDITION SELECTION ====="
set_operating_conditions -analysis_type single \
    -library sky130_fd_sc_hd__ss_n40C_1v28 \
    ss_n40C_1v28

puts "===== TEST COMPLETE ====="
exit
