#!/bin/bash

#: Title: install-ghidradev.sh
#: Description: Installs all dependencies from https://github.com/NationalSecurityAgency/ghidra/blob/master/DevGuide.md


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

echo "[*] Install bison and flex"
sudo apt-get -y install bison flex

# TO-DO:

# Gradle
# https://gradle.org/next-steps/?version=5.0&format=bin
