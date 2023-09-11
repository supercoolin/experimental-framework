dest_dir=dist
repo=https://github.com/supercoolin/fastclick-fiddling0.git
repo_version=514cee
repo_hash=514ceef12f7a8fbcf94c8fc084ad1eb0f0718f77
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
#CXX=clang++ ./configure --prefix=$PWD/$dest_dir --enable-dpdk --enable-intel-cpu --verbose --enable-select=poll CFLAGS="-O3 -march=native" CXXFLAGS="-std=c++11 -O3 -march=native"  --disable-dynamic-linking --enable-poll --enable-local --enable-flow --disable-task-stats --disable-cpu-load
./configure --disable-bound-port-transfer --enable-dpdk-pool --enable-dpdk-packet --disable-dpdk-softqueue --disable-linuxmodule --disable-rsspp --enable-userlevel --enable-user-multithread --enable-etherswitch --disable-dynamic-linking --enable-local --enable-dpdk --enable-research --disable-task-stats --enable-flow --enable-cpu-load --prefix $(pwd)/$dest_dir --enable-intel-cpu --enable-dpdk-pool --enable-rand-align CXX="clang++ -flto -fno-access-control" CC="clang -flto" CXXFLAGS="-std=gnu++14 -O3" LDFLAGS="-flto -fuse-ld=lld -Wl,-plugin-opt=save-temps" RANLIB="/bin/true" LD="ld.lld" READELF="llvm-readelf" AR="llvm-ar"
make -j 8 install
echo $'To use packetmill optimally, add \nexport alias packetmill="export CXX=clang++ packetmill"\nto your bashrc'