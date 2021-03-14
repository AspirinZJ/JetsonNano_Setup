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

git config --global user.name "AspirinZJ"
git config --global user.email "zhangmengwei1996@outlook.com"

echo "Generating ssh key"
ssh-keygen -t rsa

cat ~/.ssh/id_rsa.pub

echo "Paste the key to Github"
