import os
import subprocess
import filecmp
import struct
import re
import argparse
from datetime import datetime
from datetime import date

import os.path
from os import path
import random

from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter

from matplotlib.ticker import FuncFormatter
import matplotlib.pyplot as plt
import numpy as np

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------


# This function search for X or x condition in the faulty machine results (list) in order to de sure that the process of removal was correct.
def check_list(input_list):
	flag = 0
	for element in input_list:
		for index in element:
			if ('x' in str(index)) or ('X' in str(index)):
				flag = 1
	if flag == 1:
		print("Error, the list still includes X and X values in the outputs")
	return flag

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------


def xor(a, b):
    return (a and not b) or (not a and b)
	
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------


def find_masks_in_results(total_fm_list, total_gm_list):

	total_mask_list = []
	total_len = len(total_fm_list)

	for i in range( 0, total_len ):
		
#		print(total_fm_list[i], total_gm_list[i])
		list_mask = []
		for j in range( 1, len( total_fm_list[i] ) ):

#			print(total_fm_list[i][j], total_gm_list[i][j])

			mask = ""
			for k in range( 0, len( total_fm_list[i][j] ) ):

				if str(total_fm_list[i][j][k]) != '.' and total_gm_list[i][j][k] != 'X' and total_gm_list[i][j][k] != 'x':

#					print(total_fm_list[i][j][k], total_gm_list[i][j][k])
					
					faulty_integer = int("0x" + total_fm_list[i][j][k], 16)

					good_integer = int("0x" + total_gm_list[i][j][k], 16)

					mask_hex = hex(faulty_integer ^ good_integer)

					mask = mask + str(mask_hex)[2:]

#					print(hex(faulty_integer), hex(good_integer), mask)

				else :
#					if total_gm_list[i][j][k] != 'X' or total_gm_list[i][j][k] != 'x':
#						mask = mask + total_gm_list[i][j][k]
#					else:
					mask = mask + "0"
					
#					print("0")
#			print(mask)
			list_mask.append(mask)
#		print(list_mask)
		total_mask_list.append(list_mask)
	return total_mask_list

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------


def find_substr(fullstr):
	fullstr_temp = fullstr.replace("[","")
	fullstr_temp = fullstr_temp.replace("ns,","")
#	print(fullstr_temp)
	return fullstr_temp

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def store_list_in_file(input_list, name_file):

	new_file = open(name_file, 'w')

	for i in range (0, len(input_list)):
	
		new_file.write(input_list[i] + "\n")
		
	new_file.close()

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------


def store_str_list_in_file(input_list, name_file):

	new_file = open(name_file, 'w')

	for i in range (0, len(input_list)):
	
		new_file.write(str(input_list[i]) + "\n")
		
	new_file.close()


# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------



def find_hist(input_list, name, application):

	folder = ""
	total_counter = 0
	binary_distribution = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	counting = {}
	counters = 0 
	for line in input_list:
	
		for j in range(0, 64):
			if line[j] == "1":
				total_counter = total_counter + 1
				binary_distribution[j] = binary_distribution[j] + 1
		
		counters = line.count('1')			# searching for the '1s' in the input array
		
		if counters in counting:
			counting[counters] = counting[counters] + 1
		else:
			counting[counters] = 1
				
	
	x3 = np.arange(len(binary_distribution))
	fig1, ax3 = plt.subplots()

	plt.bar(x3, binary_distribution, color= ('green', 'green', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'green', 'green', 'r', 'r', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'r', 'r'))
	plt.xticks(x3, [63, 62, 61, 60, 59, 58, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0])
#	plt.show()
	
	# storing the image
	xxx3 = plt.figure(1)   
	xxx3.savefig( name + "/" + application + "/" + name + "_binary_distribution.png" )
	# storing the text for other analyzes
	
	file = open(name + "/" + application + "/" + name + "_hist.txt" , 'w')
	for k in range(0, 64):
		file.write(str(k) + " " + str(binary_distribution[k]) + "\n")
	file.close()
	
	file = open(name + "/" + application + "/" + name + "_fault_counting.txt" , 'w')
	for key in counting:
		file.write( str(key) + " " + str(counting[key]) + "\n")
	file.close()
	
	
	
#	print(counting)

# functions to analyze the effect of the primary outputs on each module:

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------


def  store_in_list(mini_list, len_small_list, index, mask_value, hw_port, sub_group_error, time_parameter):
	
	
	if len_small_list == 0:				# firt time that the list is going to be filled. 
		mini_list.append(index)
		mini_list.append(sub_group_error)
		mini_list.append(mask_value)
		mini_list.append(time_parameter)
		mini_list.append(hw_port)
	else:									# this is the second or more time that the same list is gonna be filled.
		mini_list.append(mask_value)
		mini_list.append(time_parameter)
		mini_list.append(hw_port)
		
	return mini_list


def  store_in_list(mini_list, len_small_list, index, mask_value, hw_port, sub_group_error, time_parameter):
	
	
	if len_small_list == 0:				# firt time that the list is going to be filled. 
		mini_list.append(index)
		mini_list.append(sub_group_error)
		mini_list.append(mask_value)
		mini_list.append(time_parameter)
		mini_list.append(hw_port)
	else:									# this is the second or more time that the same list is gonna be filled.
		mini_list.append(mask_value)
		mini_list.append(time_parameter)
		mini_list.append(hw_port)
		
	return mini_list



def  store_in_list_test(mini_list, len_small_list, index, mask_value, hw_port, sub_group_error, time_parameter, total_fm_list_xxx, total_gm_list_xxx):
	
	
	if len_small_list == 0:				# firt time that the list is going to be filled. 
		mini_list.append(index)
		mini_list.append(sub_group_error)
		mini_list.append(mask_value)
		mini_list.append(time_parameter)
		mini_list.append(hw_port)
		mini_list.append(total_fm_list_xxx)
		mini_list.append(total_gm_list_xxx)
		
		
	else:									# this is the second or more time that the same list is gonna be filled.
		mini_list.append(mask_value)
		mini_list.append(time_parameter)
		mini_list.append(hw_port)
		mini_list.append(total_fm_list_xxx)
		mini_list.append(total_gm_list_xxx)
		
	return mini_list



# ---------------------------------------------------------------------------------------------------------------------------

def	analyze_operation_errors(total_mask_list, total_fm_list, total_gm_list, module, application):

	general_structure_operation_errors = []
	list_multiple_cases = []

	if (module == "fetch") or (module == "Fetch") or (module == "FETCH"):
		
		for i in range(0, len(total_mask_list)):
		
			if str(total_mask_list[i][11]) != "0000000000000000":

					small_list = []
					small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][11], "fetch.instruction_out", "incorrect_operation_code", total_fm_list[i][0])
#					small_list = store_in_list_test(small_list, len(small_list), i, total_mask_list[i][11], "fetch.instruction_out", "incorrect_operation_code", total_fm_list[i][0], total_fm_list[i][12], total_gm_list[i][12])
					general_structure_operation_errors.append(small_list)
				
					
#					small_list.append(i)
#					small_list.append(total_mask_list[i][11])
#					print(str(small_list))
#					operation_errors.append(small_list)



		# evaluation of the instructions codes effects by a fault.


		# loading the information of the ISA of the GPU core.
		load_isa = open("../ISA_sass.txt", 'r')		# /home/e.rodriguez/Z0IXs/target_fault_model
		isa_counter = 0
		ISA = []		# empty list for the ISA
		for line in load_isa:
			isa_counter = isa_counter + 1
			words = line.split()
			ISA.append(words)

		# building the unified lists of wrong instructions effects [ gm + fm (only in the locations needed) ]
		
		total_new_mask_list = []
		total_len = len(total_fm_list)

		for i in range( 0, total_len ):
		
	#		print(total_fm_list[i], total_gm_list[i])
			list_mask = []
			
			if len(total_fm_list[i]) == 13:

	#			print(total_fm_list[i][j], total_gm_list[i][j])

				mask = ""
				for k in range( 0, len( total_fm_list[i][12] ) ):

					if str(total_fm_list[i][12][k]) != '.':
						mask = mask + str(total_fm_list[i][12][k])
					else:
						mask = mask + str(total_gm_list[i][12][k])
				total_new_mask_list.append(mask)
			else:
				total_new_mask_list.append("0")

		print("starting comparison of ISA")


		match = 0
		counter_match = 0
		total_cunters = 0
		
		list_results_ISAs_effects = []
		ISA_hist = []

		for i in range(0, len(total_new_mask_list)):

			if ('X' not in total_new_mask_list[i]) and ('x' not in total_new_mask_list[i]):

				if (len(total_mask_list[i]) == 12) and (str(total_mask_list[i][11]) != "0000000000000000"):

					value_x = bin(int(total_new_mask_list[i], 16))[2:].zfill(64)
					
					for j in range(0, isa_counter):
					
						for k in range(1, len(ISA[j])):
		#					print( "value of K:" + str(k) + " " + str(ISA[j][k]) + " " + str(value_x[k-1]) + " " + str(j) + " " + str(isa_counter) )				
							if ISA[j][k] != 'X':
								if value_x[k-1] == ISA[j][k]:   # j is the index for the number of elements in the ISA, k is the size of each element.
									counter_match = counter_match + 1
#								else:
#									print("mismatch found")
							else:
								counter_match = counter_match + 1

						if counter_match == 64:
#							print("*", counter_match)		# shows if at least was identified by one of the ISAs in the set of the GPU.
							match = match + 1
							counter_match = 0
						else:
#							print("-", counter_match)		# shows if it was not identified as one possible instruction in the ISA.
							counter_match = 0
					#print(" ")
						
					#print(value_x, counter_match, match)
					if (match > 1) or (match == 1):
						match = 0
					else:					
					
						# store the values that reach this point, these are the unidentified or affected by changes in the code.	
						# in this order:  faulty instruction (value_x), mask (total_mask_list[i][11], golden val, faulty val, counter)

