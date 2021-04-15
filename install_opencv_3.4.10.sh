#!/bin/bash

set -e

sudo apt install -y build-essential
sudo apt install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev

sudo apt install -y cmake-curses-gui g++ curl libavutil-dev libeigen3-dev libglew-dev libgtk2.0-dev libv4l-dev v4l-utils qv4l2 v4l2ucp libxine2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libjpeg8-dev libjpeg-turbo8-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev libopenblas-dev liblapack-dev liblapacke-dev gfortran qt5-default
sudo apt install -y libpython2.7-dev libpython3.6-dev python-pip python3-pip

chip_id=$(cat /sys/module/tegra_fuse/parameters/tegra_chip_id)
case ${chip_id} in
  "33" )  # Nano and TX1
    cuda_compute=5.3
    ;;
  "24" )  # TX2
    cuda_compute=6.2
    ;;
  "25" )  # AGX Xavier
    cuda_compute=7.2
    ;;
  * )     # default
    cuda_compute=5.3,6.2,7.2
    ;;
esac

cd ~
if [ ! -f opencv-3.4.10.zip ]; then
  wget https://github.com/opencv/opencv/archive/3.4.10.zip -O opencv-3.4.10.zip
fi
if [ -d opencv-3.4.10 ]; then
  echo "** ERROR: opencv-3.4.10 directory already exists"
  exit
fi
unzip opencv-3.4.10.zip
cd opencv-3.4.10/

echo "** Building opencv..."
mkdir build
cd build/
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr \
      -D WITH_CUDA=ON -D CUDA_ARCH_BIN=${cuda_compute} -D CUDA_ARCH_PTX="" \
      -D WITH_CUBLAS=ON -D ENABLE_FAST_MATH=ON -D CUDA_FAST_MATH=ON \
      -D ENABLE_NEON=ON -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON \
      -D EIGEN_INCLUDE_PATH=/usr/include/eigen3 \
      -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=ON \
      -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF \
      -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j$(nproc)
sudo make install
sudo ldconfig

echo "Install OpenCV 3.4.10 successfully."
