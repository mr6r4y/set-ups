#!/bin/bash

#: Title: install-cross-compile.sh
#: Description: Install packages and tools for cross-compilation for several architectures


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo apt-get -y install gcc-multilib-arm-linux-gnueabi  gcc-multilib-i686-linux-gnu
