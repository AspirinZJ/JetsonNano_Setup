#!/bin/bash

set -e 

sudo apt install python3-catkin-pkg-modules
sudo apt install python3-rospkg-modules
# sudo apt install python3-rosdep python3-rosinstall-generator python3-wstool python3-rosinstall build-essential
# sudo pip3 install catkin_pkg --user
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "To use python3 in ros, type catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3"
echo "To use python3 in ros, add #!/usr/bin/env python3" as the first line in your python3 script
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
