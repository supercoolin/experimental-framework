dest_dir=dist
repo=https://github.com/tbarbette/fastclick.git
repo_version=26a2
repo_hash=26a2b65
repo_dirname=fastclick-$repo_version
git clone $repo $repo_dirname
cd $repo_dirname
git checkout $repo_hash
mkdir $dest_dir
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/lib/mstflint:$LD_LIBRARY_PATH
export CPATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/include/mstflint:$CPATH
export C_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/include/mstflint:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/ofed-mstflint/mstflint-4.24.0/dist/include/mstflint:$CPLUS_INCLUDE_PATH
./configure --prefix=$PWD/$dest_dir --enable-dpdk --enable-intel-cpu --verbose --enable-select=poll CFLAGS="-O3 -march=native" CXXFLAGS="-std=c++11 -O3 -march=native"  --disable-dynamic-linking --enable-poll --enable-bound-port-transfer --enable-local --enable-flow --disable-task-stats --disable-cpu-load
make -j 8 install
