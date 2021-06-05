#!/bin/bash

set -e

if ! grep 'cuda/bin' ${HOME}/.bashrc > /dev/null ; then
  echo "** Add CUDA stuffs into ~/.bashrc"
  echo >> ${HOME}/.bashrc
  echo "export PATH=/usr/local/cuda/bin\${PATH:+:\${PATH}}" >> ${HOME}/.bashrc
  echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" >> ${HOME}/.bashrc
fi

sudo apt remove -y deja-dup
sudo apt autoremove -y

sudo apt install -y apt-utils

sudo apt install -y curl

sudo apt install -y htop

sudo apt remove -y lxtask

sudo apt remove -y libreoffice-*
sudo apt update && sudo apt autoremove -y

sudo apt remove -y lxmusic
sudo apt update && sudo apt autoremove -y

sudo apt remove -y xfburn
sudo apt update && sudo apt autoremove -y

sudo apt remove -y leafpad
sudo apt update && sudo apt autoremove -y

sudo apt remove -y onboard
sudo apt remove -y mate-calc*
sudo apt remove -y gedit*
sudo apt remove -y gnome-todo*
sudo apt update && sudo apt autoremove -y
sudo apt remove -y xfce4-notes*
sudo apt remove -y pidgin*
sudo apt update && sudo apt autoremove -y

sudo apt remove -y thunderbird
sudo apt remove -y simple-scan
sudo apt remove -y shotwell*
sudo apt update && sudo apt autoremove -y
sudo apt remove -y gnome-mines
sudo apt update && sudo apt autoremove -y
sudo apt remove -y sgt-*
sudo apt update && sudo apt autoremove -y
sudo apt remove -y gnome-sudoku
sudo apt update && sudo apt autoremove -y
sudo apt remove -y firefox

sudo apt install -y ibus-pinyin

sudo apt remove -y gpicview
sudo apt update && sudo apt autoremove -y
sudo apt remove -y lxterminal
sudo apt remove -y pcmanfm
sudo apt update && sudo apt autoremove -y
sudo apt remove -y atril*
sudo apt update && sudo apt autoremove -y
sudo apt remove -y xfce4-dict xfce4-mailwatch-plugin xfce4-weather-plugin
sudo apt remove -y gnome-calendar
sudo apt update && sudo apt autoremove -y
sudo apt remove -y galculator
sudo apt remove -y mousepad
sudo apt update && sudo apt autoremove -y
sudo apt remove -y transmission-* remmina*
sudo apt update && sudo apt autoremove -y
sudo apt install -y python3-pip

git config --global user.name "AspirinZJ"
git config --global user.email "zhangmengwei1996@outlook.com"

sudo apt remove -y xarchiver

# rm ~/.config/user-dirs.dirs && cp ./resources/user-dirs.dirs ~/.config/

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup component add rls rust-analysis rust-src

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

# remove some software
sudo apt remove gnome-mahjongg aisleriot baobab seahorse gnome-accessibility-themes -y
sudo apt remove gnome-getting-started-docs gnome-shell-extension-appindicator gnome-shell-extension-ubuntu-dock gnome-disk-utility -y
sudo apt remove rhythmbox* -y
sudo apt remove file-roller -y
sudo apt remove catfish -y
sudo apt remove gucharmap -y
sudo apt update && sudo apt autoremove -y
