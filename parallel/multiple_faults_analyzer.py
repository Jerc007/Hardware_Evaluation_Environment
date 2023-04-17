import os
import subprocess
import filecmp
import struct
import re
import argparse

import fault_analyzer
from fault_analyzer import *


import os.path
from os import path
import random

from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter

from matplotlib.ticker import FuncFormatter
import matplotlib.pyplot as plt
import numpy as np

from datetime import datetime
from datetime import date
import time


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



def xor(a, b):
    return (a and not b) or (not a and b)


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

def find_substr(fullstr):
	fullstr_temp = fullstr.replace("[","")
	fullstr_temp = fullstr_temp.replace("ns,","")
	print(fullstr_temp)
	return fullstr_temp


def store_list_in_file(input_list, name_file):

	new_file = open(name_file, 'w')

	for i in range (0, len(input_list)):
	
		new_file.write(input_list[i] + "\n")
		
	new_file.close()




def find_hist(input_list, name):

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

	plt.bar(x3, binary_distribution, color= ( 'green', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b'))
	plt.xticks(x3, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64])
#	plt.show()
	
	# storing the image
	xxx3 = plt.figure(1)
	xxx3.savefig(folder + "_" + name + "_" + 'binary_distribution.png' )
	# storing the text for other analyzes
	
	file = open(name + "_hist.txt" , 'w')
	for k in range(0, 64):
		file.write(str(k) + " " + str(binary_distribution[k]) + "\n")
	file.close()
	
	file = open(name + "_fault_counting.txt" , 'w')
	for key in counting:
		file.write( str(key) + " " + str(counting[key]) + "\n")
	file.close()
	
	
	
	print(counting)

# functions to analyze the effect of the primary outputs on each module:

def	analyze_operation_errors(total_mask_list, total_fm_list, total_gm_list, module):

	if (module == "fetch") or (module == "Fetch") or (module == "FETCH"):
		
		operation_errors = []
		for i in range(0, len(total_mask_list)):

			if len(total_mask_list[i]) == 12: # limits of elements to evaluate. It must be noted that the list also contains the weird cases with only one value.
			
#				print(len(total_mask_list[i]))
#				print(len(str(total_mask_list[i][11])))
#				print(str(total_mask_list[i][11]))
				if str(total_mask_list[i][11]) != "0000000000000000":
					small_list = []
					small_list.append(i)
					small_list.append(total_mask_list[i][11])
					print(str(small_list))
					operation_errors.append(small_list)							# this line is failing

		print(operation_errors)													# containts the golden list.
		print(len(operation_errors))											# containts the golden list.

		# evaluation of the instructions codes effects by a fault.

		# loading the information of the ISA of the GPU core.
		load_isa = open("ISA_sass.txt", 'r')
		isa_counter = 0
		ISA = []		# empty list for the ISA
		for line in load_isa:
			isa_counter = isa_counter +1
			words = line.split()
			ISA.append(words)

		# building the unified lists of wrong instructions effects [ gm + fm (only in the locations needed) ]
		
		total_new_mask_list = []
		total_len = len(total_fm_list)

		for i in range( 0, total_len ):
		
			print(total_fm_list[i], total_gm_list[i])
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
						
						total_cunters = total_cunters + 1
						match = 0
					

#		print(ISA)											# containts the golden list.
#		print(ISA[0])											# containts the golden list.
#		print(total_fm_list[5][12])
#		print(total_gm_list[5][12])
#		print(total_new_mask_list[5])

#		print(list_results_ISAs_effects[0])			# this contains the results of the instrution code errors.
#		print(len(total_fm_list))
#		print(len(total_gm_list))
#		print(len(total_new_mask_list))
		print(len(total_mask_list))
		print(str(total_cunters))
	
		name_hist = "fetch"
		find_hist(ISA_hist, name_hist)
		
			
	elif (module == "decode") or (module == "Decode") or (module == "DECODE"):

		operation_errors = []
		
		for i in range(0, len(total_mask_list)):
			
			# instr_opcode_out:
			if str(total_mask_list[i][10]) != "0":
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][10])
				small_list.append("instr_opcode_out")
				print(str(small_list))
				operation_errors.append(small_list)							# this line is failing
			# instr_subop_out:	
			if 	str(total_mask_list[i][11]) != '0':
				small_list1 = []
				small_list1.append(i)
				small_list1.append(total_mask_list[i][11])
				small_list1.append("instr_subop_out")
				operation_errors.append(small_list1)
			# pred_reg_out:
			if 	str(total_mask_list[i][16]) != '0':
				small_list2 = []
				small_list2.append(i)
				small_list2.append(total_mask_list[i][16])
				small_list2.append("pred_reg_out")
				operation_errors.append(small_list2)
				
			# pred_cond_out:
			if 	str(total_mask_list[i][17]) != "00":
				small_list2 = []
				small_list2.append(i)
				small_list2.append(total_mask_list[i][17])
				small_list2.append("pred_cond_out")
				operation_errors.append(small_list2)

			# set_pred_reg_out:
			if 	str(total_mask_list[i][18]) != '0':
				small_list3 = []
				small_list3.append(i)
				small_list3.append(total_mask_list[i][18])
				small_list3.append("pred_cond_out")
				operation_errors.append(small_list3)

			# addr_lo_out:
			if 	str(total_mask_list[i][23]) != '0':
				small_list4 = []
				small_list4.append(i)
				small_list4.append(total_mask_list[i][23])
				small_list4.append("addr_lo_out")
				operation_errors.append(small_list4)

			# addr_reg_out:
			if 	str(total_mask_list[i][24]) != '0':
				small_list5 = []
				small_list5.append(i)
				small_list5.append(total_mask_list[i][24])
				small_list5.append("addr_reg_out")
				operation_errors.append(small_list5)

			# mov_size_out:
			if 	str(total_mask_list[i][25]) != '0':
				small_list6 = []
				small_list6.append(i)
				small_list6.append(total_mask_list[i][25])
				small_list6.append("mov_size_out")
				operation_errors.append(small_list6)


	# pending storing and also case of invalid operation code...
				

		print(operation_errors)													# containts the golden list.
		print(len(operation_errors))											# containts the golden list.
	

	elif (module == "execute") or (module == "Execute") or (module == "EXECUTE"):
		print("build the functions for the execute")

	elif (module == "scheduler") or (module == "Scheduler") or (module == "SCHEDULER"):
		print("build the functions for the scheduler")


