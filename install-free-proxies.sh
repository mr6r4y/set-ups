#!/bin/bash

#: Title: install-free-proxies.sh
#: Description: Installation of ZAP and Burp Community

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

create_repo_dir "$REPODIR" "$USER"

cd $REPODIR

if [ ! -e "$HOME/BurpSuiteCommunity" ]
then
    echo "[*] Get Burp"
    wget -O burp_community.sh "https://portswigger.net/burp/releases/download?product=community&version=1.7.36&type=linux"
    echo "[*] Install Burp Community"
    bash burp_community.sh -q
fi

if [ -e "$HOME/Desktop" ]
then
    echo "[*] Copy Burp desktop icon"
    cp $HOME/BurpSuiteCommunity/*.desktop $HOME/Desktop
fi

if [ ! -e "$HOME/BurpSuiteCommunity" ]
then
    echo "[*] Get OWASP ZAP"
    wget "https://github.com/zaproxy/zaproxy/releases/download/2.7.0/ZAP_2_7_0_unix.sh"
    echo "[*] Install OWASP ZAP"
    sudo bash ZAP_2_7_0_unix.sh -q
fi

if [ -e "$HOME/Desktop" ]
then
    echo "[*] Copy ZAP desktop icon"
    cp /opt/zaproxy/*.desktop $HOME/Desktop
fi

cd $OLDDIR
