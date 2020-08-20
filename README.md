# bootstrap
rootin tootin strap-ass bootin

![](https://raw.githubusercontent.com/jeromescuggs/monoeye/master/jrmvim.png)

# overview - WORK IN PROGRESS!

quickly deploy some of the more common packages, tools and libraries to spend less time with setup. 

- installs basics: `zsh git curl wget dialog dpkg pkg-config`
- current list for [pkg_list.txt]
- current list for [lib_list.txt]
- ~~install interactive [node manager]~~
- ~~install [Go]~~
- ~~install rust via [rustup]~~
- ~~install ruby via [rbenv]~~

## files

- **README.md** no idea what this file is. truly a mystery 
- **init** this is the main script, will likely be renamed later. As a safety measure it requires an argument to actually begin setup: `./init init`. Running `./init` without any argument will simply direct you on how to begin setup. 
- **foo** this is a dummy script which mimics the beginning part of the `init` bootstrapper, so I can test the script without actually running any installs etc. Before exiting it will list any variables set by the script, which might come in handy if you're troubleshooting.

## features

**Friendly setup script**: I've put alot of effort into making sure very little goes on during the setup, which the user will not be aware of. Ideally the pacing of the setup script will allow for some 'oh shit!' moments - meaning, if you ever need to kill the script, it will be fairly easy to kill it where you want to, without too much irreversible change being done. 

**Easy package customization**: A large goal for this bootstrapper is to be able to quickly get your preferred environment going. Inevitably you will want to tweak the packages which the bootstrapper installs - or perhaps even keep a few swappable packagelists depending on use. 

To make this easy, when the bootstrapper is run, it will look in `./env` for two files: `pkg_list.txt` and `lib_list.txt`. Each file is simply a list of packages, one per line, which you would like the bootstrapper to `sudo apt install`. 

**Simple setup for common/popular tools**: When finished, the bootstrapper will be able to install version managers for npm, rust, and ruby. Python might join them as well. The bootstrapper will install Golang, but I am not too familiar with Go version management currently.

**Custom dotfiles**: If you use Zsh, I will include some relevant files which you might find useful. In particular, I will be including a highly modular `.zshrc` file which contains a large series of conditional checks, to ensure your shell will properly handle any programs you do, or do not, have installed. Adding and removing common binaries will not require editing your rc file - for example, if you install Keychain, simply re-starting your shell will auto-magically switch from the Zsh `ssh-agent` plugin, to instead work with Keychain.

**Vim with crutches**: Also included will be a script which will set Vim up to the configuration I prefer as my default, built around [vim-plug]. 

If you use SpaceVim, but would like to begin diving into the world of Vim configuration, I think you'll really like the setup. It keeps some of the styling cues from SpaceVim, such as the airline statusbar and NERDTree. 

However, it is all very neatly organized into one directory: `$HOME/.vim`, avoiding the labyrinth of symlinks and bloat that SpaceVim leaves you with. 

On top of that, the setup script can be run with the argument `nvim`, which will auto-magically create a new `init.vim` which simply points any NeoVim installation at `$HOME/.vim/vimrc` - which means you only need edit your `vimrc` to see changes also reflect in NeoVim!

[pkg_list.txt]: https://github.com/jeromescuggs/bootstrap/blob/master/env/pkg_list.txt
[lib_list.txt]: https://github.com/jeromescuggs/bootstrap/blob/master/env/lib_list.txt
[node manager]: https://github.com/tj/n/
[Go]: https://golang.org/dl/
[rustup]: https://rustup.rs
[rbenv]: https://github.com/rbenv/rbenv




[git-r-done]: https://github.com/jeromescuggs/git-r-done
[vim-plug]: https://github.com/junegunn/vim-plug
