#!/bin/bash

#: Title: build-wxpython.sh
#: Description: Build wxpython from wheel
#: Reference: https://wxpython.org/blog/2017-08-17-builds-for-linux-with-pip/index.html
#:            https://wxpython.org/pages/downloads/

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

create_repo_dir "$REPODIR" "$USER"

cd $REPODIR

if [[ ! -e wxpython-build ]]; then
	mkdir wxpython-build
fi
cd wxpython-build

PACKAGES="libqt5gstreamer-dev libgstreamer-plugins-base1.0-dev freeglut3-dev libwebkitgtk-3.0-dev libjpeg-dev libpng-dev libtiff-dev libnotify-dev libsm-dev"
sudo apt install -y $PACKAGES

virtualenv -p python3.6 ./py-builder
source ./py-builder/bin/activate
pip3.6 install -U pip
pip3.6 install -U six wheel setuptools pathlib2
pip3.6 download wxPython
pip3.6 wheel -v wxPython-*.tar.gz  2>&1 | tee build.log
