#LLVM VARS
export PATH=$EXP_FRAMEWORK_PATH/llvm/llvm-16.06/build/bin:$PATH
#DPDK VARS
export RTE_SDK=$EXP_FRAMEWORK_PATH/dpdk/dpdk-22.07
export RTE_TARGET=x86_64-native-linuxapp-gcc
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/lib/:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH
export PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/bin:$PATH
export CPATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/include:$CPATH
export C_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/include:$CPLUS_INCLUDE_PATH
#MSFLINT VARS (NEEDED FOR FASTCLICK + DPDK APPARENTLY ? PROBABLY BECAUSE OF A NEW VERSION OF DPDK)
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/lib/mstflint:$LD_LIBRARY_PATH
export CPATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/include/mstflint:$CPATH
export C_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/include/mstflint:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/include/mstflint:$CPLUS_INCLUDE_PATH
#FASTCLICK VARS
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/fastclick/fastclick-26a2/dist/lib:$LD_LIBRARY_PATH
export PATH=$EXP_FRAMEWORK_PATH/fastclick/fastclick-26a2/dist/bin:$PATH
export CPATH=$EXP_FRAMEWORK_PATH/fastclick/fastclick-26a2/dist/include:$CPATH
export C_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/fastclick/fastclick-26a2/dist/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/fastclick/fastclick-26a2/dist/include:$CPLUS_INCLUDE_PATH
#PKTGEN VARS
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/pktgen/pktgen-23.03/dist/lib:$LD_LIBRARY_PATH
export PATH=$EXP_FRAMEWORK_PATH/pktgen/pktgen-23.03/dist/bin:$PATH
export CPATH=$EXP_FRAMEWORK_PATH/pktgen/pktgen-23.03/dist/include:$CPATH
export C_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/pktgen/pktgen-23.03/dist/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/pktgen/pktgen-23.03/dist/include:$CPLUS_INCLUDE_PATH
