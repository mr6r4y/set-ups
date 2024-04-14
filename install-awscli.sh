#!/bin/bash

#: Title: install-awscli.sh
#: Description: Install and configure AWS cli toolset - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
set -e
OLDDIR=$(pwd)

AWS_DOWNLOAD_URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
AWS_ZIP_PATH="/tmp/awscliv2.zip"
AWS_INSTALL_PATH="/tmp/aws"

curl $AWS_DOWNLOAD_URL -o $AWS_ZIP_PATH
unzip $AWS_ZIP_PATH
sudo $AWS_INSTALL_PATH/install -i /usr/local/aws-cli -b /usr/local/bin

