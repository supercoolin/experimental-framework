dest_dir=dist
repo=git@github.com:tbarbette/fastclick.git
repo_version=26a2
repo_hash=26a2b65
repo_dirname=fastclick-$repo_version
git clone $repo $repo_dirname
cd $repo_dirname
git checkout $repo_hash
mkdir $dest_dir
./configure --prefix=$PWD/$dest_dir --disable-linuxmodule --enable-userlevel --enable-user-multithread --enable-intel-cpu --enable-etherswitch --disable-dynamic-linking --enable-local --enable-dpdk=$XCHG_SDK --enable-research --disable-task-stats --enable-flow --enable-cpu-load --prefix $(pwd)/build/ --enable-dpdk-pool --enable-rand-align RTE_TARGET=x86_64-native-linux-clanglto CXX="clang++ -flto -fno-access-control" CC="clang -flto -march=native" CXXFLAGS="-std=gnu++14 -O3 -march=native" LDFLAGS="-flto -fuse-ld=lld -Wl,-plugin-opt=save-temps" RANLIB="/bin/true" LD="ld.lld" READELF="llvm-readelf" AR="llvm-ar" --disable-bound-port-transfer --enable-dpdk-pool --enable-dpdk-xchg --enable-dpdk-packet --disable-dpdk-softqueue
make -J install
