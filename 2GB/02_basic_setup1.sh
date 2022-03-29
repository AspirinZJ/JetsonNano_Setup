#!/bin/bash

set -e

sudo apt update
sudo apt autoremove -y

sudo apt remove baobab -y
sudo apt remove libreoffice-* -y
sudo apt autoremove -y
sudo apt remove thunderbird* -y
sudo apt remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku -y
sudo apt remove simple-scan shotwell shotwell-common evince evince-common -y
sudo apt remove remmina* transmission-* -y
sudo apt remove lxmusic mpv rhythmbox* smplayer* totem* -y
sudo apt remove eog gnome-calendar -y
sudo apt remove sudo apt remove gnome-disk-utility gnome-calculator -y
sudo apt remove gnome-todo gnome-todo-common -y
sudo apt remove gnome-font-viewer gedit gedit-common -y
sudo apt remove gnome-screenshot seahorse -y
sudo apt autoremove -y
sudo apt remove gucharmap deja-dup -y
sudo apt remove file-roller activity-log-manager clipit -y
sudo apt autoremove -y

# remove docker
sudo apt remove docker docker.io -y
sudo rm -rf /var/lib/docker/ /etc/docker/
sudo groupdel docker
sudo rm -rf /var/run/docker /var/run/docker.sock
sudo apt autoremove -y


if ! grep 'cuda/bin' ${HOME}/.bashrc > /dev/null ; then
  echo "** Add CUDA stuffs into ~/.bashrc"
  echo >> ${HOME}/.bashrc
  echo "export PATH=/usr/local/cuda/bin\${PATH:+:\${PATH}}" >> ${HOME}/.bashrc
  echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" >> ${HOME}/.bashrc
fi


sudo apt install -y apt-utils
sudo apt install -y curl
sudo apt install -y htop


git config --global user.name "AspirinZJ"
git config --global user.email "zhangmengwei1996@outlook.com"



echo "Installing SpaceVim, run `curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall` to uninstall"

curl -sLf https://spacevim.org/install.sh | bash
vim
vim

cd ~
git clone git@github.com:AspirinZJ/SpaceVim_settings.git

if [ ! -f /~/.SpaceVim.d/init.toml ]; then
	rm ~/.SpaceVim.d/init.toml
fi

cp ./SpaceVim_settings/init.toml ~/.SpaceVim.d/

# install JetbrainsMono font
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
