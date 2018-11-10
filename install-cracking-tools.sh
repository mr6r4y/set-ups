#!/bin/bash

#: Title: install-cracking-tools.sh
#: Description: Installs cracking tools such as hashcat, ncrack, medusa, john, hydra
#: Reference:
#:      * http://thesprawl.org/projects/pack/
#:      * https://github.com/iphelix/pack
#:      * https://hashcat.net/hashcat/
#:      * https://github.com/hashcat/hashcat-utils.git
#:      * https://github.com/vanhauser-thc/thc-hydra
#:      * https://github.com/nmap/ncrack
#:      * https://github.com/vanhauser-thc/thc-hydra
#:      * http://foofus.net/goons/jmk/medusa/medusa.html

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

sudo apt-get -y install build-essential

sudo apt-get -y install \
    medusa \
    ncrack \
    john \
    hydra \
    lsb-core

create_repo_dir "$REPODIR" "$USER"

# Clone hashcat, hashcat-utils, pack
cd $REPODIR
if [[ ! -e $REPODIR/hashcat ]]; then
    git clone https://github.com/hashcat/hashcat.git
fi
if [[ ! -e $REPODIR/hashcat-utils ]]; then
    git clone https://github.com/hashcat/hashcat-utils.git
fi
if [[ ! -e $REPODIR/pack ]]; then
    git clone https://github.com/iphelix/pack.git
fi

# Compile hashcat
cd hashcat/
git submodule update --init
make
./example0.sh

link_to_home_local_bin ./hashcat