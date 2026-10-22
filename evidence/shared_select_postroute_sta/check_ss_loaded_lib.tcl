read_liberty /pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_n40C_1v28.lib

puts "===== ALL MATCHING LIBRARIES ====="
puts [get_libs *]

puts "===== SKY130 HD MATCH ====="
puts [get_libs *sky130_fd_sc_hd*]

puts "===== SELECT OPERATING CONDITION ====="
set_operating_conditions -analysis_type single \
    -library sky130_fd_sc_hd__ss_n40C_1v28 \
    ss_n40C_1v28

puts "===== DIAGNOSTIC COMPLETE ====="
exit
