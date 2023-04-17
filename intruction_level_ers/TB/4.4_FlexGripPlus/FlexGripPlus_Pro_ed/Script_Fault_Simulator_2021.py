# ---------------------------------------------------------------------------------------------
#                     Python fault injection for FlexGripPlus
# ---------------------------------------------------------------------------------------------
# Author: Josie Esteban Rodriguez Condia.
# ESR 1.4 RESCUE-ETN
# CAD Group
# Politecnico di Torino
# DAUIN Department
# 2017-2021

# Required software: ModelSim 10.7b or equivalent QuestaSim version.
# Python 2.7 and Python 3.6

# Launch a fault simulation:
# python Script_Fault_Simulator_2021.py name_application(TP) Name_fault_list total_threads (32)

# The fault list should include the .txt extension. By default loaded during the command line.

# ---------------------------------------------------------------------------------------------


import os
from afs_func import *
import subprocess
import filecmp
import argparse
from import_project import *
#from FaultyScript import *
from datetime import datetime
from datetime import date

import os.path
from os import path
import random

# pending the checkpoint... check all


def main():
	
	# Definition of the arguments to considered:
	# Target application.
	# The target fault list.
	# Configuration ?.  future...

	parser = argparse.ArgumentParser()
#	parser.add_argument('application_name', help='application', type=str)   # it will be used when all check are passed.
	parser.add_argument('fault_list', help='fault_list', type=str)
#	parser.add_argument('thread_number', help='thread_number', type=int)
	
	# parser.add_argument('fault_list', help='fault_list', type=str)				# potential new parameter, enable fault simulation, debug mode, execution time, future steps.
	
	args=parser.parse_args()

	# generate_pick_bench()  # pending function to generate the configuration of the environment.

	# definition of the object to manage the name strings of the input parameters.
	fault_list = args.fault_list						# Strings
#	application_name = args.application_name			# Strings	# not need in this version. pending developing a new version to include it.

	application_name = "TP"								# Strings

#	total_thread_number = args.thread_number			# Integer   # not need in this version. pending developing a new version to include it.

	total_thread_number = 32		# Integer

	resume = 1
	cold = 0
	start_type = cold


    # Apps. definition as integer numbers.
	vector_add = 0
	matrix_mul = 1
	reduction =  2
	transpose =  3
	Sort = 	 4
	FFT = 		 5
	Edge = 		 6
	TP = 		 7
	M3 = 		 8	# SBST code for the Scheduler memory.
		
	print(application_name)

	# simple method, modify to generalize later...
	if application_name == "vector_add":  			# this parameter is defined as an input string
					Select_app = vector_add
	elif application_name == "matrix_mul":
					Select_app = matrix_mul
	elif application_name == "reduction":  				# not employed
					Select_app = reduction
	elif application_name == "transpose":				# not employed
					Select_app = transpose
	elif application_name == "sort":
					Select_app = Sort
	elif application_name == "FFT":
					Select_app = FFT
	elif application_name == "edge":
					Select_app = Edge
	elif application_name == "TP":
					Select_app = TP
	elif application_name == "m3":
					Select_app = M3
	
	print(application_name + " :   " + str(Select_app))

	fault_list_name = fault_list
	print(fault_list_name)

	# checking the fault list before start the importing:
		
	if not path.exists(fault_list_name):								# checking if the file storing the check pointing information is present
		print("There is an error in the fault list name. Please check that the file is present in the path")
		exit()															# stop the execution of the fault injector by lack of input resources



	# check all files before to start compilation?



	# Scheduler configuration:
	scheduler_1 = 1															# Dispatcher of maximum One block per SM.
	scheduler_2 = 2															# Dispatcher of maximum two or more blocks per SM.

	app_name_array = ["vector_add", "matrix_mul", "reduction", "transpose", "Bittonic", "FFT", "Edge", "TP", "M3"]									# from 0 to 8
	default_execution_time = ['3750000ns', '1152000ns', '1002300ns', '1344000ns', '2617200ns',  '1000000ns' , '2557200ns', '2900000ns', '5152000ns']	# execution time for 32 cores, less cores requires more exec. time.
	doubled_execution_time = ['6000000ns', '2304000ns', '2004600ns', '2688000ns', '5234400ns', '2000000ns' , '5011400ns', '2900000ns', '12000000ns']
	#																														5152000
	#																													   6304000
	
	Debug_mode = 1														# Change this value to forced debug operations
	golden_launch = 0													# With 0 it means that the fault injection is performed, with 1 it means that the fault injection is not performed.
	default_execution_time[Select_app] = "1000000ns"
	# select the app to apply the fault injection, parameters of fault type and signals should be stored in a text file.

