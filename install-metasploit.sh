#!/bin/bash

#: Title: install-metasploit.sh
#: Description: Installation of metasploit from source
#: Reference: https://github.com/rapid7/metasploit-framework/wiki/Setting-Up-a-Metasploit-Development-Environment

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

sudo apt-get -y install \
  autoconf \
  bison \
  build-essential \
  curl \
  git-core \
  libapr1 \
  libaprutil1 \
  libcurl4-openssl-dev \
  libgmp3-dev \
  libpcap-dev \
  libpq-dev \
  libreadline6-dev \
  libsqlite3-dev \
  libssl-dev \
  libtool \
  libxml2 \
  libxml2-dev \
  libxslt-dev \
  libyaml-dev \
  ncurses-dev \
  openssl \
  postgresql \
  postgresql-contrib \
  wget \
  zlib1g \
  zlib1g-dev

create_repo_dir "$REPODIR" "$USER"

# Clone metasploit from GitHub
cd $REPODIR
if [[ ! -e $REPODIR/metasploit-framework ]]; then
    git clone https://github.com/rapid7/metasploit-framework.git
fi
cd metasploit-framework

# Install RVM
if [ -z $(which rvm) ]
then
    echo "[*] Installing RVM .."
    curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    curl -L https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
    source ~/.bashrc
fi

# Install ruby version for metasploit
RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
if [[ $(python -c "print '%i' % ('$(ruby -v)'.split(' ')[1] == '$RUBYVERSION')") -eq 0 ]]
then
    echo "[*] Installing Ruby-$RUBYVERSION"
    rvm install $RUBYVERSION
    rvm use $RUBYVERSION --default
fi

ruby -v

gem install bundler
bundle install

# TO-DO: configure postgres