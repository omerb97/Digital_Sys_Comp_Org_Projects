# vlog mult32x32_fsm.sv
# vlog mult32x32_arith.sv
# vlog mult32x32.sv
# vlog mult32x32_test.sv
# vsim mult32x32_test

# add wave sim:/mult32x32_test/uut/*
# add wave sim:/mult32x32_test/uut/fsm_u/current_state
# add wave sim:/mult32x32_test/uut/fsm_u/next_state
# run 400ns

vlog mult32x32_fast_fsm.sv
vlog mult32x32_fast_arith.sv
vlog mult32x32_fast.sv
vlog mult32x32_fast_test.sv
vsim mult32x32_fast_test

add wave sim:/mult32x32_fast_test/uut/*
add wave sim:/mult32x32_fast_test/uut/fsm_u/current_state
add wave sim:/mult32x32_fast_test/uut/fsm_u/next_state
run 400ns
