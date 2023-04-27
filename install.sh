#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list

# Creating username and builddir variable
username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
apt install nala -y
nala update
nala upgrade -y
# Making .config and Moving config files and background to Pictures
cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/.icons
mkdir -p /home/$username/Pictures
mkdir -p /usr/share/sddm/themes
mkdir -p /usr/share/backgrounds
cp .Xresources /home/$username
cp .Xnord /home/$username
cp .zshrc /home/$username
cp -R dotconfig/* /home/$username/.config/
cp images/background.png /usr/share/backgrounds/
mv user-dirs.dirs /home/$username/.config
chown -R $username:$username /home/$username
# Installing sddm and sugar theme
# tar -xzvf sugar-candy.tar.gz -C /usr/share/sddm/themes
mv /home/$username/.config/sddm.conf /etc/sddm.conf
cd /usr/share/sddm/themes
git clone "https://framagit.org/MarianArlt/sddm-sugar-candy"
git clone "https://github.com/MarianArlt/sddm-sugar-dark"

# Installing sugar-candy dependencies
nala install libqt5svg5 qml-module-qtquick-controls qml-module-qtquick-controls2 -y
# Installing Essential Programs
nala install zsh bspwm sxhkd rofi polybar picom alacritty thunar lxpolkit x11-xserver-utils unzip yad wget pulseaudio pavucontrol -y
# Installing Other less important Programs
nala install feh flameshot nitrogen psmisc vim mousepad lxappearance papirus-icon-theme fonts-noto-color-emoji redshift -y
# Installing System Utility Programs
nala install bpytop stacer -y

# Installing material-black-pistachio
cd $builddir
unzip Material-Black-Pistachio-2.9.4.zip -d /usr/share/themes

#install sddm
wget 'ftp.us.debian.org/debian/pool/main/s/sddm/sddm_0.19.0-5_amd64.deb'
dpkg -i sddm_0.19.0-5_amd64.deb
rm -r sddm_*_amd64.deb

# Installing fonts
cd $builddir
nala install fonts-font-awesome
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/NerdFontsSymbolsOnly.zip
unzip NerdFontsSymbolsOnly.zip -d /home/$username/.fonts
mv dotfonts/fontawesome/*.otf /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip ./NerdFontsSymbolsOnly.zip

# Install Nightly diamond cursors
gzip -dc cursors/night-diamond-blue.tar.gz | tar -xvzf -
mv "Night Diamond (Blue)" /usr/share/icons

# Install brave-browser
nala install curl
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
nala update
nala install brave-browser -y

nala update
nala upgrade -y
# Enable graphical login and change target from CLI to GUI
systemctl enable sddm
systemctl set-default graphical.target

# Polybar configuration
bash scripts/changeinterface
