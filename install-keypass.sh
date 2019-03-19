#!/bin/bash

#: Title: install-keypass.sh
#: Description: Installation of KeyPass password manager
#: References:
#: 		* https://sourceforge.net/p/keepass/discussion/329220/thread/17d1bd26/

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo apt-add-repository ppa:jtaylor/keepass
sudo apt-get update
sudo apt-get install keepass2