#-----------------------------------------------------------------------
#   This line can be removed considering that the execution of the new parameters is including this definition.
#	fault_list_name = "Fault_list_permanent_pipeline_10.txt"			# Change the name of the test file which includes all the signal list and the type of faults to inject.
	# possible values: (0= "vector_add", 1= "matrix_mul", 2= "reduction", 3= "transpose", 4=  "Bittonic", 5= "FFT", 6= "Edge", 7= "TP")
#	Select_app = TP								#  <------------- For the test of SBST on TP application, the configuration is: Scheduler_2, Threads:64, Cores: 32
	
	# scheduler config:
	scheduler_config = scheduler_1				# _1 means one per block, _2 means parallel , in new sims for sort and m3, sch2 means the 32x2
	
	
	#(for 64ths one block, the SCHEDULER_2 is selected)
	
	# Thread configuration:
#	threads_n = 1024 		# 32, 64 options for the vectoradd, FFT and Edge apps.   (the 64 thread config), TP with experimental kernels are 64
	threads_n = total_thread_number

	# Cores configuration:
	cores_n = 8 		# 32, 16, 8 options
#-----------------------------------------------------------------------

	param = Select_app
	print("Starting the Simulator execution...")   							# 257065000 ps partially, check with the step sim.

#	os.system("rd /s /q work")												# Remove the previous work directory (Win version)
	os.system("rm -r work")													# Remove the previous work directory (Linux version)
	os.system("rm gpgpu_rdata.log")											# Remove previous simulation results
	
	os.system("vlib work")
		
	if not path.exists("check_point_file.txt"):								# checking if the file storing the check pointing information is present
		new_checker = open("check_point_file.txt", 'w')
		new_checker.write("0\n0\n0\n0\n0\n0\n")
		new_checker.close()
		start_type = cold
	else:
		start_type = resume
		
	if not path.exists("result_memory_files/"):			# checking the folder to store memories:
		os.system("mkdir result_memory_files")								# generate folder to store results
		print("The storing folder was created")
	else:
	
		if start_type == cold:		# checking that if really needed to generate the new folder
			today = date.today()
			now = datetime.now()
			t = now.strftime("%H_%M_%S")
			time_name = str(today.year) + "_" + str(today.month) + "_" + str(today.day) + "_" + t

			source_name_x = 'result_memory_files'
			destiny_name_y = 'result_memory_files_' + time_name
			os.rename(source_name_x, destiny_name_y)

			os.system("mkdir result_memory_files")								# generate folder to store results
			print("The storing folder was renamed")
	

	# final file to store the quantitative results:
	inFile_final = open("final_result_"+ str( app_name_array[Select_app] ) + ".txt", 'a')						# file for final save test



	# link the files for the fault injection (move the memory, the pickbench and the instructions) for now fixed
	
	

	# Function to import all the parameters of the project:  _select the compilation files and the instruction sifles to generate the parametric compilation... pending...
	import_project(Select_app, scheduler_config, threads_n, cores_n)

	# Initial compilation command of the entire project (could be replaced by calling the tcl file):
	#             with the command: vsim -c -do \"vsim -t %s work.%s -novopt; source gpgpu_compile.tcl;quit -sim;quit -f;\"

	# mod command
	#	cmd_vsim ="""
	# 	vsim -c -do \"vsim -t %s work.%s -novopt;run %s;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
	#	""" %('1ns', 'tb_top_level', default_execution_time[Select_app])

	cmd_vsim ="""
	vsim -c -do \"vsim -t %s work.%s -novopt;run -all;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
	""" %('1ns', 'tb_top_level')
	
	
	# check if resume mode: (after launching and stopped by an external effect, recover from checkpointing...)
	
	# check if file generated from golden sim is present, if not, launch again the golden one.
	
	# Launching the Execution (golden in this case):
	# Internally the function generates the memory results and the performance parameters for the golden execution for the GPGPU project.
	# Performance parameters: total_time, totalcpu_time, official_kernel_op_time, official_op_time
	# Memory results generated in the "gpgpu_rdata.log" file and copied to "reference_memory_probe.log" file for fault injection purpose.
