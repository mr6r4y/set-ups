#: Title: common.sh
#: Description: Library for common functions

 [ -n "$COMMON_LIB" ] && return || readonly COMMON_LIB=1

check_sudo()
#@ DESCRIPTION: Exits if executing without root privilages
{
    if [ "$EUID" -ne 0 ]
    then 
        echo "[!] Please run as root"
        exit 1
    fi
}

create_local_bin()
{
    if [ ! -e "$HOME/.local/bin" ]
    then
        mkdir -p "$HOME/.local/bin"
        echo "[*] Create $HOME/.local/bin"
    fi
}

create_repo_dir()
#@ USAGE: create_repo_dir DIR USER
#@ DESCRIPTION: Creates directory for user source repositories
{
    if [[ -e $1 ]]; then
        echo "[!] $1 alredy exists"
        return
    fi
    
    echo "[*] create_repo_dir $1"
    sudo mkdir $1
    sudo chown $2:$2 $1
}

link_to_home_local_bin()
#@ USAGE: link_to_home_local_bin PATH_TO_EXEC
#@ DESCRIPTION: create symlink in ~/.local/bin if not exists
{
    create_local_bin
    name=$(basename "$1")
    abs_path=$(realpath "$1")
    rm -f "$HOME/.local/bin/$name"
    echo "[*] Link $name in $HOME/.local/bin"
    ln -s "$abs_path" "$HOME/.local/bin/$name"
}

install_rvm()
{
    # Install RVM
    if [ ! -e ~/.rvm/scripts/rvm ]
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
}
