#!/bin/bash

#: Title: install-docbuild.sh
#: Description: Installation of pandoc and latex needed to build documents out of Markdown
#: References:

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo add-apt-repository ppa:jonathonf/texlive

sudo apt-get update

sudo apt-get -y install \
    texlive-base \
    texlive-binaries \
    texlive-extra-utils \
    texlive-font-utils \
    texlive-fonts-extra \
    texlive-fonts-extra-links \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-lang-cyrillic \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-pictures \
    texlive-plain-generic \
    texlive-pstricks \
    texlive-publishers \
    texlive-xetex \
    texlive-fonts-extra-doc \
    texlive-fonts-recommended-doc \
    texlive-latex-base-doc \
    texlive-latex-extra-doc \
    texlive-latex-recommended-doc \
    texlive-pictures-doc \
    texlive-pstricks-doc \
    texlive-publishers-doc \
    libgraphviz-dev \
    pandoc \
    xzdec

sudo pip3 install pygraphviz pandocfilters
sudo pip2 install pygraphviz pandocfilters

tlmgr init-usertree
tlmgr update --all

tlmgr install sectsty
tlmgr install listings
tlmgr install newunicodechar
tlmgr install float
