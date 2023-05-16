#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

echo
echo "INSTALLING X-MONAD"
echo

PKGS=(
  # Installing Essential Programs
  'alacritty'
  'brightnessctl'
  'curl'
  #'dmenu' # Recommended if you dont use rofi
  'libghc-xmonad-contrib-dev' #Must have
  'libghc-dbus-dev' #Must have
  'lxpolkit'
  'pavucontrol'
  'picom'
  'pulseaudio'
  'rofi'
  'thunar'
  'thunar-archive-plugin'
  'wget'
  'x11-xserver-utils'
  'xmonad' # Must have
  'xmobar'
 # 'xterm' # Recommended if you dont use alacritty or it does not show up
)

for PKG in "${PKGS[@]}"; do
  echo "INSTALLING: ${PKG}"
  sudo nala install "$PKG" -y
done

echo
echo "Done!"
echo
