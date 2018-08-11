#!/bin/bash

# update linux
sudo apt-get update
sudo apt-get upgrade

# install git tmux
sudo install -y git tmux

# install vundle 
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# install config files
cp .bash_profile ~
cp .vimrc ~
cp .tmux_conf ~
cp .prompt ~
touch ~/.bash_profile_local

# change editor to vim, you know it makes sense
git config --global core.editor "vim"

# to finish installation, restart shell, run vim and issue :PluginInstall
