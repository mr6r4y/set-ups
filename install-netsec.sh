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

echo "[*] Install nmap, tcpdump, iptables-persistent"
sudo apt-get -y install \
    nmap \
    tcpdump \
    iptables-persistent

echo "[*] Install mitmproxy"
sudo pip3 install mitmproxy

echo "[*] Install bettercap"
sudo apt-get -y install \
    libusb-1.0-0-dev \
    libpcap-dev \
    libnetfilter-queue-dev \
    build-essential
go get github.com/bettercap/bettercap
GOPATH="$HOME/go"
cd $GOPATH/src/github.com/bettercap/bettercap
make build 
sudo make install

create_repo_dir "$REPODIR" "$USER"

echo "[*] Get SecLists"
cd $REPODIR
if [[ ! -e $REPODIR/SecLists ]]; then
    echo "[*] Clone SecLists"
    git clone https://github.com/danielmiessler/SecLists.git
fi

echo "[*] Install dnscan"
sudo pip install dnspython
cd $REPODIR
if [[ ! -e $REPODIR/dnscan ]]; then
    echo "[*] Clone dnscan"
    git clone https://github.com/rbsec/dnscan.git
fi
cd dnscan
git pull
link_to_usr_local_bin ./dnscan.py

echo "[*] Install gobuster"
cd $REPODIR
if [[ ! -e $REPODIR/gobuster ]]; then
    echo "[*] Clone gobuster"
    git clone https://github.com/OJ/gobuster.git
fi
cd gobuster
git pull
go get -u github.com/OJ/gobuster
go build
link_to_usr_local_bin ./gobuster

cd $OLDDIR

