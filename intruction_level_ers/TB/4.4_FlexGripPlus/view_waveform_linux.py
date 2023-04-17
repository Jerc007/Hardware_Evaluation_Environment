
import os
import filecmp
import subprocess



# removing parameters from previous configurations:
File_path=os.getcwd()

os.chdir(File_path+"/GenericDesign/lib")

command = "vsim -view vsim.wlf -do wave_custom_JDGB.do"
print(command)
os.system(command)

