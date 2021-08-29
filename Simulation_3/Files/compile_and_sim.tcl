vlog *.sv
vsim rv_sim


add wave -position end  sim:/rv_sim/dut/dp/ir
add wave -position end  sim:/rv_sim/dut/dp/pc
add wave -position end  sim:/rv_sim/clk
add wave -position end  sim:/rv_sim/rst
# add wave -position end  sim:/rv_sim/dut/ctl/current
# add wave -position end  sim:/rv_sim/dut/ctl/next
# add wave -position end  sim:/rv_sim/dut/dp/imem_datain
# add wave -position end  sim:/rv_sim/dut/dp/dmem_datain
# add wave -position end  sim:/rv_sim/dut/dp/dmem_dataout
# add wave -position end  sim:/rv_sim/dut/dp/alu_a
# add wave -position end  sim:/rv_sim/dut/dp/alu_b
# add wave -position end  sim:/rv_sim/dut/dp/aluout
# add wave -position insertpoint  \
# sim:/rv_sim/dut/dp/alu_as \
# sim:/rv_sim/dut/dp/alu_bs \
# sim:/rv_sim/dut/dp/alu_result
# add wave -position insertpoint  \
# sim:/rv_sim/dut/dp/alu_result

run -all