#!/bin/bash

#: Title: install-tomaty.sh
#: Description: Installation of pomodoro application

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo apt-get install libasound2-dev
sudo pip3 install simpleaudio
sudo pip3 install tomaty