def analyze_operand_errors(total_mask_list, total_fm_list, total_gm_list, module):

	if (module == "fetch") or (module == "Fetch") or (module == "FETCH"):
		# evaluting operand errors:
		operand_errors = []
		for i in range(0, len(total_mask_list)):
	#		print(str(total_mask_list[i]))
	#		print(str(total_mask_list[i][11]))
			if len(total_mask_list[i]) == 12: # limits of elements to evaluate. It must be noted that the list also contains the weird cases with only one value.
			
				if ( str(total_mask_list[i][8]) != "000" ) or ( str(total_mask_list[i][9]) != "000" ):

					small_list = []
					small_list.append(i)
					small_list.append(total_mask_list[i][8])
					small_list.append(total_mask_list[i][9])
					print(str(small_list))
					operand_errors.append(small_list)			# this line is failing

		print(operand_errors)		# containts the golden list.
		print(len(operand_errors))		# containts the golden list.


		operand_errors1 = []
		for i in range(0, len(total_mask_list)):

	#		print(str(total_mask_list[i]))
	#		print(str(total_mask_list[i][11]))

			if len(total_mask_list[i]) == 12: # limits of elements to evaluate. It must be noted that the list also contains the weird cases with only one value.
			
				if ( str(total_mask_list[i][7]) != "0000" ):
				
					small_list = []
					small_list.append(i)
					small_list.append(total_mask_list[i][7])
					print(str(small_list))
					operand_errors1.append(small_list)			# this line is failing

		print(operand_errors1)		# containts the golden list.
		print(len(operand_errors1))		# containts the golden list.


	elif (module == "decode") or (module == "Decode") or (module == "DECODE"):

		operand_errors = []
		for i in range(0, len(total_mask_list)):

				# gprs_base_addr_out:				
				if ( str(total_mask_list[i][8]) != "00"):

					small_list = []
					small_list.append(i)
					small_list.append(total_mask_list[i][8])
					small_list.append("gprs_base_addr_out")

					operand_errors.append(small_list)
				
				# Decode.src1_out:				
				if ( str(total_mask_list[i][42]) != "00000000"):

					small_list1 = []
					small_list1.append(i)
					small_list1.append(total_mask_list[i][42])
					small_list1.append("Decode.src1_out")

					operand_errors.append(small_list1)
					
				# missing ... Decode.src2_out   	total_mask_list[i][43]
				if ( str(total_mask_list[i][43]) != "00000000"):

					small_list2 = []
					small_list2.append(i)
					small_list2.append(total_mask_list[i][43])
					small_list2.append("Decode.src2_out")

					operand_errors.append(small_list2)

				#Decode.src3_out   					total_mask_list[i][44]
				if ( str(total_mask_list[i][44]) != "00000000"):

					small_list3 = []
					small_list3.append(i)
					small_list3.append(total_mask_list[i][44])
					small_list3.append("Decode.src3_out")

					operand_errors.append(small_list3)

				#Decode.dest_out   	 				total_mask_list[i][45]
				if ( str(total_mask_list[i][45]) != "00000000"):

					small_list4 = []
					small_list4.append(i)
					small_list4.append(total_mask_list[i][44])
					small_list4.append("Decode.dest_out")

					operand_errors.append(small_list4)
				
				#Decode.imm_hi_out 	 				total_mask_list[i][29]
				if ( str(total_mask_list[i][28]) != "00000000"):

					small_list5 = []
					small_list5.append(i)
					small_list5.append(total_mask_list[i][28])
					small_list5.append("Decode.imm_hi_out")

					operand_errors.append(small_list5)
				
				#Decode.shmem_base_addr_out
				if ( str(total_mask_list[i][6]) != "0000"):

					small_list5 = []
					small_list5.append(i)
					small_list5.append(total_mask_list[i][6])
					small_list5.append("Decode.shmem_base_addr_out")

					operand_errors.append(small_list5)
					
				# gprs_size_out
				if ( str(total_mask_list[i][7]) != "00"):

					small_list5 = []
					small_list5.append(i)
					small_list5.append(total_mask_list[i][7])
					small_list5.append("Decode.gprs_size_out")

					operand_errors.append(small_list5)
		
		print(operand_errors)		# containts the golden list.
		print(len(operand_errors))		# containts the golden list.


		operand_errors1 = []
		for i in range(0, len(total_mask_list)):

	#		print(str(total_mask_list[i]))
	#		print(str(total_mask_list[i][11]))

			if len(total_mask_list[i]) == 12: # limits of elements to evaluate. It must be noted that the list also contains the weird cases with only one value.
			
				if ( str(total_mask_list[i][7]) != "0000" ):
				
					small_list = []
					small_list.append(i)
					small_list.append(total_mask_list[i][7])
					print(str(small_list))
					operand_errors1.append(small_list)			# this line is failing

		print(operand_errors1)		# containts the golden list.
		print(len(operand_errors1))		# containts the golden list.
		
		
	elif (module == "execute") or (module == "Execute") or (module == "EXECUTE"):
		print("build the functions for the execute")

	elif (module == "scheduler") or (module == "Scheduler") or (module == "SCHEDULER"):
		print("build the functions for the scheduler")



