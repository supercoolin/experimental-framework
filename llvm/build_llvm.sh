dest_dir=dist
repo=https://github.com/llvm/llvm-project.git
repo_version=16.06
repo_hash=7cbf1a2591520c2491aa35339f227775f4d3adf6
repo_dirname=llvm-$repo_version
git clone $repo $repo_dirname
cd $repo_dirname
git checkout $repo_hash
mkdir $dest_dir
prefix=$PWD/$dest_dir
mkdir build
cmake -S llvm -B build -GNinja -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_USE_LINKER=gold  -DLLVM_ENABLE_PROJECTS="clang;lldb;llvm" -DCMAKE_INSTALL_PREFIX:PATH=$prefix -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_FLAGS=-march=native -DCMAKE_CPP_FLAGS=-march=native ..
cd build
ninja -j 12 install
