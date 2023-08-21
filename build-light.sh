#!/bin/bash
export EXP_FRAMEWORK_PATH=$(dirname "$BASH_SOURCE")
cd dpdk
source build_dpdk.sh
source ../envs/env0.sh
cd ../fastclick
source build_fastclick.sh
cd ../pktgen
source build_pktgen.sh