def analyze_order_errors(total_mask_list, total_fm_list, total_gm_list, module):

	if (module == "fetch") or (module == "Fetch") or (module == "FETCH"):
		print("build the functions for the fetch")



	elif (module == "decode") or (module == "Decode") or (module == "DECODE"):

		order_errors = []
		
		for i in range(0, len(total_mask_list)):

			operand_errors1 = []
			#Decode.flow_opcode_out
			if ( str(total_mask_list[i][14]) != "0"):

				small_list10 = []
				small_list10.append(i)
				small_list10.append(total_mask_list[i][14])
				small_list10.append("Decode.flow_opcode_out")

				operand_errors.append(small_list10)
	
	

	elif (module == "execute") or (module == "Execute") or (module == "EXECUTE"):
		print("build the functions for the execute")

	elif (module == "scheduler") or (module == "Scheduler") or (module == "SCHEDULER"):
		print("build the functions for the scheduler")




def analyze_execution_errors(total_mask_list, total_fm_list, total_gm_list, module):

	if (module == "fetch") or (module == "Fetch") or (module == "FETCH"):
	# evaluating execution errors:

		execution_errors1 = []
		for i in range(0, len(total_mask_list)):

	#		print(str(total_mask_list[i]))
	#		print(str(total_mask_list[i][11]))

			if len(total_mask_list[i]) == 12: # limits of elements to evaluate. It must be noted that the list also contains the weird cases with only one value.
			
				if ( str(total_mask_list[i][6]) != "00000000" ):
				
					small_list = []
					small_list.append(i)
					small_list.append(total_mask_list[i][6])
					print(str(small_list))
					execution_errors1.append(small_list)			# this line is failing

		print(execution_errors1)									# containts the golden list.
		print(len(execution_errors1))								# containts the golden list.


		execution_errors2 = []
		for i in range(0, len(total_mask_list)):

	#		print(str(total_mask_list[i]))
	#		print(str(total_mask_list[i][11]))
		
			if ( str(total_mask_list[i][4]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][4])
				print(str(small_list))
				execution_errors2.append(small_list)			# this line is failing

		print(execution_errors2)									# containts the golden list.
		print(len(execution_errors2))								# containts the golden list.



		execution_errors3 = []
		for i in range(0, len(total_mask_list)):

	#		print(str(total_mask_list[i]))
	#		print(str(total_mask_list[i][11]))

			if len(total_mask_list[i]) == 12: # limits of elements to evaluate. It must be noted that the list also contains the weird cases with only one value.
			
				if ( str(total_mask_list[i][3]) != "0" ):
				
					small_list = []
					small_list.append(i)
					small_list.append(total_mask_list[i][3])
					print(str(small_list))
					execution_errors3.append(small_list)			# this line is failing

		print(execution_errors3)									# containts the golden list.
		print(len(execution_errors3))								# containts the golden list.


		execution_errors4 = []
		for i in range(0, len(total_mask_list)):

	#		print(str(total_mask_list[i]))
	#		print(str(total_mask_list[i][11]))

			if len(total_mask_list[i]) == 12: # limits of elements to evaluate. It must be noted that the list also contains the weird cases with only one value.
			
				if ( str(total_mask_list[i][2]) != "00" ):
				
					small_list = []
					small_list.append(i)
					small_list.append(total_mask_list[i][3])
					print(str(small_list))
					execution_errors4.append(small_list)			# this line is failing

		print(execution_errors4)									# containts the golden list.
		print(len(execution_errors4))								# containts the golden list.



	elif (module == "decode") or (module == "Decode") or (module == "DECODE"):
		print("build the functions for the decode")

		execution_errors_Decode1 = []
		for i in range(0, len(total_mask_list)):

			# alu_opcode_out
			if ( str(total_mask_list[i][12]) != "00" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][12])
				small_list.append("Decode.alu_opcode_out")

				execution_errors_Decode1.append(small_list)			# this line is failing


		execution_errors_Decode2 = []
		for i in range(0, len(total_mask_list)):

			# abs_saturate_out
			if ( str(total_mask_list[i][19]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][19])
				small_list.append("Decode.abs_saturate_out")

				execution_errors_Decode2.append(small_list)			# this line is failing


		execution_errors_Decode3 = []
		for i in range(0, len(total_mask_list)):

			# cvt_round_out
			if ( str(total_mask_list[i][19]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][19])
				small_list.append("Decode.cvt_round_out")

				execution_errors_Decode3.append(small_list)			# this line is failing


		execution_errors_Decode4 = []
		for i in range(0, len(total_mask_list)):

			# cvt_type_out
			if ( str(total_mask_list[i][21]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][21])
				small_list.append("Decode.cvt_type_out")

				execution_errors_Decode4.append(small_list)			# this line is failing


		execution_errors_Decode5 = []
		for i in range(0, len(total_mask_list)):

			# current_mask_out
			if ( str(total_mask_list[i][5]) != "00000000" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][5])
				small_list.append("Decode.current_mask_out")

				execution_errors_Decode5.append(small_list)			# this line is failing


		execution_errors_Decode6 = []
		for i in range(0, len(total_mask_list)):

			# cta_id_out
			if ( str(total_mask_list[i][3]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][3])
				small_list.append("Decode.cta_id_out")

				execution_errors_Decode6.append(small_list)			# this line is failing


		execution_errors_Decode7 = []
		for i in range(0, len(total_mask_list)):

			# warp_id_out
			if ( str(total_mask_list[i][1]) != "00" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][1])
				small_list.append("Decode.warp_id_out")

				execution_errors_Decode7.append(small_list)			# this line is failing


		execution_errors_Decode8 = []
		for i in range(0, len(total_mask_list)):

			# warp_lane_id_out
			if ( str(total_mask_list[i][2]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][2])
				small_list.append("Decode.warp_lane_id_out")

				execution_errors_Decode8.append(small_list)			# this line is failing


		execution_errors_Decode9 = []
		for i in range(0, len(total_mask_list)):

			# mov_opcode_out
			if ( str(total_mask_list[i][13]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][13])
				small_list.append("Decode.mov_opcode_out")

				execution_errors_Decode9.append(small_list)			# this line is failing


		execution_errors_Decode10 = []
		for i in range(0, len(total_mask_list)):

			# src1_mem_type_out
			if ( str(total_mask_list[i][29]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][29])
				small_list.append("Decode.src1_mem_type_out")

				execution_errors_Decode10.append(small_list)			# this line is failing


		execution_errors_Decode11 = []
		for i in range(0, len(total_mask_list)):

			# src2_mem_type_out
			if ( str(total_mask_list[i][30]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][30])
				small_list.append("Decode.src2_mem_type_out")

				execution_errors_Decode11.append(small_list)			# this line is failing


		execution_errors_Decode12 = []
		for i in range(0, len(total_mask_list)):

			# src3_mem_type_out
			if ( str(total_mask_list[i][31]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][31])
				small_list.append("Decode.src3_mem_type_out")

				execution_errors_Decode12.append(small_list)			# this line is failing


		execution_errors_Decode13 = []
		for i in range(0, len(total_mask_list)):

			# src1_mem_opcode_out
			if ( str(total_mask_list[i][33]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][33])
				small_list.append("Decode.src1_mem_opcode_out")

				execution_errors_Decode13.append(small_list)			# this line is failing


		execution_errors_Decode14 = []
		for i in range(0, len(total_mask_list)):

			# src2_mem_opcode_out
			if ( str(total_mask_list[i][34]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][34])
				small_list.append("Decode.src2_mem_opcode_out")

				execution_errors_Decode14.append(small_list)			# this line is failing


		execution_errors_Decode15 = []
		for i in range(0, len(total_mask_list)):

			# src3_mem_opcode_out
			if ( str(total_mask_list[i][35]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][35])
				small_list.append("Decode.src3_mem_opcode_out")

				execution_errors_Decode15.append(small_list)			# this line is failing


		execution_errors_Decode16 = []
		for i in range(0, len(total_mask_list)):

			# src1_data_type_out
			if ( str(total_mask_list[i][38]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][38])
				small_list.append("Decode.src1_data_type_out")

				execution_errors_Decode16.append(small_list)			# this line is failing


		execution_errors_Decode17 = []
		for i in range(0, len(total_mask_list)):

			# src2_data_type_out
			if ( str(total_mask_list[i][39]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][39])
				small_list.append("Decode.src2_data_type_out")

				execution_errors_Decode17.append(small_list)			# this line is failing


		execution_errors_Decode18 = []
		for i in range(0, len(total_mask_list)):

			# src3_data_type_out
			if ( str(total_mask_list[i][40]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][40])
				small_list.append("Decode.src3_data_type_out")

				execution_errors_Decode18.append(small_list)			# this line is failing


		execution_errors_Decode19 = []
		for i in range(0, len(total_mask_list)):

			# dest_mem_type_out
			if ( str(total_mask_list[i][32]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][32])
				small_list.append("Decode.dest_mem_type_out")

				execution_errors_Decode19.append(small_list)			# this line is failing


		execution_errors_Decode20 = []
		for i in range(0, len(total_mask_list)):

			# target_addr_out
			if ( str(total_mask_list[i][37]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][37])
				small_list.append("Decode.target_addr_out")

				execution_errors_Decode20.append(small_list)			# this line is failing


		execution_errors_Decode21 = []
		for i in range(0, len(total_mask_list)):

			# dest_data_type_out
			if ( str(total_mask_list[i][41]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][41])
				small_list.append("Decode.dest_data_type_out")

				execution_errors_Decode21.append(small_list)			# this line is failing


		execution_errors_Decode22 = []
		for i in range(0, len(total_mask_list)):

			# dest_mem_opcode_out
			if ( str(total_mask_list[i][36]) != "0" ):
				
				small_list = []
				small_list.append(i)
				small_list.append(total_mask_list[i][36])
				small_list.append("Decode.dest_mem_opcode_out")

				execution_errors_Decode22.append(small_list)			# this line is failing

















	elif (module == "execute") or (module == "Execute") or (module == "EXECUTE"):
		print("build the functions for the execute")

	elif (module == "scheduler") or (module == "Scheduler") or (module == "SCHEDULER"):
		print("build the functions for the scheduler")




