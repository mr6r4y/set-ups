#!/bin/bash

#: Title: install-pythonturtle.sh
#: Description: Installation PythonTurtle

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

create_venv_dir "$VENVDIR" "$USER"

echo "[*] Install dependencies"
sudo apt install -y libwxgtk3.0-gtk3-dev

virtualenv -p python3.6 $VENVDIR/kids

source $VENVDIR/kids/bin/activate


if [[ ! -e $(ls $REPODIR/wxpython-build/wxPython-4.0.6-*.whl) ]];then
	$SCRIPT_DIR/build-wxpython.sh
fi

pip3.6 install $REPODIR/wxpython-build/wxPython-4.0.6-*.whl
pip3.6 install git+https://github.com/cool-RR/PythonTurtle.git


echo "[*] Create start script"
echo "#!/bin/bash

source $VENVDIR/kids/bin/activate

PythonTurtle
" > $HOME/.local/bin/startPythonTurtle
chmod +x $HOME/.local/bin/startPythonTurtle

echo "[*] Copy icon"
mkdir -p $HOME/.local/share/icons/
cp $VENVDIR/kids/lib/python3.6/site-packages/pythonturtle/resources/icon.ico $HOME/.local/share/icons/pythonturtle.ico

echo "[*] Create Desktop Icon"
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=PythonTurtle
Comment=
Exec=startPythonTurtle
Icon=$HOME/.local/share/icons/pythonturtle.ico
Path=
Terminal=false
StartupNotify=false
" > $HOME/Desktop/PythonTurtle.desktop
