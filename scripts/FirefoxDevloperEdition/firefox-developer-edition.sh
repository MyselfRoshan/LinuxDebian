#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
    echo -ne "
    #######################################################################
    ##  Must be root user to run this script, please run ./installer.sh  ##
    #######################################################################" 2>&1
    exit 1
fi

read -rep $'\e[1;33mChoose the following action for Firefox Developer Edition browser (1, 2 or 3) :
-------------------------------------------------------------------------------
1. Install
2. Update
3. Uninstall
-------------------------------------------------------------------------------\n\e[0m' FDE_ACTION

if [ "$FDE_ACTION" == 1 ]; then
    nala install libgtk2.0-0 libasound2 libdbus-glib-1-2
    curl -L "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" | tar --extract --verbose --preserve-permissions --bzip2 -C /opt
    ln -s /opt/firefox/firefox /usr/bin/firefox-developer-edition
    cp ./firefox-developer-edition.desktop /usr/share/applications/
    echo "Firefox Developer Edition installed sucessfully......"
elif [ "$FDE_ACTION" == 2 ]; then
    rm -rf /opt/firefox
    curl -L "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" | tar --extract --verbose --preserve-permissions --bzip2 -C /opt
    echo "Firefox Developer Edition updated sucessfully......"
elif [ "$FDE_ACTION" == 3 ]; then
    rm -rf /opt/firefox
    rm -r /usr/bin/firefox-developer-edition
    rm -r /usr/share/applications/firefox-developer-edition.desktop
    echo "Firefox Developer Edition uninstalled sucessfully......"
fi