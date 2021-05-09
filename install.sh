#!/bin/bash

echo "creating symbolic links in home directory"
ln -s $HOME/.dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/.dotfiles/.Xresources $HOME/.Xresources
ln -s $HOME/.dotfiles/.xinitrc $HOME/.xinitrc
ln -s $HOME/.dotfiles/.vim $HOME/.vim
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.config $HOME/.config

