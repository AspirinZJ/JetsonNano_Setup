#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y xfce4

echo "You could choose lightdm to run with a lighter display manager."
sudo apt install -y xubuntu-desktop
sudo apt remove -y nautilus gnome-power-manager gnome-screensaver gnome-termina* gnome-pane* gnome-applet* gnome-bluetooth gnome-desktop* gnome-sessio* gnome-user* gnome-shell-common compiz compiz* unity unity* hud zeitgeist zeitgeist* python-zeitgeist libzeitgeist* activity-log-manager-common gnome-control-center gnome-screenshot overlay-scrollba*

sudo apt install -y lightdm
sudo apt autoremove -y
echo "Reboot the system"
