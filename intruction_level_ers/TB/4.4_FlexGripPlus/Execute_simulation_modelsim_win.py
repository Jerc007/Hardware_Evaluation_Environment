
import os
import filecmp
import subprocess

print("del ./Test_Programs/*.vcd")
os.system("del ./Test_Programs/*.vcd")
print("rmdir /s /q ./GenericDesign/lib_m/work")
os.system("rmdir /s /q ./GenericDesign/lib_m/work")

# removing parameters from previous configurations:
File_path=os.getcwd()
print(File_path)
command="copy .\Test_Programs\TP_configuration.vhd .\GenericDesign\TB\TP"
print(command)
os.system(command)

command="copy .\Test_Programs\TP_instructions.vhd .\GenericDesign\TB\TP"
print(command)
os.system(command)

command="copy .\Test_Programs\pick_bench.vhd .\GenericDesign\TB"
print(command)
os.system(command)

command="copy .\Test_Programs\global_mem.mif .\GenericDesign\lib"
print(command)
os.system(command)

os.chdir(".\GenericDesign\lib_m")

#command = "C:\modeltech64_10.5\win64\vsim.exe -c -do .\gpgpu_compile.tcl"

command = "C:/modeltech64_10.5/win64/vsim.exe  -c -do .\gpgpu_compile.tcl"
print(command)
os.system(command)

os.system("copy .\gpgpu_rdata.log ..\..\Test_Programs")
os.system("copy .\vsim.wlf ..\..\Test_Programs")
os.system("copy .\wave_custom_JDGB.do ..\..\Test_Programs")