#						print(value_x, counter_match, match, total_mask_list[i][11], i, total_gm_list[i][12], total_fm_list[i][12])
						
						small_result = []
						small_result.append( str(value_x) )
						small_result.append( str(total_mask_list[i][11]) )
						small_result.append( total_gm_list[i][12] )
						small_result.append( total_fm_list[i][12] )
						small_result.append( i )
						list_results_ISAs_effects.append( small_result )
						ISA_hist.append( str(bin(int(total_mask_list[i][11], 16))[2:].zfill(64)) )
						
						

						small_list_xxx = []
						small_list_xxx = store_in_list(small_list_xxx, len(small_list_xxx), i, total_mask_list[i][11], "fetch.instruction_out", "invalid_op_code", total_fm_list[i][0])
	#					small_list = store_in_list_test(small_list, len(small_list), i, total_mask_list[i][11], "fetch.instruction_out", "incorrect_operation_code", total_fm_list[i][0], total_fm_list[i][12], total_gm_list[i][12])
						general_structure_operation_errors.append(small_list_xxx)
						
						total_cunters = total_cunters + 1
						match = 0
						
		find_hist(ISA_hist, module, application)
		
		
		# print(list_results_ISAs_effects)
		# print(general_structure_operation_errors)
		
		
		
	elif (module == "decode") or (module == "Decode") or (module == "DECODE"):

		for i in range(0, len(total_mask_list)):
#		for i in range(0, 3000):

			multiple_fault_effect = 0
			small_list = []
			
			# instr_opcode_out:
			if str(total_mask_list[i][10]) != "0":
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][10], "decode.instr_opcode_out", "incorrect_operation_code", total_fm_list[i][0])
				multiple_fault_effect = multiple_fault_effect + 1
			#	print(small_list)

			# instr_subop_out:
			if 	str(total_mask_list[i][11]) != '0':

				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][11], "decode.instr_subop_out", "incorrect_operation_code", total_fm_list[i][0])
			#	print(small_list)
				multiple_fault_effect = multiple_fault_effect + 1
				
			# pred_reg_out:
			if 	str(total_mask_list[i][16]) != '0':

				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][16], "decode.pred_reg_out", "incorrect_operation_code", total_fm_list[i][0])
			#	print(small_list)
				multiple_fault_effect = multiple_fault_effect + 1

			# pred_cond_out:
			if 	str(total_mask_list[i][17]) != "00":
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][17], "decode.pred_cond_out", "incorrect_operation_code", total_fm_list[i][0])
			#	print(small_list)
				multiple_fault_effect = multiple_fault_effect + 1

			# set_pred_reg_out:
			if 	str(total_mask_list[i][18]) != '0':
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][18], "decode.set_pred_reg_out", "incorrect_operation_code", total_fm_list[i][0])
			#	print(small_list)
				multiple_fault_effect = multiple_fault_effect + 1

			# addr_lo_out:
			if 	str(total_mask_list[i][23]) != '0':
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][23], "decode.addr_lo_out", "incorrect_operation_code", total_fm_list[i][0])
			#	print(small_list)
				multiple_fault_effect = multiple_fault_effect + 1

			# addr_reg_out:
			if 	str(total_mask_list[i][24]) != '0':
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][24], "decode.addr_reg_out", "incorrect_operation_code", total_fm_list[i][0])
			#	print(small_list)
				multiple_fault_effect = multiple_fault_effect + 1

			# mov_size_out:
			if 	str(total_mask_list[i][25]) != '0':
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][25], "decode.mov_size_out", "incorrect_operation_code", total_fm_list[i][0])
			#	print(small_list)
				multiple_fault_effect = multiple_fault_effect + 1
				

			# Storage of any possible effect on the "general_structure_operation_errors" structure
			if len(small_list) != 0:
				general_structure_operation_errors.append(small_list)
			#	print(general_structure_operation_errors)
				
#			if multiple_fault_effect > 1:

#				small_list = []
#				small_list.append(i)
#				small_list.append("incorrect_operation_code")
#				list_multiple_cases.append(small_list)
#				multiple_fault_effect = 0
				
				
				

	# pending storing and also case of invalid operation code... Decode.instr_marker_out (build a function for this...)
				
	elif (module == "execute") or (module == "Execute") or (module == "EXECUTE"):
		print("build the functions for the execute")

	elif (module == "warp_unit") or (module == "Warp_unit") or (module == "WARP_UNIT") or (module == "Warp_Unit"):
		
		multiple_fault_effect = 0
		#print("impossible to reach here") # other approach
		
		for i in range(0, len(total_mask_list)):
			
			# program_cntr_out:
			if str(total_mask_list[i][0]) != "00000000":

				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][0], "warp_unit.program_cntr_out", "incorrect_operation_code", total_fm_list[i][0])
				general_structure_operation_errors.append(small_list)
				multiple_fault_effect = multiple_fault_effect + 1


	return (general_structure_operation_errors, list_multiple_cases)



# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------


def analyze_operand_errors(total_mask_list, total_fm_list, total_gm_list, module):

	general_structure_operand_errors = []

	if (module == "fetch") or (module == "Fetch") or (module == "FETCH"):
		# evaluting operand errors:
		for i in range(0, len(total_mask_list)):

			small_list = []
			
			if ( str(total_mask_list[i][8]) != "000" ):
				
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][0], "fetch.gprs_size_out", "incorrect_register_addressed", total_fm_list[i][0])
#				general_structure_operand_errors.append(small_list)

			if ( str(total_mask_list[i][9]) != "000" ):

#				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][9], "fetch.gprs_base_addr_out", "incorrect_register_addressed", total_fm_list[i][0])
#				general_structure_operand_errors.append(small_list)

			if ( str(total_mask_list[i][7]) != "0000" ):

#				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][7], "fetch.shmem_base_addr_out", "incorrect_parallel_parameters", total_fm_list[i][0])

			if len(small_list) != 0:
				general_structure_operand_errors.append(small_list)



	elif (module == "decode") or (module == "Decode") or (module == "DECODE"):

		for i in range(0, len(total_mask_list)):

			small_list = []
			small_list1 = []
			small_list2 = []
			small_list3 = []
			small_list4 = []
			small_list5 = []
			
			# gprs_base_addr_out:				
			if ( str(total_mask_list[i][8]) != "000"):

				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][8], "decode.gprs_base_addr_out", "incorrect_register_addressed", total_fm_list[i][0])
				general_structure_operand_errors.append(small_list)



			# Decode.src1_out:				
			if ( str(total_mask_list[i][43]) != "00000000"):

#					small_list = []
				small_list1 = store_in_list(small_list1, len(small_list1), i, total_mask_list[i][43], "decode.src1_out", "invalid_register", total_fm_list[i][0])
#					general_structure_operand_errors.append(small_list)
				
				
			# Decode.src2_out   	total_mask_list[i][43]
			if ( str(total_mask_list[i][44]) != "00000000"):

#					small_list = []
				small_list1 = store_in_list(small_list1, len(small_list1), i, total_mask_list[i][44], "decode.src2_out", "invalid_register", total_fm_list[i][0])
#					general_structure_operand_errors.append(small_list)

			#Decode.src3_out   					total_mask_list[i][44]
			if ( str(total_mask_list[i][45]) != "00000000"):

#					small_list = []
				small_list1 = store_in_list(small_list1, len(small_list1), i, total_mask_list[i][45], "decode.src3_out", "invalid_register", total_fm_list[i][0])
#					general_structure_operand_errors.append(small_list)

			#Decode.dest_out   	 				total_mask_list[i][45]
			if ( str(total_mask_list[i][46]) != "00000000"):

#					small_list = []
				small_list1 = store_in_list(small_list1, len(small_list1), i, total_mask_list[i][46], "decode.dest_out", "invalid_register", total_fm_list[i][0])
#					general_structure_operand_errors.append(small_list)
			
			if len(small_list1) != 0:
				general_structure_operand_errors.append(small_list1)
			
			
			
			#Decode.imm_hi_out 	 				total_mask_list[i][29]
			if ( str(total_mask_list[i][28]) != "000000"):

#					small_list = []
				small_list2 = store_in_list(small_list2, len(small_list2), i, total_mask_list[i][28], "decode.imm_hi_out", "incorrect_immediate_operand", total_fm_list[i][0])
				general_structure_operand_errors.append(small_list2)

				
			#Decode.shmem_base_addr_out
			if ( str(total_mask_list[i][6]) != "0000"):

#					small_list = []
				small_list3 = store_in_list(small_list3, len(small_list3), i, total_mask_list[i][6], "decode.shmem_base_addr_out", "incorrect_parallel_parameters", total_fm_list[i][0])
#					general_structure_operand_errors.append(small_list3)				

			# gprs_size_out
			if ( str(total_mask_list[i][7]) != "000"):

#					small_list = []
				small_list3 = store_in_list(small_list3, len(small_list3), i, total_mask_list[i][7], "decode.gprs_size_out", "incorrect_parallel_parameters", total_fm_list[i][0])

			if len(small_list3) != 0:
				general_structure_operand_errors.append(small_list3)



	elif (module == "execute") or (module == "Execute") or (module == "EXECUTE"):
		print("build the functions for the execute")
	
	elif (module == "warp_unit") or (module == "Warp_unit") or (module == "WARP_UNIT") or (module == "Warp_Unit"):

		for i in range(0, len(total_mask_list)):

			small_list = []
			small_list1 = []
			
			if ( str(total_mask_list[i][6]) != "000" ):

				# gprs_size_out
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][6], "warp_unit.gprs_size_out", "incorrect_register_addressed", total_fm_list[i][0])
#				general_structure_operand_errors.append(small_list)

			if ( str(total_mask_list[i][7]) != "000" ):
				
				# gprs_base_addr_out
#				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][7], "warp_unit.gprs_base_addr_out", "incorrect_register_addressed", total_fm_list[i][0])
#				general_structure_operand_errors.append(small_list)

			if len(small_list) != 0:
				general_structure_operand_errors.append(small_list)



			if ( str(total_mask_list[i][5]) != "0000" ):
				
				# shmem_base_addr_out
#				small_list = []
				small_list1 = store_in_list(small_list1, len(small_list1), i, total_mask_list[i][5], "warp_unit.shmem_base_addr_out", "incorrect_parallel_parameters", total_fm_list[i][0])
#				general_structure_operand_errors.append(small_list)

			if ( str(total_mask_list[i][8]) != "00" ):
				
				# num_warps_out
