# Function to import all the files in the project: (FP version for FlexGripPlus)

import os
import filecmp
import subprocess
from afs_func import *


def import_project(param, scheduler_config, threads_n, cores_n):

# based on the application selection, the files for the isntruction and configuration should be replaced in the prueba folder.
	
	# removing parameters from previous configurations:
#	os.system("rm TB/TP/TP_configuration.vhd")													# Remove the previous files during the compilation of the project
#	os.system("rm TB/TP/TP_instructions.vhd")
	os.system("rm global_mem.mif")																	# remove the previous global memory
	
	# App. selection to load all the project files:	
	if (param==0):																# Parameter to define the store name depending on app. Also loading the app config.
		# Copy the pickbench config to the principal file.		
		# os.system("vcom -2008 -work work TB/configuration/pick_bench.vhd")								# TP app. Vector add
		# os.system("cp TB/vector_add/TP_configuration.vhd TB/prueba/TP_configuration.vhd")	# Copy of the configuration and instruction files to the loading location for compilation
		# os.system("cp TB/vector_add/TP_instructions.vhd TB/prueba/TP_instructions.vhd")
		# loading the global memory parameters for the compilation and execution process:
		# os.system("cp TB/vector_add/global_mem.mif global_mem.mif")
		print("wrong path")
						
	if (param==7):		# TP
		os.system("vcom -2008 -work work RTL/TB/configuration/pick_bench.vhd")								# TP app.
#		os.system("cp TB/TP/TP_instructions.vhd TB/prueba/TP_instructions.vhd")				# Copy of the configuration and instruction files to the loading location for compilation
#		os.system("cp TB/TP/TP_configuration.vhd TB/prueba/TP_configuration.vhd")
		os.system("cp RTL/TB/TP/global_mem.mif global_mem.mif")
				
	else:					# by default, the selected application is TP
		os.system("vcom -2008 -work work RTL/TB/configuration/pick_bench.vhd")								# TP app.