#	total_time = 0
#	totalcpu_time = 0
#	official_kernel_op_time=0
#	official_op_time= 0


	#if start_type == cold:														# checking that if really needed to generate the golden simulation
	
	(total_time, totalcpu_time, official_kernel_op_time, official_op_time) = Launch_golden_sim(cmd_vsim, Debug_mode, app_name_array[Select_app])


	if official_kernel_op_time == 0 and official_op_time == 0:
		print("program terminated: the Simulation time of the Golden Sim was not sufficient or the process of execution failed, check the debug mode for more info.")
		exit(0)

	#	official_kernel_op_time
	#else:																		# resume launch
	
	#	if not path.exists("TP_reference_mem.log"):								# checking if the file storing the check pointing information is present

	#		(total_time, totalcpu_time, official_kernel_op_time, official_op_time) = Launch_golden_sim(cmd_vsim, Debug_mode, app_name_array[Select_app])


	if Debug_mode == 1:
		print("total time running the simulation: " + str(default_execution_time[Select_app]) + "\n")

	# -------------------------------------------------------------------------------------------
	# openning the fault injection file for fault injection purposes:
	
	print("Opening fault injection file...")
	inFile = open(fault_list_name, 'r')								# Use a test file ( It includes a format : [Fault_type Signal_name - ])
	num_fault_lines = sum(1 for line_present in open(fault_list_name))
	if	num_fault_lines == 0:
		print("Error: check the fault list file, the total number of fault to apply cannot be zero...")
		exit()														# Finish the program to prevent the wrong lecture or injection of parameters.
	else:
		print("Fault list correctly open. [" + str(num_fault_lines) + "] lines to inject" )
	
	# General file to store the limit of tries.	


	
	# -------------------------------------------------------------------------------------------
	#                                  FAULT SIMULATION CODE ZONE
	# -------------------------------------------------------------------------------------------
	actual_value = 0
	check_open=0
	i=0
	lines=0
	crashed_event=0
	count=0
	passed_event=0
	fault_memory_count=0
	error_by_stall=0
	error_by_memory=0
	error_by_degradation=0						# In time
	error_by_degradation_in_memory = 0			# In time
	error_by_degradation_but_mem_ok = 0			# In time
	flat_degradation=0
	error_not_detected=0						# fault not detected by the app. (dont affect performance or result)
	start_point = 0								# initialization for the SA0 and SA1 cases.
	perioded = 0
	fault_injection_counter = 0.0
	total_fault_lines = num_fault_lines			# defining the total number of fault to be applied in this fault simulation
	finished_sim = 0

	if golden_launch == 0:			# the fault injector can be launched:
		print("--------------------------------------------------------------------------------------- \n")
		print("                            Fault Simulation enabled...\n")
		print("--------------------------------------------------------------------------------------- \n")


		# Checking the actual fault simulation point:
#		input_check_file = open('check_point_file.txt', 'r')
		
		with open('check_point_file.txt', 'r') as input_check_file:

			actual_value = int( input_check_file.readline() )
			print (str(actual_value))
		
			if (actual_value == 0):
				print ("cold start")
			else:
				print ("resume start")
				print ( str(total_fault_lines) )
				error_by_stall = int( input_check_file.readline() )
				error_by_memory = int( input_check_file.readline() )
				error_by_degradation_in_memory = int( input_check_file.readline() )
				error_not_detected = int( input_check_file.readline() )
				error_by_degradation_but_mem_ok = int( input_check_file.readline() )
				# restoring the dictionary file:
				os.system("cp final_fault_dictionary_back_up_" + str( app_name_array[Select_app] ) + ".txt final_fault_dictionary_" + str( app_name_array[Select_app] ) + ".txt" )

		# Fault injector execution:
		
		for line in inFile:			# main loop for fault simulation app.
		
			  # check point:
			  # open check file and see if this is a resume mode sim or a cold one:

			  if actual_value == total_fault_lines:
