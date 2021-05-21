#!/bin/bash

set -e

read -p "Specify slave hostname: " slaveHostName
read -p "Specify slave ip address: " slaveIP
read -p "Specify master hostname: " masterHostName
read -p "Specify master ip address: " masterIP

# -q means quiet
if grep -q ${slaveHostName} /etc/hosts ; then
    echo "hostname already exists"
    exit 1
fi

# or > /dev/null
if grep ${slaveIP} /etc/hosts > /dev/null ; then
    echo "host IP address already exists"
    exit 1
fi

if grep -q ${masterHostName} /etc/hosts ; then
    echo "master host name already exists"
    exit 1
fi

if grep -q ${masterIP} /etc/hosts ; then
    echo "master ip address already exists"
    exit 1
fi

echo "Adding the following slave info into /etc/hosts"

sudo cp /etc/hosts /etc/hosts.bak

# sudo Permission denied 重定向符号 >> 也是 bash 的命令 sudo 只是让echo命令具有了root权限
# 但是没有让 >> 命令也具有root权限，所以bash 会认为这个命令没有写入信息的权限
# sudo bash -c "echo /"${slaveIP} ${slaveHostName}/" >> /etc/hosts"

# 利用管道和 tee 命令，tee可以从标准输入中读入信息并将其写入标准输出或文件中
echo "${slaveIP} ${slaveHostName}" | sudo tee -a /etc/hosts


echo ""
echo "Adding the following master info into /etc/hosts"
echo "${masterIP} ${masterHostName}" | sudo tee -a /etc/hosts


# sudo systemctl restart networking.service
sudo apt install chrony openssh-server -y

cp ${HOME}/.bashrc ${HOME}/.bashrc.bak
echo "" >> ${HOME}/.bashrc
echo "export ROS_MASTER_URI=http://${masterIP}:11311" >> ${HOME}/.bashrc

read -p "Configure this device as master or slave? m/s:" role
if [[ "m" == ${role} ]] ;
then
    echo "export ROS_HOSTNAME=${masterHostName}" >> ${HOME}/.bashrc
elif [[ "s" == ${role} ]] ; 
then
    echo "export ROS_HOSTNAME=${slaveHostName}" >> ${HOME}/.bashrc
else
    echo "wrong input"
fi

echo "" >> ${HOME}/.bashrc
echo "configure successfully!"
