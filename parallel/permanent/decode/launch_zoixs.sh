#!/bin/bash
#

./clean.csh

rm -rf zoix.sim sim.zdb faults.fdef simout-N0* zoix.log zoix.progress* zoix_rt.log *.log* *.cdf

zoix -f ./bin/load_design.f ./bin/strobes.sv +timescale+override+1ns/1ns +top+pipeline_decode+strobe +sv +notimingchecks +define+ZOIX +suppress+cell +delay_mode_fault -l log/zoix_compile.log


#fmsh -load bin/stuckat_v3.fmsh


#fmsh -blast sim


./zoix.sim +vcd+file+"DUT/RTL_sim/dumpports_decode.vcd" +vcd+dut+pipeline_decode+tb_top_level.uGPGPU.uStreamingMultiProcessor.uPipelineDecode +vcd+verify +vcd+verbose -l logic_sim.log


fmsh -load bin/permanent_faults_gen.fmsh