#		os.system("cp TB/TP/TP_instructions.vhd TB/prueba/TP_instructions.vhd")				# Copy of the configuration and instruction files to the loading location for compilation
#		os.system("cp TB/TP/TP_configuration.vhd TB/prueba/TP_configuration.vhd")
		os.system("cp RTL/TB/TP/global_mem.mif global_mem.mif")
		
	os.system("rm system_mem.mif")
	os.system("rm constant_mem.mif")

	os.system("cp RTL/system_mem.mif system_mem.mif")
	os.system("cp RTL/constant_mem.mif constant_mem.mif")
		

	os.system("vcom -2008 -work work RTL/gpgpu_package.vhd")									# Netlist (CUT) build
	os.system("vcom -2008 -work work RTL/SMP/shift_register.vhd")								# TB build
	os.system("vcom -2008 -work work RTL/SMP/effective_address.vhd")
	os.system("vcom -2008 -work work RTL/SMP/dp_regfile.vhd")
	os.system("vcom -2008 -work work RTL/SMP/address_register_controller.vhd")
	os.system("vcom -2008 -work work RTL/SMP/address_register_file.vhd")
	os.system("vcom -2008 -work work RTL/SMP/predicate_register_controller.vhd")
	os.system("vcom -2008 -work work RTL/SMP/predicate_register_file.vhd")
	os.system("vcom -2008 -work work RTL/SMP/vector_register_controller.vhd")
	os.system("vcom -2008 -work work RTL/SMP/vector_register_file.vhd")
	os.system("vcom -2008 -work work RTL/SMP/memory_controller.vhd")
	os.system("vcom -2008 -work work RTL/SMP/constant_memory_controller.vhd")
	os.system("vcom -2008 -work work RTL/SMP/global_memory_controller.vhd")
	os.system("vcom -2008 -work work RTL/SMP/shared_memory_controller.vhd")
	os.system("vcom -2008 -work work RTL/SMP/SMPController/block_id_calc.vhd")
	os.system("vcom -2008 -work work RTL/SMP/SMPController/thread_id_calc.vhd")
	os.system("vcom -2008 -work work RTL/SMP/SMPController/warps_per_block_calc.vhd")
	os.system("vcom -2008 -work work RTL/SMP/SMPController/streaming_multiprocessor_cntlr.vhd")
	os.system("vcom -2008 -work work RTL/SMP/WarpUnit/fence_registers.vhd")
	os.system("vcom -2008 -work work RTL/SMP/WarpUnit/warps_done_mask_LUT.vhd")
	os.system("vcom -2008 -work work RTL/SMP/WarpUnit/warp_id_calc.vhd")
	os.system("vcom -2008 -work work RTL/SMP/WarpUnit/warp_generator.vhd")
	os.system("vcom -2008 -work work RTL/SMP/WarpUnit/warp_scheduler.vhd")
	os.system("vcom -2008 -work work RTL/SMP/WarpUnit/warp_checker.vhd")
	os.system("vcom -2008 -work work RTL/SMP/WarpUnit/warp_unit.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/bshift.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/stack.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Fetch/pipeline_fetch.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Read/arbiter.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Read/predicate_lut.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Read/convert_data_types.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Read/calculate_address.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Read/read_source_ops.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Read/pipeline_read.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Decode/pipeline_decode.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/ScalarProcessor/shift_logic.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/ScalarProcessor/min_max.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/ScalarProcessor/boolean_functions.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/ScalarProcessor/compute_set_pred_i.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/ScalarProcessor/convert_int_int.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/ScalarProcessor/integer_add_subtract.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/ScalarProcessor/integer_mult_24.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/ScalarProcessor/scalar_processor.vhd")
	
	# Loading the FP module in FlexGripPlus
	
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_add_32.vhd")				
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_conv_32.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_exceptions_32.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_fma_32.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_mul_32.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_round_32.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_sub_32.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_set_32.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/a_s.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/divisor.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_rcp_32.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/FPU/fpu_top_32_new.vhd")

	# Pipeline - Execution - SpecialFunctionUnit version 2
	
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Components/CLZ.vhd")
	
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Components/SFU_Exceptions.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/fused_accm_tree/Booth_PP.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/fused_accm_tree/CSA_4_2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/fused_accm_tree/fused_accum_tree.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_cos.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_exp.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_ln2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_ln2e0.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_reci.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_reci_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_reci_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_sin.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_cos.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_exp.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_ln2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_ln2e0.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_reci.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_reci_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_reci_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_sin.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_cos.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_exp.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_ln2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_ln2e0.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_reci.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_reci_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_reci_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_sin.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/squaring.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/ROM.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Quadratic_Interpolator.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/sfu.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/SFU/sfu_proc.vhd")
	# Pipeline - Execution - RangeReduceOrder"
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/RRO/Components/fp_leading_zeros_and_shift.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/RRO/Components/right_shifter.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/RRO/Components/add_sub.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/RRO/Components/multFP.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/RRO/RRO_trig.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/RRO/rro.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/RRO/rro_proc.vhd")
		
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/branch_exec_unit.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Execution/pipeline_execute.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Write/compute_pred_flags.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Write/increment_address.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/Pipeline/Write/pipeline_write.vhd")
	os.system("vcom -2008 -work  work RTL/SMP/streaming_multiprocessor.vhd")
	os.system("vcom -2008 -work  work RTL/block_scheduler.vhd")
	os.system("vcom -2008 -work  work RTL/dp_ram.vhd")
	os.system("vcom -2008 -work  work RTL/gpgpu_configuration.vhd")
	os.system("vcom -2008 -work  work RTL/system_memory_cntlr.vhd")
	os.system("vcom -2008 -work  work RTL/gpgpu_ml605_top_level.vhd")
	os.system("vcom -2008 -work  work RTL/TB/txt_util.vhd")
	os.system("vcom -2008 -work  work RTL/TB/read_data.vhd")
	os.system("vcom -2008 -work  work RTL/TB/write_instructions.vhd")

