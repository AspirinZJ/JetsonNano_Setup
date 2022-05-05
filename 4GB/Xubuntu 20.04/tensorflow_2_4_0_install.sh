#!/bin/bash

set -e

# get a fresh start (remember, the 64-bit OS is still under development)
sudo apt update
sudo apt upgrade
# install pip and pip3
sudo apt install python-pip python3-pip -y
## remove old versions, if not placed in a virtual environment (let pip search for them)
# sudo -H pip uninstall tensorflow
# sudo -H pip3 uninstall tensorflow
# install the dependencies (if not already onboard)
sudo apt install gfortran -y
sudo apt install libhdf5-dev libc-ares-dev libeigen3-dev -y
sudo apt install libatlas-base-dev libopenblas-dev libblas-dev -y
sudo apt install liblapack-dev -y
sudo -H pip3 install Cython==0.29.21
# install h5py with Cython version 0.29.21 (± 6 min @1950 MHz)
sudo -H pip3 install h5py==2.10.0
sudo -H pip3 install -U testresources numpy
# upgrade setuptools 39.0.1 -> 51.0.0
sudo -H pip3 install --upgrade setuptools
sudo -H pip3 install pybind11 protobuf google-pasta
sudo -H pip3 install -U six mock wheel requests gast
sudo -H pip3 install keras_applications --no-deps
sudo -H pip3 install keras_preprocessing --no-deps
# install gdown to download from Google drive
sudo -H pip3 install gdown
# download the wheel
gdown https://drive.google.com/uc?id=1W-p9oIo37xT2rQzd6KPuJq1QOBRL7-wp
# install TensorFlow (± 12 min @1500 MHz)
sudo -H pip3 install tensorflow-2.4.0-cp36-cp36m-linux_aarch64.whl

