#!/bin/bash

#: Title: install-pythonsec.sh
#: Description: Installs pwntools, scapy for Python2 and Python3
#: Reference:
#:      * http://thesprawl.org/projects/pack/


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo apt-get -y install cmake

#sudo pip install keystone-engine
sudo pip3 install keystone-engine

#sudo pip install capstone
sudo pip3 install capstone

#sudo pip install unicorn
sudo pip3 install unicorn

#sudo pip install pwntools
#sudo pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git
sudo pip3 install pwntools

sudo pip3 install scapy
sudo pip3 install PyX

# Matplotlib needs pdflatex
#sudo apt-get -y install texlive-latex-base
sudo apt-get -y install dvipng
#sudo pip3 install matplotlib
