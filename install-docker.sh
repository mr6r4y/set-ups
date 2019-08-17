#!/bin/bash

#: Title: install-docker.sh
#: Description: Install and configure docker


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

echo "[*] Update"
sudo apt update

echo "[*] Enable apt work over HTTPS"
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "[*] Add Docker's GPG"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

echo "[*] Add repository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "[*] Install Docker CE"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose

echo "[*] Manage groups"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "[*] Test installation"
docker run hello-world
