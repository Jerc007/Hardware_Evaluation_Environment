# Laucher Xcelium using python:

import os
import subprocess
import filecmp
import argparse
import os
import subprocess
import sys

def main():

	print("Starting:")
	
	coverage = 0
	# defining the environment variables:

#	os.system("alias help_cds_xcelium='$CDS_XCELIUM/bin/cdnshelp &'")

	os.environ['CDS_XCELIUM'] = '/eda/cadence/2018-19/RHELx86/XCELIUM_18.03.010'

	os.environ['PATH'] = '/software/ZOIX/O-2018.09-SP2-1/bin:/software/ti/msp430_gcc/bin:/softwares/eclipse/cpp-mars2/eclipse:/software/ugp3/camellia/bin:/software/sparc-elf-4.4.2/bin:/software/ghs/comp_201416:/software/ghs/multi_616:/software/testenv-tools/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/eda/cadence/2014-15/RHELx86/EDI_14.13.000/bin:/eda/cadence/2014-15/RHELx86/RC_14.11.000/tools/bin:/eda/mentor/2016-17/RHELx86/QUESTA-CORE-PRIME_10.5c-4/questasim/bin:/eda/mentor/2014-15/RHELx86/QUESTA-VIP_10.3b_1/bin:/eda/mentor/2014-15/RHELx86/FPRO_2014.1/Mgc_home/bin:/eda/mentor/2016-17/RHELx86/TESSENT_2016.4/bin:/eda/synopsys/2016-17/RHELx86/TMAX_2016.12/bin:/eda/synopsys/2014-15/SLESx86/CORETOOLS_2014.12/bin:/eda/synopsys/2014-15/SLESx86/ESP_2014.12/bin:/eda/synopsys/2014-15/SLESx86/FM_2014.09-SP2/bin:/eda/synopsys/2014-15/SLESx86/HSIMPLUS_2014.09-SP2/hsimplus/bin:/eda/synopsys/2014-15/SLESx86/HSPICE_2014.09-SP1-1/hspice/bin:/eda/synopsys/2014-15/SLESx86/HSPICE_2014.09-SP1-1/hspice/cdpl/bin:/eda/synopsys/2014-15/SLESx86/MW_2014.09-SP2/bin/AMD.64:/eda/synopsys/2014-15/SLESx86/NS_2013.03/bin:/eda/synopsys/2014-15/SLESx86/NT_2014.12/bin:/eda/synopsys/2014-15/SLESx86/PT_2014.12/bin:/eda/synopsys/2014-15/SLESx86/SIS_2014.09-SP1/bin:/eda/synopsys/2014-15/SLESx86/SYN_2014.09-SP2/bin:/eda/synopsys/2014-15/SLESx86/VC_2014.12/bin:/eda/synopsys/2014-15/SLESx86/VCSMX_2014.12/bin:/eda/synopsys/2014-15/SLESx86/VERDI_2014.12/bin:/eda/synopsys/2014-15/SLESx86/XA_2014.09-SP2/bin:/home/a.ruospo/.local/bin:/home/a.ruospo/bin:/eda/cadence/2018-19/RHELx86/XCELIUM_18.03.010/bin:/eda/cadence/2018-19/RHELx86/XCELIUM_18.03.010/tools/bin:/eda/cadence/2018-19/RHELx86/XCELIUM_18.03.010/tools/cdsgcc/gcc/bin:/eda/cadence/2018-19/RHELx86/INCISIVE_15.20.058/kits/VerificationKit/bin:/eda/cadence/2018-19/RHELx86/MDV_18.03.005/bin:/software/or1k-elf/bin'
#	export PATH=/software/ZOIX/O-2018.09-SP2-1/bin:/software/ti/msp430_gcc/bin:/softwares/eclipse/cpp-mars2/eclipse:/software/ugp3/camellia/bin:/software/sparc-elf-4.4.2/bin:/software/ghs/comp_201416:/software/ghs/multi_616:/software/testenv-tools/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/eda/cadence/2014-15/RHELx86/EDI_14.13.000/bin:/eda/cadence/2014-15/RHELx86/RC_14.11.000/tools/bin:/eda/mentor/2016-17/RHELx86/QUESTA-CORE-PRIME_10.5c-4/questasim/bin:/eda/mentor/2014-15/RHELx86/QUESTA-VIP_10.3b_1/bin:/eda/mentor/2014-15/RHELx86/FPRO_2014.1/Mgc_home/bin:/eda/mentor/2016-17/RHELx86/TESSENT_2016.4/bin:/eda/synopsys/2016-17/RHELx86/TMAX_2016.12/bin:/eda/synopsys/2014-15/SLESx86/CORETOOLS_2014.12/bin:/eda/synopsys/2014-15/SLESx86/ESP_2014.12/bin:/eda/synopsys/2014-15/SLESx86/FM_2014.09-SP2/bin:/eda/synopsys/2014-15/SLESx86/HSIMPLUS_2014.09-SP2/hsimplus/bin:/eda/synopsys/2014-15/SLESx86/HSPICE_2014.09-SP1-1/hspice/bin:/eda/synopsys/2014-15/SLESx86/HSPICE_2014.09-SP1-1/hspice/cdpl/bin:/eda/synopsys/2014-15/SLESx86/MW_2014.09-SP2/bin/AMD.64:/eda/synopsys/2014-15/SLESx86/NS_2013.03/bin:/eda/synopsys/2014-15/SLESx86/NT_2014.12/bin:/eda/synopsys/2014-15/SLESx86/PT_2014.12/bin:/eda/synopsys/2014-15/SLESx86/SIS_2014.09-SP1/bin:/eda/synopsys/2014-15/SLESx86/SYN_2014.09-SP2/bin:/eda/synopsys/2014-15/SLESx86/VC_2014.12/bin:/eda/synopsys/2014-15/SLESx86/VCSMX_2014.12/bin:/eda/synopsys/2014-15/SLESx86/VERDI_2014.12/bin:/eda/synopsys/2014-15/SLESx86/XA_2014.09-SP2/bin:/home/a.ruospo/.local/bin:/home/a.ruospo/bin:/eda/cadence/2018-19/RHELx86/XCELIUM_18.03.010/bin:/eda/cadence/2018-19/RHELx86/XCELIUM_18.03.010/tools/bin:/eda/cadence/2018-19/RHELx86/XCELIUM_18.03.010/tools/cdsgcc/gcc/bin:/eda/cadence/2018-19/RHELx86/INCISIVE_15.20.058/kits/VerificationKit/bin:/eda/cadence/2018-19/RHELx86/MDV_18.03.005/bin:/software/or1k-elf/bin

	# defining the environment variable for the HW directory:
	os.environ['HW_DIR'] = '/home/e.rodriguez/FlexGrip_FP_SFU_v3/FlexGrip_FP_SFU_v3/GenericDesign/'
	
	
