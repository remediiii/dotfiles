#!/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/will/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions colored-man-pages)

source $ZSH/oh-my-zsh.sh

###### aliases ######
# For a full list of active aliases, run `alias`.

# open zshrc w nano
alias zshconfig="nano ~/.zshrc"

# shortcut for superuser nano
alias n="sudo nano"

# shortcut for dotfiles management with git
alias dotfiles='git -C ~/dotfiles/'

# restart plasma
alias rplasma='kquitapp5 plasmashell && kstart5 plasmashell'

###### custom functions ######

# update package database depending on distro version
# TODO: support for fedora, since it doesn't use lsb_release to check distro version
# TODO: this is easy but add support for debian as well
function update() {
	RED='\033[1;31m'
	BLUE='\033[1;34m'
	GREEN='\033[1;32m'
	NC='\033[0m' # No Color
	case $(lsb_release -ds) in
		*Manjaro*)
			echo -e "\n${GREEN}###############\npacman & AUR updates\n###############\n"
			yay -Syu --noconfirm
			;;
		*ubuntu* | *Debian*)
			echo -e "${RED}##############\napt updates\n###############\n"
			sudo apt update && sudo apt upgrade
			;;
		*neon*)
			echo -e "${BLUE}###############\npkcon updates\n###############\n"
			sudo pkcon update
			;;
		*Fedora*)
			echo -e "###############\ndnf updates\n###############\n"
			sudo dnf upgrade
			;;
	esac
    echo -e "${NC}\n###############\noh my zsh\n###############\n"
	omz update
	# avoid using snaps, as it increases boot time very slightly
	# echo -e "${NC}###############\nsnap updates\n###############\n"
	# sudo snap update
}

# similiar to macOS open,
# open a file manager window detached from the terminal.
# can pass in specified directory as argument
function open() {
	case $DESKTOP_SESSION in
		gnome)
		FILE_MANAGER="nautilus"
		;;
		/usr/share/xsessions/plasma)
		FILE_MANAGER="dolphin"		
		;;
	esac
	if [ -z "$1" ]
	then
		( nohup $FILE_MANAGER . > /dev/null 2>&1& )
	else
		( nohup $FILE_MANAGER "$1" > /dev/null 2>&1& )
	fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
