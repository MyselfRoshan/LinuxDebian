#!/bin/bash
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install Brave Browser ? (Y,n) ' BB
if [ "$BB" == "Y" ] || [ "$BB" == "y" ]; then
    sudo nala install curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo nala update
    sudo nala install brave-browser -y
fi
