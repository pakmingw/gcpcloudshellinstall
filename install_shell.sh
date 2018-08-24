#!/bin/bash

# update linux
sudo apt-get update
sudo apt-get upgrade

# install git
sudo install -y git

# install tmux
sudo install -y tmux

# install vundle 
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# install config files
cp .bash_profile ~
cp .vimrc ~
cp .tmux.conf ~
cp .prompt ~
touch ~/.bash_profile_local

# change editor to vim, you know it makes sense
git config --global core.editor "vim"

# to finish installation, restart shell, run vim and issue :PluginInstall
