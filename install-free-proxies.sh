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

echo "[*] Get Burp"
wget -O burp_community.sh "https://portswigger.net/burp/releases/download?product=community&version=1.7.36&type=linux"
echo "[*] Install Burp Community"
bash burp_community.sh -q

echo "[*] Get OWASP ZAP"
wget "https://github.com/zaproxy/zaproxy/releases/download/2.7.0/ZAP_2_7_0_unix.sh"
sudo bash ZAP_2_7_0_unix.sh -q

cd $OLDDIR
