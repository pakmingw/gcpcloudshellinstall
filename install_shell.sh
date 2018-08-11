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

# to finish installation, restart shell, run vim and issue :PluginInstall
