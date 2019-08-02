#!/bin/bash

#: Title: install-gef.sh
#: Description: installation of GEF Gdb extention
#: Resources:
#:     - https://github.com/hugsy/gef

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo pip3 install -U keystone-engine
sudo pip3 install -U capstone
sudo pip3 install -U unicorn
sudo pip3 install -U ropper

create_repo_dir "$REPODIR" "$USER"

cd $REPODIR
if [[ ! -e $REPODIR/gef ]]; then
    echo "[*] Clone GEF"
    git clone https://github.com/hugsy/gef.git
fi
cd $OLDDIR

cd $REPODIR
if [[ ! -e $REPODIR/gef-extras ]]; then
    echo "[*] Clone GEF-Extras"
    git clone https://github.com/hugsy/gef-extras.git
fi
cd $OLDDIR


echo "[*] Install GEF into .gdbinit"
test -f "$HOME/.gdbinit" && mv "$HOME/.gdbinit" "$HOME/.gdbinit.old"
echo "source $REPODIR/gef/gef.py" > "$HOME/.gdbinit"

echo "[*] Set up gef-extra"
gdb -q -ex "gef config gef.extra_plugins_dir '$REPODIR/gef-extras/scripts'" \
       -ex "gef config pcustom.struct_path '$REPODIR/gef-extras/structs'" \
       -ex "gef config syscall-args.path '$REPODIR/gef-extras/syscall-tables'" \
       -ex 'gef save' \
       -ex quit
