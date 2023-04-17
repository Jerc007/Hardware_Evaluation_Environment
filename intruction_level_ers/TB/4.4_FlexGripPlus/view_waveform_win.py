
import os
import filecmp
import subprocess



# removing parameters from previous configurations:
File_path=os.getcwd()

os.chdir(File_path+"/GenericDesign/lib")

command = "C:/modeltech64_10.5/win64/vsim.exe -view vsim.wlf -do .\wave_custom_JDGB.do"
print(command)
os.system(command)

