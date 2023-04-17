###############################################################
# List of Project Files of the GPGPU
###############################################################

#$HW_DIR defined in the enviromental variable as:
#   export HW_DIR=/home/e.rodriguez/Xcelium_FlexGrip/FlexGripPlus/  =====> check it with printenv HW_DIR

# Including the packages and other files first:

$HW_DIR/TB/configuration/pick_bench.vhd
$HW_DIR/gpgpu_package.vhd

$HW_DIR/SMP/shift_register.vhd
$HW_DIR/SMP/effective_address.vhd

$HW_DIR/SMP/dp_regfile.vhd

# Address, Predicate, Vector(GP) registers:

$HW_DIR/SMP/address_register_controller.vhd
$HW_DIR/SMP/address_register_file.vhd
$HW_DIR/SMP/predicate_register_controller.vhd
$HW_DIR/SMP/predicate_register_file.vhd
$HW_DIR/SMP/vector_register_controller.vhd
$HW_DIR/SMP/vector_register_file.vhd

$HW_DIR/SMP/memory_controller.vhd

$HW_DIR/SMP/constant_memory_controller.vhd
$HW_DIR/SMP/global_memory_controller.vhd
$HW_DIR/SMP/shared_memory_controller.vhd

# SMP Controller:

$HW_DIR/SMP/SMPController/block_id_calc.vhd
$HW_DIR/SMP/SMPController/thread_id_calc.vhd
$HW_DIR/SMP/SMPController/warps_per_block_calc.vhd
$HW_DIR/SMP/SMPController/streaming_multiprocessor_cntlr.vhd

# Warp Unit:

$HW_DIR/SMP/WarpUnit/fence_registers.vhd
$HW_DIR/SMP/WarpUnit/warps_done_mask_LUT.vhd
$HW_DIR/SMP/WarpUnit/warp_id_calc.vhd
$HW_DIR/SMP/WarpUnit/warp_generator.vhd
$HW_DIR/SMP/WarpUnit/warp_scheduler.vhd
$HW_DIR/SMP/WarpUnit/warp_checker.vhd
$HW_DIR/SMP/WarpUnit/warp_unit.vhd

# Pipeline, reference components:

$HW_DIR/SMP/Pipeline/bshift.vhd
$HW_DIR/SMP/Pipeline/stack.vhd

# Pipeline - Fetch:

$HW_DIR/SMP/Pipeline/Fetch/pipeline_fetch.vhd

# Pipeline - Read:

$HW_DIR/SMP/Pipeline/Read/arbiter.vhd
$HW_DIR/SMP/Pipeline/Read/predicate_lut.vhd
$HW_DIR/SMP/Pipeline/Read/convert_data_types.vhd
$HW_DIR/SMP/Pipeline/Read/calculate_address.vhd

$HW_DIR/SMP/Pipeline/Read/read_source_ops.vhd
$HW_DIR/SMP/Pipeline/Read/pipeline_read.vhd

# Pipeline - Decode:

$HW_DIR/SMP/Pipeline/Decode/pipeline_decode.vhd

# Pipeline - Execution - ScalarProcessor:

$HW_DIR/SMP/Pipeline/Execution/ScalarProcessor/shift_logic.vhd

$HW_DIR/SMP/Pipeline/Execution/ScalarProcessor/min_max.vhd
$HW_DIR/SMP/Pipeline/Execution/ScalarProcessor/boolean_functions.vhd
$HW_DIR/SMP/Pipeline/Execution/ScalarProcessor/compute_set_pred_i.vhd
$HW_DIR/SMP/Pipeline/Execution/ScalarProcessor/convert_int_int.vhd
$HW_DIR/SMP/Pipeline/Execution/ScalarProcessor/integer_add_subtract.vhd
$HW_DIR/SMP/Pipeline/Execution/ScalarProcessor/integer_mult_24.vhd
$HW_DIR/SMP/Pipeline/Execution/ScalarProcessor/scalar_processor.vhd

# Pipeline - Execution - Floating Point unit:

