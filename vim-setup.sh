#!/bin/bash

DIR=$(dirname $(readlink -f $0))

git submodule update --init

NVIM_PLUG=$1

echo "VIMCONFIG"
echo "remember to run :PlugInstall after starting vim to complete the setup."

if [[ -z $NVIM_PLUG ]]; then 
    echo "installing vim configs in $HOME/.vim..."
	sleep 1
	mkdir -p $HOME/.vim/autoload 
    cp $DIR/vim-plug/plug.vim $HOME/.vim/autoload
    cp $DIR/src/vimrc $HOME/.vim
    echo "done! to also setup neovim to source the same file,"
    echo "rerun this script with 'nvim' as an argument"
    echo "e.g. ./setup-vim.sh nvim"
fi

if [[ $NVIM_PLUG == "nvim" ]] && [[ -f $HOME/.config/nvim/init.vim ]]; then
		echo "found existing NeoVim config file. renaming it to bkp-init.vim..."
		mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/bkp-init.vim
fi 

if [[ $NVIM_PLUG == "nvim" ]]; then 
    mkdir -p $HOME/.config/nvim
    echo "adding config file for neovim..."
    sleep 2
    touch $HOME/.config/nvim/init.vim
    echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> $HOME/.config/nvim/init.vim
    echo "let &packpath=&runtimepath" >>  $HOME/.config/nvim/init.vim
    echo "source ~/.vim/vimrc" >> $HOME/.config/nvim/init.vim
    echo "all done! neovim will now look for and use your vim rc dir and config."
fi

