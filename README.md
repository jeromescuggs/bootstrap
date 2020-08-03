# bootstrap
rootin tootin strap-ass bootin

## usage

### vim setup

i am pretty satisfied with my vim setup, as it is both very pretty yet very lightweight. coming from SpaceVim, learning to take a vanilla vim install and make it fancy without including the stuff i don't use from SpaceVim was pretty difficult, because of the highly specialized way it sets everything up. 

the core magic is built on the same tool SpaceVim uses: [vim-plug]. after cloning this git repository, navigate to it and run `vim-setup.sh` which will create a folder in your $HOME dir `.vim` and then copy the `vimrc` from this repo into it. at the same time, the script will also grab the vim-plug submodule from its home repository into this folder, before then copying the plugin to its proper subfolder in your home `.vim` directory. 

with both vim-plug and a customized vimrc file installed, you can complete setup by running vim. you will probably see an error or two which is normal (your vimrc is looking for the scripts you're about to tell vim to download). after vim loads, run `:PlugInstall` and you will see the plugin manager open and begin automatically grabbing a variety of plugins I consider useful.

if you plan on running NeoVim, you can run the script again with `nvim` as an argument e.g. `./vim-setup.sh nvim`. this will either create or replace `init.vim` in `~/.config/nvim` and contain 3 lines which will point NeoVim at your Vim config folder to use as its source. This way you can edit a single `vimrc` file, and the changes will reflect in both Vim and NeoVim. 

You might have some settings that work with NeoVim, but not Vim. I've included a section for this which will only execute settings if it detects it is being sourced in NeoVim:

```
if has('nvim')
" !-------------------------------!
" any commands that will only work
" with neovim can be placed here
" !-------------------------------!endif
endif
```

## setup environment
```
cd bootstrap/env
./init  
```

### updated 2020-08-02

when the `init` script is executed, it will first run an update of local packages with the APT package manager. after that it will quickly install some basic packages needed not only by this script, but most likely anything you will be doing later: `zsh`,`git`,`curl`,`vim`,`pkg-config`,`build-essential`,`devscripts` and a few others. 

after this, it will divide the remaining installs between needed libraries and packages. however, when doing so, it will look at `lib_list.txt` and `pkg_list.txt` and install the dependencies in these files - so you can easily add or remove as needed.

once done, the script will proceed to then setup popular development environment managers for Go and NPM. Rust and Ruby will be coming soon. 


[git-r-done]: https://github.com/jeromescuggs/git-r-done
[vim-plug]: https://github.com/junegunn/vim-plug
