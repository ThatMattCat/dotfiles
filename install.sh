#!/bin/bash

# Get directory of this script
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


main() {

    if test $# -eq 0; then
	    echo "Must provide install options from: vim, bash, all"
    fi
    while test $# -gt 0
    do
        case "$1" in
            "vim") setup_vim
                ;;
            "bash") setup_bash
                ;;
            "all") setup_bash && setup_vim
                ;;
	    *) echo "Unknown install option"
		        ;;
        esac
        shift
    done

    # Configure Git if not already configured
    if [ -z "$(git config --global user.name)" ]; then
        read -p "Enter your Git username: " GIT_USERNAME
        git config --global user.name "$GIT_USERNAME"
    fi

    if [ -z "$(git config --global user.email)" ]; then
        read -p "Enter your Git email: " GIT_EMAIL
        git config --global user.email "$GIT_EMAIL"
    fi
}

setup_bash() {
    touch ${HOME}/.bash_eternal_history
    if ! grep -qF "source ${CWD}/bash/bashrc" ${HOME}/.bashrc; then
        echo "source ${CWD}/bash/bashrc" >> ${HOME}/.bashrc
    fi
    chmod +x ./bin/*
}

# This needs to be manually triggerd with arg "vim" or "all"
setup_vim() {
    sudo apt update
    sudo apt install -y vim-gtk3 #xclip

    mkdir -p ${HOME}/.vim/autoload ${HOME}/.vim/colors ${HOME}/.vim/plugged ${HOME}/.vim/backup ${HOME}/.vim/syntax
    cp -R -u ./vim/syntax/* ${HOME}/.vim/syntax/
    if ! grep -qF "source ${CWD}/vim/vimrc" ${HOME}/.vimrc; then
        echo "source ${CWD}/vim/vimrc" >> ${HOME}/.vimrc
    fi
    # Install Vim plugins, colors, etc
    if [ ! -f ${HOME}/.vim/autoload/plug.vim ]; then
        curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    if [ ! -f ${HOME}/.vim/colors/molokai.vim ]; then
        curl -o ${HOME}/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
    fi

    vim +PlugInstall +qall
}

main "$@"; exit
