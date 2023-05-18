#!/usr/bin/env bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run ./sddm.sh" 2>&1
  exit 1
fi

echo
echo "INSTALLING SUGAR CANDY AND ITS DEPENDENCY"
echo

PKGS=(
  # Installing sugar-candy dependencies
  'libqt5svg5'
  'qml-module-qtquick-controls'
  'qml-module-qtquick-controls2'
)

for PKG in "${PKGS[@]}"; do
  nala install "$PKG" -y
done
#mv ~/.config/sddm.conf /etc/sddm.conf
cd /usr/share/sddm/themes || {
  echo "Directory /usr/share/sddm/themes not found....."
  exit 1
}
git clone "https://framagit.org/MarianArlt/sddm-sugar-candy"
git clone "https://github.com/MarianArlt/sddm-sugar-dark"

echo
echo "INSTALLING SDDM DISPLAY MANAGER"
echo
#install sddm
SDDM_DEB="$(mktemp)" &&
  wget -O "$SDDM_DEB" 'ftp.us.debian.org/debian/pool/main/s/sddm/sddm_0.19.0-5_amd64.deb' &&
  sudo dpkg -i "$SDDM_DEB"
rm -f "$SDDM_DEB"
#One liner
# deb=$(curl -w "%{filename_effective}" -LO ftp.us.debian.org/debian/pool/main/s/sddm/sddm_0.19.0-5_amd64.deb) && dpkg -i "$deb" && rm "$deb" && unset deb
# dpkg -i <(wget --output-file=- 'ftp.us.debian.org/debian/pool/main/s/sddm/sddm_0.19.0-5_amd64.deb')
echo
echo "Done!"
echo