#				small_list = []
				small_list1 = store_in_list(small_list1, len(small_list1), i, total_mask_list[i][8], "warp_unit.num_warps_out", "incorrect_parallel_parameters", total_fm_list[i][0])

			if len(small_list1) != 0:
				general_structure_operand_errors.append(small_list1)
				
	return (general_structure_operand_errors)

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def analyze_order_errors(total_mask_list, total_fm_list, total_gm_list, module):

	general_structure_order_errors = []

	if (module == "decode") or (module == "Decode") or (module == "DECODE"):

		for i in range(0, len(total_mask_list)):

			#Decode.flow_opcode_out
			if ( str(total_mask_list[i][14]) != "0"):

				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][14], "decode.flow_opcode_out", "commitment_order_violation", total_fm_list[i][0])
				general_structure_order_errors.append(small_list)
	
	return (general_structure_order_errors)

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------


def analyze_execution_errors(total_mask_list, total_fm_list, total_gm_list, module):

	general_structure_execution_errors = []

	if (module == "fetch") or (module == "Fetch") or (module == "FETCH"):
	# evaluating execution errors:

		for i in range(0, len(total_mask_list)):
		


			if ( str(total_mask_list[i][6]) != "00000000" ):
				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][6], "fetch.current_mask_out", "incorrect_active_threads", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list)
				
			if ( str(total_mask_list[i][4]) != "0" ):

				small_list1 = []
				small_list1 = store_in_list(small_list1, len(small_list1), i, total_mask_list[i][4], "fetch.cta_id_out", "incorrect_active_CTA(block)", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list1)
				
			if ( str(total_mask_list[i][3]) != "0" ):
				small_list2 = []
				small_list2 = store_in_list(small_list2, len(small_list2), i, total_mask_list[i][3], "fetch.warp_lane_id_out", "incorrect_active_line", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list2)
			
			if ( str(total_mask_list[i][2]) != "00" ):
				small_list3 = []
				small_list3 = store_in_list(small_list3, len(small_list3), i, total_mask_list[i][2], "fetch.warp_id_out", "incorrect_active_warp", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list3)


	elif (module == "decode") or (module == "Decode") or (module == "DECODE"):

		for i in range(0, len(total_mask_list)):

			small_list = []
			small_list1 = []
			small_list2 = []
			small_list3 = []
			small_list4 = []
			small_list5 = []
			small_list6 = []
			
			
			# alu_opcode_out
			if ( str(total_mask_list[i][12]) != "00" ):
				
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][12], "decode.alu_opcode_out", "incorrect_functional_unit_used", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# abs_saturate_out
			if ( str(total_mask_list[i][19]) != "0" ):
				
#				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][19], "decode.abs_saturate_out", "incorrect_functional_unit_used", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# cvt_round_out
			if ( str(total_mask_list[i][20]) != "0" ):
				
#				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][20], "decode.cvt_round_out", "incorrect_functional_unit_used", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# cvt_type_out
			if ( str(total_mask_list[i][21]) != "0" ):
				
#				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][21], "decode.cvt_type_out", "incorrect_functional_unit_used", total_fm_list[i][0])
				
				
			if len(small_list) != 0:
				general_structure_execution_errors.append(small_list)



			# current_mask_out
			if ( str(total_mask_list[i][5]) != "00000000" ):
				
#				small_list = []
				small_list1 = store_in_list(small_list1, len(small_list1), i, total_mask_list[i][5], "decode.current_mask_out", "incorrect_active_threads", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list1)

			# cta_id_out
			if ( str(total_mask_list[i][3]) != "0" ):
				
#				small_list = []
				small_list2 = store_in_list(small_list2, len(small_list2), i, total_mask_list[i][3], "decode.cta_id_out", "incorrect_active_CTA", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list2)

			# warp_lane_id_out
			if ( str(total_mask_list[i][2]) != "0" ):
				
#				small_list = []
				small_list3 = store_in_list(small_list3, len(small_list3), i, total_mask_list[i][2], "decode.warp_lane_id_out", "incorrect_active_line", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list3)
			

			# warp_id_out
			if ( str(total_mask_list[i][1]) != "00" ):
				
#				small_list = []
				small_list4 = store_in_list(small_list4, len(small_list4), i, total_mask_list[i][1], "decode.warp_id_out", "incorrect_active_warp", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# mov_opcode_out
			if ( str(total_mask_list[i][13]) != "0" ):
				
#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][13], "decode.mov_opcode_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)


			# src1_mem_type_out
			if ( str(total_mask_list[i][30]) != "0" ):
				
#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][30], "decode.src1_mem_type_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# src2_mem_type_out
			if ( str(total_mask_list[i][31]) != "0" ):
				
#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][31], "decode.src2_mem_type_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# src3_mem_type_out
			if ( str(total_mask_list[i][32]) != "0" ):
				
#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][32], "decode.src3_mem_type_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# src1_mem_opcode_out
			if ( str(total_mask_list[i][34]) != "0" ):
				
#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][34], "decode.src1_mem_opcode_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# src2_mem_opcode_out
			if ( str(total_mask_list[i][35]) != "0" ):
				
#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][35], "decode.src2_mem_opcode_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# src3_mem_opcode_out
			if ( str(total_mask_list[i][36]) != "0" ):
				
#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][36], "decode.src3_mem_opcode_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# src1_data_type_out
			if ( str(total_mask_list[i][39]) != "0" ):
				
#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][39], "decode.src1_data_type_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# src2_data_type_out
			if ( str(total_mask_list[i][40]) != "0" ):
				
#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][40], "decode.src2_data_type_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# src3_data_type_out
			if ( str(total_mask_list[i][41]) != "0" ):

#				small_list = []
				small_list5 = store_in_list(small_list5, len(small_list5), i, total_mask_list[i][41], "decode.src3_data_type_out", "incorrect_memory_source", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			if len(small_list5) != 0:
				general_structure_execution_errors.append(small_list5)




			# dest_mem_type_out
			if ( str(total_mask_list[i][33]) != "0" ):
				
#				small_list = []
				small_list6 = store_in_list(small_list6, len(small_list6), i, total_mask_list[i][33], "decode.dest_mem_type_out", "incorrect_memory_destiny", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)


			# target_addr_out
			if ( str(total_mask_list[i][38]) != "00000" ):
				
#				small_list = []
				small_list6 = store_in_list(small_list6, len(small_list6), i, total_mask_list[i][38], "decode.target_addr_out", "incorrect_memory_destiny", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# dest_data_type_out
			if ( str(total_mask_list[i][42]) != "0" ):
				
#				small_list = []
				small_list6 = store_in_list(small_list6, len(small_list6), i, total_mask_list[i][42], "decode.dest_data_type_out", "incorrect_memory_destiny", total_fm_list[i][0])
#				general_structure_execution_errors.append(small_list)

			# dest_mem_opcode_out
			if ( str(total_mask_list[i][37]) != "0" ):
				
#				small_list = []
				small_list6 = store_in_list(small_list6, len(small_list6), i, total_mask_list[i][37], "decode.dest_mem_opcode_out", "incorrect_memory_destiny", total_fm_list[i][0])
				
			if len(small_list6) != 0:
				general_structure_execution_errors.append(small_list6)



	elif (module == "execute") or (module == "Execute") or (module == "EXECUTE"):
		print("build the functions for the execute")


	elif (module == "warp_unit") or (module == "Warp_unit") or (module == "WARP_UNIT") or (module == "Warp_Unit"):
	
		for i in range(0, len(total_mask_list)):

			# current_mask_out
			if ( str(total_mask_list[i][4]) != "00000000" ):

				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][4], "warp_unit.current_mask_out", "incorrect_active_threads", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list)

			# cta_id_out
			if ( str(total_mask_list[i][3]) != "0" ):
			
				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][3], "warp_unit.cta_id_out", "incorrect_active_CTA", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list)
									
			# warp_lane_id_out
			if ( str(total_mask_list[i][2]) != "0" ):

				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][2], "warp_unit.warp_lane_id_out", "incorrect_active_line", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list)


			# warp_id_out
			if ( str(total_mask_list[i][1]) != "00" ):

				small_list = []
				small_list = store_in_list(small_list, len(small_list), i, total_mask_list[i][1], "warp_unit.warp_id_out", "incorrect_active_warp", total_fm_list[i][0])
				general_structure_execution_errors.append(small_list)


	return(general_structure_execution_errors)
	
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

# output format for the gm and fm lists:  [detection time] [primary outputs according to the dictionary report]

def split_dictionary(total_lines, dic_file_1, total_output_ports, total_gm_list, total_fm_list, total_fault_list):
	
	close_read_procedure = 0
	output_ports_collected = 0
	
	for lines_in_file in range(0, total_lines):

		linex = dic_file_1.readline()

		# collection of the output ports (strobes for fault detection)
		if output_ports_collected == 0:
			if "Pins{" in linex:		# extraction of the output pins of the target module:
				while (output_ports_collected != 1):

					linex = dic_file_1.readline()
				
					if "}" in linex:
						output_ports_collected = 1
					else:
						words = linex.split()
						port = words[1].replace(';','')
						port = port.replace('"','')
						total_output_ports.append(port)

		# collection of error effects:
		if ("    [" in linex) and ("ns" in linex):
			# this is the target line describing the starting of the detection of fault or faults:

			# check if there is any effect:
			if "]" not in linex:	# if there is an effect there must be one or more lines showing the effect.

				#extraction of the time (use already present function)
				detection_time = int(find_substr(linex))
				#print("el tiempo de detecction is: " + str(detection_time))
				gm_list=[]
				fm_list=[]

				# new read
				close_read_procedure = 0

				# storing the detection time:
				gm_list.append(detection_time)
				fm_list.append(detection_time)

				while(close_read_procedure !=1):

					linex = dic_file_1.readline()
					#extraction of the Golden machine values: (store in dictionary, so it is possible to address later the comparison in parts)
					if ("GM:" in linex):
						splited_words = linex.split()
						gm_start = 0
						for i in range (0, len(splited_words)):
							if gm_start == 1:
								gm_list.append(splited_words[i])

							if "GM" in splited_words[i]:
								gm_start = 1

					linex = dic_file_1.readline()

					if ("]" in linex):		# it means, it is the last one of the lines containing info.
						close_read_procedure = 1
					else:
						close_read_procedure = 0
					
					if ("FM:" in linex):
						splited_words = linex.split()
						fm_start = 0

						for i in range (0, len(splited_words)):
							if fm_start == 1:
								if "]" not in splited_words[i]:			# just to be sure the last symbol is not included as part of the list
									fm_list.append(splited_words[i])
							if "FM" in splited_words[i]:
								fm_start = 1
								
					# check if a new line must be read..
				
				# checking the HW faults that where detected and produced the observed error effect:
				collected_faults = 0
				fault_collected_list = []
				
				while(collected_faults != 1):
				
					linex = dic_file_1.readline()
					
					if ("{"  in linex) and ("}" in linex):
						collected_faults = 0
