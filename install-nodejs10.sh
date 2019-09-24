#!/bin/bash

#: Title: install-nodejs10.sh
#: Description: Installation of NodeJS 10

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

set -e

OLDDIR=$(pwd)

curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
sudo bash ./nodesource_setup.sh
sudo apt -y install nodejs
nodejs -v
