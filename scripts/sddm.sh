#!/usr/bin/env bash

echo
echo "INSTALLING SDDM DISPLAY MANAGER"
echo

PKGS=(
  # Installing sugar-candy dependencies
  'libqt5svg5'
  'qml-module-qtquick-controls'
  'qml-module-qtquick-controls2'
)

for PKG in "${PKGS[@]}"; do
  sudo nala install "$PKG" -y
done
#install sddm
wget ftp.us.debian.org/debian/pool/main/s/sddm/sddm_0.19.0-5_amd64.deb
sudo dpkg -i sddm_0.19.0-5_amd64.deb
rm -r sddm_*_amd64.deb
echo
echo "Done!"
echo