#						print(linex)
						linex1 = linex.replace("\"","")
						linex1 = linex1.replace("}","")
						linex1 = linex1.replace("{","")
						linex1 = linex1.replace("\n","")
						linex1 = linex1.replace("PORT","")
						
#						print(linex1)
						words = linex1.split()

						try:
							clear_value = words[3]
							
						except IndexError:
							clear_value = ""
						
#						print(words)
						
						clear_value = words[2] + clear_value
						
						fault_collected_list.append(words[0])						# Type of detection
						fault_collected_list.append(words[1])						# state of the detection
						fault_collected_list.append(clear_value)			# Specific location of the fault detected
						fault_collected_list.append(";")			# Specific location of the fault detected
						
					else:
						collected_faults = 1
						
						
				total_gm_list.append(gm_list)
				total_fm_list.append(fm_list)
				total_fault_list.append(fault_collected_list)
				
				
#					print("GM: " + str(gm_list))
#					print("FM: " + str(fm_list))

	return (total_gm_list, total_fm_list, total_output_ports, total_fault_list)

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def print_list_to_file(total_gm_list, name):
	
	file = open(name, 'w')
	
	for i in range (0, len(total_gm_list)):
		file.write(str(total_gm_list[i]) + "\n")
	file.close()
	
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def remove_hanging_values(total_fm_list, total_gm_list, total_fault_list):

	index_list = []
	new_index_list = []
	
	hanging_list_FM = []
	hanging_list_GM = []
	hanging_list_HW_faults = []
	
	elements_FM = len(total_fm_list)
	elements_GM = len(total_gm_list)
	#print("total elements FM: " + str(elements_FM) + " total elements GM: " + str(elements_GM))
	stored_output_GM = 0

	# removing X cases from the faulty lists:
	if elements_FM == elements_GM:		# check sizes of the input lists

		for stored_output in range (0, elements_FM):
		
			for output in total_fm_list[stored_output]:
			# print("Element to evalute: " + str(stored_output)  + " xxx " +  str(output))
			
				# checking if the XX condition is in the faulty:
				if ('X' in str(output)) or ('x' in str(output)):
				
					# store in the hanging effects in a new list for later analysis (a colateral classification)
					hanging_list_FM.append(total_fm_list[stored_output])
					hanging_list_GM.append(total_gm_list[stored_output])
					hanging_list_HW_faults.append(total_fault_list[stored_output])

					if stored_output not in index_list:			# only store the indices of the locations. The repeated ones are not stored
						index_list.append(stored_output)
					
	#				print("there are hanging in the output: " + str(output) + ", comming from :" + str(stored_output) )
	else:
		print("Removal from faulty file, there is a mismatch in the size of the golden and faulty list, please check the files")


# #	print("TGM: " + str(total_fm_list))

	# Remove hanging cases from the original complete list
	for j in range(len(index_list)-1, -1, -1):		# Checks the condition for the limits...
		del total_fm_list[index_list[j]]
		del total_gm_list[index_list[j]]
		del total_fault_list[index_list[j]]
# 	print(str(j), str(index_list[j]))

	# removing X from the golden files: (it could be possible when the golden sim also generates cases of XXX, by normal behavior of the simulation)

	elements_FM = len(total_fm_list)
	elements_GM = len(total_gm_list)
	#print("total elements FM: " + str(elements_FM) + " total elements GM: " + str(elements_GM))
	stored_output_GM = 0
	
	if elements_FM == elements_GM:		# check sizes of the input lists

		for stored_output in range (0, elements_FM):
		
			for output in total_gm_list[stored_output]:
			# print("Element to evalute: " + str(stored_output)  + " xxx " +  str(output))
			
				# checking if the XX condition is in the faulty:
				if ('X' in str(output)) or ('x' in str(output)):
				
					# store in the hanging effects in a new list for later analysis (a colateral classification)
					hanging_list_FM.append(total_fm_list[stored_output])
					hanging_list_GM.append(total_gm_list[stored_output])
					hanging_list_HW_faults.append(total_fault_list[stored_output])
					
					if stored_output not in new_index_list:			# only store the indices of the locations. The repeated ones are not stored
						new_index_list.append(stored_output)
					
	#				print("there are hanging in the output: " + str(output) + ", comming from :" + str(stored_output) )
	else:
		print("Removal from golden file, there is a mismatch in the size of the golden and faulty list, please check the files")

# #	print("TGM: " + str(total_fm_list))

	# Remove hanging cases from the original complete list
	
	print( str(len(total_fault_list)) , str(len(total_fm_list)), str(len(total_gm_list)) )

	for j in range(len(new_index_list)-1, -1, -1):		# Checks the condition for the limits...
		del total_fm_list[new_index_list[j]]
		del total_gm_list[new_index_list[j]]
		del total_fault_list[new_index_list[j]]
# 	print(str(j), str(new_index_list[j]))


	if (check_list(total_gm_list) == 0) and (check_list(total_fm_list) == 0):			# if zero, it means that the removal procedure was correct.
		return (total_fm_list, total_gm_list, total_fault_list, hanging_list_FM, hanging_list_GM, hanging_list_HW_faults)
	else:
		print("There is an error in the removal of the XXX outputs from the golden or faulty lists")
		return ('0', '0', '0', hanging_list_FM, hanging_list_GM, hanging_list_HW_faults)
		

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def remove_no_fault_Effects(total_fm_list, total_gm_list, total_fault_list, name_strobes):

	# find the normal number of elements according to the strobes:
	file_strobes = open(name_strobes , 'r')
	
	total_ports = 0
	counter_ports = 0

	for line in file_strobes:
		if '[' and ']' in line:
			new_line = line.split('[')
			value = new_line[1].split(':')
			value_int = int(value[0])
			value_int = value_int + 1		# to include the case of the zero port (port(0))
			total_ports = total_ports + value_int
			
#			print(line, value_int)
		else:
			total_ports = total_ports + 1
			
		counter_ports = counter_ports + 1
			
	#print(total_ports, counter_ports)
	
	index_list = []
	
	for i in range (0, len(total_fm_list)):
	
		if ( (len(total_fm_list[i]) < (counter_ports - 2)) or (len(total_fm_list[i]) > (counter_ports + 2)) ):
			index_list.append(i)

	for j in range(len(index_list)-1, -1, -1):		# Checks the condition for the limits...
		del total_fm_list[index_list[j]]
		del total_gm_list[index_list[j]]
		del total_fault_list[index_list[j]]
		
	return (total_fm_list, total_gm_list, total_fault_list)


# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def analyze_detections_per_subgroup(global_structure, type):
	total_number = 0
	
	total_index_set = set()
	
#	print(len(global_structure))
#	print(global_structure[0][0])
	
	for i in range (0, len(global_structure)):
	
		for j in range (0, len(global_structure[i])):

#			print(i, j, global_structure[i][j], global_structure[i][j][0])

			if global_structure[i][j][type] not in total_index_set:
				total_index_set.add(global_structure[i][j][type])
			
	total_number = len(total_index_set)

	return total_number


# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def analyze_detections_per_subgroup_operands(global_structure, type):
	total_number = 0
	
	total_index_set = set()
	
#	print(len(global_structure))
#	print(global_structure[0][0])
	
	for i in range (0, len(global_structure)):
	
#			print(i, j, global_structure[i][j], global_structure[i][j][0])

			if global_structure[i][type] not in total_index_set:
				total_index_set.add(global_structure[i][type])
			
	total_number = len(total_index_set)

	return total_number

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def search_operation_subgroups(global_general_structure_operation_errors):

	number_incorrect_op_code = 0
	number_invalid_op_code = 0
	
	for i in range (0, len(global_general_structure_operation_errors)):
	
		for j in range (0, len(global_general_structure_operation_errors[i])):

			if "incorrect_operation_code" in global_general_structure_operation_errors[i][j][1]:
				number_incorrect_op_code = number_incorrect_op_code + 1

			elif "invalid_op_code" in global_general_structure_operation_errors[i][j][1]:		# Pending to add in the analysis function.
				number_invalid_op_code = number_invalid_op_code + 1

	
	return(number_incorrect_op_code, number_invalid_op_code)

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def search_operand_subgroups(global_general_structure_operand_errors):

	number_incorrect_register_addressed = 0
	number_incorrect_parallel_parameters = 0
	number_invalid_register = 0
	number_incorrect_immediate_operand = 0
	
	for i in range (0, len(global_general_structure_operand_errors)):
	
			if "incorrect_register_addressed" in global_general_structure_operand_errors[i][1]:
				number_incorrect_register_addressed = number_incorrect_register_addressed + 1

			elif "incorrect_parallel_parameters" in global_general_structure_operand_errors[i][1]:		# Pending to add in the analysis function.
				number_incorrect_parallel_parameters = number_incorrect_parallel_parameters + 1

			elif "invalid_register" in global_general_structure_operand_errors[i][1]:		# Pending to add in the analysis function.
				number_invalid_register = number_invalid_register + 1

			elif "incorrect_immediate_operand" in global_general_structure_operand_errors[i][1]:		# Pending to add in the analysis function.
				number_incorrect_immediate_operand = number_incorrect_immediate_operand + 1
	
	return(number_incorrect_register_addressed, number_incorrect_parallel_parameters, number_invalid_register, number_incorrect_immediate_operand)


# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def search_order_subgroups(global_general_structure_order_errors):

	number_commitment_order_violation = 0
	
	for i in range (0, len(global_general_structure_order_errors)):
	
			if "commitment_order_violation" in global_general_structure_order_errors[i][1]:
				number_commitment_order_violation = number_commitment_order_violation + 1
	
	return (number_commitment_order_violation)

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def search_execution_subgroups(global_general_structure_execution_errors):

	number_incorrect_active_threads = 0
	number_incorrect_active_CTA = 0
	number_incorrect_active_line = 0
	number_incorrect_active_warp = 0
	number_incorrect_functional_unit_used = 0
	number_incorrect_memory_source = 0
	number_incorrect_memory_destiny = 0

	for i in range (0, len(global_general_structure_execution_errors)):
	
			if "incorrect_active_threads" in global_general_structure_execution_errors[i][1]:
				number_incorrect_active_threads = number_incorrect_active_threads + 1
				
			elif "incorrect_active_CTA" in global_general_structure_execution_errors[i][1]:
				number_incorrect_active_CTA = number_incorrect_active_CTA + 1
				
			elif "incorrect_active_line" in global_general_structure_execution_errors[i][1]:
				number_incorrect_active_line = number_incorrect_active_line + 1

			elif "incorrect_active_warp" in global_general_structure_execution_errors[i][1]:
				number_incorrect_active_warp = number_incorrect_active_warp + 1

			elif "incorrect_functional_unit_used" in global_general_structure_execution_errors[i][1]:
				number_incorrect_functional_unit_used = number_incorrect_functional_unit_used + 1

			elif "incorrect_memory_source" in global_general_structure_execution_errors[i][1]:
				number_incorrect_memory_source = number_incorrect_memory_source + 1
	
			elif "incorrect_memory_destiny" in global_general_structure_execution_errors[i][1]:
				number_incorrect_memory_destiny = number_incorrect_memory_destiny + 1
	
	return (number_incorrect_active_threads, number_incorrect_active_CTA, number_incorrect_active_line, number_incorrect_active_warp, number_incorrect_functional_unit_used, number_incorrect_memory_source, number_incorrect_memory_destiny)


# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def search_instruction(global_line_list, total_list):
	execution_time = int(global_line_list[3])					# Extracting the execution time.	
	found = 0
#	print(global_line_list, execution_time)
	
	for i in range (0, len(total_list)):
		
		low_limit = int(total_list[i][2])
		high_limit = int(total_list[i][3])
#		print(low_limit, high_limit)
		if (execution_time >= low_limit) and (execution_time <= high_limit):
			found_instruction = total_list[i][0]
			found = 1
#			print("entered", total_list[i][0])

	if found == 0:
		# this is the last case: RET	
#		print(global_line_list)
		found_instruction = total_list[len(total_list)-1][0]
	
	return(found_instruction)




# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def find_list_of_executed_instructions(module, official_starting_time, official_kernel_op_time):

	address_profiler_name = "/home/e.rodriguez/intruction_level_ers/TB/" + str(module) + "/instruction_logger.log"
	sass_instructions_name = "/home/e.rodriguez/intruction_level_ers/TB/4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/TP_instructions.vhd"
	
	sass_file = open(sass_instructions_name, 'r')

	# finding the sass instructions:

	list_instructions = []

#	if module != "warp_unit":
	small_list = []
	small_list.append("0000") 						# starting address
	small_list.append("config")						# instruction nemonic	
	list_instructions.append(small_list)			# only for the first element in order to include the config phase in the GPU.

	
	for line in sass_file:
		if "--" in line:			# one instructions is in the line:
			words = line.split()
			if str(words[7]) != 'RET':
				if '.' in words[8]:
					sub_words_x = words[8].split('.')
					sub_words = sub_words_x[0]
				else:
					sub_words = words[8]
#				print( str(words[7]) + " " + str(sub_words) )
				small_list = []
				small_list.append(str(words[7]))		# address PC
				small_list.append(str(sub_words))	 	# nemonic	
								
				list_instructions.append(small_list)
			
			
	len_x = len(list_instructions)
	last_adress = int('0x' + str(list_instructions[len_x - 1][0]), base=16)
	small_list = []
	last_adress_h = hex(last_adress + 8)
	last_add = str(last_adress_h)
	last_add = last_add.replace('x', '0')
	
	small_list.append( str(last_add) )
	small_list.append("RET")
	list_instructions.append(small_list)

	print("SASS instructions:")
	print(len(list_instructions))
	print(list_instructions)

	
	# open the logger report and extract the execution times:
	
	address_profiler = open(address_profiler_name, 'r')
	
	list_address_profiler = []
	
	first_time = 1

	if module != "warp_unit":
		first_time  = 1 
		simple_list = []
		simple_list.append("0")   			# time
		simple_list.append("FFFFFFFF")  	# PC
		list_address_profiler.append(simple_list)
	
	set_list = set()
	
	for line in address_profiler:
	
		if "XX" not in line:
			words = line.split()
		#	print(words[0], words[1])
			
			if first_time == 1:
				first_time = 2			
				if module == "warp_unit":
					simple_list = []
					simple_list.append(words[0])   			# time
					simple_list.append("FFFFFFFF")  	# PC
					list_address_profiler.append(simple_list)
					
				else:
					first_time = 2
					simple_list = []
					simple_list.append(str(   int( (official_starting_time)/10.0 ) ))   			# time
					simple_list.append(words[1])  	# PC
					list_address_profiler.append(simple_list)
			else:
		
				if not words[0] in set_list:			# The set only helps to check that not repeated times are added to the list
					set_list.add(words[0])
			
					simple_list = []
					simple_list.append(words[0])   		# Time
					simple_list.append(words[1])  		# PC
					list_address_profiler.append(simple_list)
			

	print("logger ins:")
	print(len(list_address_profiler))
	print(list_address_profiler)
	
	
	# building the total list to relate the execution times with the instructions.
	
	# biulding execution times
	total_list = []
	
	list_times = []
	
	# add the starting time for the config of the GPU:	
	
	for i in range (0, len(list_address_profiler)-1):
		local_l = []

		if i < len(list_address_profiler)-2:
			local_l.append( str(int(list_address_profiler[i][0])*10) )				# (*10) to express in ns
			local_l.append( str(  (int(list_address_profiler[i+1][0])*10) - 1 ) )
		else:
			local_l.append( str(int(list_address_profiler[i][0])*10) )
			local_l.append( str( int(official_kernel_op_time) ))
		list_times.append(local_l)

	print("logger times")
	print(len(list_times))
	print(list_times)
	
	# correlating the logger values with the SASS ins:

	starting_val = 1
	

	mini_list_x = []
				# the case of the configuration case:
	mini_list_x.append( list_instructions[0][1] )		# instruction nemonic
	mini_list_x.append( list_instructions[0][0] )		# address
	mini_list_x.append( list_times[0][0] )			# starting execution time of instruction
	mini_list_x.append( list_times[0][1] )			# end execution time of instruction
	total_list.append(mini_list_x)
	
	
	for i in range (0, len(list_address_profiler)-1):
	
		for j in range (starting_val, len(list_instructions) ):

			#print( int(list_address_profiler[i][1], 16) , int(list_instructions[j][0], 16) )

			if (int(list_address_profiler[i][1], 16) == int(list_instructions[j][0], 16)):		# compare the PC counter to identify the instruction
				# there is a match: store the combination:
		
				mini_list = []
		
				mini_list.append( list_instructions[j][1] )		# instruction nemonic
				mini_list.append( list_instructions[j][0] )		# address
				
				mini_list.append( list_times[i][0] )			# starting execution time of instruction
				mini_list.append( list_times[i][1] )			# end execution time of instruction
				
				total_list.append(mini_list)
				
	print("complete list of instructions for the app:")
	print(len(total_list))
	print(total_list)
	sass_file.close()
	
	return(total_list)

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

# This function works in two steps:
# Collect original instructions from the program (SASS). this SASS must contain the PC in order to recognize them during classification.
# extraction the values from HW logger
# Comparison...

def Analyze_instructions_effects_operation(file_name_report, total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, global_general_structure_operation_errors, module, official_starting_time, official_kernel_op_time):

	total_list = []
	
	(total_list) = find_list_of_executed_instructions(module, official_starting_time, official_kernel_op_time)

	# Dividing each case of the classified faults:
	# global_general_structure_operation_errors, 
	# global_general_structure_operand_errors, 
	# global_general_structure_order_errors, 
	# global_general_structure_execution_errors

	store_str_list_in_file(total_list, file_name_report + "_test.txt")

	
	# list of all detected instructions per general structure:
	total_instructions = dict()
	# inst_detected[type_classified] = counter
	# inst_detected[type_classified] = inst_detected[type_classified] + 1
	
	for i in range (0, len(global_general_structure_operation_errors[0]) ):
	
		instruction_found = search_instruction(global_general_structure_operation_errors[0][i], total_list)		# only happened with global_general_structure_operation_error, other is only []
		
		#print(instruction_found)
		
		key = global_general_structure_operation_errors[0][i][1] # only happened with global_general_structure_operation_error, other is only [][]

		if (instruction_found in total_instructions):
		
			if (key) in total_instructions[instruction_found]:
				# increase the value:
		#		print(total_instructions[instruction_found],  total_instructions[instruction_found][key] )
				
				total_instructions[instruction_found][key] = total_instructions[instruction_found][key] + 1
				
			else: # add the new case:
				# global_general_structure_operation_errors[i][1] is the type of classification:
				total_instructions[instruction_found][key] = 1

				
		else:	# add the new case:
			# creating empty dict to contain all the classification types:
			total_instructions[instruction_found] = {}
			total_instructions[instruction_found][key] = 1

#	print(total_instructions)
	
	file_to_open = open(file_name_report, 'w')
	
	for key_ins in total_instructions:
		for key_type in total_instructions[key_ins]:
			file_to_open.write( str(key_ins) + " " + str(key_type) + " " + str(total_instructions[key_ins][key_type]) + "\n" )
#			print(key_ins, key_type, total_instructions[key_ins][key_type])
	file_to_open.close()
	

#	print(total_instructions[instruction_found], total_instructions[instruction_found][key])
	return(total_list)


# ---------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------


