dest_dir=dist
repo=https://github.com/pktgen/Pktgen-DPDK.git
repo_version=23.03
repo_hash=2d5f9cadf87cc71e3a01063e3412fbdeb53d7ea8
repo_dirname=pktgen-$repo_version
git clone $repo $repo_dirname
cd $repo_dirname
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/lib/:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH
export PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/bin:$PATH
export CPATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/include:$CPATH
export C_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist/include:$CPLUS_INCLUDE_PATH
git checkout $repo_hash
mkdir $dest_dir
patch < ../patch/meson_options.txt.patch
patch < ../patch/meson.build.patch
#WARNING This fix makes it so that we expect to have the corresponding version of dpdk in the env vars, if we sudo, we need to use sudo -E 
meson setup -Dbuildtype=debugoptimized -Denable_lua=true -Ddpdk_prefix=$EXP_FRAMEWORK_PATH/dpdk/dpdk-23.07/dist -Dc_args=-march=native -Dcpp_args=-march=native --prefix $PWD/$dest_dir $dest_dir .
cd $dest_dir
ninja -j 8 install
