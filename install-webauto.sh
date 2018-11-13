#!/bin/bash

#: Title: install-webaut.sh
#: Description: Installation of Web automation tools: Chrome, selenium, chromedriver

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/lib/net.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

create_repo_dir "$REPODIR" "$USER"

if [ -z $(which chromedriver) ]
then
    echo "[*] Install latest chromedriver"
    LATEST_CHROMEDRIVER=$(get_latest_chromedriver_download_url)
    cd $REPODIR
    [ ! -e ./chromedriver ] && mkdir chromedriver
    cd chromedriver
    wget "$LATEST_CHROMEDRIVER"
    unzip *.zip
    CHROMEDRIVER_EXEC="$(pwd)/chromedriver"
    link_to_home_local_bin "$CHROMEDRIVER_EXEC"
fi

# Install google chrome
if [ ! -e /etc/apt/sources.list.d/google.list ]
then
    echo "[*] Prepare apt sources for google-chrome"
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    sudo apt-get update
fi
echo "[*] Install google-chrome-stable"
sudo apt-get install google-chrome-stable

# Install selenium
echo "[*] Install python selenium packages"
sudo pip install selenium

echo "[*] Create new Chrome profile"
# TO-DO: ..
if [ -e "$HOME/Desktop" ]
then
    echo "[*] Generate Desktop Icon for Chrome-Burp-profile"
fi

if [ -z $(which firefox) ]
then
    echo "[*] Create new Firefox profile"
    # TO-DO: ..
    if [ -e "$HOME/Desktop" ]
    then
        echo "[*] Generate Desktop Icon for Firefox-Burp-profile"
        # TO-DO: ..
    fi
fi
