onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top_level/test_bench_state_machine
add wave -noupdate /tb_top_level/uWriteInstructions/mem_data_out
add wave -noupdate /tb_top_level/uWriteInstructions/instruction_pointer
add wave -noupdate /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/instr_opcode_b
add wave -noupdate /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/instr_opcode_out
add wave -noupdate /tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/alu_opcode_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {127641 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 452
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {146777 ns} {153945 ns}
