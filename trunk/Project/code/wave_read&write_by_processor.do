onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_filter/uutp/clock
add wave -noupdate -format Logic /tb_filter/uutp/reset
add wave -noupdate -format Logic /tb_filter/uutp/read_in_mem
add wave -noupdate -format Logic /tb_filter/uutp/write_in_mem
add wave -noupdate -format Logic /tb_filter/uutp/read_out_mem
add wave -noupdate -format Logic /tb_filter/uutp/write_out_mem
add wave -noupdate -format Literal /tb_filter/uutp/read_addr_in_mem
add wave -noupdate -format Literal /tb_filter/uutp/read_addr_out_mem
add wave -noupdate -format Literal /tb_filter/uutp/write_addr_out_mem
add wave -noupdate -format Literal /tb_filter/uutp/data_in_1
add wave -noupdate -format Literal /tb_filter/uutp/data_in_2
add wave -noupdate -format Literal /tb_filter/uutp/data_out
add wave -noupdate -format Literal /tb_filter/uutp/filter
add wave -noupdate -format Logic /tb_filter/uutp/disable_filter
add wave -noupdate -format Logic /tb_filter/uutp/disable_to_cache
add wave -noupdate -format Literal /tb_filter/uutp/cache_bits
add wave -noupdate -format Literal /tb_filter/uutp/filter_bits
add wave -noupdate -format Literal /tb_filter/uutp/mult1_out
add wave -noupdate -format Literal /tb_filter/uutp/mult2_out
add wave -noupdate -format Literal /tb_filter/uutp/mult3_out
add wave -noupdate -format Literal /tb_filter/uutp/mult4_out
add wave -noupdate -format Literal /tb_filter/uutp/mult5_out
add wave -noupdate -format Literal /tb_filter/uutp/mult6_out
add wave -noupdate -format Literal /tb_filter/uutp/mult7_out
add wave -noupdate -format Literal /tb_filter/uutp/mult8_out
add wave -noupdate -format Literal /tb_filter/uutp/mult9_out
add wave -noupdate -format Literal /tb_filter/uutp/add1_out
add wave -noupdate -format Literal /tb_filter/uutp/add2_out
add wave -noupdate -format Literal /tb_filter/uutp/add3_out
add wave -noupdate -format Literal /tb_filter/uutp/select_adder
add wave -noupdate -format Literal /tb_filter/uutp/mux_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {131205 ns} 0}
configure wave -namecolwidth 62
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {131193 ns} {131225 ns}
