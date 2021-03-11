#!/bin/zsh


# flash keyboard brightness
case $(brightnessctl --device='tpacpi::kbd_backlight' g) in 
	2)
		(  brightnessctl --device='tpacpi::kbd_backlight' set 0% 
		brightnessctl --device='tpacpi::kbd_backlight' set 100% ) &> /dev/null
		;;
	1)
		(  brightnessctl --device='tpacpi::kbd_backlight' set 0%
		brightnessctl --device='tpacpi::kbd_backlight' set 50% ) &> /dev/null
		;;
	0)
		(  brightnessctl --device='tpacpi::kbd_backlight' set 100%
		brightnessctl --device='tpacpi::kbd_backlight' set 0% ) &> /dev/null
		;;
esac

neofetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Increase default HISTSIZE
export HISTSIZE=10000
export HISTFILESIZE=10000

# set default editor to neovim
export EDITOR='nvim'

# check if running WSL
if [ $(uname -r | grep microsoft -c) ] # does kernel name include microsoft?
then
	USING_WSL=1
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Use tab completion waiting dots 
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-syntax-highlighting colored-man-pages)

source "$ZSH"/oh-my-zsh.sh


###### aliases ######
# For a full list of active aliases, run `alias`.

# quickly edit .zshrc
alias zshconfig="${EDITOR} ~/.zshrc"

# quickly edit neovim config
alias vimconfig="${EDITOR} ~/.config/nvim/init.vim"

# shortcut for superuser editor
alias n="sudo ${EDITOR}"

# restart plasma
alias rplasma='kquitapp5 plasmashell &> /dev/null && kstart5 plasmashell &> /dev/null'

# create parent directories by default
alias mkdir='mkdir -pv'

# macOS-style open command
alias open="xdg-open &> /dev/null"



###### custom functions ######

# update package database depending on distro version
function update() {
	RED='\033[1;31m'
	BLUE='\033[1;34m'
	GREEN='\033[1;32m'
	NC='\033[0m' # No Color
	if [ $(uname) = "Darwin" ]
	then
		echo -e "\n########\nbrew updates\n########\n"
		brew upgrade
	else 
		case $(lsb_release -ds) in
			*Manjaro* | *Arch*)
				echo -e "\n${GREEN}#########\npacman & AUR updates\n#########\n"
				yay -Syu --noconfirm
				;;
			*buntu* | *Debian*)
				echo -e "${RED}#########\napt updates\n#########\n"
				sudo apt update && sudo apt upgrade --yes
				;;
			*neon*)
				echo -e "${BLUE}#########\npkcon updates\n#########\n"
				sudo pkcon update
				;;
			*Fedora*)
				echo -e "${BLUE}#########\ndnf updates\n#########\n"
				sudo dnf upgrade
				;;
		esac
	fi
	echo "Packages have been updated."
    echo -e "${RED}\n#########\noh my zsh\n#########\n"
	omz update

	echo -e "${RED}\n#########\npowerlevel 10k\n#########\n"
	git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull
	echo $'\a'
}

function youtube-dl() {
	youtube-dl "$1" -f bestvideo+bestaudio/best
}

# assembly shortcut for compilation
function qasm() {
	if [ -z "$1" ]
	then
		echo -e "Usage: qasm filename [32/64]"
		return
	fi
	FILE_NAME=$(basename "$1" .asm) 	
	case $2 in 
		64)
			nasm -f elf64 -o "$FILE_NAME".o "$1"
			ld -e _main -melf_x86_64 -o "$FILE_NAME" "$FILE_NAME".o
			;;
		*)
			if [ -z "$2" ]
			then
				echo -e "Bits not supported or not specified. Defaulting to 32-bit..."
			fi
			nasm -f elf32 -o "$FILE_NAME".o "$1"
			ld -e _main -melf_i386 -o "$FILE_NAME" "$FILE_NAME".o 
			;;
	esac
	echo -e "Output file: ${FILE_NAME}"
}
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
