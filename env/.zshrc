# set omz install path, set path for rustup completions
export ZSH="/home/$USER/.oh-my-zsh"
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

# jerome-theme can be found at github.com/jeromescuggs/jerome-theme
#ZSH_THEME="zeta"
ZSH_THEME="dieter"

# TODO condition this on finding a dietpi-exclusive executable 
if [[ -d /DietPi ]]; then
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
/DietPi/dietpi/dietpi-login
. /DietPi/dietpi/func/dietpi-globals 
fi 

# i guess if you use deno, cool, whatever. still needs some work!
if [[ -d $HOME/.deno ]]; then 
    export DENO_INSTALL="/home/$USER/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
fi 

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
#        zsh-256color
		ssh-agent
        sudo
        )

# other popular plugins:
# git, debian, ubuntu, ssh-agent, gpg-agent, tmux

# try to minimize any more code above this line - the following
# initiliazes the meat of oh-my-zsh, and everything below it is executed 
# "within the context" of the OMZ environment
source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export COLORTERM="truecolor"

# You may need to manually set your language environment
# NOTE: i've read reports that LANG is supposed to be set as "en" and not 
# used to define the character set, ie, unicode 
# if you still have hiccups, try setting the bottom variable instead 
# export LANG="en_US.UTF-8"
# export LANG="en"
export LC_ALL="en_US.UTF-8"

# WSL X11 variables, uncomment to play nice with X on WSL

if [[ "$(</proc/version)" == *Microsoft* ]] 2>/dev/null; then
  export WSL=1
  export DISPLAY=localhost:0
  export NO_AT_BRIDGE=1
  export LIBGL_ALWAYS_INDIRECT=1
#  sudo /usr/local/bin/clean-tmp-su
# else
# export WSL=0
fi

#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# export LIBGL_ALWAYS_INDIRECT

# Rust/cargo PATH
export PATH="$PATH:/home/jerome/.cargo/bin"

# pip path
export PATH="$PATH:/home/jerome/.local/bin"

# Go path, not nearly as important now that GO111MODULE is a thing
# if [[ -x "$(command -v go)" ]]; then
if [[ -d /usr/local/go/bin ]]; then
    export GOPATH=$HOME/go
    export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
fi 

# personal bin
# export PATH="$PATH:/home/$USER/.jrmbin"
export PATH="$PATH:/home/$USER/balena-cli"

# RVM - define PATH and source as a function 
if [[ -d $HOME/.rvm ]]; then
    export PATH="$PATH:$HOME/.rvm/bin"
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
fi 

# rbenv - define PATH and source rbenv 
if [[ -d $HOME/.rbenv ]]; then 
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi 

# this variable can be tweaked to get a variety of things to play nice. default is set to 24bit to 
# make the best of the pastel utility
export COLORTERM=24bit 

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


if [[ -x "$(command -v brew)" ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# add ssh key files (e.g. id_rsa) and any gpg keys you'd like keychain to handle
# using the short key format (16 characters)
if [[ -x "$(command -v keychain)" ]]; then
    eval `keychain --eval --agents ssh,gpg id_rsa 0xDEADBEEF`
fi

# eyecandy: the following defines colorschemes for the 'ls' command and its relatives 
# depending on things, calling one, both, one before the other, etc. can lead to different blends of colors, so i'm leaving it all below

# export LS_COLORS="$(vivid generate snazzy)"

# eval $(dircolors -b $HOME/.dircolors)

 eval $(dircolors -b $HOME/.dircolors)
 if [ -n "$LS_COLORS" ]; then
       zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
 fi

 if [[ -x "$(command -v vivid)" ]]; then
    export LS_COLORS="$(vivid generate snazzy)"
 fi 

# eval $(TERM=xterm-256color dircolors ~/.dircolors)

# invoke tmux requirements 
if 
  [ -z $TMUX ] 
then
    export TERM=xterm-256color
  else 
    export TERM=tmux-256color
fi

# banner: the following is what pops up upon initial login
# (cfonts is a neat node package that can generate colorized figlets: npm i -g cfonts)
# cfonts jerome -c cyan,candy -s 

# load aliases if you have any
if [[ -f $HOME/.aliases ]]; then
    source ~/.aliases
fi 

# zsh syntax highlighting - to install, 
# # git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins
if [[ -f $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /home/$USER/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi 
# source /home/$USER/.dotfiles/zsh-fh.zsh 

# TODO: check for starship, if true, execute: 
if [[ -f $HOME/.cargo/bin/starship ]]; then
    eval "$(starship init zsh)"
fi 
# export TERM="xterm-256color"

compinit

if [[ -f $HOME/.cargo/bin/broot ]]; then
    source /home/jerome/.config/broot/launcher/bash/br
fi 

if [[ -d $HOME/.resh ]]; then
    [ -f ~/.resh/shellrc ] && source ~/.resh/shellrc
fi 

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jerome/.sdkman"
[[ -s "/home/jerome/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jerome/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /home/jerome/.config/broot/launcher/bash/br