#	os.system("vcom -2008 -work  work RTL/TB/AutoCor/autocor_configuration.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/AutoCor/autocor_instructions.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/MatrixMult/matrix_mult_configuration.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/MatrixMult/matrix_mult_cubin_instructions.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/MatrixMult/matrix_mult_sass_instructions.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/Transpose/transpose_configuration.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/Transpose/transpose_inst.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/BitonicSort/bitonic_sort_configuration.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/BitonicSort/bitonic_sort_instr.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/Reduction/reduction_configuration.vhd")
#	os.system("vcom -2008 -work  work RTL/TB/Reduction/reduction_kernel_inst.vhd")

	os.system("vcom -2008 -work  work RTL/TB/TP/TP_configuration.vhd")		
	os.system("vcom -2008 -work  work RTL/TB/TP/TP_instructions.vhd")


	os.system("vcom -2008 -work  work RTL/TB/tb_configuration.vhd")
	os.system("vcom -2008 -work  work RTL/TB/tb_top_level.vhd")


	# by default, the GPGPU is configured to use the instructions stored in the prueba folder. 
	
def Extract_time_params(out, debug_mode):
	# File generation:
	file_temp = open("file_Temp.txt", 'w')
	file_temp.write(out)
	file_temp.close()
	
	with open ("file_Temp.txt", "r") as myfile:
		data = myfile.readlines()
		
		if debug_mode ==1: 
			print(data)
		total_time = (find_substr(data, "totaltime", "# simstats"))		# partially extract the value for the string chain.
		totalcpu_time = (find_substr(data, "totalcpu", "# quit"))
	
	if debug_mode ==1:
		print("\n")
		print(out)
		print("\n")

	total_time_short = total_time[7:-1]
	totalcpu_time_short = totalcpu_time[7:-1]	
	# parameters ready:
	total_time_short_short =total_time_short[ 0: -5]
	totalcpu_time_short_short = totalcpu_time_short[ 0: -5]

	if debug_mode ==1:	
		print(str(float(total_time_short_short) ))
		print(str(float(totalcpu_time_short_short) ))

	os.system("rm file_Temp.txt")				# Remove the temporal file

	return(float(total_time_short_short), float(totalcpu_time_short_short))


def Extract_GPU_time_params(out2, Debug_mode):
	official_kernel_op_time = 0					# Variable initialization
	official_op_time = 0 
	
	official_kernel_op_time = int(find_substr(out2, " KERNEL DONE@'", " ns "))
	official_op_time = int(find_substr(out2, "READDATA DONE@'", " ns "))
	if Debug_mode == 1:
		print("Official kernel time function: " + str(official_kernel_op_time))
		print("Official op time function: " + str(official_op_time))
	
	return(official_kernel_op_time, official_op_time)
	
	
	
# Function employed to launch the fault simulator:
def Lauch_execution(cmd_vsim, Enabled_Debug, num_fault_lines):				# The enabled_debug mode allows to find the performance parameters of the app.
	print("Starting Fault simulation...")
	p = subprocess.Popen(cmd_vsim, stdout=subprocess.PIPE, shell=True)
	out, error = p.communicate()
	print("Fault simulation finished")

	num_fault_lines = num_fault_lines - 1			# reduce the total number of fault to be applied.

	if Enabled_Debug == 1 :
		print (out) 						#enable if you want to read the modelsim output
	
	totalcpu_time = 0.0						# by default, under not debug mode activation.
	total_time = 0.0
	official_kernel_op_time  = 0.0
	official_op_time  = 0.0

	# Extraction of execution time parameters:
	(total_time, totalcpu_time) = Extract_time_params(out, Enabled_Debug)

	# Extraction of GPGPU execution parameters:
	(official_kernel_op_time, official_op_time) = Extract_GPU_time_params(out, Enabled_Debug)

	if Enabled_Debug == 1 :
		print("-> Total Execution time: " + str(total_time) + "s.")
		print("-> Total CPU Execution time: " + str(totalcpu_time) + "s.")
		print("-> Total Kernel Execution time: (GPGPU execution) " + str(official_kernel_op_time) + "ns.")
		print("-> Total GPGPU simulation time: (GPGPU after memory results generation) " + str(official_op_time) + "ns.")
				
	if (total_time == 0) | (totalcpu_time == 0) |(official_kernel_op_time == 0) |(official_op_time == 0):
		print("An error has occured during simulation execution, check the GPGPU simulation in Debug mode\n")

	return(total_time, totalcpu_time, official_kernel_op_time, official_op_time, out, num_fault_lines)

	
	
	
