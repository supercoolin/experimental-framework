dest_dir=dist
repo=https://github.com/DPDK/dpdk.git
repo_version=23.07
repo_hash=12fcafcd62286933e6b167b14856d21f642efa5f
repo_dirname=dpdk-$repo_version
git clone $repo $repo_dirname
cd $repo_dirname
export RTE_SDK=$PWD
export RTE_TARGET=x86_64-native-linuxapp-gcc
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/lib/mstflint:$LD_LIBRARY_PATH
export CPATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/include/mstflint:$CPATH
export C_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/include/mstflint:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/include/mstflint:$CPLUS_INCLUDE_PATH
git checkout $repo_hash
mkdir $dest_dir
meson setup -Dbuildtype=debugoptimized -Dc_args=-march=native -Dcpp_args=-march=native -Ddisable_drivers=regex/cn9k --prefix $PWD/$dest_dir $dest_dir .
cd $dest_dir
ninja -j 8 install


echo "Please add export RTE_SDK=$RTE_SDK;RTE_TARGET=$RTE_TARGET to your bashrc"