#				  print("Finished simulation")
				  fault_injection_counter = total_fault_lines
				  finished_sim = 1
			  elif actual_value > count:
			#	  print("do nothing, searching the fault to inject...")
				  count = count + 1
				  fault_injection_counter = fault_injection_counter + 1.0
			  else:
				  # File for fault detection dictionary
				  os.system("cp final_fault_dictionary_" + str( app_name_array[Select_app] ) + ".txt final_fault_dictionary_back_up_" + str( app_name_array[Select_app] ) + ".txt" )
				  inFile_dictionary = open("final_fault_dictionary_" + str( app_name_array[Select_app] ) + ".txt", 'a')		# file for fault dictionary	

				  print("Decoding the fault to inject... \n")
				  lines=lines+1

				  words = line.split()
				  fault_type = words[0]
				  location = words[1]
				  other_signal = words[2]
				  
				  if fault_type == "bflip":		# Collect other parameter if the test fault model is bitflip, in other case, it should be SA0 or SA1.						
#						start_point = words[3]	# internal random version of the transient fault campaigns, so internally generated for each fault.

						operative_ranges_low = 2000
						operative_ranges_high = int(official_kernel_op_time)
						start_point = random.randint(operative_ranges_low, operative_ranges_high)

						Internal_Gen = open("Internal_gen_fault_injection_list_"+ str( app_name_array[Select_app] ) + ".txt", 'a')						# file for final save test
						Internal_Gen.write(fault_type + "_c " + location + " - " + str(start_point)  + " 11\n" )
						Internal_Gen.close()

#						perioded = words[4]
				  elif fault_type == "bflip_c":			  
						start_point = words[3]
						perioded = words[4]
				  elif fault_type == "behave_signal":	# The fault is behavioral and a special case should be considered
						start_point = words[3]
						perioded = words[4]
				  else:
						start_point = '0'			# SA0 of SA1 or other cases.
						perioded = '0'
				  
				  os.system("rm gpgpu_rdata.log")
				  inFile_dictionary.write(str(location) + " : ")


				  # Generation of command according to the fault type in file and location of fault, including the total launh time and the steps length.
#				  cmd_vsim = build_cmd(fault_type, location, other_signal, "tb_top_level", doubled_execution_time[Select_app], "1ns", "gpgpu_ml605_top_level", start_point, perioded)
							  
				  cmd_vsim = build_cmd(fault_type, location, other_signal, "tb_top_level", int(int(official_op_time) * 1.2), "1ns", "gpgpu_ml605_top_level", start_point, perioded)
							  
							  							  
							  
				  # Appliying the command in the terminal, launching and waiting for execution...

				  if Debug_mode == 1:
					print("Printing command to apply: \n")
			#		print(str(cmd_vsim))
#					print("\n")

				  fault_injection_counter = fault_injection_counter + 1.0							# basic definition of the parameter to measure the execution
					
				  print("Appliying the Fault # " +  str( int(fault_injection_counter)) + " of " + str(total_fault_lines) )				

				  # Launching the GPGPU with the selected fault:
				  (total_time, totalcpu_time, actual_kernel_op_time, actual_op_time, out, num_fault_lines) = Lauch_execution(cmd_vsim, Debug_mode, num_fault_lines)						# not debug mode enabled

				  
				  print("--------------------------------------------------------------------------------------- \n")
				  print("Fault Simulator Execution % " + str( 100.0* (fault_injection_counter / (total_fault_lines) ) ) + "  Faults pending: [" + str(num_fault_lines) + "/" + str(total_fault_lines) +"]")
#				  print("--------------------------------------------------------------------------------------- \n")
				  print("Fault list file: " + str(fault_list_name) + " applied to the " + str(app_name_array[Select_app] ) + " App." )
				  print("--------------------------------------------------------------------------------------- \n")
				  
				  
				  
				  # pending to use the total_time, totalcpu_time performance parameters....
				  
				  # At this point the simulation has finished, classified the type of fault: Detected (by stall), not detected (not affect the system), Detected in memory and detected by Degradation in time (good 		answer or bad answer.


				  # ---------------------------------------------------------------------------------------------------
				  # classification (checker and classifier):
				  # silent: not effect
				  # time out: (not finished on a selected period of time)
				  # detected: Memory miss...
				  # Silent data corruption (SDC) memory results comparison.

				  # Execution ending...	  
				  check_open=0
				  check=0
				  flat_degradation = 0
				  # check if the sim really finish or it stalls (time out) in some part by efect of the fault.
				  try:
					 inFilex = open("gpgpu_rdata.log", 'r')		# use the final memory, after the fault generation.
								# #inFilex = open("fault1_log.txt", 'r')		# use the test file
					 if Debug_mode == 1:
						print(inFile) 			# description of the file to be processed and contains the fault list.
						print("open memory file of test " + str(lines))
					 inFilex.seek(0) #ensure you're at the start of the file
					 check_open=1
				  except IOError:		# there is not file for memory results.
					 check_open=0
					 print ("Could not open file!")

				  if (check_open==1):					# the simulation ended and the memory file was created
					check=1
					print ("open memory file, checking if its empty...")

					first_char = inFilex.read(1) 			#get the first character

					if not first_char:
						 check=0					# there is not mandatory to compare an empty file with the reference memory file
						 print ("memory file empty")
					else: 							# file not empty
						 check=1					# a comparison of memory files(reference and new) should be carried out.
						 print ("memory file not empty")
					inFilex.close()		#first character is the empty string..
					
				  else: # there is not a memory file for simulation, circuit stalls in sim. due to fault.
					# nothing else to do, this means that even the simulation colapsed by timeout
					check=0

			# comparison line by line, classify by degradation or good.
				  if(check==1):					# comparison of files:
					  check=0																	# memory write
					  
					  #check the degradation, probably it finished but with long time.