def Launch_golden_sim(cmd_vsim, Debug_mode, app_name):
	
	# Golden Simulation:
	print("--------------------------------------------------------------------------------------- \n")
	print("                                Golden simulation...\n")
	print("--------------------------------------------------------------------------------------- \n")
		
	# sub functions to establish the performance parameters
	p = subprocess.Popen(cmd_vsim, stdout=subprocess.PIPE, shell=True)
	out, error = p.communicate()
	
	os.system("mv gpgpu_rdata.log " + str(app_name) + "_reference_mem.log")
	
	if Debug_mode == 0:							# Erase the original simulation memory results if there is not debug mode.
		os.system("rm gpgpu_rdata.log")
		
	# Extraction of execution time parameters:
	(total_time, totalcpu_time) = Extract_time_params(out, Debug_mode)

	# Extraction of GPGPU execution parameters:
	(official_kernel_op_time, official_op_time) = Extract_GPU_time_params(out, Debug_mode)
	
	print("--------------------------------------------------------------------------------------- \n")
	print("                       Golden simulation Finished\n")
	print("-> Total Execution time: " + str(total_time) + "s.")
	print("-> Total CPU Execution time: " + str(totalcpu_time) + "s.")
	print("-> Total Kernel Execution time: (GPGPU execution) " + str(official_kernel_op_time) + "ns.")
	print("-> Total GPGPU simulation time: (GPGPU after memory results generation) " + str(official_op_time) + "ns.")
	print("--------------------------------------------------------------------------------------- \n")
	
	if (total_time == 0) | (totalcpu_time == 0) |(official_kernel_op_time == 0) |(official_op_time == 0):
		print("An error has occured during simulation execution, check the GPGPU simulation in Debug mode (fault list could be corrupted)\n")
	
	return(total_time, totalcpu_time, official_kernel_op_time, official_op_time)
	
	
	
	
	
	
				  
				  # Pending method to check the memory results line by line (could solve some issues with the problems presented at the end of the memory files.....)
				  
		#		  f_log = inFile_reference
		#		  for liney in inFile_to_check:
		#			  ref_line = f_log.readline()				#Read reference memory
		#			  words = liney.split()						#Read actual check memory
		#			  ref_words = ref_line.split()				
					  
		#			  print("words :" + str(words))
		#			  print("ref_words :" + str(ref_words))

		#			  if words[1]:								# evaluation if the actual memory has reached the limit.
																# there are still data lines to be evaluated
		#					if ref_words[1]:						# evaluation if the reference memory has reached the limit				
		#						print ("memory file still with lines" + str(ref_words) )
		#
		#						if(words[0] != ref_words[0]) :			# is the Address equal??
		#						  fault_address_count = fault_address_count + 1
		#						  Final_log.write("Address\t\t" + str(count) + "\t\t" + str(ref_words[0]) + "\t\t" + str(words[0]) + "\n")
						
		#						if(words[1] != ref_words[1]) :			# data equal
		#						  fault_data_count = fault_data_count + 1
		#						  Final_log.write("Data   \t\t" + str(count) + "\t\t" + str(ref_words[1]) + "\t\t" + str(words[1]) + "\n")
								  
		#					else: 						# file not empty					
							# the fault has damage the memory in the actual memory. extra mem.					
		#						fault_address_count = fault_address_count + 1	
		#						fault_data_count = fault_data_count + 1
		#			  else:				
		#					if ref_words:						# evaluation if the reference memory has reached the limit.
							# the fault has damage the memory in the actual memory. cut mem
		#						  fault_address_count = fault_address_count + 1	
		#						  fault_data_count = fault_data_count + 1
							
		#			  count=count+1
		#--------------------------------------------- zone of comparison ---------------------------------------------------------	
	
	
	
	
	
	
	
	
	
	
	