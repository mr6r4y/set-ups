#!/bin/bash

#: Title: install-vala.sh
#: Description: installation of Vala language
#: Resources:
#:     - https://wiki.gnome.org/Projects/Vala/ValaOnLinux

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

sudo add-apt-repository -y ppa:vala-team
sudo apt-get update
sudo apt-get -y install valac
