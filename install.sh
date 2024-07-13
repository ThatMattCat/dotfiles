#!/bin/bash

touch ~/.bash_eternal_history

# Install vim-gtk3 and xclip
sudo apt update
sudo apt install -y vim-gtk3 #xclip

# Backup Original
#[[ -f ~/.vimrc && $(mv ~/.vimrc ~/dotfiles/.vimrc.orig) ]]
#[[ -f ~/.bashrc && $(mv ~/.bashrc ~/dotfiles/.bashrc.orig) ]]
#[[ -f ~/.bash_aliases && $(mv ~/.bash_aliases ~/dotfiles/.bash_aliases.orig) ]]

# Create symlinks
ln -sf ~/dotfiles/vimrc ~/.vimrc
rm -rf ~/.vim
cp -r -l ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/bash_aliases ~/.bash_aliases

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f ~/.vim/colors/molokai.vim ]; then
    curl -o ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
fi

vim +PlugInstall +qall
