#!/bin/bash

#: Title: install-base-dev.sh
#: Description: Installation of Python, Ruby, build-essential, etc

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

sudo apt-get update

sudo apt -y install git git-lfs \
    vim \
    fonts-dejavu \
    curl \
    global \
    libgconf2-4   # Turtl needs it

sudo apt-get -y install \
    build-essential \
    cmake \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip
