dest_dir=dist
repo=https://github.com/Mellanox/mstflint.git
repo_version=4.24.0
repo_hash=885b2418543128ba2ae6a8095f39002d7c56c0ef
repo_dirname=mstflint-$repo_version
git clone $repo $repo_dirname
cd $repo_dirname
git checkout $repo_hash
mkdir $dest_dir
./autogen.sh
./configure --prefix=$PWD/$dest_dir --disable-inband
make -j 8 install
