## Hardware Evaluation Environment (artifact)

Name of the project:

Type: Hardware profiling and fault evaluation environment

Author: Josie Esteban Rodriguez Condia

Language: Python / VHDL / CUDA / SASS

Requirements: 

The operation of the framework requires the following packages:

- Python 3.7
- ModelSim by Siemens EDA*
- Z01X by Synopsys*
- Design Compiler*

(*)Professional licenses are required

Politecnico di Torino, Turin, Italy

Department of Control and Computer Engineering (DAUIN)

Electronic CAD & Reliability Group (CAD Group)

2023


## Description:

The proposed environment supports the implementation of a methodology focuses on the accurate and efficient analysis of fault effects in microarchitectural control
units of GPUs, as well as their capacity to propagate, possibly identifying equivalent error effects during the execution of instructions by a parallel application. The method speeds up
the analysis and evaluation by resorting to the careful structural analysis of the GPU in combination with efficient fine-grain fault characterizations of the units when executing instructions from workloads. 
Then, the fault characterization faces the almost unfeasible evaluation times of complete workloads in a GPU (i.e., the complete operation of an application in a gate-level GPU model) by resorting to localized fault injection campaigns (on the target unit, only) and multi-threading mechanisms to split the workload’s instructions and the faults on individual fault evaluations per instruction. 
A later analysis determines the impact effects at the unit level and also provides the mapping of faults to corresponding feasible instruction errors (i.e., error models) to support accurate cross-layer evaluation.

The environment implements the following three steps of the methodology: **(1)** Instruction’s profiling and unit feature’s extrac-
tion, **(2)** Focused micro-architectural characterization, and **(3)** Error classification and analysis.


## Preliminary and Configuration steps:

The operation of the hardware evaluation framework is focused on the micro-architectural characterization of hardware units inside hardware descriptions of digital devices (specially GPUs).
Thus, a set of preliminary conditions and configurations are required for the correct operation of the environmentm, during the characterization.

**Please follow ONLY step 0 when targeting the analysis and evaluation of the decode, fetch, or warp_units in the GPU model. Otherwise, follow steps 0, 1, and 2 to adapt the proposed environment, to target new hardware units, or to customize the unit profiling step.**

Set of preliminary steps:

**0) Set the root folder path:**

Once, the repository is clioned, please check that the absolute pahts are correctly identified. For this purpose, check that the variable **main_path** in *general_launcher.py* is correctly set according to the target root directory.

e.g.,
```
main_path = "/home/e.rodriguez"
```

**1) Import the GPU model for evaluation:**

The VHDL description (of the GPU model) must be imported in the following path:

```main_path/intruction_level_ers/```

Please, check that the variable **main_path** in *general_launcher.py* is correctly set according to the root directory.

e.g.,
```
main_path = "/home/e.rodriguez"
```

**2) Gate-level generation of a unit:**

The environment requires the gate-level *(verilog)* netlist for the fault-injection campaigns. Thus, The **Design Compiler** framework and a **15nm Technology library** are used to generate the gate-level version (*see folder intruction_level_ers/GL for examples of generation and the versions used in the experiments*).

Once the two previous steps are correctly performed, the profiling, evaluation and classification can be performed. 
**If the purpose is to analyze the effect on the target hardware units (e.g., control units in GPUs), the preliminary steps can be skipped.**


## Configuration and description of the environment:

The environment is based in the follow files hierarchy:

- parallel/*general_launcher.py*
- instruction_level_ers/TB/target_unit/*gpu_compile.tcl*
- parallel/permanent/target_unit/*launch_zoixs.sh*
- parallel/*fault_analyzer.py*

Other complementary tools:

- parallel/*analyze_use_units.py*
- parallel/*HW_SW_analyzer.py*
- parallel/*instruction_errors_analyzer.py*
- parallel/*multiple_faults_analyzer.py*


The *general_launcher.py* file is the main file of the environment and configures and handles the complete execution of the profiling, fault-injection and error classification tasks.

The *gpu_compile.tcl* is mainly used to handle the hardware profiling operation. Moreover, this procedure allows the collection of target information from the instruction's execution per workload.

The *launch_zoixs.sh* handles the configuration and execution of the focused fault simulation campaigns on the hardware units. This step is executed through several sets of multi-threading schemes that are managed by the general controller of the environment (*general_launcher.py*).

The *fault_analyzer.py* is only used after all previous steps finished and associates the intermediate results from the previous steps to identify any possible presence of observable errors.

A set of complementary tools (*analyze_use_units.py*, *HW_SW_analyzer.py*, *instruction_errors_analyzer.py*, and *multiple_faults_analyzer.py*) are used to provide additional metrics and post-evaluation analyses.

## Operation of the environment:

To execute a hardware analysis and evaluation, please use the following command from the root directory:

```python3 general_launcher.py target_application target_unit```

where, *target_application* and *target_unit* are the target application and the target unit for evaluation, respectively.

The evnironment is configured to evaluate, by default, the instructions from fourteen applications, according to the first input argument to the environment: *back_propagation*, *euler*, *FFT*, *gray_filter*, *mxm*, *mxm_simple*, *nn*, *reduction*, *scalar_vector_product*, *scan*, *sobel*, *sort*, *transpose*, and *vector_add*.

Moreover, three target units (*target_unit*) can be evaluated by default: *warp_unit*, *decode*, and *fetch*.



## Example of simple analysis and evaluation:

The following example shows the use of the environment to evaluate the instructions from the *vector_add* application in the *decode* unit:

```python3 general_launcher.py vector_add decode```

Once, the simulation and evaluations are finished, you will observe a new folder *parallel/decode/vector_add* containing all the output reports:

- *individual_ins/*

contains the individual reports per dynamic instruction from the application.

- *decode_global_general_structure_execution_errors.txt*
- *decode_global_general_structure_operand_errors.txt*
- *decode_global_general_structure_operation_errors.txt*
- *decode_global_general_structure_order_errors.txt*

contain the set of each fault and the possible error classification.

- *decode_instruction_logger.log*

contains the execution time per dynamic instruction from the golde hardware profiling operation.

- *decode_report_Hw_faults_errors_relation.txt*

contains the quantitative relation of SW errors and HW faults from the performed evaluation.

- *decode_strobe_list.txt*

contains the hardware ports evaluated to identify observable error effects from propagated faults during the fault injection campaigns.

- *general_binary_distribution.txt*

These contain the binary error effects (number of bits affected by the propagated fault) for all propagated faults.

- *general_output_results.txt*

Contains the general output information of the number of faults classified, execution times and general evaluation of the instructions in a hardware unit.

- *individual_bin_distribution_execution_errors.txt*
- *individual_bin_distribution_operand_errors.txt*
- *individual_bin_distribution_operation_errors.txt*
- *individual_bin_distribution_order_errors.txt*

These contain the binary error effects (number of bits affected by the propagated fault) for each visible error classification.

- *inst_classification_execution.txt*
- *inst_classification_operand.txt*
- *inst_classification_operational.txt*
- *inst_classification_order.txt*

These contain the classification of the dynamic instructions into each visible error classification.

- *saf_dic_long.txt* 

contains the fine-grain hardware-level classification of the faults and the main effect at the output.

The additional files are intermediate-step files, generated during the procedures of error evaluation and classification.

If the profiling, fault simulation and error classifications are successful, a general output message must show the following information:

```
total mask list lenght:
 14905 
 total number of global_general_structure_operation_errors: 
 1263 
 total number of global_general_structure_operand_errors: 
 4732 
 total number of global_general_structure_order_errors: 
 229 
 total number of global_general_structure_execution_errors: 
 6663 
 Number of operation errors per subgroup:  
 Incorrect op. code: 1263        Invalid op. code: 0 
 Number of operand errors per subgroup:   
 Incorrect register addressed: 667        Incorrect parallel parameters: 624 
 Invalid register: 2806        Incorrect immediate operand: 1019 
 Number of order errors per subgroup:  
 commitment order violation: 229 
 Number of execution errors per subgroup:  
 Incorrect active threads: 1353        Incorrect active CTA: 99 
 Incorrect active line: 50        Incorrect active warp: 0 
 Incorrect functional unit: 1092        Incorrect memory source: 3122 
 Incorrect memory destiny: 2377 
 execution times: 
 Golden model import time(s): 7.72418022156 
 Golden simulation time(s): 14.6056377888 
 Total golden simuation time(s): 22.3298180103 
 fault-injection simulation time(s): 75.3150038719 
 fault analysis time(s): 3.61250519753 
```
Including execution times per each of the three steps, a general overview of the faults analyzed and their initial classifications.

**It is worth noting that according to the observable categories names, these can be indiferently:**

***Operation = Operation***
***Operand = Resource management***
***Order = Control-flow***
***Execution = Parallel managemento***



## Acknowledgments:

The **Hardware evaluation environment** was developed under the support of the National Resilience and Recovery Plan (PNRR) through the National Center for HPC, Big Data and Quantum Computing
For more information: http://www.supercomputing-icsc.it

The **FlexGripPlus** model was developed in the CAD group of Politecnico di Torino, Turin, Italy and supported with funding by the European Comission through the **Horizon 2020 RESCUE-ETN project** under grant 722325. 
For more information: http://rescue-etn.eu/


[![logo-poli-blu.png](https://i.postimg.cc/tRMFsnD8/logo-poli-blu.png)](https://postimg.cc/kDW2Z40y)


