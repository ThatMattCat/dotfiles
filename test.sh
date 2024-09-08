#!/bin/bash

main() {

    if test $# -eq 0; then
	    echo "Must provide install options from: vim, bash, all"
	    exit
    fi
    while test $# -gt 0
    do
	echo "num args = $#"
        case "$1" in
            "vim") echo "vim"
                ;;
            "bash") echo "bash"
                ;;
            "all") bash && vim
                ;;
	    *) echo "Unknown install option"
		;;
        esac
        shift
    done
}

bash() {
    touch ~/.bash_eternal_history
    echo "source ~/dotfiles/bash/bashrc" >> ~/.bashrc
    chmod +x ./bin/*
}

# This needs to be manually triggerd with arg "vim" or "all"
vim() {
    # Install vim-gtk3 and xclip
    sudo apt update
    sudo apt install -y vim-gtk3 #xclip so we can always paste properly

    mkdir -p ~/.vim/autoload ~/.vim/colors ~/.vim/plugged ~/.vim/backup ~/.vim/syntax
    cp -R -u ./vim/syntax/* ~/.vim/syntax/
    echo "source ~/dotfiles/vim/vimrc" >> ~/.vimrc
    # Install Vim plugins, colors, etc
    if [ ! -f ~/.vim/autoload/plug.vim ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    if [ ! -f ~/.vim/colors/molokai.vim ]; then
        curl -o ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
    fi

    vim +PlugInstall +qall
}

main "$@"; exit
