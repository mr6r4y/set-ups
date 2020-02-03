#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
set -e
OLDDIR=$(pwd)

echo "[*] Dpkg - add i386 arch"
sudo dpkg --add-architecture i386

echo "[*] Install WineHQ key"
cd /tmp
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
cd $OLDDIR

echo "[*] Add repository with FAudio for Debian and Ubuntu"
wget -nv https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/Release.key -O /tmp/Release.key
sudo apt-key add - < /tmp/Release.key
sudo apt-add-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/ ./'
sudo apt update

echo "[*] Install stable branch"
sudo apt install --install-recommends winehq-stable
