#!/usr/bin/tclsh
set GPGPU_GENERIC_ROOT "../"

exec vlib work
exec vmap gpgpu work

set gpgpu_vhdls [list \
	"# TB - configuration" \
	"$GPGPU_GENERIC_ROOT/TB/pick_bench.vhd" \
	"# Top-level, reference components" \
	"## Package" \
	"$GPGPU_GENERIC_ROOT/gpgpu_package.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/shift_register.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/effective_address.vhd" \
	"## DP REGISTER FILE" \
	"$GPGPU_GENERIC_ROOT/SMP/dp_regfile.vhd" \
	"$GPGPU_GENERIC_ROOT/syn/8cores_dpregfiles.vhd" \
	"## Address, Predicate, Vector(GP) registers" \
	"$GPGPU_GENERIC_ROOT/SMP/address_register_controller.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/address_register_file.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/predicate_register_controller.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/predicate_register_file.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/vector_register_controller.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/vector_register_file.vhd" \
	"## Memory controller" \
	"$GPGPU_GENERIC_ROOT/SMP/memory_controller.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/constant_memory_controller.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/global_memory_controller.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/shared_memory_controller.vhd" \
	"## SMP Controller" \
	"$GPGPU_GENERIC_ROOT/SMP/SMPController/block_id_calc.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/SMPController/thread_id_calc.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/SMPController/warps_per_block_calc.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/SMPController/streaming_multiprocessor_cntlr.vhd" \
	"## Warp Unit" \
	"$GPGPU_GENERIC_ROOT/SMP/WarpUnit/fence_registers.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/WarpUnit/warps_done_mask_LUT.v" \
	"$GPGPU_GENERIC_ROOT/SMP/WarpUnit/warp_id_calc.v" \
	"$GPGPU_GENERIC_ROOT/SMP/WarpUnit/warp_generator.v" \
	"$GPGPU_GENERIC_ROOT/SMP/WarpUnit/warp_scheduler.v" \
	"$GPGPU_GENERIC_ROOT/SMP/WarpUnit/warp_checker.v" \
	"$GPGPU_GENERIC_ROOT/SMP/WarpUnit/warp_unit.v" \
	"$GPGPU_GENERIC_ROOT/SMP/WarpUnit/warp_unit_rtl.vhd" \
	"## Pipeline, reference components" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/bshift.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/stack.vhd" \
	"## Pipeline - Fetch" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Fetch/pipeline_fetch.vhd" \
	"## Pipeline - Read" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Read/arbiter.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Read/predicate_lut.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Read/convert_data_types.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Read/calculate_address.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Read/read_source_ops.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Read/pipeline_read.vhd" \
	"## Pipeline - Decode" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Decode/pipeline_decode.vhd" \
	"## Pipeline - Execution - ScalarProcessor" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/ScalarProcessor/shift_logic.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/ScalarProcessor/min_max.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/ScalarProcessor/boolean_functions.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/ScalarProcessor/compute_set_pred_i.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/ScalarProcessor/convert_int_int.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/ScalarProcessor/integer_add_subtract.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/ScalarProcessor/integer_mult_24.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/ScalarProcessor/scalar_processor.vhd" \
	"## Pipeline - Execution - Branch" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/branch_exec_unit.vhd" \
	"## Pipeline - Execution" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Execution/pipeline_execute.vhd" \
	"## Pipeline - Write" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Write/compute_pred_flags.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Write/increment_address.vhd" \
	"$GPGPU_GENERIC_ROOT/SMP/Pipeline/Write/pipeline_write.vhd" \
	"## SMP" \
	"$GPGPU_GENERIC_ROOT/SMP/streaming_multiprocessor.vhd" \
	"## Block Scheduler" \
	"$GPGPU_GENERIC_ROOT/block_scheduler.vhd" \
	"## DP RAM (BEHAVIORAL)" \
	"$GPGPU_GENERIC_ROOT/dp_ram.vhd" \
	"## GPGPU Configuration" \
	"$GPGPU_GENERIC_ROOT/gpgpu_configuration.vhd" \
	"## System Memory Controller" \
	"$GPGPU_GENERIC_ROOT/system_memory_cntlr.vhd" \
	"## GPGPU Top Level" \
	"$GPGPU_GENERIC_ROOT/gpgpu_ml605_top_level.vhd" \
	"# TestBench, top-level components" \
	"$GPGPU_GENERIC_ROOT/TB/txt_util.vhd" \
	"$GPGPU_GENERIC_ROOT/TB/read_data.vhd" \
	"$GPGPU_GENERIC_ROOT/TB/write_instructions.vhd" \
	"# TB - AutoCor" \
	"$GPGPU_GENERIC_ROOT/TB/AutoCor/autocor_configuration.vhd" \
	"$GPGPU_GENERIC_ROOT/TB/AutoCor/autocor_instructions.vhd" \
	"# TB - MatrixMult" \
	"$GPGPU_GENERIC_ROOT/TB/MatrixMult/matrix_mult_configuration.vhd" \
    "$GPGPU_GENERIC_ROOT/TB/MatrixMult/matrix_mult_cubin_instructions.vhd" \
    "$GPGPU_GENERIC_ROOT/TB/MatrixMult/matrix_mult_sass_instructions.vhd" \
	"# TB - Transpose" \
    "$GPGPU_GENERIC_ROOT/TB/Transpose/transpose_configuration.vhd" \
	"$GPGPU_GENERIC_ROOT/TB/Transpose/transpose_inst.vhd" \
	"# TB - BitonicSort" \
	"$GPGPU_GENERIC_ROOT/TB/BitonicSort/bitonic_sort_configuration.vhd" \
	"$GPGPU_GENERIC_ROOT/TB/BitonicSort/bitonic_sort_instr.vhd" \
	"# TB - TP" \
	"$GPGPU_GENERIC_ROOT/TB/prueba/TP_configuration.vhd" \
    "$GPGPU_GENERIC_ROOT/TB/prueba/TP_instructions.vhd" \
	"# TB - Reduction" \
	"$GPGPU_GENERIC_ROOT/TB/Reduction/reduction_configuration.vhd" \
    "$GPGPU_GENERIC_ROOT/TB/Reduction/reduction_kernel_inst.vhd" \
	"# TB - Benchmark Configuration" \
	"$GPGPU_GENERIC_ROOT/TB/tb_configuration.vhd" \
	"# TB - Top-level" \
	"$GPGPU_GENERIC_ROOT/TB/tb_top_level.vhd" \
]

vlog -reportprogress 300 -work work $GPGPU_GENERIC_ROOT/syn/opencell_db/NangateOpenCellLibrary.v

foreach src $gpgpu_vhdls {
	if [expr {[string first # $src] eq 0}] {puts $src} else {
		if [expr {[string compare [string index $src end] "v"] eq 0}] {
			vlog -reportprogress 300 -work work $src
		} else {
			vcom -64 -2008 -work work $src
	
		}
	}
}

vsim -64 -voptargs=+acc work.tb_top_level

#do wave_debug_ports.do
#run 20000ns
