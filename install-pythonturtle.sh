#!/bin/bash

#: Title: install-pythonturtle.sh
#: Description: Installation PythonTurtle

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

sudo apt install -y libwxgtk3.0-gtk3-dev

virtualenv -p python3.6 ~/py3-kids

source ~/py3-kids/bin/activate


if [[ ! -e $(ls $REPODIR/wxpython-build/wxPython-4.0.6-*.whl) ]];then
	$SCRIPT_DIR/build-wxpython.sh
fi

pip3.6 install $REPODIR/wxpython-build/wxPython-4.0.6-*.whl
pip3.6 install git+https://github.com/cool-RR/PythonTurtle.git
