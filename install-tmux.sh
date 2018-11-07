#!/bin/bash

#: Title: install-tmux.sh
#: Description: Installation and configuration of tmux

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

sudo apt-get install tmux

cd $REPODIR
if [ ! -e  tmux-plugins ]
then
    echo "[*] Clone repository of tmux-plugins"
    git clone https://github.com/tmux-plugins/tmux-logging.git
else
    echo "[!] tmux-plugins already exists"
fi
cd -

if [ ! -e "~/.tmux.conf" ]
then
    echo "[*] Writing $HOME/.tmux.conf"
    $SCRIPT_DIR/tpl-rend.py -t "$SCRIPT_DIR/conf/tmux.conf.tpl" -o "$HOME/.tmux.conf"
fi
