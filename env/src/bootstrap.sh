#!/usr/bin/env bash

# ===============
# variable setup
# ---------------

proc_id=$!

#cfonts "loading..." -f shade 

echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "░█░░░░░██░░░██░░███░░███░█░░█░░███░░░░░░░░░░░░░░░░"
echo "░█░░░░█  █░█  █░█  █░ █ ░██░█░█   ░░░░░░░░░░░░░░░░"
echo "░█░░░░█░░█░████░█░░█░░█░░█ ██░█░██░░░░░░░░░░░░░░░░"
echo "░█░░░░█░░█░█  █░█░░█░░█░░█░ █░█░ █░░░░░░░░░░░░░░░░"
echo "░████░ ██ ░█░░█░███ ░███░█░░█░███ ░░░█░░░░█░░░░█░░"
echo "░    ░░  ░░ ░░ ░   ░░   ░ ░░ ░   ░░░░ ░░░░ ░░░░ ░░"
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
sleep 3s

if [[ -z $1 ]]; then
  #cfonts "jerome" -f simple3d --spaceless -c magenta,yellow
  #cfonts "strap\!" -f block --spaceless -c yellow,magenta
  #pastel paint cc6666 "   jeromestrap: bootstrap, but jerome"
  
echo "   ██████╗   ██████╗   ██████╗  ████████╗"
echo "    ██╔══██╗ ██╔═══██╗ ██╔═══██╗ ╚══██╔══╝"
echo "     ██████╔╝ ██║   ██║ ██║   ██║    ██║"
echo "      ██╔══██╗ ██║   ██║ ██║   ██║    ██║"
echo "       ██████╔╝ ╚██████╔╝ ╚██████╔╝    ██║"
echo "        ╚═════╝   ╚═════╝   ╚═════╝     ╚═╝"
echo " "
echo "         ███████╗ ████████╗ ██████╗   █████╗  ██████╗"
echo "  by      ██╔════╝ ╚══██╔══╝ ██╔══██╗ ██╔══██╗ ██╔══██╗"
echo " jerome    ███████╗    ██║    ██████╔╝ ███████║ ██████╔╝"
echo " scuggs     ╚════██║    ██║    ██╔══██╗ ██╔══██║ ██╔═══╝"
echo "     2020    ███████║    ██║    ██║  ██║ ██║  ██║ ██║"
echo "              ╚══════╝    ╚═╝    ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚═╝"
echo " "     
  echo "  -------------------------------------------------"
  echo "    command | result                   "
  echo "  ----------+--------------------------------------"
  echo "    prompt  | setup zsh+omz+extras     "
  echo "            |                          "
  echo "    env     | installs a bundle of common envs:envs" 
  echo "            | go, node, pip/pip3, cpanm            "
  # TODO: figure out how to install rvm without causing a fuckin mess
  echo "            |                          "
  echo "    zsh     | zsh, oh-my-zsh, + tweaks "
  echo "  ----------+---------------------------------------"
  echo "    another fine scuggscorp, inc. app  "
fi 

if [[ $1 == "zsh" ]]; then 
  echo "Installing z-shell, OMZ, and some jerome-tastic tweaks..."
  sleep 3s
  echo "Install ZSH & common tools"
  sudo apt install -y zsh curl git wget 
  wait $proc_id
  echo "Setup base oh-my-ZSH install"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  wait $proc_id
  echo "but wait! there's more!"
  sleep 3s 
# TODO: give option here to either keep default OMZ, or continue with tweaked zshrc below  
  echo "downloading tweaked zshrc file..."
  sleep 3s
  mv /home/$USER/.zshrc /home/$USER/.zshrc-omz 
  ln -s -f /home/$USER/.jrmux/.zshrc /home/$USER/
  echo "installing zsh-256color..."
  sleep 2s
  git clone https://github.com/chrissicool/zsh-256color $HOME/.oh-my-zsh/custom/plugins
  git clone https://github.com/jeromescuggs/.tmux /home/$USER/.tmux
  mv /home/$USER/.zshrc /home/$USER/.zshrc-omz 
  echo "DONE! to load new defaults, run:"
  echo "exec zsh"
  echo "To set zsh as your default shell, run:"
  echo "chsh -s $(which zsh)"
fi 

# packages for kernel compile
# sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison
