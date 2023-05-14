#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

echo
echo "INSTALLING BSPWM"
echo

PKGS=(
  # Installing Essential Programs
  'bspwm'
  'brightnessctl'
  'curl'
  'lxpolkit'
  'pavucontrol'
  'picom'
  'polybar'
  'pulseaudio'
  'rofi'
  'sxhkd'
  'thunar'
  'wget'
  'x11-xserver-utils'
  'yad'
)

for PKG in "${PKGS[@]}"; do
  echo "INSTALLING: ${PKG}"
  sudo nala install "$PKG" -y
done

echo
echo "Done!"
echo
