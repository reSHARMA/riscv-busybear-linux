#!/bin/bash

# sudo apt-get install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev

set -x

source env_var.sh

git clone  https://git.qemu.org/git/qemu.git qemu
cd qemu
./configure --target-list=riscv64-softmmu
make -j $(nproc)
cd ..

git clone https://github.com/reSHARMA/busybear-linux.git
git clone https://github.com/torvalds/linux
cd linux
git checkout v4.19-rc3
cp ../busybear-linux/conf/linux.config .config
make -j $(nproc) CROSS_COMPILE=riscv64-unknown-linux-gnu- ARCH=riscv olddefconfig
#make -j $(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- nconfig
make -j $(nproc) CROSS_COMPILE=riscv64-unknown-linux-gnu- ARCH=riscv vmlinux
cd ..

git clone https://github.com/riscv/riscv-pk.git
cd riscv-pk
mkdir build
cd build
../configure \
    --enable-logo \
    --host=riscv64-unknown-elf \
    --with-payload=../../linux/vmlinux
make -j $(nproc)
cd ../../

cd busybear-linux && make -j $(nproc)
