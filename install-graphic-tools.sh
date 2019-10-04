#!/bin/bash

#: Title: install-graphic-tools.sh
#: Description: Install inkscape, diagrams, etc

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

# WARNING: This installs Ubuntu's default package for NodeJS
#          The better way is to install latest via NodeJS script
# sudo apt-get -y install nodejs-dev node-gyp libssl1.0-dev
# sudo apt-get -y install nodejs npm
# sudo npm install -g diagrams

$SCRIPT_DIR/install-nodejs10.sh

sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get update

sudo apt-get -y install inkscape
sudo apt-get -y install mscgen graphviz

sudo apt-get -y install xdot

# Install plantuml
sudo mkdir /opt/plantuml/
# This URL or find new one at http://plantuml.com/
wget -O /tmp/plantuml.jar "https://sourceforge.net/projects/plantuml/files/plantuml.jar/download?use_mirror=netix&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fplantuml%2Ffiles%2Fplantuml.jar%2Fdownload%3Fuse_mirror%3Dvorboss"
sudo mv /tmp/plantuml.jar /opt/plantuml/plantuml.jar
sudo cp $SCRIPT_DIR/conf/plantuml.sh /opt/plantuml/plantuml
sudo chmod +x /opt/plantuml/plantuml
sudo ln -s /opt/plantuml/plantuml /usr/local/bin/plantuml
