#!/bin/bash
export EXP_FRAMEWORK_PATH=$(dirname "$BASH_SOURCE")
cd llvm
sh build_llvm.sh
cd ../ofed-mstflint
sh build_mstflint.sh
cd ../dpdk
sh build_dpdk.sh
source ../env/env0.sh
cd ../fastclick
sh build_fastclick.sh
cd ../pktgen
sh build_pktgen.sh