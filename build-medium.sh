#!/bin/bash
export EXP_FRAMEWORK_PATH=$(pwd)
export START_DIR=$(pwd)
cd ofed-mstflint
source build_mstflint.sh
cd $START_DIR/dpdk
source build_dpdk.sh
source $START_DIR/envs/env0.sh
cd $START_DIR/fastclick
source build_fastclick.sh
cd $START_DIR/pktgen
source build_pktgen.sh