#					  print("Checking Degradation in time....")
					  print("Actual simulation kernel time:    " + str(actual_kernel_op_time))
					  print("Golden simulation kernel time:    " + str(official_kernel_op_time))
					  
					  if(actual_kernel_op_time > official_kernel_op_time):	# there is a degradation by the fault
						 print("Timeout faulure present (Degradation in performance)")
						 flat_degradation=1
						 error_by_degradation += 1

					  # Store memory files in directory
					  
					  
					  os.system("mv gpgpu_rdata.log result_memory_files/memory_" +  str( app_name_array[Select_app] ) + "_" + str(i) + ".log")
					  os.system("rm gpgpu_rdata.log")
				#	  inFile_to_check = open("result_memory_files/memory_" + str( app_name_array[Select_app] ) + "_" +  str(i) + ".log")
					  inFile_reference = open( str( app_name_array[Select_app] ) + "_reference_mem.log")
						 
						 
					  # Comparison of memory results (fault memory, golden memory)
					  # True mean equal files.
					  if filecmp.cmp("result_memory_files/memory_" + str( app_name_array[Select_app] ) + "_" +  str(i) + ".log", str( app_name_array[Select_app] ) + "_reference_mem.log"):
							print("Memory match")
							passed_event+=1
							error_not_detected+=1								# error in memory not detected
		  
							if(flat_degradation == 1):
								error_by_degradation_in_memory+= 1				# there is presence of performance degradation.
								flat_degradation=0
								inFile_dictionary.write("	D	Time out (Degradation by Performance)	" + str(fault_type) + "\n")
								inFile_final.write("signal failed	D	Time out	: " + str(cmd_vsim) + "Log #: " + str(count) + "\n")
							else:
								inFile_dictionary.write("	ND	"+ str(fault_type) +"\n")			# not detection of fault, silent fault		
					  else:
							print("No Memory match (SDC)")
							inFile_dictionary.write("	D	(SDC)"+ str(fault_type) +"\n")
							
							crashed_event+=1
							fault_memory_count+=1
							error_by_memory+=1

							inFile_final.write("signal failed	D	(SDC)	: " + str(location) + "\n" + "Injection time:  ("+ str(start_point) + ")"+ "\n" + "Log #: " + str(count) + "\n")

							error_by_degradation_but_mem_ok+= 1				# In time
					  
							os.system("mv result_memory_files/memory_" + str( app_name_array[Select_app] ) + "_" +  str(i) + ".log result_memory_files/memory_" + str( app_name_array[Select_app] ) + "_" + datetime.now().strftime('%d/%m/%Y %H:%M:%S') + "_" + str(i) + ".log" )

					  fault_memory_count=0
					  
				  else:							# memory didnt write, stall
					# second chance: run again with the double time, probably was degradation in time: (double time)
					print ("error! halt")
					error_by_stall += 1
					inFile_dictionary.write("	D	Halted"+ str(fault_type) +"\n")
				  count =count+1
				  i+=1

				  print(application_name + " :   " + str(Select_app))


				  print("Fault list employed:  " + str(fault_list_name))
