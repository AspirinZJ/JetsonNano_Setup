#!/bin/bash

set -e

cd ~
wget https://boostorg.jfrog.io/artifactory/main/release/1.76.0/source/boost_1_76_0.tar.gz
tar -zxf boost_1_76_0.tar.gz
rm boost_1_76_0.tar.gz
cd boost_1_76_0/
./bootstrap.sh --with-python=/usr/bin/python3 --with-python-version=3.7 --with-python-root=/usr/local/lib/python3.7 --prefix=/usr/local
sudo ./b2 install -a --with=all
sudo ldconfig