$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_add_32.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_conv_32.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_exceptions_32.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_fma_32.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_mul_32.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_round_32.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_sub_32.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_set_32.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/a_s.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/divisor.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_rcp_32.vhd
$HW_DIR/SMP/Pipeline/Execution/FPU/fpu_top_32_new.vhd

# Pipeline - Execution - SFU version1: (disabled in latest version)

#$HW_DIR/SMP/Pipeline/Execution/SFU/cordic_vhdl/parts/cordic_ieee.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/cordic_vhdl/parts/fp_leading_zeros_and_shift.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/cordic_vhdl/parts/multFP.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/cordic_vhdl/parts/mux2_1.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/cordic_vhdl/parts/prueba.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/cordic_vhdl/parts/right_shifter.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/cordic_vhdl/parts/punto1.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/cordic_vhdl/parts/suma_resta.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/cordic_vhdl/cordic.vhd

#$HW_DIR/SMP/Pipeline/Execution/SFU/exp2_vhdl/parts/exp2_ieee.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/exp2_vhdl/parts/exp2_luts_64x23b.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/exp2_vhdl/exp2_fp.vhd

#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/CLZ.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/comparator.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/FA.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/left_shifter.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/log2_ieee.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/log2_luts_64x23b.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/mult.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/mux.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/ones_complement.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/parts/sum_ripple_carry_adder.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/log2_vhdl/log2_fp.vhd

#$HW_DIR/SMP/Pipeline/Execution/SFU/rsqrt_vhdl/rsqrt.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/rsqrt_vhdl/rsqrt_ieee.vhd

#$HW_DIR/SMP/Pipeline/Execution/RRO/rro.vhd

#$HW_DIR/SMP/Pipeline/Execution/SFU/sfu.vhd
#$HW_DIR/SMP/Pipeline/Execution/SFU/sfu_proc.vhd

# Pipeline - Execution - SFU version12: (Biquadratic approximation)

$HW_DIR/SMP/Pipeline/Execution/SFU/Components/CLZ.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Components/SFU_Exceptions.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/fused_accm_tree/Booth_PP.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/fused_accm_tree/CSA_4_2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/fused_accm_tree/fused_accum_tree.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_cos.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_exp.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_ln2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_ln2e0.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_reci.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_reci_sqrt_1_2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_reci_sqrt_2_4.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_sin.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_sqrt_1_2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_sqrt_2_4.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_cos.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_exp.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_ln2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_ln2e0.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_reci.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_reci_sqrt_1_2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_reci_sqrt_2_4.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_sin.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_sqrt_1_2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_sqrt_2_4.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_cos.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_exp.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_ln2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_ln2e0.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_reci.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_reci_sqrt_1_2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_reci_sqrt_2_4.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_sin.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_sqrt_1_2.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_sqrt_2_4.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/squaring.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/ROM.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Quadratic_Interpolator.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/sfu.vhd"
$HW_DIR/SMP/Pipeline/Execution/SFU/sfu_proc.vhd"

## Pipeline - Execution - RangeReduceOrder

$HW_DIR/SMP/Pipeline/Execution/RRO/Components/fp_leading_zeros_and_shift.vhd"
$HW_DIR/SMP/Pipeline/Execution/RRO/Components/right_shifter.vhd"
$HW_DIR/SMP/Pipeline/Execution/RRO/Components/add_sub.vhd"
$HW_DIR/SMP/Pipeline/Execution/RRO/Components/multFP.vhd"
$HW_DIR/SMP/Pipeline/Execution/RRO/RRO_trig.vhd"
$HW_DIR/SMP/Pipeline/Execution/RRO/rro.vhd"
$HW_DIR/SMP/Pipeline/Execution/RRO/rro_proc.vhd"


# Pipeline - Execution - Branch:

$HW_DIR/SMP/Pipeline/Execution/branch_exec_unit.vhd

# Pipeline - Execution:

$HW_DIR/SMP/Pipeline/Execution/pipeline_execute.vhd

# Pipeline - Write:

$HW_DIR/SMP/Pipeline/Write/compute_pred_flags.vhd
$HW_DIR/SMP/Pipeline/Write/increment_address.vhd
$HW_DIR/SMP/Pipeline/Write/pipeline_write.vhd

# SMP:

$HW_DIR/SMP/streaming_multiprocessor.vhd

# Block Scheduler":

$HW_DIR/block_scheduler.vhd

# DP RAM (BEHAVIORAL):

$HW_DIR/dp_ram.vhd

# GPGPU Configuration:

$HW_DIR/gpgpu_configuration.vhd

# System Memory Controller:

$HW_DIR/system_memory_cntlr.vhd

# GPGPU Top Level:

$HW_DIR/gpgpu_ml605_top_level.vhd

# TestBench, top-level components:

$HW_DIR/TB/txt_util.vhd
$HW_DIR/TB/read_data.vhd
$HW_DIR/TB/write_instructions.vhd
	
# TB - AutoCor:

#$HW_DIR/TB/AutoCor/autocor_configuration.vhd
#$HW_DIR/TB/AutoCor/autocor_instructions.vhd

# TB - MatrixMult:

#$HW_DIR/TB/MatrixMult/matrix_mult_configuration.vhd
#$HW_DIR/TB/MatrixMult/matrix_mult_cubin_instructions.vhd
#$HW_DIR/TB/MatrixMult/matrix_mult_sass_instructions.vhd

# TB - Transpose:

#$HW_DIR/TB/Transpose/transpose_configuration.vhd
#$HW_DIR/TB/Transpose/transpose_inst.vhd
	
# TB - BitonicSort:

#$HW_DIR/TB/BitonicSort/bitonic_sort_configuration.vhd
#$HW_DIR/TB/BitonicSort/bitonic_sort_instr.vhd
	
# TB - Reduction:

#$HW_DIR/TB/Reduction/reduction_configuration.vhd
#$HW_DIR/TB/Reduction/reduction_kernel_inst.vhd
	
# TB - TP:

$HW_DIR/TB/TP/TP_configuration.vhd
$HW_DIR/TB/TP/TP_instructions.vhd
	
# TB - Benchmark Configuration:

$HW_DIR/TB/tb_configuration.vhd

# TB - Top-level:

$HW_DIR/TB/tb_top_level.vhd


# Including main HW components:

#-incdir $HW_DIR/SMP/*.vhd
#$HW_DIR/SMP/Pipeline/*.vhd

#$HW_DIR/SMP/Pipeline/Fetch/*.vhd
#$HW_DIR/SMP/Pipeline/Decode/*.vhd
#$HW_DIR/SMP/Pipeline/Read/*.vhd
#$HW_DIR/SMP/Pipeline/Execution/*.vhd
#$HW_DIR/SMP/Pipeline/Execution/ScalarProcessor/*.vhd
#$HW_DIR/SMP/Pipeline/Execution/FPU/*.vhd

#$HW_DIR/SMP/SMPController/*.vhd

#$HW_DIR/SMP/WarpUnit/*.vhd






###############################################################
# loading predefined application:
###############################################################

# $HW_DIR/Benchmarks/TP/*.vhd

###############################################################
# VPI Files
###############################################################
#$HW_DIR/TB/jtag_vpi_0-r2/jtag_vpi.c
#$HW_DIR/TB/elf-loader_1.0.2/elf-loader.c -lelf
#$HW_DIR/TB/elf-loader_1.0.2/vpi_user.c

###############################################################
# Testbench Location
###############################################################
#$HW_DIR/TB/vlog_tb_utils_1.0/*.v
#$HW_DIR/TB/jtag_vpi_0-r2/*.v

#-incdir $HW_DIR/TB/include
#$HW_DIR/TB/*.v

###############################################################
# Other Configurations
###############################################################
-allowredefinition

-ieee1364

# better option for FlexGripPlus
-v200x		
# It has some conflicts with FlexGripPlus
#-v93

-access +rwc
-noassert
-timescale 10ns/1ns

-nowarn DSEMEL
-nowarn NCEXDEP
-uvmnoautocompile

# explicitely defining the top module in the design. It is required for correct operation.
-vhdltop tb_top_level:behavior

-c


### Fault Parameters ###
#-fault_file $FILES_DIR/faultTarget.spec
#-fault_dbg
#-fault_iso_opts 
#-fault_overwrite
#-fault_top orpsoc_tb


