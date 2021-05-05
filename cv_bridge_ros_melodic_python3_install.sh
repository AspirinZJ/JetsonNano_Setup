#!/bin/bash

set -e

echo "~~~~~~~Specify the folder name you want to build cv_bridge with python3. Example: catkin_ws~~~~~~~"
echo "~~~~~~~Use absolute path. DO NOT use relative path"
read -p "folder name: " folderName
if [[ $folderName != /home/* ]]; then
    echo "Wrong folder path. Use absolute path."
    exit 1
fi
mkdir -p "${folderName}/src"

cd "${folderName}/src"
git clone -b noetic https://github.com/ros-perception/vision_opencv.git

# in ros-melodic, modify one line in CMakeLists.txt
sed -i "s/find_package(Boost REQUIRED python37)/find_package(Boost REQUIRED python3)/g" ./vision_opencv/cv_bridge/CMakeLists.txt

cd .. # back to catkin workspace
mkdir -p "${folderName}/build" "${folderName}/devel" "${folderName}/logs" "${folderName}/install"
catkin config -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython3.6m.so
catkin config --install

catkin build cv_bridge

echo ""
echo ""
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Finished building cv_bridge~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~~To use the package, source it via: source ${folderName}/install/setup.bash --extend~~~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