def split_dictionary(total_lines, dic_file_1, total_output_ports, total_gm_list, total_fm_list):
	
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

		# collection of faults:
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
				
				total_gm_list.append(gm_list)
				total_fm_list.append(fm_list)
#					print("GM: " + str(gm_list))
#					print("FM: " + str(fm_list))

	return (total_gm_list, total_fm_list, total_output_ports)





def print_list_to_file(total_gm_list, name):
	
	file = open(name, 'w')
	
	for i in range (0, len(total_gm_list)):
		file.write(str(total_gm_list[i]) + "\n")
	file.close()
	


def remove_hanging_values(total_fm_list, total_gm_list):

	index_list = []
	hanging_list_FM = []
	hanging_list_GM = []
	
	elements_FM = len(total_fm_list)
	elements_GM = len(total_gm_list)
	#print("total elements FM: " + str(elements_FM) + " total elements GM: " + str(elements_GM))
	
	if elements_FM == elements_GM:

		for stored_output in range (0, elements_FM):
		
			for output in total_fm_list[stored_output]:
			#	print("Element to evalute: " + str(stored_output)  + " xxx " +  str(output))
			
				# checking if the XX condition is in the faulty:
				if ('X' in str(output)) or ('x' in str(output)):
				
					# store in the hanging effects in a new list for later analysis (a colateral classification)
					hanging_list_FM.append(total_fm_list[stored_output])
					hanging_list_GM.append(total_gm_list[stored_output])

					if stored_output not in index_list:			# only store the indices of the locations. The repeated ones are not stored
						index_list.append(stored_output)
					
	#				print("there are hanging in the output: " + str(output) + ", comming from :" + str(stored_output) )
	else:
		print("There is a mismatch in the size of the golden and faulty list, please check the files")