#				  print("Simulating the configuration of : " + str(total_thread_number) + " Threads")
				  print("Error_by_halt:..................................." + str(error_by_stall))   												# initial parameter to observe
				  print("Error_by_Silent_data_corruption(SDC):............" + str(error_by_memory))   												# initial parameter to observe
				  print("Error_by_time_out:..............................." + str(error_by_degradation_in_memory))   								# initial parameter to observe
				  print("Error_not_detected( silent):....................." + str(error_not_detected - error_by_degradation_in_memory))  	 		# initial parameter to observe
			#	  print("Error_by_time_out_(Error in memory not detected):" + str(error_by_degradation_in_memory))   								# initial parameter to observe
			#	  print("Error_by_time_out_(Error in memory detected)....." + str(error_by_degradation_but_mem_ok))   								# initial parameter to observe
				  print("----------------------------------------------------------------------------------- \n")
				  
				  # Updating checkpoint:
				  input_check_file = open("check_point_file.txt", "w").close()						# Clearing the content of the checkpoint file
				  input_check_file = open("check_point_file.txt", "w")
				  input_check_file.write(str(count)+"\n")
				  input_check_file.write(str(error_by_stall)+"\n")
				  input_check_file.write(str(error_by_memory)+"\n")
				  input_check_file.write(str(error_by_degradation_in_memory)+"\n")
				  input_check_file.write(str(error_not_detected)+"\n")
				  input_check_file.write(str(error_by_degradation_but_mem_ok)+"\n")
				  input_check_file.close()
				  inFile_dictionary.close()
				  
	inFile_final.write("Total # Faults evaluated :\t\t" + str(count) +"\n")
	inFile_final.write("Total # Faults detected :\t\t"   +   str( error_by_stall + error_by_memory + error_by_degradation - error_by_degradation_but_mem_ok )  +   "\n")
	inFile_final.write("Total # Faults not detected :\t\t" +  str( error_not_detected ) +"\n")
			  
	inFile_final.write("Error_by_halt:..................................." + str(error_by_stall)+"\n")   										# initial parameter to observe
	inFile_final.write("Error_by_Silent_data_corruption(SDC):............" + str(error_by_memory)+"\n")   										# initial parameter to observe
	inFile_final.write("Error_by_time_out:..............................." + str(error_by_degradation_in_memory)+"\n")   						# initial parameter to observe
	inFile_final.write("Error_not_detected( silent):....................." + str(error_not_detected - error_by_degradation_in_memory)+"\n")   	# initial parameter to observe
	inFile_final.write("Error_by_time_out_(Error in memory not detected):" + str(error_by_degradation_in_memory)+"\n")   						# initial parameter to observe
	inFile_final.write("Error_by_time_out_(Error in memory detected)....." + str(error_by_degradation_but_mem_ok)+"\n")   						# initial parameter to observe											

	inFile_final.write("(SDC) Detected events: " + str(crashed_event)+"\n")  	 																# initial parameter to observe
	inFile_final.write("(SDC) Not Detected events: " + str(passed_event)+"\n")


	if finished_sim == 1:
		finished_sim = 0

		input_check_file = open("check_point_file.txt", "w").close()						# Clearing the content of the checkpoint file
		input_check_file = open("check_point_file.txt", "w")
		input_check_file.write(str(0)+"\n")
		input_check_file.write(str(0)+"\n")
		input_check_file.write(str(0)+"\n")
		input_check_file.write(str(0)+"\n")
		input_check_file.write(str(0)+"\n")
		input_check_file.write(str(0)+"\n")
		input_check_file.close()		
		
		print(" Simulation finished, Now the checkpoint file is clear, please retrive results \n")
	
	
	
	print("--------------------------------------------------------------------------------------- \n")
	print("                                 Fault injection finished ")
	print("--------------------------------------------------------------------------------------- \n")
	print("Total Faults by Halt:.........................." + str(error_by_stall))  	 														# initial parameter to observe
	print("Total Faults by Silent Data Corruption (SDC):.." + str(error_by_memory))   															# initial parameter to observe
	print("Total Faults by Time Out(100%):................" + str(error_by_degradation_in_memory))   											# initial parameter to observe
	print("Total Faults not detected (Silent Faults):....." + str(error_not_detected - error_by_degradation_in_memory))   						# initial parameter to observe
	print("--------------------------------------------------------------------------------------- \n")

	inFile_final.close()
	
	os.system("python redable_report_top.py")
	os.system("rm check_point_file.txt")
	
	
	
	
main()
