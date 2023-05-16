#!/bin/bash
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install Firefox Developer Edition ? (Y,n) ' FDE
if [ "$FDE" == "Y" ] || [ "$FDE" == "y" ]; then
    sudo nala install libgtk2.0-0 libasound2 libdbus-glib-1-2
    sudo curl --location "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" | sudo tar --extract --verbose --preserve-permissions --bzip2 -C /opt
    sudo ln -s /opt/firefox/firefox /usr/bin/firefox-developer-edition
    sudo cp ./firefox-developer-edition.desktop /usr/share/applications/
fi
