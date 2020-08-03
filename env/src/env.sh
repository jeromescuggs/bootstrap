#!/bin/bash 

cp ~/.dotfiles/.aliases ~/
cp ~/.dotfiles/.inputrc ~/
cp ~/.dotfiles/.exa-ls ~/
cp ~/.dotfiles/dircolors-greenaf ~/.dircolors

cat ~/.dotfiles/omz.j | sh

git clone https://github.com/chrissicool/zsh-256color $HOME/.oh-my-zsh/custom/plugins/zsh-256color

sudo apt install -y zsh git curl htop nmon nmap screen screenfetch build-essential cmake autoconf pkg-config python-pip python3-pip cpanminus bison mc bc flex dialog gettext cifs-utils netcat vim irssi tmux ssh cifs-utils libssl-dev libjpeg-dev libffi-dev python-setuptools python3-setuptools

sudo apt install clang llvm libreadline-dev

# setup rustup, a cargo management system
# curl -sSf https://sh.rustup.rs | sh
curl https://sh.rustup.rs -sSf | sh -s -- -y

# setup rbenv, and cross fingers
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

# verify rbenv 
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# this lets rbenv install the requires gems as defined in $(rbenv root)/default-gems 
# git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

mkdir -p $HOME/gits && git clone https://github.com/tj/n $HOME/gits/n
cd $HOME/gits/n
sudo make && sudo make install
cat $HOME/.dotfiles/n.j | sh




