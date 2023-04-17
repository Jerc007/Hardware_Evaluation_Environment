"""Function defitions"""

import os
import re
import fileinput
import filecmp
import timeit
import subprocess
# from compile import Config_compile





def vsim_gen_force01_now(signal_path, new_value, period=None):
    return "force -freeze {{ {signal_path} }} {new_value} -cancel {{ {period} }}" if period is not None else\
        "force -freeze {{ {signal_path} }} {new_value}"

		
		
def vsim_gen_flip01(signal_path, start_time, period=None):
    """ Generate the force command(s) to flip the value of a signal for vsim
        Verilog and VHDL is different as the value str is different:
            Verilog: 'b0/'b1
            VHDL: 2#0/2#1
    """
    return "when -fast {{ \$now == {start_time} }} " \
           "{{ " \
               "if {{ -1 != [ string last \"0\" [ examine -binary {{ {sig} }} ] ] }} " \
                   "{{ {force1} }} " \
               "elseif {{ -1 != [ string last \"1\" [ examine -binary {{ {sig} }} ] ] }} " \
                   "{{ {force0} }} " \
               "else "\
                   "{{ puts {{Error: not flipping value of <{sig}>  @{start_time} }} }} " \
           "}}".format(
                sig=signal_path,
                start_time=start_time,
                force1=vsim_gen_force01_now(signal_path, 1, period=period),
                force0=vsim_gen_force01_now(signal_path, 0, period=period)
           )


def compute_tab(str):
	length =len(str)
	tab = 3-length/8
	i = 0
	final = "\t"
	while (i < tab):
		final += "\t"
		i += 1
	return final


def exec_command_read_out(cmd):
	p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
	out, error = p.communicate()
	print (out) #enable if you want to read the modelsim output
	return ''.join(out.split())


def find_substr(fullstr, substr1, substr2):

	regexpr = substr1 + "(.+?)" + substr2
	match = re.search(regexpr, str(fullstr))
	if match:
		return match.group(1)
	else:
		print ("***Err: NO STRING MATCH")
		return 0

"""
# special_char fucntion solve any problem caused by the usage of special characters in the name of instances within the netlist file, with the 
# force -freeze command.
# special characters can be: "\" (backslash), "[" or "]" (square brackets) etc.
# the list of special characters might grow up, thus, get ready to upload it.   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

"""

def special_char(location):

	location = location.replace("\\", "\\\\\\")
	location = location.replace("[", "\[")
	location = location.replace("]", "\]")
	return location


def bit_flip(my_string, index):
	
	if my_string[index] is '0':
		print ("--DBG(bit_flip): I'm returning 1")
		my_string = my_string[:index] + "1" + my_string[index + 1:]
	else:
		print ("--DBG(bit_flip): I'm returning 0")
		my_string = my_string[:index] + "0" + my_string[index + 1:]
	
	return my_string
	
"""
# mod_lut function: edit the 'bit' of the nth lut (indicated by 'lut' parameter) 
# inside the file 'filename', which contains 'total_lut' lut.
# 
"""	

def mod_lut(filename, location):
	inFile = fileinput.input(filename, inplace=True)

	lut = location.split('/')[0]
	bit = int(location.split('/')[1])
	print ("DBG:(mod_lut): lut is %s, bit is %s" %(lut, bit))
	found = 0

	for line in inFile:
		
		if lut in line:
			found = 1
		else:
			pass

		if "lut_table => b" in line and found is 1:
			#change the bit of the string and save the file
			match = re.search('b\"(.+?)\"', line)
			str_bits = match.group(1)
			print ("--DBG(mod_lut)my old string is: " + str_bits + "*****************************")
			str_bits = bit_flip(str_bits, bit)
			print ("--DBG(mod_lut)my NEW string is: " + str_bits + "*****************************")
			line = line.replace(match.group(1), str_bits)
			found = 0
		else:
			pass

		print (line.rstrip('\n'))
	
	inFile.close()


def build_cmd(fault_type, location, other_signal, TB_NAME, SIM_TIME, RES, NETLIST, start_point, period):
#   Period used only for bflip functions:

#	print ("afs: " + fault_type + " " + location + " " + other_signal)
#	TB_PATH = TB_NAME + "/uut/"
	TB_PATH = TB_NAME

	if fault_type == 'sa0':
		cmd_fault = "force -freeze " + TB_PATH + special_char(location) + " 0 0;"
	
	elif fault_type == 'sa1':
		cmd_fault = "force -freeze " + TB_PATH + special_char(location) + " 1 0;"
	
	
	elif fault_type == 'bflip_c':						# Behavioral Bitflip (in case of not potential injection in the FF, just in behavioral descriptions)
		cmd_fault =	"""
		when -fast { $now == %sns } { if { -1 != [ string last "0" [ examine -binary { %s } ] ] } { force -deposit { %s } 1 ; puts {Flipping value to One...} } elseif { -1 != [ string last "1" [ examine -binary { %s } ] ] } { force -deposit { %s } 0 ; puts {Flipping value to Zero...} } else { puts {Error: Not Flipping value of <%s>  @ %s ns  } ; echo $now    } }
		""" %(start_point, TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), start_point )

		# Store in the (TCL) file:
		# Erase the previous file...
		os.system("rm bitflip_c.tcl")
		# generate a new one
		TCL_file = open("bitflip_c.tcl", 'w')
		# Fill the file with the new command:
		TCL_file.write(cmd_fault)
		# close the file
		TCL_file.close()
		cmd_fault2 = "bitflip_c.tcl"
		print (cmd_fault)			# initial printing of the generated function:
		
		
	#	when -fast { $now == 32227ns } { force -deposit { tb_top_level/uGPGPU/uStreamingMultiProcessor/gRegisterFile(0)/uRegisterFile/dp_regfile_inst/addr_a(5) } {0} }
	
	
	elif fault_type == 'bflip':		# replacing the function to generate the transient fault injector function:
#		cmd_fault = vsim_gen_flip01( TB_PATH+special_char(location), start_point, period)

		# Generation of command to send to the (.TCL) file
		cmd_fault =	"""
		when -fast { $now == %sns } { if { -1 != [ string last "0" [ examine -binary { %s } ] ] } { force -freeze { %s } 1 -cancel { %s } ; puts {Done_One...} } elseif { -1 != [ string last "1" [ examine -binary { %s } ] ] } { force -freeze { %s } 0 -cancel { %s } ; ; puts {Done_Zero...} } else { puts {Error: not flipping value of <%s>  @ %s ns  } ; echo $now    } }
		""" %(start_point, TB_PATH+special_char(location), TB_PATH+special_char(location), period, TB_PATH+special_char(location), TB_PATH+special_char(location), period, TB_PATH+special_char(location), start_point )
	
		# Store in the (TCL) file:
		# Erase the previous file...
		os.system("rm bitflip.tcl")	
		# generate a new one
		TCL_file = open("bitflip.tcl", 'w')	
		# Fill the file with the new command:
		TCL_file.write(cmd_fault)
		# close the file
		TCL_file.close()		
		cmd_fault1 = "bitflip.tcl"
		print (cmd_fault)			# initial printing of the generated function:

	elif fault_type == 'behave_signal':		# replacing the function to generate the transient fault injector function:
		# Ask for the particular location:
		if location == 'tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_scheduler_state_machine':		

			cmd_fault =	"""
			when -fast { $now == %sns } { if { [examine -Symbolic { %s }] == "IDLE" } { force -deposit { %s } READ_FIRST_WARP ; puts {Flipping value ...} } elseif { [examine -Symbolic { %s }] == "READ_FIRST_WARP" } { force -deposit { %s } SCHEDULE_FIRST_WARP ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_FIRST_WARP" } { force -deposit { %s } SCHEDULE_WARP_LANE_0 ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP_LANE_0" } { force -deposit { %s } SCHEDULE_WARP_NEXT_LANE ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP_NEXT_LANE" } { force -deposit { %s } SCHEDULE_WARP_GAP ; puts {Flipping value ...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP_GAP" } { force -deposit { %s } SCHEDULE_WARP32_STATE_WAIT ; puts {Flipping value ...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP32_STATE_WAIT" } { force -deposit { %s } SCHEDULE_WARP_DONE ; puts {Flipping value ...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP_DONE" } { force -deposit { %s } IDLE ; puts {Flipping value ...}} else { puts {Error: Not Flipping value of <%s>  @ %s ns  } ; echo $now }}
			""" %(start_point, TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), start_point)		

		elif location == 'tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpScheduler/warp_scheduler_next_state':

			cmd_fault =	"""
			when -fast { $now == %sns } { if { [examine -Symbolic { %s }] == "IDLE" } { force -deposit { %s } READ_FIRST_WARP ; puts {Flipping value ...} } elseif { [examine -Symbolic { %s }] == "READ_FIRST_WARP" } { force -deposit { %s } SCHEDULE_FIRST_WARP ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_FIRST_WARP" } { force -deposit { %s } SCHEDULE_WARP_LANE_0 ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP_LANE_0" } { force -deposit { %s } SCHEDULE_WARP_NEXT_LANE ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP_NEXT_LANE" } { force -deposit { %s } SCHEDULE_WARP_GAP ; puts {Flipping value ...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP_GAP" } { force -deposit { %s } SCHEDULE_WARP32_STATE_WAIT ; puts {Flipping value ...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP32_STATE_WAIT" } { force -deposit { %s } SCHEDULE_WARP_DONE ; puts {Flipping value ...}} elseif { [examine -Symbolic { %s }] == "SCHEDULE_WARP_DONE" } { force -deposit { %s } IDLE ; puts {Flipping value ...}} else { puts {Error: Not Flipping value of <%s>  @ %s ns  } ; echo $now }}
			""" %(start_point, TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), start_point)		

		elif location == 'tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpGenerator/warp_generator_state_machine':

			cmd_fault =	"""
			when -fast { $now == %sns } { if { [examine -Symbolic { %s }] == "IDLE" } { force -deposit { %s } CALC_WARP_ID ; puts {Flipping value ...} } elseif { [examine -Symbolic { %s }] == "CALC_WARP_ID" } { force -deposit { %s } CALC_WARP_ID_WAIT ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "CALC_WARP_ID_WAIT" } { force -deposit { %s } WRITE_WARP ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "WRITE_WARP" } { force -deposit { %s } WARP_GEN_COMPLETE ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "WARP_GEN_COMPLETE" } { force -deposit { %s } IDLE ; puts {Flipping value ...}} else { puts {Error: Not Flipping value of <%s>  @ %s ns  } ; echo $now }}
			""" %(start_point, TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), start_point)		

		elif location == 'tb_top_level/uGPGPU/uStreamingMultiProcessor/uWarpUnit/uWarpChecker/warp_checker_state_machine':

			cmd_fault =	"""
			when -fast { $now == %sns } { if { [examine -Symbolic { %s }] == "IDLE" } { force -deposit { %s } CHECK_FENCE_WAIT ; puts {Flipping value ...} } elseif { [examine -Symbolic { %s }] == "CHECK_FENCE_WAIT" } { force -deposit { %s } CHECK_FENCE ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "CHECK_FENCE" } { force -deposit { %s } SET_WARPS_ACTIVE ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "SET_WARPS_ACTIVE" } { force -deposit { %s } DONE ; puts {Flipping value...}} elseif { [examine -Symbolic { %s }] == "DONE" } { force -deposit { %s } IDLE ; puts {Flipping value ...}} else { puts {Error: Not Flipping value of <%s>  @ %s ns  } ; echo $now }}
			""" %(start_point, TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), TB_PATH+special_char(location), start_point)				

		else:	# Not Employed...
			cmd_fault =	"""
			when -fast { $now == %sns } { if { -1 != [ string last "0" [ examine -binary { %s } ] ] } { force -freeze { %s } 1 -cancel { %s } ; puts {Done_One...} } elseif { -1 != [ string last "1" [ examine -binary { %s } ] ] } { force -freeze { %s } 0 -cancel { %s } ; ; puts {Done_Zero...} } else { puts {Error: not flipping value of <%s>  @ %s ns  } ; echo $now    } }
			""" %(start_point, TB_PATH+special_char(location), TB_PATH+special_char(location), period, TB_PATH+special_char(location), TB_PATH+special_char(location), period, TB_PATH+special_char(location), start_point )

		# Store in the (TCL) file:
		# Erase the previous file...
		os.system("rm bitflip.tcl")			# Particular file to store the command and then load during the simulation process.
		# Generate a new one
		TCL_file = open("bitflip.tcl", 'w')	
		# Fill the file with the new command:
		TCL_file.write(cmd_fault)
		# close the file
		TCL_file.close()
		cmd_fault1 = "bitflip.tcl"
		print (cmd_fault1)			# initial printing of the generated function:

	# End of the fault injector function.
	# -----------------------------------------------------------------------------------------------------------	
	elif fault_type == 'bAND':
		cmd_fault = """
		when {%s = 10#1 and %s = 10#0} {force -deposit %s 10#0; force -deposit %s 10#0};
		when {%s = 10#0 and %s = 10#1} {force -deposit %s 10#0; force -deposit %s 10#0};
		""" %(TB_PATH+location, TB_PATH+other_signal, TB_PATH+special_char(location), TB_PATH+special_char(other_signal), TB_PATH+location, TB_PATH+other_signal, TB_PATH+special_char(location), TB_PATH+special_char(other_signal))
			
	elif fault_type == 'bOR':
		cmd_fault = """
		when {%s = 10#1 and %s = 10#0} {force -deposit %s 10#1; force -deposit %s 10#1};
		when {%s = 10#0 and %s = 10#1} {force -deposit %s 10#1; force -deposit %s 10#1};
		""" %(TB_PATH+location, TB_PATH+other_signal, TB_PATH+special_char(location), TB_PATH+special_char(other_signal), TB_PATH+location, TB_PATH+other_signal, TB_PATH+special_char(location), TB_PATH+special_char(other_signal))
		
	else:
		print ("*** Errors: unknown fault type")
		cmd_fault = "NONE"