def Analyze_instructions_effects(file_name_report, total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, global_general_structure_operation_errors, module, official_starting_time, official_kernel_op_time):
	
	total_list = []
	(total_list) = find_list_of_executed_instructions(module, official_starting_time, official_kernel_op_time)
	
	# Dividing each case of the classified faults:
	# global_general_structure_operation_errors, 
	# global_general_structure_operand_errors, 
	# global_general_structure_order_errors, 
	# global_general_structure_execution_errors
	store_str_list_in_file(total_list, file_name_report + "_test.txt")
	
	# list of all detected instructions per general structure:
	total_instructions = dict()
	# inst_detected[type_classified] = counter
	# inst_detected[type_classified] = inst_detected[type_classified] + 1
#	print("XXXX")

#	print(len(global_general_structure_operation_errors))
	
	for i in range (0, len(global_general_structure_operation_errors) ):
	
		instruction_found = search_instruction(global_general_structure_operation_errors[i], total_list)		# only happened with global_general_structure_operation_error, other is only []
		
#		print(instruction_found)
		
		key = global_general_structure_operation_errors[i][1] # only happened with global_general_structure_operation_error, other is only [][]
		
		if (instruction_found in total_instructions):
		
			if (key) in total_instructions[instruction_found]:
				# increase the value:
#				print(total_instructions[instruction_found],  total_instructions[instruction_found][key] )
				
				total_instructions[instruction_found][key] = total_instructions[instruction_found][key] + 1
				
			else: # add the new case:
				# global_general_structure_operation_errors[i][1] is the type of classification:
				total_instructions[instruction_found][key] = 1

				
		else:	# add the new case:
			# creating empty dict to contain all the classification types:
			total_instructions[instruction_found] = {}
			total_instructions[instruction_found][key] = 1
		

#	print(total_instructions)
	
	file_to_open = open(file_name_report, 'w')
	
	for key_ins in total_instructions:
		for key_type in total_instructions[key_ins]:
			file_to_open.write( str(key_ins) + " " + str(key_type) + " " + str(total_instructions[key_ins][key_type]) + "\n" )
#			print(key_ins, key_type, total_instructions[key_ins][key_type])
	file_to_open.close()


	return(total_list)
	
#	print(total_instructions[instruction_found], total_instructions[instruction_found][key])
#	return(total_instructions)


# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def search_instruction_from_hanging(global_line_list, total_list):
	execution_time = int(global_line_list[0])					# Extracting the execution time.
	found = 0
#	print(global_line_list, execution_time)
	
	for i in range (0, len(total_list)):
		
		low_limit = int(total_list[i][2])
		high_limit = int(total_list[i][3])
#		print(low_limit, high_limit)
		if (execution_time >= low_limit) and (execution_time <= high_limit):
			found_instruction = total_list[i][0]
			found = 1
#			print("entered", total_list[i][0])

	if found == 0:
		# this is the last case: RET
#		print(global_line_list)
		found_instruction = total_list[len(total_list)-1][0]
	
	return(found_instruction)

# ---------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------

def	analyze_true_hangs(hanging_list_FM, hanging_list_GM, total_instruction_list, file_name_hanging_report, module):
	
	list_true_hanging = []
	checker = 0
	counter_true_hanging = 0
	counter_false_hanging = 0
	
	for i in range(0, len(hanging_list_FM)):
	
		for j in range (0, len(hanging_list_FM[i])):
			
			if ("X" in str(hanging_list_GM[i][j])) or ("x" in str(hanging_list_GM[i][j])):
				checker = 1
			
		if checker == 0:
			list_true_hanging.append(hanging_list_FM[i])
			counter_true_hanging = counter_true_hanging + 1
		else:
			counter_false_hanging = counter_false_hanging + 1
			
		checker = 0												# restart the flag.
	
	print("total true hanging cases: " + str(counter_true_hanging) )
	print("total false hanging cases: " + str(counter_false_hanging) )
	
	name = module + "/hanging_true.txt"
	print_list_to_file(list_true_hanging, name)
	
	# search the instructions causing hanging:
	total_instructions = dict()
	
	for i in range (0, len(list_true_hanging)):
		instruction_found = search_instruction_from_hanging(list_true_hanging[i], total_instruction_list)		
#		print(instruction_found)
		
		key = "hanging"
		if (instruction_found in total_instructions):
		
			if (key) in total_instructions[instruction_found]:
				# increase the value:
		#		print(total_instructions[instruction_found],  total_instructions[instruction_found][key] )
				
				total_instructions[instruction_found][key] = total_instructions[instruction_found][key] + 1
				
			else: # add the new case:
				# global_general_structure_operation_errors[i][1] is the type of classification:
				total_instructions[instruction_found][key] = 1

				
		else:	# add the new case:
			# creating empty dict to contain all the classification types:
			total_instructions[instruction_found] = {}
			total_instructions[instruction_found][key] = 1
		
#	print(total_instructions)

	file_to_open = open(file_name_hanging_report, 'a')
	
	for key_ins in total_instructions:
		for key_type in total_instructions[key_ins]:
			file_to_open.write( str(key_ins) + " " + str(key_type) + " " + str(total_instructions[key_ins][key_type]) + "\n" )
#			print(key_ins, key_type, total_instructions[key_ins][key_type])
	file_to_open.close()
	
	#return()

# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def analyze_binaries(total_mask_list, global_general_structure_operation_errors, global_general_structure_operand_errors, global_general_structure_order_errors, global_general_structure_execution_errors, module):
	
	# general analysis:
	general_total_number = 0
	general_local_array = dict()
	for i in range(0, len(total_mask_list)):
		for j in range( 0, len(total_mask_list[i]) ):
		
			mask = "0x" + str( total_mask_list[i][j] )
			hex_mask = int(mask, 16)
			total_number = int(bin(hex_mask).count('1'))
			
			general_total_number = general_total_number + total_number
			
		if general_total_number in general_local_array:
			general_local_array[general_total_number] = general_local_array[general_total_number] + 1
		else:
			general_local_array[general_total_number] = 1			# new counter, started in one
		general_total_number = 0

	print(general_local_array)
	
	
	file_name_report = 	module + "/general_binary_distribution.txt"
	
	file_to_open = open(file_name_report, 'w')
	
	for general_total_number in general_local_array:
			file_to_open.write( str(general_total_number) + " " + str( general_local_array[general_total_number] ) + "\n" )
#			print(key_ins, key_type, total_instructions[key_ins][key_type])
	file_to_open.close()
				
				
	# local classification analysis:
	local_array = dict()
	for i in range(0, len(global_general_structure_operation_errors[0]) ):

		mask = "0x" + str( global_general_structure_operation_errors[0][i][2] ) 
		hex_mask = int(mask, 16)
		total_number = int(bin(hex_mask).count('1'))
		# Fill the dictionary with the value:
		if total_number in local_array:
			local_array[total_number] = local_array[total_number] + 1
		else:
			local_array[total_number] = 1			# new counter, started in one
			
	print(local_array)


	file_name_report = 	module + "/individual_bin_distribution_operation_errors.txt"
	
	file_to_open = open(file_name_report, 'w')
	
	for total_number in local_array:
			file_to_open.write( str(total_number) + " " + str( local_array[total_number] ) + "\n" )
#			print(key_ins, key_type, total_instructions[key_ins][key_type])
	file_to_open.close()


	local_array2 = dict()		
	for i in range(0, len(global_general_structure_operand_errors) ):
	
		mask = ("0x" + str( global_general_structure_operand_errors[i][2] ) )
		hex_mask = int(mask, 16)
		total_number = bin(hex_mask).count('1')

		if total_number in local_array2:
			local_array2[total_number] = local_array2[total_number] + 1
		else:
			local_array2[total_number] = 1			# new counter, started in one
	

	print(local_array2)

	file_name_report = 	module + "/individual_bin_distribution_operand_errors.txt"
	
	file_to_open = open(file_name_report, 'w')
	
	for total_number in local_array2:
			file_to_open.write( str(total_number) + " " + str( local_array2[total_number] ) + "\n" )
#			print(key_ins, key_type, total_instructions[key_ins][key_type])
	file_to_open.close()




	
	local_array3 = dict()		
	for i in range(0, len(global_general_structure_order_errors) ):
	
		mask = ("0x" + str( global_general_structure_order_errors[i][2] ) )
		hex_mask = int(mask, 16)
		total_number = bin(hex_mask).count('1')

		if total_number in local_array3:
			local_array3[total_number] = local_array3[total_number] + 1
		else:
			local_array3[total_number] = 1			# new counter, started in one
	
	print(local_array3)

	file_name_report = 	module + "/individual_bin_distribution_order_errors.txt"
	
	file_to_open = open(file_name_report, 'w')
	
	for total_number in local_array3:
			file_to_open.write( str(total_number) + " " + str( local_array3[total_number] ) + "\n" )
#			print(key_ins, key_type, total_instructions[key_ins][key_type])
	file_to_open.close()





		
	local_array4 = dict()		
	for i in range(0, len(global_general_structure_execution_errors) ):
	
		mask = ("0x" + str( global_general_structure_execution_errors[i][2] ) )
		hex_mask = int(mask, 16)
		total_number = bin(hex_mask).count('1')

		if total_number in local_array4:
			local_array4[total_number] = local_array4[total_number] + 1
		else:
			local_array4[total_number] = 1			# new counter, started in one
	
	print(local_array4)


	file_name_report = 	module + "/individual_bin_distribution_execution_errors.txt"
	
	file_to_open = open(file_name_report, 'w')
	
	for total_number in local_array4:
			file_to_open.write( str(total_number) + " " + str( local_array4[total_number] ) + "\n" )
#			print(key_ins, key_type, total_instructions[key_ins][key_type])
	file_to_open.close()
	


# ---------------------------------------------------------------------------------------------------------------------------
def identify_HW_faults(global_general_structure, total_fault_list):

	total_HW_faults = 0
	general_struct = []
	
	limit = len(global_general_structure)
	if limit == 2:
		dummy_extract = global_general_structure[0]
		limit = len(dummy_extract)
		general_struct = global_general_structure[0]
	else:
		general_struct = global_general_structure
			
#	print(limit)

	for i in range (0, limit):
		line = general_struct[i]
		
#		print(line)
		
		index = line[0]