# #	print("TGM: " + str(total_fm_list))

	# Remove hanging cases from the original complete list
	for j in range(len(index_list)-1, -1, -1):		# Checks the condition for the limits...
		del total_fm_list[index_list[j]]
		del total_gm_list[index_list[j]]
# 	print(str(j), str(index_list[j]))

	if check_list(total_fm_list) == 0:			# if zero, it means that the removal procedure was correct.
		return (total_fm_list, total_gm_list, hanging_list_FM, hanging_list_GM)
	else:
		return ('0', '0', hanging_list_FM, hanging_list_GM)



def remove_no_fault_Effects(total_fm_list, total_gm_list, name_strobes):

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
			
	print(total_ports, counter_ports)
	
	index_list = []
	
	for i in range (0, len(total_fm_list)):
	
		if ( (len(total_fm_list[i]) < (counter_ports - 2)) or (len(total_fm_list[i]) > (counter_ports + 2)) ):
			index_list.append(i)

	for j in range(len(index_list)-1, -1, -1):		# Checks the condition for the limits...
		del total_fm_list[index_list[j]]
		del total_gm_list[index_list[j]]	
		
	return (total_fm_list, total_gm_list)





# -----------------------------------------------------------------------------------------------------------
# import RTL description
# -----------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------

def import_project(input_parameter):

# based on the application selection, the files for the isntruction and configuration should be replaced in the prueba folder.
	
	# removing parameters from previous configurations:
#	os.system("rm TB/TP/TP_configuration.vhd")													# Remove the previous files during the compilation of the project
#	os.system("rm TB/TP/TP_instructions.vhd")
	os.system("rm global_mem.mif")																# remove the previous global memory
	os.system("cp ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/global_mem.mif global_mem.mif")

	os.system("rm system_mem.mif")
	os.system("rm constant_mem.mif")

	os.system("cp ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/system_mem.mif system_mem.mif")
	os.system("cp ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/constant_mem.mif constant_mem.mif")

	# Add here the source folder to place the pichbench and also the other parameters for the configuration of the GPU
#	os.system("cp folder/pickbench.vhd ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/configuration/pick_bench.vhd")
#	os.system("cp folder/TP_configuration.vhd ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/TP_configuration.vhd")
#	os.system("cp folder/TP_instructions.vhd ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/TP_instructions.vhd")