#	print ("DGB(build_cmd): cmd_fault = " + cmd_fault)

#	cmd_vsim ="""
#	vsim -c -do \"vsim -t %s work.%s -novopt ;%srun %s;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
#	""" %(RES, TB_NAME, cmd_fault, SIM_TIME)
	

	
	if fault_type == 'bflip':
		# Bitflip Version: check the diference in the commands. working.
		cmd_vsim ="""
		vsim -c -do \"vsim -t %s work.%s -novopt; source %s; run %s;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
		""" %("1ns", TB_NAME, cmd_fault1, SIM_TIME)    # RES	working...
	
	elif fault_type == 'behave_signal':
		# Bitflip for special signals. Check if it is working...
		cmd_vsim ="""
		vsim -c -do \"vsim -t %s work.%s -novopt; source %s; run %s;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
		""" %("1ns", TB_NAME, cmd_fault1, SIM_TIME)
		
	elif fault_type == 'bflip_c':
	
		# Bitflip Behavioral Version: check the diference in the commands.
		cmd_vsim ="""
		vsim -c -do \"vsim -t %s work.%s -novopt; source %s; run %s;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
		""" %("1ns", TB_NAME, cmd_fault2, SIM_TIME)    # RES	Under-Checks
	else:
		# Original version: (-do command employed)
		cmd_vsim ="""
		vsim -c -do \"vsim -t %s work.%s -novopt;%s run %s;simstats totaltime;simstats totalcpu;quit -sim;quit -f;\"
		""" %("1ns", TB_NAME, cmd_fault, SIM_TIME)		#RES

	return cmd_vsim			# original cmd_vsim

def update_stat_fault(outFile, fault_type, location, other_signal):
	
	if filecmp.cmp('golden_out.txt', 'sim_out.txt'):	#when the simultation is over, outputs are compared
		print ("Fault Not Detected")
		outFile.write(fault_type + "\t" + location + compute_tab(location) + other_signal + "\t" + "ND" + "\n")
		return 0

	else:
		print ("Fault Detected")
		outFile.write(fault_type + "\t" + location + compute_tab(location) + other_signal + "\t" + "DT" + "\n")
		return 1
