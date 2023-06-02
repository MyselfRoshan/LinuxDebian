#!/usr/bin/env bash

# Check if script is run as Root
if [[ $EUID -ne 0 ]]; then
  echo -ne "
    #######################################################################
    ##  Must be root user to run this script, please run ./installer.sh  ##
    #######################################################################" 2>&1
  exit 1
fi

# Install sddm
echo "
***************************
*** Installing SDDM.... ***
***************************
"
SDDM_DEB="$(mktemp)" &&
  wget -O "$SDDM_DEB" 'ftp.us.debian.org/debian/pool/main/s/sddm/sddm_0.19.0-5_amd64.deb' &&
  sudo dpkg -i "$SDDM_DEB"
rm -f "$SDDM_DEB"

# Install sddm sugar candy theme or not
read -rep $'[\e[1;33mACTION\e[0m] Choose the following SDDM Theme options (1, 2 or 3) :
-------------------------------------------------------------------------------
1. Sugar candy theme
2. Corners

-------------------------------------------------------------------------------\n' SDDM_THEMES

if [ "$SDDM_THEMES" == 1 ]; then
  PKGS=(
    'libqt5svg5'
    'qml-module-qtquick-controls'
    'qml-module-qtquick-controls2'
  )

  for PKG in "${PKGS[@]}"; do
    nala install "$PKG" -y
  done

  cd /usr/share/sddm/themes || {
    echo "Directory /usr/share/sddm/themes not found....."
    echo "Creating directory /usr/share/sddm/themes....."
    mkdir -p /usr/share/sddm/themes
    cd /usr/share/sddm/themes || exit
  }
  git clone "https://framagit.org/MarianArlt/sddm-sugar-candy"
  # Make Sugar candy the default theme for sddm
  # echo -ne '[Theme]\nCurrent=sugar-candy' > ~/sddm.conf
  # mv ~/sddm.conf /etc/
elif [ "$SDDM_THEMES" == 2 ]; then
  PKGS=(
    'libqt5svg5'
    'qml-module-qtquick-controls2'
    'qml-module-qtgraphicaleffects'
  )

  for PKG in "${PKGS[@]}"; do
    nala install "$PKG" -y
  done

  cd /usr/share/sddm/themes || {
    echo "Directory /usr/share/sddm/themes not found....."
    echo "Creating directory /usr/share/sddm/themes....."
    mkdir -p /usr/share/sddm/themes
    cd /usr/share/sddm/themes || exit
  }
  git clone https://github.com/aczw/sddm-theme-corners.git
  cd sddm-theme-corners || exit
  cp -r corners/ /usr/share/sddm/themes/
  # Make corners the default theme for sddm
  # echo -ne '[Theme]\nCurrent=corners' > ~/sddm.conf
  # mv ~/sddm.conf /etc/
fi

echo "Use command to test the themes: sddm-greeter --test-mode --theme /usr/share/sddm/themes/<theme-name>"
