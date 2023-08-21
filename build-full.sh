#!/bin/basource
export EXP_FRAMEWORK_PATH=$(dirname "$BAsource_SOURCE")
cd llvm
source build_llvm.source
cd ../ofed-mstflint
source build_mstflint.source
cd ../dpdk
source build_dpdk.source
source ../envs/env0.source
cd ../fastclick
source build_fastclick.source
cd ../pktgen
source build_pktgen.source