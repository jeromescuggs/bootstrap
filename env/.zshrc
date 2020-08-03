# set omz install path, set path for rustup completions
export ZSH="$HOME/.oh-my-zsh"
fpath+=~/.zfunc

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

ZSH_THEME="dieter"

# uncomment the following code when using liquidprompt - must be installed first!
# [[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

# purely aesthetic, comment the following out if troubleshooting, but it shouldn't cause any issues
COMPLETION_WAITING_DOTS="true"

# base16 shell colorthemes: type "base16" in prompt and mash dat mf tab button
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
         eval "$("$BASE16_SHELL/profile_helper.sh")"

# check to see if the base16-shell default installation is present, and grab it if it isn't

 if [ -d "$HOME/.config/base16-shell/" ]; then
    export BASE16_INSTALLED="1"
 else 
     git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
   fi

# Uncomment the following when working with large VCS (git etc) repo's, and experience lag when moving thru directories
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*

plugins=(
        zsh-256color
        sudo
        )
# git, debian, ubuntu, ssh-agent, gpg-agent, tmux

# initiliazes the meat of oh-my-zsh, and everything below it is executed 
# "within the context" of the OMZ environment
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# this is used with the cargo app "pastel", comment it out if it borks something
export COLORTERM="truecolor"

# You may need to manually set your language environment
# NOTE: i've read reports that LANG is supposed to be set as "en" and not 
# used to define the character set, ie, unicode 
# if you still have hiccups, try setting the bottom variable instead 
export LANG="en_US.UTF-8"
# export LANG="en"
# export LC_ALL="en_US.UTF-8"

# WSL X11 variables, uncomment to play nice with X on WSL
# export DISPLAY=localhost:0
# export LIBGL_ALWAYS_INDIRECT

# Rust/cargo PATH
export PATH="$PATH:/home/jerome/.cargo/bin"

# pip path
export PATH="$PATH:/home/jerome/.local/bin"

# Go path, not nearly as important now that GO111MODULE is a thing
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# path for ruby
export PATH="$PATH:$HOME/.rvm/bin"
# sources rvm/ruby - as a function

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# check for default brew install dir, and add to path
if [[ -x "$(command -v brew)" ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# check for keychain, and start it with default ssh key 
if [[ -x "$(command -v keychain)" ]]; then
    eval `keychain --eval --agents ssh,gpg id_rsa`
fi

# eyecandy: the following defines colorschemes for the 'ls' command and its relatives 
# depending on things, calling one, both, one before the other, etc. can lead to different blends of colors, so i'm leaving it all below

if [[ $DIRCLR_VIVID == "1" ]]; then
export LS_COLORS="$(vivid generate snazzy)"
fi

 eval $(dircolors -b $HOME/.dircolors)
 if [ -n "$LS_COLORS" ]; then
       zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
 fi

#eval $(TERM=xterm-256color dircolors ~/.dircolors)

# invoke tmux requirements 
# if 
#   [ -z $TMUX ] 
# then
#    export TERM=xterm-256color
#  else 
#    export TERM=screen-256color
#fi

# better to add [ set -g default-terminal "screen-256color" ] to tmux conf

if [[ -e $HOME/.aliases ]]; then
source ~/.aliases
fi 

# initialize zsh-syntax-highlighting
source $HOME/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# if [[ -f ~/.local/bin/banner ]]; then 
#      banner 
# fi    
# ~/.zshrc

# TODO: check for starship, if true, execute: 
if [ -x "$(command -v starship)" ]; then 
    eval "$(starship init zsh)"
fi
compinit

if [[ -x "$(command -v resh)" ]]; then 
[ -f ~/.resh/shellrc ] && source ~/.resh/shellrc
fi 

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

