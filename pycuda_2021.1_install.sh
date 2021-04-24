#!/bin/bash

set -e

cd ~
wget https://github.com/inducer/pycuda/archive/v2021.1.tar.gz -O pycuda_2021.1.tar.gz
tar -zxf pycuda_2021.1.tar.gz
rm pycuda_2021.1.tar.gz
cd pycuda-2021.1/
python3 configure.py --cuda-root=/usr/local/cuda