#		print(index)
		
		HW_faults = total_fault_list[index]

		len_HW_faults = len(HW_faults)
		for j in range (0, len_HW_faults):
			if ";" in HW_faults[j]:
				total_HW_faults = total_HW_faults + 1

	return (total_HW_faults)

# ---------------------------------------------------------------------------------------------------------------------------

def determine_HW_errors_trend(total_fault_list_no_XXX_no_masked, global_general_structure_operation_errors, global_general_structure_operand_errors, global_general_structure_order_errors, global_general_structure_execution_errors, hanging_list_HW_faults, name):
	
	file_to_store = open(name, 'w')
	
	len_operation_errors = len(global_general_structure_operation_errors[0])
	len_operand_errors = len(global_general_structure_operand_errors)
	len_order_errors = len(global_general_structure_order_errors)
	len_execution_errors = len(global_general_structure_execution_errors)
	len_hanging_faults = len(hanging_list_HW_faults)
	
	total_faults_operation = 0
	total_faults_operand = 0
	total_faults_order = 0
	total_faults_execution = 0
	
	total_faults_operation = identify_HW_faults(global_general_structure_operation_errors, total_fault_list_no_XXX_no_masked)
	total_faults_operand = identify_HW_faults(global_general_structure_operand_errors, total_fault_list_no_XXX_no_masked)
	total_faults_order = identify_HW_faults(global_general_structure_order_errors, total_fault_list_no_XXX_no_masked)
	total_faults_execution = identify_HW_faults(global_general_structure_execution_errors, total_fault_list_no_XXX_no_masked)
	
	total_Values_HW = total_faults_operation + total_faults_operand + total_faults_order + total_faults_execution
	total_Values_sort_errors = len_operation_errors + len_operand_errors + len_order_errors + len_execution_errors + len_hanging_faults
	
#	hanging_list_HW_faults
	file_to_store.write("Software errors, HW faults\n")
	file_to_store.write("operation: " + str(len_operation_errors) + " " + str(total_faults_operation) + "\n")
	file_to_store.write("operand: " + str(len_operand_errors) + " " + str(total_faults_operand) + "\n")
	file_to_store.write("order: " + str(len_order_errors) + " " + str(total_faults_order) + "\n")
	file_to_store.write("execution: " + str(len_execution_errors) + " " + str(total_faults_execution) + "\n")
	file_to_store.write("hanging: " + str(len_hanging_faults) + " " + str(len_hanging_faults) + "\n")
	file_to_store.write("-----------------------------------------------------\n")
	file_to_store.write("Total: " + str(total_Values_sort_errors) + " " + str(total_Values_HW) + "\n")
	
	file_to_store.close()
	
	
	

	
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# Main function performing all analyzes of a given module......
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def principal_analyzer(input_target, application, official_starting_time, official_kernel_op_time):

	print("Extraction of fault effects from the dictionary fault...")

	taget_folder = input_target
	dictionary_file_name = taget_folder + "/" +  application + "/saf_dic_long.txt"
	dic_file = open(dictionary_file_name, 'r')

	general_output_report = open(taget_folder + "/" +  application + "/general_output_results.txt", 'w')

	output_ports_collected = 0

	total_lines = 0

	for line in dic_file:
		total_lines = total_lines + 1
	dic_file.close()

	total_output_ports=[]
	
	total_fault_list =[]
	total_fault_list_no_XXX=[]
	total_fault_list_no_XXX_no_masked=[]
	
	total_gm_list=[]
	total_gm_list_no_XXX=[]
	total_gm_list_no_XXX_no_masked=[]
	
	total_fm_list=[]
	total_fm_list_no_XXX=[]
	total_fm_list_no_XXX_no_masked=[]
	
	dic_file_1 = open(dictionary_file_name, 'r')

	(total_gm_list, total_fm_list, total_output_ports, total_fault_list) = split_dictionary(total_lines, dic_file_1, total_output_ports, total_gm_list, total_fm_list, total_fault_list)
	

	name_strobes = taget_folder + "/" + taget_folder + "_strobe_list.txt"
	store_list_in_file(total_output_ports, name_strobes)
	
	name = taget_folder + "/" + taget_folder + "_golden_vals.txt"
	print_list_to_file(total_gm_list, name)

	name = taget_folder + "/" + taget_folder + "_faulty_vals.txt"
	print_list_to_file(total_fm_list, name)
	
	name = taget_folder + "/" + taget_folder + "_HW_faults_vals.txt"
	print_list_to_file(total_fault_list, name)




# extracting the hanging values: (those that generated XX even in the golden execution, caused mainly by control lines)
# this function also eliminates those cases when the output values have no error (masked faults)

	hanging_list_FM = []
	hanging_list_GM = []
	hanging_list_HW_faults = []
	
	(total_fm_list_no_XXX, total_gm_list_no_XXX, total_fault_list_no_XXX, hanging_list_FM, hanging_list_GM, hanging_list_HW_faults) = remove_hanging_values(total_fm_list, total_gm_list, total_fault_list)

	(total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, total_fault_list_no_XXX_no_masked) = remove_no_fault_Effects(total_fm_list_no_XXX, total_gm_list_no_XXX, total_fault_list_no_XXX, name_strobes)

	name = taget_folder + "/" + taget_folder + "_golden_vals_after_removing_XXX_and_masked.txt"
	print_list_to_file(total_gm_list_no_XXX_no_masked, name)

	name = taget_folder + "/" + taget_folder + "_faulty_vals_after_removing_XXX_and_masked.txt"
	print_list_to_file(total_fm_list_no_XXX_no_masked, name)

	name = taget_folder + "/" + taget_folder + "_HW_faults_after_removing_XXX_and_masked.txt"
	print_list_to_file(total_fault_list_no_XXX_no_masked, name)

	name = taget_folder + "/" + taget_folder + "_hanging_faulty_values.txt"
	print_list_to_file(hanging_list_FM, name)

	name = taget_folder + "/" + taget_folder + "_hanging_golden_values.txt"
	print_list_to_file(hanging_list_GM, name)
	
	name = taget_folder + "/" + taget_folder + "_hanging_HW_fault_values.txt"
	print_list_to_file(hanging_list_HW_faults, name)
	
		
# Storing in a file the output strobe list used to clasify the fault effects and correlate the faults at instruction level.


# # Information inside the "hanging_list_GM" and "hanging_list_FM" lists can be employed to classify those cases were the fault caused an affect on the instruction groups, but also corruted the execution of the GPU by hanging.
	total_mask_list = []

	total_mask_list = find_masks_in_results(total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked)


#	print(total_fm_list[0])		# containts the fault list.
#	print(total_gm_list[0])		# containts the golden list.

	print("total mask list lenght: ")
	general_output_report.write("total mask list lenght: " + "\n")
	print(len(total_mask_list))	# Contains only the masks of the affected locations, ready to be analyzed for the diferent errors types
	general_output_report.write(str(len(total_mask_list)) + "\n")
	
# # analysis of operation errors:

# # naive case of fetch (then to be generalized for all modules)

	module = input_target		# choose between fetch, decode or scheduler

	global_general_structure_operation_errors = []
	global_general_structure_operand_errors = []
	global_general_structure_order_errors = []
	global_general_structure_execution_errors = []


	global_general_structure_operation_errors = analyze_operation_errors(total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, module, application)

	global_general_structure_operand_errors = analyze_operand_errors(total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, module)

	global_general_structure_order_errors = analyze_order_errors(total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, module)
	
	global_general_structure_execution_errors = analyze_execution_errors(total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, module)
	

	name = taget_folder + "/" + taget_folder + "_global_general_structure_operation_errors.txt"
	store_str_list_in_file(global_general_structure_operation_errors, name)

	name = taget_folder + "/" + taget_folder + "_global_general_structure_operand_errors.txt"
	store_str_list_in_file(global_general_structure_operand_errors, name)

	name = taget_folder + "/" + taget_folder + "_global_general_structure_order_errors.txt"
	store_str_list_in_file(global_general_structure_order_errors, name)
	
	name = taget_folder + "/" + taget_folder + "_global_general_structure_execution_errors.txt"
	store_str_list_in_file(global_general_structure_execution_errors, name)

	#	print(len(global_general_structure_operand_errors))
	#	print("x" + str(global_general_structure_operand_errors[0]))
	#	print("xx" + str(global_general_structure_operand_errors[0][0]))
	#	print("xxx" + str(global_general_structure_operand_errors[0][0][0]))
	#	print("y" + str(global_general_structure_operand_errors[1]))
	#	print("z" + str(global_general_structure_operand_errors[2]))
	#	print("z1" + str(global_general_structure_operand_errors[3]))

	# 	Deterning the relation between the HW and error numbers:
	
	name = taget_folder + "/" + taget_folder + "_report_Hw_faults_errors_relation.txt"
	

	
	determine_HW_errors_trend(total_fault_list_no_XXX_no_masked, global_general_structure_operation_errors, global_general_structure_operand_errors, global_general_structure_order_errors, global_general_structure_execution_errors, hanging_list_HW_faults, name)




	# extracting general parameters: total detections per sub group:
		
	total_number_elements = 0
	total_number_subgroups = 1
	
	total_operation_errors = analyze_detections_per_subgroup(global_general_structure_operation_errors, total_number_elements)
	total_operand_errors = analyze_detections_per_subgroup_operands(global_general_structure_operand_errors, total_number_elements)
	total_order_errors = analyze_detections_per_subgroup_operands(global_general_structure_order_errors, total_number_elements)
	total_execution_errors = analyze_detections_per_subgroup_operands(global_general_structure_execution_errors, total_number_elements)

	print("total number of global_general_structure_operation_errors:")
	general_output_report.write("total number of global_general_structure_operation_errors:\n")
	print(str(total_operation_errors))
	general_output_report.write(str(total_operation_errors) + "\n")
	
	print("total number of global_general_structure_operand_errors:")
	general_output_report.write("total number of global_general_structure_operand_errors:\n")
	print(str(total_operand_errors))
	general_output_report.write(str(total_operand_errors) + "\n")

	print("total number of global_general_structure_order_errors: ")
	general_output_report.write("total number of global_general_structure_order_errors:\n")
	print(str(total_order_errors))
	general_output_report.write(str(total_order_errors) + "\n")

	print("total number of global_general_structure_execution_errors: ")
	general_output_report.write("total number of global_general_structure_execution_errors:\n")
	print(str(total_execution_errors))
	general_output_report.write(str(total_execution_errors) + "\n")

	number_incorrect_op_code = 0
	number_invalid_op_code = 0
	number_incorrect_register_addressed = 0
	number_incorrect_parallel_parameters = 0
	number_invalid_register = 0
	number_incorrect_immediate_operand = 0
	number_commitment_order_violation = 0
	number_incorrect_active_threads = 0
	number_incorrect_active_CTA = 0
	number_incorrect_active_line = 0
	number_incorrect_active_warp = 0
	number_incorrect_functional_unit_used =0 
	number_incorrect_memory_source = 0
	number_incorrect_memory_destiny = 0

	(number_incorrect_op_code, number_invalid_op_code) = search_operation_subgroups(global_general_structure_operation_errors)
	(number_incorrect_register_addressed, number_incorrect_parallel_parameters, number_invalid_register, number_incorrect_immediate_operand) = search_operand_subgroups(global_general_structure_operand_errors)
	(number_commitment_order_violation) = search_order_subgroups(global_general_structure_order_errors)
	(number_incorrect_active_threads, number_incorrect_active_CTA, number_incorrect_active_line, number_incorrect_active_warp, number_incorrect_functional_unit_used, number_incorrect_memory_source, number_incorrect_memory_destiny) = search_execution_subgroups(global_general_structure_execution_errors)

	print( "Number of operation errors per subgroup: " )
	general_output_report.write("Number of operation errors per subgroup: \n")
	
	print( "Incorrect op. code: " + str(number_incorrect_op_code) + "        Invalid op. code: " + str(number_invalid_op_code) )
	general_output_report.write("Incorrect op. code: " + str(number_incorrect_op_code) + "        Invalid op. code: " + str(number_invalid_op_code) + "\n")	
	print( "Number of operand errors per subgroup: " )
	general_output_report.write("Number of operand errors per subgroup:  \n")
	print("Incorrect register addressed: " + str(number_incorrect_register_addressed) + "        Incorrect parallel parameters: " + str(number_incorrect_parallel_parameters) )
	general_output_report.write("Incorrect register addressed: " + str(number_incorrect_register_addressed) + "        Incorrect parallel parameters: " + str(number_incorrect_parallel_parameters) + "\n")

	print("Invalid register: " + str(number_invalid_register) + "        Incorrect immediate operand: " + str(number_incorrect_immediate_operand) )
	general_output_report.write("Invalid register: " + str(number_invalid_register) + "        Incorrect immediate operand: " + str(number_incorrect_immediate_operand) + "\n")
	print( "Number of order errors per subgroup: " )
	general_output_report.write("Number of order errors per subgroup: \n")

	print( "commitment order violation: " + str(number_commitment_order_violation) )
	general_output_report.write("commitment order violation: " + str(number_commitment_order_violation) + "\n")
	
	print( "Number of execution errors per subgroup: " )
	general_output_report.write("Number of execution errors per subgroup: \n")
	print( "Incorrect active threads: " + str(number_incorrect_active_threads) + "        Incorrect active CTA: " + str(number_incorrect_active_CTA) )
	general_output_report.write( "Incorrect active threads: " + str(number_incorrect_active_threads) + "        Incorrect active CTA: " + str(number_incorrect_active_CTA) + "\n")
	print( "Incorrect active line: " + str(number_incorrect_active_line) + "        Incorrect active warp: " + str(number_incorrect_active_warp) )
	general_output_report.write("Incorrect active line: " + str(number_incorrect_active_line) + "        Incorrect active warp: " + str(number_incorrect_active_warp) + "\n")
	print( "Incorrect functional unit: " + str(number_incorrect_functional_unit_used) + "        Incorrect memory source: " + str(number_incorrect_memory_source) )
	general_output_report.write("Incorrect functional unit: " + str(number_incorrect_functional_unit_used) + "        Incorrect memory source: " + str(number_incorrect_memory_source) + "\n")
	print( "Incorrect memory destiny: " + str(number_incorrect_memory_destiny))
	general_output_report.write("Incorrect memory destiny: " + str(number_incorrect_memory_destiny) + "\n")
	general_output_report.close()
	
	# develop the profiler for the RTL, connection of SASS + profiler_CLK + analyzed and detected cases of total_list(masks I guess)
	total_instruction_list = []
	
	file_name_report = taget_folder + "/inst_classification_operational.txt"
	
	total_instruction_list = Analyze_instructions_effects_operation(file_name_report, total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, global_general_structure_operation_errors, module, official_starting_time, official_kernel_op_time)
		
	file_name_report = taget_folder + "/inst_classification_operand.txt"
	
	total_instruction_list = Analyze_instructions_effects(file_name_report, total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, global_general_structure_operand_errors, module, official_starting_time, official_kernel_op_time)
	
	file_name_report = taget_folder + "/inst_classification_order.txt"
	
	total_instruction_list = Analyze_instructions_effects(file_name_report, total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, global_general_structure_order_errors, module, official_starting_time, official_kernel_op_time)
		 
	file_name_report = taget_folder + "/inst_classification_execution.txt"

	total_instruction_list = Analyze_instructions_effects(file_name_report, total_mask_list, total_fm_list_no_XXX_no_masked, total_gm_list_no_XXX_no_masked, global_general_structure_execution_errors, module, official_starting_time, official_kernel_op_time)
	
	# hanging values at instructions level:
	
	# the hanging will be added at the end of the "inst_classification_execution.txt" classification report
	analyze_true_hangs(hanging_list_FM, hanging_list_GM, total_instruction_list, file_name_report, module)
	
	# TODO:
	# Binary analysis, how many bits affected per classified fault?
	# general to all total_mask_list, individual to the sublist per classification

	#print(total_mask_list)
	analyze_binaries(total_mask_list, global_general_structure_operation_errors, global_general_structure_operand_errors, global_general_structure_order_errors, global_general_structure_execution_errors, module)
	
	# Multiple detections (a given fault could produce several classification at instruction-level)


	os.system("mkdir " + str(module) + "/" + str(application))
	os.system("mv " + str(module) + "/" + str(module) + "_faulty_vals.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_faulty_vals.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_faulty_vals_no_masked.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_faulty_vals_no_masked.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_global_general_structure_execution_errors.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_global_general_structure_execution_errors.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_global_general_structure_operand_errors.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_global_general_structure_operand_errors.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_global_general_structure_operation_errors.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_global_general_structure_operation_errors.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_global_general_structure_order_errors.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_global_general_structure_order_errors.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_golden_vals.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_golden_vals.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_golden_vals_no_masked.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_golden_vals_no_masked.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_hanging_faulty_values.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_hanging_faulty_values.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_hanging_golden_values.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_hanging_golden_values.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_strobe_list.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_strobe_list.txt")

	os.system("mv " + str(module) + "/" + "general_binary_distribution.txt " + str(module) + "/" + str(application) + "/general_binary_distribution.txt")
	os.system("mv " + str(module) + "/" + "hanging_true.txt " + str(module) + "/" + str(application) + "/hanging_true.txt")
	os.system("mv " + str(module) + "/" + "individual_bin_distribution_execution_errors.txt " + str(module) + "/" + str(application) + "/individual_bin_distribution_execution_errors.txt")
	os.system("mv " + str(module) + "/" + "individual_bin_distribution_operand_errors.txt " + str(module) + "/" + str(application) + "/individual_bin_distribution_operand_errors.txt")
	os.system("mv " + str(module) + "/" + "individual_bin_distribution_operation_errors.txt " + str(module) + "/" + str(application) + "/individual_bin_distribution_operation_errors.txt")
	os.system("mv " + str(module) + "/" + "individual_bin_distribution_order_errors.txt " + str(module) + "/" + str(application) + "/individual_bin_distribution_order_errors.txt")
	os.system("mv " + str(module) + "/" + "inst_classification_execution.txt " + str(module) + "/" + str(application) + "/inst_classification_execution.txt")
	os.system("mv " + str(module) + "/" + "inst_classification_operand.txt " + str(module) + "/" + str(application) + "/inst_classification_operand.txt")
	os.system("mv " + str(module) + "/" + "inst_classification_operational.txt " + str(module) + "/" + str(application) + "/inst_classification_operational.txt")
	os.system("mv " + str(module) + "/" + "inst_classification_order.txt " + str(module) + "/" + str(application) + "/inst_classification_order.txt")
	os.system("mv " + str(module) + "/" + "testability.txt " + str(module) + "/" + str(application) + "/testability.txt")
	
	os.system("mv " + str(module) + "/" + "inst_classification_operational.txt_test.txt " + str(module) + "/" + str(application) + "/inst_classification_operational.txt_test.txt")
	os.system("mv " + str(module) + "/" + "inst_classification_execution.txt_test.txt " + str(module) + "/" + str(application) + "/inst_classification_execution.txt_test.txt")
	os.system("mv " + str(module) + "/" + "inst_classification_operand.txt_test.txt " + str(module) + "/" + str(application) + "/inst_classification_operand.txt_test.txt")
	os.system("mv " + str(module) + "/" + "inst_classification_order.txt_test.txt " + str(module) + "/" + str(application) + "/inst_classification_order.txt_test.txt")
	
	os.system("mv " + str(module) + "/" + str(module) + "_HW_faults_after_removing_XXX_and_masked.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_HW_faults_after_removing_XXX_and_masked.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_HW_faults_vals.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_HW_faults_vals.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_report_Hw_faults_errors_relation.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_report_Hw_faults_errors_relation.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_hanging_HW_fault_values.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_hanging_HW_fault_values.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_faulty_vals_after_removing_XXX_and_masked.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_faulty_vals_after_removing_XXX_and_masked.txt")
	os.system("mv " + str(module) + "/" + str(module) + "_golden_vals_after_removing_XXX_and_masked.txt " + str(module) + "/" + str(application) + "/" + str(module) + "_golden_vals_after_removing_XXX_and_masked.txt")

	os.system("mv " + "/home/e.rodriguez/intruction_level_ers/TB/" + str(module) + "/instruction_logger.log " + str(module) + "/" + str(application) + "/" + str(module) + "_instruction_logger.log")








	print("done.. " + str(input_target) )








