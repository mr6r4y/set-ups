#!/bin/bash

#: Title: install-tmux.sh
#: Description: Installation and configuration of tmux

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

sudo yum install -y tmux

create_repo_dir "$REPODIR" "$USER"

cd $REPODIR
if [ ! -e  tmux-logging ]
then
    echo "[*] Clone repository of tmux-logging"
    git clone https://github.com/tmux-plugins/tmux-logging.git
else
    echo "[!] tmux-logging already exists"
fi
cd -

if [ ! -e "~/.tmux.conf" ]
then
    echo "[*] Writing $HOME/.tmux.conf"
    $SCRIPT_DIR/tpl-rend.py -t "$SCRIPT_DIR/conf/tmux.conf.tpl" -o "$HOME/.tmux.conf"
fi

# Copy configuration to /root also
if sudo [ ! -e "/root/.tmux.conf" ]
then
    echo "[*] Writing /root/.tmux.conf"
    sudo $SCRIPT_DIR/tpl-rend.py -t "$SCRIPT_DIR/conf/tmux.conf.tpl" -o "/root/.tmux.conf"
fi