# loading the gate level description of the target module:

	os.system("vlog 	 ../../GL/15nm/verilog/NanGate_15nm_OCL_functional.v")

	if input_parameter == "warp_unit":
		os.system("vlog     ../../GL/warp_scheduler/dp_regfile_verilog.v")
		os.system("vlog     ../../GL/warp_scheduler/warp_unit_15.v")
	elif input_parameter == "decode":
		os.system("vlog     ../../GL/decode/pipeline_decode.v")
	elif input_parameter == "fetch":
		os.system("vlog     ../../GL/fetch/pipeline_fetch.v")
	else:
		print("there is an error when loading the design... missing target module")

	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/configuration/pick_bench.vhd")
			
	if input_parameter == "warp_unit":
		os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/gpgpu_package_warp.vhd")

	elif input_parameter == "decode":
		os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/gpgpu_package_decode.vhd")

	elif input_parameter == "fetch":
		os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/gpgpu_package_fetch.vhd")

	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/shift_register.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/effective_address.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/dp_regfile.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/address_register_controller.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/address_register_file.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/predicate_register_controller.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/predicate_register_file.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/vector_register_controller.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/vector_register_file.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/memory_controller.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/constant_memory_controller.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/global_memory_controller.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/shared_memory_controller.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/SMPController/block_id_calc.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/SMPController/thread_id_calc.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/SMPController/warps_per_block_calc.vhd")
	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/SMPController/streaming_multiprocessor_cntlr.vhd")

	os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/WarpUnit/fence_registers.vhd")
	
	if input_parameter != "warp_unit":
	
		os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/WarpUnit/warps_done_mask_LUT.vhd")
		os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/WarpUnit/warp_id_calc.vhd")
		os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/WarpUnit/warp_generator.vhd")
		os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/WarpUnit/warp_scheduler.vhd")
		os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/WarpUnit/warp_checker.vhd")
		os.system("vcom -2008 -work work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/WarpUnit/warp_unit.vhd")
			
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/bshift.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/stack.vhd")

	if input_parameter != "fetch":
		os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Fetch/pipeline_fetch.vhd")
		print("unfortunatelly .... loaded")

	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Read/arbiter.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Read/predicate_lut.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Read/convert_data_types.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Read/calculate_address.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Read/read_source_ops.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Read/pipeline_read.vhd")

	if input_parameter != "decode":
		os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Decode/pipeline_decode.vhd")

	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/ScalarProcessor/shift_logic.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/ScalarProcessor/min_max.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/ScalarProcessor/boolean_functions.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/ScalarProcessor/compute_set_pred_i.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/ScalarProcessor/convert_int_int.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/ScalarProcessor/integer_add_subtract.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/ScalarProcessor/integer_mult_24.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/ScalarProcessor/scalar_processor.vhd")
	
	# Loading the FP module in FlexGripPlus
	
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_add_32.vhd")				
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_conv_32.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_exceptions_32.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_fma_32.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_mul_32.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_round_32.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_sub_32.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_set_32.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/a_s.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/divisor.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_rcp_32.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/FPU/fpu_top_32_new.vhd")

	# Pipeline - Execution - SpecialFunctionUnit version 2
	
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Components/CLZ.vhd")
	
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Components/SFU_Exceptions.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/fused_accm_tree/Booth_PP.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/fused_accm_tree/CSA_4_2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/fused_accm_tree/fused_accum_tree.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_cos.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_exp.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_ln2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_ln2e0.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_reci.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_reci_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_reci_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_sin.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C0_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_cos.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_exp.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_ln2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_ln2e0.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_reci.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_reci_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_reci_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_sin.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C1_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_cos.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_exp.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_ln2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_ln2e0.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_reci.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_reci_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_reci_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_sin.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_sqrt_1_2.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Single_LUTS/LUT_C2_sqrt_2_4.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/squaring.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/ROM.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/Quadratic_Interpolator/Quadratic_Interpolator.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/sfu.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/SFU/sfu_proc.vhd")
	# Pipeline - Execution - RangeReduceOrder"
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/RRO/Components/fp_leading_zeros_and_shift.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/RRO/Components/right_shifter.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/RRO/Components/add_sub.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/RRO/Components/multFP.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/RRO/RRO_trig.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/RRO/rro.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/RRO/rro_proc.vhd")
		
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/branch_exec_unit.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Execution/pipeline_execute.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Write/compute_pred_flags.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Write/increment_address.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/Pipeline/Write/pipeline_write.vhd")

	if input_parameter == "warp_unit":
		os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/streaming_multiprocessor_warp.vhd")

	elif input_parameter == "decode":
		os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/streaming_multiprocessor_decode.vhd")

	elif input_parameter == "fetch":
		os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/SMP/streaming_multiprocessor_fetch.vhd")

	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/block_scheduler.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/dp_ram.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/gpgpu_configuration.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/system_memory_cntlr.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/gpgpu_ml605_top_level.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/txt_util.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/read_data.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/write_instructions.vhd")

#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/AutoCor/autocor_configuration.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/AutoCor/autocor_instructions.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/MatrixMult/matrix_mult_configuration.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/MatrixMult/matrix_mult_cubin_instructions.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/MatrixMult/matrix_mult_sass_instructions.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/Transpose/transpose_configuration.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/Transpose/transpose_inst.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/BitonicSort/bitonic_sort_configuration.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/BitonicSort/bitonic_sort_instr.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/Reduction/reduction_configuration.vhd")
#	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/Reduction/reduction_kernel_inst.vhd")

	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/TP_configuration.vhd")		
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/TP_instructions.vhd")


	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/tb_configuration.vhd")
	os.system("vcom -2008 -work  work ../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/tb_top_level.vhd")



# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
#                                          auxiliary functions
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------

def find_substr(fullstr, substr1, substr2):

	regexpr = substr1 + "(.+?)" + substr2
	match = re.search(regexpr, str(fullstr))
	if match:
		return match.group(1)
	else:
		print ("***Err: NO STRING MATCH")
		return 0

# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
#                                          auxiliary functions
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------

def Extract_time_params(out):
	# File generation:
	file_temp = open("file_Temp.txt", 'w')
	file_temp.write(out)
	file_temp.close()
	
	with open ("file_Temp.txt", "r") as myfile:
		data = myfile.readlines()
		
	#		print(data)
		total_time = (find_substr(data, "totaltime", "# simstats"))		# partially extract the value for the string chain.
		totalcpu_time = (find_substr(data, "totalcpu", "# quit"))
	
#	if debug_mode ==1:
#		print("\n")
#		print(out)
#		print("\n")

	total_time_short = total_time[7:-1]
	totalcpu_time_short = totalcpu_time[7:-1]	
	# parameters ready:
	total_time_short_short =total_time_short[ 0: -5]
	totalcpu_time_short_short = totalcpu_time_short[ 0: -5]

#	if debug_mode ==1:	

	print(str(total_time_short_short) )
	print(str(totalcpu_time_short_short) )

	os.system("rm file_Temp.txt")				# Remove the temporal file

	return(float(total_time_short_short), float(totalcpu_time_short_short))
