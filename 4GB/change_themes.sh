#!/bin/bash

cd ./themes

echo "Installing cursor theme..."
tar -xf Oxygen\ 21\ White\ Daisy.tar.gz
sudo mv Oxygen\ 21\ White\ Daisy /usr/share/icons/

echo "Installing theme..."
tar -xf 05-Flat-Remix-GTK-Green-Dark_20201129.tar.xz
sudo mv Flat-Remix-GTK-Green-Dark/ /usr/share/themes/

echo "Installing icon theme..."
tar -xf papirus-icon-theme-20210302.tar.xz
sudo mv Papirus* /usr/share/icons/ && sudo mv ePapirus/ /usr/share/icons/
sudo gtk-update-icon-cache /usr/share/icons/Papirus && sudo gtk-update-icon-cache /usr/share/icons/Papirus-Dark/ && sudo gtk-update-icon-cache /usr/share/icons/Papirus-Light/ && sudo gtk-update-icon-cache /usr/share/icons/ePapirus/

echo "Cleaning redundent files..."
rm AUTHORS Makefile LICENSE
