#!/bin/bash

set -e

sudo apt install git cmake libpython3-dev python3-numpy -y
cd ~
git clone --recursive git@github.com:dusty-nv/jetson-inference.git
cd jetson-inference
mkdir build && cd build
cmake ..
make -j3
sudo make install
sudo ldconfig
