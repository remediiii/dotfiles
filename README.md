# dotfiles
my dotfiles for linux

neovim is my default editor, so change your .zshrc EDITOR variable accordingly.

## requirements

* oh-my-zsh
* powerlevel10k
* vim-plug (optional, only if using neovim config)
* (if running Fedora, for update function) redhat-lsb

## installation

run `./install-things.sh` if you need omz, p10k, or vimplug, then run `./move-configs` to actually move the dotfiles to where they need to be.
both scripts give options for what you can install, so pick and choose what you want.