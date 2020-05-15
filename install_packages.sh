#!/bin/bash

apt-get update -q
apt install -yqq software-properties-common
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt update -q
apt-get install --no-install-recommends -yqq \
        make \
        ninja-build \
        git \
        libedit-dev \
        libtbb-dev \
        xz-utils \
        zlib1g-dev \
        python3 \
        python3-pip \
        gcc-9 \
        g++-9 \
        libboost-filesystem1.65-dev \
        libboost1.65-dev \
        libprotobuf-dev \
        protobuf-compiler \
        libopenblas-dev \
        ocl-icd-opencl-dev \
        opencl-headers \
        libpocl2 \
        wget \
        xz-utils

wget https://github.com/Kitware/CMake/releases/download/v3.17.2/cmake-3.17.2-Linux-x86_64.sh
chmod +x cmake-3.17.2-Linux-x86_64.sh
./cmake-3.17.2-Linux-x86_64.sh --prefix=/usr/ --exclude-subdir --skip-license
rm cmake-3.17.2-Linux-x86_64.sh

git clone https://github.com/google/googletest.git
cd googletest
CXX_FLAGS="-fPIC" cmake .
CXX_FLAGS="-fPIC" cmake --build .
cmake --build . --target install

cd ..

rm -rf googletest

pip3 install setuptools
pip3 install gcovr
pip3 install lit

rm -rf /var/lib/apt/lists/*

wget https://github.com/alexbatashev/llvm-build/releases/latest/download/llvm-ubuntu-latest.tar.gz
tar -xf llvm-ubuntu-latest.tar.gz -C /usr/local

rm -f llvm-ubuntu-latest.tar.gz

