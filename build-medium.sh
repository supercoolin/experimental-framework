#!/bin/bash
export EXP_FRAMEWORK_PATH=$(pwd)
export START_DIR=$(pwd)
cd llvm
source build_llvm.sh
cd $START_DIR/dpdk
source build_dpdk.sh
source $START_DIR/envs/env0.sh
cd $START_DIR/fastclick
source build_fastclick.sh
cd $START_DIR/pktgen
source build_pktgen.sh