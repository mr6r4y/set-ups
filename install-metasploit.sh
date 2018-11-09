#!/bin/bash

#: Title: install-metasploit.sh
#: Description: Installation of metasploit from source
#: Reference: https://github.com/rapid7/metasploit-framework/wiki/Setting-Up-a-Metasploit-Development-Environment

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

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
git pull

# Install RVM
if [ -z $(which rvm) ]
then
    echo "[*] Installing RVM "
    curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    curl -L https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
    source ~/.bashrc
else
    echo "[*] Include RVM"
    source ~/.rvm/scripts/rvm
fi

# Install ruby version for metasploit
RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
if [[ $(python -c "print '%i' % ('$(ruby -v)'.split(' ')[1].split('p')[0] == '$RUBYVERSION')") -eq 0 ]]
then
    echo "[*] Installing/using ruby $RUBYVERSION"
    rvm install $RUBYVERSION
    rvm use $RUBYVERSION --default
fi

echo "[*] Using ruby: $(ruby -v)"

echo "[*] Install ruby packages"
gem install bundler
echo "[*] Check bundle"
[[ $(python -c "print '%i' % ('''The Gemfile's dependencies are satisfied''' in '''$(bundle check)''')") -eq 0 ]] && echo "[*] Install bundle" && bundle install

# Configure postgres db and user account
echo "[*] Configuring postgresql"

export MSF_DB_USER=msfdev
export MSF_DB_DEV_NAME=msf_dev_db
export MSF_DB_TEST_NAME=msf_test_db
export MSF_DB_PASSWD=msfdev

sudo update-rc.d postgresql enable
sudo service postgresql start

sudo -u postgres psql -f "$SCRIPT_DIR/conf/pg-utf8.sql"
[ ! $(sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='$MSF_DB_USER'") -eq 1 ] && sudo -u postgres createuser $MSF_DB_USER -dRS
sudo -u postgres psql -c "ALTER USER $MSF_DB_USER WITH ENCRYPTED PASSWORD '$MSF_DB_PASSWD';"
sudo -u postgres dropdb $MSF_DB_DEV_NAME
sudo -u postgres createdb --owner $MSF_DB_USER $MSF_DB_DEV_NAME
sudo -u postgres dropdb $MSF_DB_TEST_NAME
sudo -u postgres createdb --owner $MSF_DB_USER $MSF_DB_TEST_NAME

[ ! -e "$HOME/.msf4" ] && mkdir "$HOME/.msf4"
$SCRIPT_DIR/tpl-rend.py -t "$SCRIPT_DIR/conf/msf-database.yml.tpl" -o "$HOME/.msf4/database.yml"

echo "[*] Check msfconsole db connection"
./msfconsole -qx "db_status; exit"

create_local_bin
if [ ! -e  "$HOME/.local/bin/msfconsole" ]
then
    echo "[*] Link msfconsole in $HOME/.local/bin"
    ln -s "$(pwd)/msfconsole" "$HOME/.local/bin/msfconsole"
fi

cd $OLDDIR