#	return(1.2, 2.3)

# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
#                                          auxiliary functions
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------

def Extract_GPU_time_params(out2):
	official_kernel_starting_time = 0					# Variable initialization
	official_kernel_op_time = 0
	official_op_time = 0 
	
	official_kernel_starting_time = int(find_substr(out2, " KERNEL START@'", " ns "))
	official_kernel_op_time = int(find_substr(out2, " KERNEL DONE@'", " ns "))
	official_op_time = int(find_substr(out2, "READDATA DONE@'", " ns "))


	print("Official kernel starting time: " + str(official_kernel_starting_time))
	print("Official kernel time function: " + str(official_kernel_op_time))
	print("Official op time function: " + str(official_op_time))
	
	return(official_kernel_starting_time, official_kernel_op_time, official_op_time)
	



# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------
#                                 Fault free-simulation (profiling simulation)
# ----------------------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------------------

def Launch_golden_sim(cmd_vsim, app_name):
	
	# Golden Simulation:
	print("--------------------------------------------------------------------------------------- \n")
	print("                                Golden simulation...\n")
	print("--------------------------------------------------------------------------------------- \n")
	
	# sub functions to establish the performance parameters
	p = subprocess.Popen(cmd_vsim, stdout=subprocess.PIPE, shell=True)
	out, error = p.communicate()
	
	os.system("mv gpgpu_rdata.log " + str(app_name) + "_reference_mem.log")
			
	# Extraction of execution time parameters:
	(total_time, totalcpu_time) = Extract_time_params(out)

	# Extraction of GPGPU execution parameters:
	(official_starting_time, official_kernel_op_time, official_op_time) = Extract_GPU_time_params(out)
	
	print("                       Golden simulation Finished\n")
	print("-> Total Execution time: " + str(total_time) + "s.")
	print("-> Total CPU Execution time: " + str(totalcpu_time) + "s.")

	print("-> Starting Kernel time: " + str(official_starting_time) + "ns.")
	print("-> Total Kernel Execution time: (GPGPU execution) " + str(official_kernel_op_time) + "ns.")
	print("-> Total GPGPU simulation time: (GPGPU after memory results generation) " + str(official_op_time) + "ns.")
	
	if (total_time == 0) | (totalcpu_time == 0) |(official_kernel_op_time == 0) |(official_op_time == 0):
		print("An error has occured during simulation execution, check the GPGPU simulation \n")
	
	return(total_time, totalcpu_time, official_starting_time, official_kernel_op_time, official_op_time)


# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ----------------------------------------    execute golden simulation    --------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def execute_golden_sim(input_parameter, input_fault_model):

	os.chdir("/home/e.rodriguez/intruction_level_ers/TB/" + str(input_parameter))
	os.system("rm -R work")								# Remove data of previous simulation

	os.system("rm instruction_logger.log")				# Remove logger from previous simulation


	# current date and time
	timestamp1 = time.time()

	import_project(input_parameter)		# Import all the GPU model (RTL + GL)

	timestamp2 = time.time()

	if (input_parameter == "fetch") or (input_parameter == "Fetch") or (input_parameter == "FETCH"):
		# fetch
		cmd_vsim ="""
	vsim -c -do \"vsim -t %s work.%s -novopt;vcd dumpports tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/* -file dumpports_fetch.vcd;run -all;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
	""" %('1ns', 'tb_top_level')

	elif (input_parameter == "decode") or (input_parameter == "Decode") or (input_parameter == "DECODE"):
		# decode
		cmd_vsim ="""
	vsim -c -do \"vsim -t %s work.%s -novopt;vcd dumpports tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineDecode/* -file dumpports_decode.vcd;run -all;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
	""" %('1ns', 'tb_top_level')
	
	elif (input_parameter == "warp_unit") or (input_parameter == "Warp_unit") or (input_parameter == "WARP_UNIT"):
		# warp_unit
		cmd_vsim ="""
	vsim -c -do \"vsim -t %s work.%s -novopt;vcd dumpports tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/* -file dumpports_warp_unit.vcd;run -all;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
	""" %('1ns', 'tb_top_level')
	
	(total_time, totalcpu_time, official_starting_time, official_kernel_op_time, official_op_time) = Launch_golden_sim(cmd_vsim, "TP")

	timestamp3 = time.time()

	if input_fault_model == "permanent":
		folder_fault_model = "permanent/"
	elif input_fault_model == "transition":
		folder_fault_model = "transition/"
	elif input_fault_model == "transient":
		folder_fault_model = "transient/"
	else:
		print("Uncompatible fault model selected!!!!")

	if (total_time != 0) and (totalcpu_time != 0) and (official_kernel_op_time != 0):
		# the simulation can continue:
				
		os.system("rm ../../../Z0IXs/"  + str(folder_fault_model) + str(input_parameter) + "/DUT/RTL_sim/dumpports_" + str(input_parameter) + ".vcd")		# movement of the output report for the fault simulation environment....
		os.system("cp dumpports_" + str(input_parameter) + ".vcd ../../../Z0IXs/"  + str(folder_fault_model) + str(input_parameter) + "/DUT/RTL_sim/dumpports_" + str(input_parameter) + ".vcd")
		fault_injection_enable = 1
	else:
		# the simulation cannot continue, something happened in the execution of the golden sim, stop all.
		print("There was an error in the execution fo the golden sim, the environment is not prepared to continue with the fault-injection campaign")
		fault_injection_enable = 0

	return (fault_injection_enable, timestamp1, timestamp2, timestamp3, official_starting_time, official_kernel_op_time)


# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ------------------------------------    execute fault-injection campaign    -----------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def	execute_fault_injection_campaign(fault_injection_enable, input_parameter, input_fault_model, application_name):

	timestamp4 = 0.0
	timestamp5 = 0.0
	
	if fault_injection_enable == 1:
		
		if input_fault_model == "permanent":
			folder_fault_model = "permanent/"
		elif input_fault_model == "transition":
			folder_fault_model = "transition/"
		elif input_fault_model == "transient":
			folder_fault_model = "transient/"
		else:
			print("Uncompatible fault model selected!!!!")
			
		os.chdir("/home/e.rodriguez/Z0IXs/" + str(folder_fault_model) + str(input_parameter))

		os.system("rm saf_dic_long.txt")											# removal of any previous fault from a fault injection with a different application.
		
		timestamp4 = time.time()
		os.system("bash launch_zoixs.sh")											# Launching the fault-injection simulation.
		timestamp5 = time.time()
		
		print("/home/e.rodriguez/Z0IXs/" + str(folder_fault_model))
		
		
		if os.path.isfile("saf_dic_long.txt"):
		
			if os.path.isdir("./" + str(application_name)):
			
				print("fault simulation campaign finished correctly...")
				os.system("mv saf_dic_long.txt " + str(application_name) + "/saf_dic_long.txt")
				os.system("mv fmsh.log " + str(application_name) + "/fault_coverage_results.txt")
				os.system("mv SAF_coverage.sff " + str(application_name) + "/SAF_coverage.sff")
				
			else:
				os.system("mkdir " + str(application_name))
				print("fault simulation campaign finished correctly...")
				os.system("mv saf_dic_long.txt " + str(application_name) + "/saf_dic_long.txt")
				os.system("mv fmsh.log " + str(application_name) + "/fault_coverage_results.txt")
				os.system("mv SAF_coverage.sff " + str(application_name) + "/SAF_coverage.sff")
			
			fault_analysis_enable = 1
		else:
			print("There is an error in the fault simulation campaign...")
			fault_analysis_enable = 0

	return (timestamp4, timestamp5, fault_analysis_enable)


# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ------------------------------------    execute fault-injection campaign    -----------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------

def execute_fault_classification(fault_analysis_enable, input_parameter, input_fault_model, applicazzione, official_starting_time, official_kernel_op_time):

	timestamp6 = 0.0
	timestamp7 = 0.0
	
	if fault_analysis_enable == 1:

		if input_fault_model == "permanent":
			folder_fault_model = "permanent/"
		elif input_fault_model == "transition":
			folder_fault_model = "transition/"
		elif input_fault_model == "transient":
			folder_fault_model = "transient/"
		else:
			print("Uncompatible fault model selected!!!!")

		os.chdir("/home/e.rodriguez/Z0IXs/" + str(folder_fault_model) )
	
		timestamp6 = time.time()
		principal_analyzer(input_parameter, applicazzione, official_starting_time, official_kernel_op_time)   # calling the analysis functions
		timestamp7 = time.time()
	else:
		print("Something failed in the fault simulation, please check if the output file exist and the simuation finished correctly")

	return(timestamp6, timestamp7)



# ---------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------

def	Select_application(application_name, File_path):

	# Finding the folder of the target app.
	# TO DO: add the constraint to check the case if the app is not present...
	os.chdir("/home/e.rodriguez/intruction_level_ers/TB/applications/" + str(application_name))

	# Remove and replace the pick_bench file:
	os.system("rm ../../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/configuration/pick_bench.vhd")
	os.system("cp pick_bench.vhd ../../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/configuration/pick_bench.vhd")

	# Remove and replace the instructions file:
	os.system("rm ../../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/TP_instructions.vhd")
	os.system("cp TP_instructions.vhd ../../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/TP_instructions.vhd")

	# Remove and replace the global memory file:
	os.system("rm ../../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/global_mem.mif")
	os.system("cp global_mem.mif ../../4.4_FlexGripPlus/FlexGripPlus_Pro_ed/RTL/TB/TP/global_mem.mif")

	# Return to the original path from the execution started.
	os.chdir(File_path)
	
	
	
	

# --------------------------------------------------------------------------------------------------
# main function
# --------------------------------------------------------------------------------------------------
# python general_launcher vector_add warp_unit

def main():
	parser = argparse.ArgumentParser()
	parser.add_argument('application_name', help='application_name', type=str)
	parser.add_argument('HW_module', help='HW_module', type=str)
	args = parser.parse_args()
	
#	application_name = "vector_add"				# the possible applications to be analyzed are: scalar_vector_product, sobel, nn, vector_add, mxm, gray_filter, transpose, reduction. for the moment
#	input_parameter = "warp_unit" 				# replace for input argument
	application_name = args.application_name	# Strings
	input_parameter = args.HW_module			# Strings
	fault_model = "permanent"
		
	print("Starting analysis framework...")
	
	address_file_name = fault_model + "/" + input_parameter + "/" + application_name + "/" +  input_parameter + "_HW_faults_vals.txt"
	
	input_file = open(address_file_name, 'r')
	
	total_lines = 0
	total_multiple = 0
	
	for line in input_file:
		
		total_lines = total_lines + 1
		total_vals = line.count(';')
		
		if total_vals != 1:
			total_multiple = total_multiple + 1
			
	print("total multiple = " + str(total_multiple) )
	print("total lines = " + str(total_lines) )
	
	
	
	
main()
