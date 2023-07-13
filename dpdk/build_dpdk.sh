dest_dir=dist
repo=git@github.com:DPDK/dpdk.git
repo_version=22.07
repo_hash=4fceceed5b5e9fbf04acffd66239c79d81e79260
repo_dirname=dpdk-$repo_version
git clone $repo $repo_dirname
cd $repo_dirname
git checkout $repo_hash
mkdir $dest_dir
meson setup -Dbuildtype=debugoptimized -Dc_args=-march=icelake-server -Dcpp_args=-march=icelake-server -Ddisable_drivers=regex/cn9k --prefix $PWD/$dest_dir build .
cd build
ninja install
