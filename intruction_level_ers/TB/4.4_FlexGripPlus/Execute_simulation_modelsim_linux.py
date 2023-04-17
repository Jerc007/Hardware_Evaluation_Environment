
import os
import filecmp
import subprocess



# removing parameters from previous configurations:
File_path=os.getcwd()
print(File_path)

print("rm ./Test_Programs/*.vcd")
os.system("rm ./Test_Programs/*.vcd")
print("rm -R ./GenericDesign/lib_m/work")
os.system("rm -R ./GenericDesign/lib_m/work")


command="cp ./Test_Programs/TP_configuration.vhd ./GenericDesign/TB/TP"
print(command)
os.system(command)

command="cp ./Test_Programs/TP_instructions.vhd ./GenericDesign/TB/TP"
print(command)
os.system(command)

command="cp ./Test_Programs/pick_bench.vhd ./GenericDesign/TB"
print(command)
os.system(command)

command="cp ./Test_Programs/global_mem.mif ./GenericDesign/lib"
print(command)
os.system(command)

os.chdir("./GenericDesign/lib_m")

command = "vsim -c -do gpgpu_compile.tcl"
print(command)
os.system(command)

os.system("cp ./gpgpu_rdata.log ../../Test_Programs/")
os.system("cp ./vsim.wlf ../../Test_Programs/")
os.system("cp ./wave_custom_JDGB.do ../../Test_Programs/")


