#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
    echo -ne "
    #######################################################################
    ##  Must be root user to run this script, please run ./installer.sh  ##
    #######################################################################" 2>&1
    exit 1
fi


read -rep $'\e[1;33mChoose the following action for Docker (1, 2 or 3) :
-------------------------------------------------------------------------------
1. Install
2. Update
3. Uninstall
-------------------------------------------------------------------------------\n\e[0m' DOCKER_ACTION


if [ "$DOCKER_ACTION" == 1 ]; then
    echo "Uninstalling any older versions of docker, docker.io, containerd and runc before attempting to install a new version...."
    nala remove docker docker-engine docker.io containerd runc

    echo "Installing ca-certificates, curl and gnupg....."
    nala update
    nala install ca-certificates curl gnupg

    echo "Adding Docker’s official GPG key....."
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    chmod a+r /etc/apt/keyrings/docker.gpg

    echo "Setting up the repository....."
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null

    echo "Installing docker....."
    nala update
    nala install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    echo "Docker installed sucessfully......"
elif [ "$DOCKER_ACTION" == 2 ]; then
    echo "Uninstalling any older versions of docker, docker.io, containerd and runc before attempting to install a new version...."
    nala remove docker docker-engine docker.io containerd runc
    nala install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
    echo "Firefox Developer Edition updated sucessfully......"
elif [ "$DOCKER_ACTION" == 3 ]; then
    nala remove docker docker-engine docker.io containerd runc
    nala remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    echo "Docker uninstalled sucessfully......"
fi

