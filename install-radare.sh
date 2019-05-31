#!/bin/bash

#: Title: install-radare.sh
#: Description: Installs radare2 and additional packages


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

# TO-DO