#	export HW_DIR=/home/e.rodriguez/Xcelium_FlexGrip/FlexGripPlus/
	
#	print("Modified HW_DIR:", os.environ['HW_DIR'])
	
# normal simulation of the design: the time of simulation should be specified it the running.tcl script for Xrun
	
	print("variable exported.")

	cmd_Xrun ="""
	xrun -clean -cleanlib
	"""
	
	p = subprocess.Popen(cmd_Xrun, stdout=subprocess.PIPE, shell=True)
	out, error = p.communicate()
	
	
	
	if coverage ==1:	# enable normal execution without coverage
		print("Normal Simulation")
	
		cmd_Xrun ="""
		xrun -f Xrun_GPGPU_Elab.f -l Xrun_elab_log.log
		"""
		
		p = subprocess.Popen(cmd_Xrun, stdout=subprocess.PIPE, shell=True)
		out, error = p.communicate()
		
		cmd_Xrun ="""
		xrun -R -gui -input running.tcl -l XRUN_RUN.log
		"""
		
	else:		# enable the coverage execution
		print("Coverage Simulation")
	
		cmd_Xrun ="""
		xrun -f Xrun_GPGPU_Elab.f -l Xrun_elab_cov_log.log -coverage A -covdut tb_top_level
		"""
		
		p = subprocess.Popen(cmd_Xrun, stdout=subprocess.PIPE, shell=True)
		out, error = p.communicate()

		cmd_Xrun ="""
		xrun -R -input running.tcl -covtest Entire_design_program_2 -exit -l XRUN_RUN.log
		"""

	p = subprocess.Popen(cmd_Xrun, stdout=subprocess.PIPE, shell=True)
	out, error = p.communicate()

	
	print("Finishing.")	
	
	
	
	
	
	

	# xrun -R -run 10000000ns -exit
	# -gui
	
	
	# Target Coverage evaluation: the switching activity is the only one for gate-level netlist
	# FSM coverage, important to analyze bugs in the design. -state (report of the visited states), -transition (occurence of transitions), - arc (why transitions occurs)
	
	# The coverage options are added during the elaboration of the snapshot.
	# during the running, the score and the store of the coverage is perfomed.
	
	# Options of coverage:
	#
	#		add to enable the data generation:  		-coverage <coverage type>
	#			     options of coverage type:  		-B block cov.			-T Toggle cov.
	#													-E Expresion cov.		-U functional cov.
	#													-F FSM cov. 			-A all options enabled.
	#		add to specify the module to instrument: 	-covdut <module> could be more than one
	# 		add to specify config file: 				-cov_file <file>
	#
	# Examples: 
	#		xrun -f file_with_config.f -coverage B:E:F -covdut chipA -covdut chipB
	# 		xrun -f file_with_config.f -coverage A -covdut chipA
	#
	# Generating the coverage data during the simulation:
	# 
	# -covworkdir <directory>
	# -covscope <scope> other directory to store the coverage files
	# -covtest <test>  test directory  name
	# -covoverwrite (enables obverwrite of files)
	# 
	# example:		xrun -r top -covtest testA (the new folder testA is generated in the folder cov_work/scope and stores the files)
	# 				xrun -r top -covworkdir regxxx -covtest testC (the new folder testC is generated in the new folder regXXX and stores the files)
	# 
	# -covfile (used to load a control file for coverage)
	# 
	# Example of file covfile.ccf:
	#				
	#				select_coverage -bet -module chipA
	#				deselect_coverage -t -module mod_in_chipA
	#				#normal comment
	#				set_branch_scoring
	#				select_coverage -fsm -module Modxx (this line enables the FSM extraction in Modxx)
	#				select_functional (scores assetions/covergroups) ??
	#				
	#				set_hit_count_limit B:E (-b, -e, -be)
	#
	#
	#
	#	
	# IMC is required to analyze the coverage metrics
	#launching IMC:  (the environment variable is needed to use the tool)
	# imc -gui
	
	
	
	

	

	
	
	
main()
