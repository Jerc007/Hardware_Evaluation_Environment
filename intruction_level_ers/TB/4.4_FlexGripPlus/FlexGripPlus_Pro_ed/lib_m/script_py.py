import os
from afs_func import *
from compile import Config_compile
import subprocess
from FaultyScript import *

#os.system("exec rm -rf work")								# Proceso de carga de las librerias y archivos para el sistema.		-- leer de documentacion
#os.system("vlib work")										#
#os.system("vcom -work work proasic3.vhd")					# compilar la libreria
#os.system("vcom -work work b01.vhd")						# compilar el netlist
#os.system("vcom -work work b01_tb.vhd")					# compilar el tb y agregarlo a la libreria work
i=0

print("start")
   
   
#if (Config_compile.version == "linux"):					# linux os
#	os.system("exec rm -rf work")							# remove the previous work directory (linux version)
#elif(Config_compile.version == "win"):

os.system("rd /s /q work")									# remove the previous work directory (Win version)
os.system("del gpgpu_rdata.log")							# remove previos simulation results
   
inFile = open("GPGPU_warp_example.txt", 'r')				# use the test file
print("finish open file")

print("finish com")
os.system("vlib work")
os.system("vcom -work work $GPGPU_GENERIC_ROOT/gpgpu_package.vhd")					# Library build
os.system("vcom -work work $GPGPU_GENERIC_ROOT/TB/pick_bench.vhd")												# Netlist (CUT) build
#os.system("vcom -work work .vhd")													# TB build





#os.system("vsim -c")										# Use Model/Questa-Sim from comand line
#os.system("vsim -c -do gpgpu_compile.tcl" )				# Load design


cmd_vsim ="""
vsim -c -do \"   gpgpu_compile.tcl;run %s;simstats totaltime;simstats totalcpu;quit;\"
""" %("200000n")

p = subprocess.Popen(cmd_vsim, stdout=subprocess.PIPE, shell=True)
out, error = p.communicate()
print (out) #enable if you want to read the modelsim output


print("finish")


#os.system("vsim -c run 200000ns" )				# Load design



##################
#FAULT SIMULATION#
##################


#for line in inFile:
#	print("loop")

#	words = line.split()
#	fault_type = words[0]
#	location = words[1]
#	other_signal = words[2]
	
#	cmd_vsim = build_cmd(fault_type, location, other_signal, "tb_top_level", "200000ns", "1ns", " ")
#	print(cmd_vsim)
	
	
	#cmd_vsim = build_cmd(fault_type, location, other_signal, TB_NAME, SIM_TIME, RES, NETLIST)
	#os.system(cmd_vsim)
	








#out, error = p.communicate()
#print (out)

#print(vsim_fault_injection_gen(["SSA", "tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/pipeline_stall_in" , "12000ns","1"]))
	
#os.system("vsim -c -do gpgpu_compile.tcl;" + vsim_fault_injection_gen(["SSA", "tb_top_level/uGPGPU/uStreamingMultiProcessor/uPipelineFetch/pipeline_stall_in" , "12000ns","1"]) + "; run 200000ns ; simstats totaltime ; simstats totalcpu ; quit")


i=i+1
	#os.system("ren gpgpu_rdata.log " + str(i) + "gpgpu_rdata.log")
	
	
	
	
	
	#os.system("ren gpgpu_rdata.log " + str() + ".log")
	
#	print(cmd_vsim)
#	os.system("vsim -c -run 200000ns")


#	out = exec_command_read_out(cmd_vsim)
#	total_time += float(find_substr(out, 'totaltime#', '#simstats'))
#	totalcpu_time += float(find_substr(out, 'totalcpu#', '#quit'))
#	errors += int(find_substr(out, 'Errors:', ','))

#	fault_DT += update_stat_fault(outFile, fault_type, location, other_signal)

#	total_fault += 1


#inside the simulator

#							# run add external param

#get new file
# if there is not new file is faulty
#compare with reference
#establish the fault or ok








