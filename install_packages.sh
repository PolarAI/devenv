#!/bin/bash

apt-get update -q
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
        gcc \
        g++ \
        libboost-filesystem1.65-dev \
        libboost1.65-dev \
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
rm cmake-3.14.3-Linux-x86_64.sh

pip3 install setuptools
pip3 install gcovr
pip3 install lit

rm -rf /var/lib/apt/lists/*

wget https://github.com/alexbatashev/llvm-build/releases/latest/download/llvm.tar.gz
tar -xf llvm.tar.gz -C /usr/local

rm -f llvm.tar.gz

