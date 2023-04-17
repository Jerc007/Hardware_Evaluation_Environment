#!/bin/bash
#

./clean.csh

rm -rf zoix.sim sim.zdb faults.fdef simout-N0* zoix.log zoix.progress* zoix_rt.log *.log* *.cdf

zoix -f ./bin/load_design.f ./bin/strobes.sv +timescale+override+1ns/1ns +top+warp_unit+strobe +sv +notimingchecks +define+ZOIX +suppress+cell +delay_mode_fault -l log/zoix_compile.log


#fmsh -load bin/stuckat_v3.fmsh


#fmsh -blast sim


./zoix.sim +vcd+file+"DUT/RTL_sim/dumpports_warp_unit.vcd" +vcd+dut+warp_unit+tb_top_level.uGPGPU.uStreamingMultiProcessor.uWarpUnit +vcd+verify +vcd+verbose -l logic_sim.log


fmsh -load bin/permanent_faults_gen.fmsh
