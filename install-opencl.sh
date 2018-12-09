#!/bin/bash

#: Title: install-opencl.sh
#: Description: Needed drivers for hashcat
#: Reference:
#:      * https://github.com/hashcat/hashcat/issues/1207
#:      * https://github.com/intel/compute-runtime/releases
#:      * https://software.intel.com/en-us/forums/opencl/topic/762654

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

create_repo_dir "$REPODIR" "$USER"

cd $REPODIR

# Install driver for opencl (needed for hashcat)
if [ ! -e /opt/intel/opencl-1.2-6.4.0.37 ]
then
    OLDDIR_1=$(pwd)

    echo "[*] Install opencl_runtime_16.1.2_x64_rh_6.4.0.37 driver"

    [ ! -e "./opencl_runtime" ] && mkdir ./opencl_runtime
    cd opencl_runtime

    wget http://registrationcenter-download.intel.com/akdlm/irc_nas/12556/opencl_runtime_16.1.2_x64_rh_6.4.0.37.tgz
    tar zxvf opencl_runtime_*.tgz
    cd opencl_runtime_16.1.2_x64_rh_6.4.0.37
    echo "[*] Run ./install.sh for opencl_runtime_16.1.2_x64_rh_6.4.0.37 driver"
    sudo ./install.sh -s "$SCRIPT_DIR/conf/opencl_runtime_silent.cfg"

    cd $OLDDIR_1
fi
