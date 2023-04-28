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
apt install -y nala
# Making .config and moving config files and backgrounds
cd $builddir
mkdir -p /home/$username/{.config,.fonts,.icons}
mkdir -p /usr/share/sddm/themes
mkdir -p /usr/share/backgrounds
cp .Xresources /home/$username
cp .Xnord /home/$username
cp -R dotconfig/* /home/$username/.config/
cp images/background.* /usr/share/backgrounds/
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
nala install bspwm sxhkd rofi polybar picom thunar lxpolkit x11-xserver-utils yad wget pulseaudio pavucontrol -y
# Installing terminal (alacritty,terminator)
nala install alacritty -y
# Installing Other less important Programs
nala install vim mousepad flameshot psmisc lxappearance redshift brightnessctl unzip -y
# Installing System Utility Programs
nala install bpytop stacer -y
# Image viewer (feh,qimgv,ristretto,viewnior,nitrogen)
nala install qimgv
# Installing material-black-pistachio
cd $builddir
unzip Material-Black-Pistachio-2.9.4.zip -d /usr/share/themes

#install sddm
wget ftp.us.debian.org/debian/pool/main/s/sddm/sddm_0.19.0-5_amd64.deb
dpkg -i sddm_0.19.0-5_amd64.deb
rm -r sddm_*_amd64.deb

# Installing fonts and icons
cd $builddir
nala install fonts-font-awesome fonts-noto-color-emoji papirus-icon-theme -y
mv dotfonts/* /home/$username/.fonts/

#Installing nerd-fonts
source scripts/nerdfonts.sh
chown $username:$username /home/$username/.fonts/*

# Install Nightly diamond cursors
gzip -dc cursors/night-diamond-blue.tar.gz | tar -xvzf -
mv "Night Diamond (Blue)" /usr/share/icons

# Install brave-browser
nala install curl
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
nala update
nala install brave-browser -y

# Enable graphical login and change target from CLI to GUI
systemctl enable sddm
systemctl set-default graphical.target

# Polybar configuration
bash scripts/changeinterface

# Install zsh shell with its config
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install zsh shell with oh-my-zsh (Y,n)? ' INSTZSH
if [ $INSTZSH =="Y"] || [$INSTZSH =="y" ]; then
  nala install zsh -y
  chsh -s /bin/zsh $username
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
  cp .zshrc /home/$username
fi

# Reboot the system after installation
read -rep $'[\e[1;33mACTION\e[0m] - !!!!!!!!!!!!!!!!!!!!!!!!!!Installtion Complete!!!!!!!!!!!!!!!!!!!!!!!!!!\nWould you like to reboot the system? (Y,n) ' WANREBOOT
if [ $INSTZSH =="Y"] || [$INSTZSH =="y" ]; then
  reboot
fi
