#!/bin/bash

#: Title: install-graphic-tools.sh
#: Description: Install inkscape, diagrams, etc

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo apt-get -y install nodejs npm
sudo npm install -g diagrams

sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get update

sudo apt-get -y install inkscape
sudo apt-get -y install mscgen graphviz

sudo apt-get -y install xdot

