#!/bin/bash

#: Title: install-dirbusters.sh
#: Description: Installation of SecList, Gobuster, nmap, dnscan
#: References:
#:      * https://github.com/OJ/gobuster

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo apt-get update
sudo apt-get -y install libpcap-dev

create_repo_dir "$REPODIR" "$USER"

echo "[*] Install xmppdump"
cd $REPODIR
if [[ ! -e $REPODIR/xmppdump ]]; then
    echo "[*] Clone xmppdump"
    git clone https://github.com/balthorium/xmppdump.git
fi
cd xmppdump
git pull
g++ xmppdump.cpp xmlpp.cpp -lpcap -o xmppdump
sudo cp xmppdump /usr/local/bin/xmppdump
