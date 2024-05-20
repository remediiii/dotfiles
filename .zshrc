#!/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH"/oh-my-zsh.sh


# Increase default HISTSIZE
export HISTSIZE=10000
export HISTFILESIZE=10000

# set default editor to neovim
export EDITOR='nvim'

###### aliases ######
# For a full list of active aliases, run `alias`.

# quickly edit .zshrc
alias zshconfig="${EDITOR} $HOME/.zshrc"

# quickly edit neovim config
alias vimconfig="${EDITOR} $HOME/.config/nvim/init.vim"

# shortcut for superuser editor
alias n="sudo ${EDITOR}"

# create parent directories by default
alias mkdir='mkdir -pv'

# macOS-style open command
alias open="xdg-open &> /dev/null"

# use lsd instead of ls
alias ls="lsd"

# update package database depending on distro version
function update() {
	RED='\033[1;31m'
	BLUE='\033[1;34m'
	GREEN='\033[1;32m'
	NC='\033[0m' # No Color
	case $(lsb_release -ds) in
		*Manjaro* | *Arch*)
			echo -e "\n${GREEN}#####\npacman & AUR updates\n#####\n"
			yay -Syu --noconfirm
			;;
		*buntu* | *Debian*)
			echo -e "${RED}#####\napt updates\n#####\n"
			sudo apt update && sudo apt upgrade --yes
			;;
	esac
	echo "Packages have been updated."
    echo -e "${RED}\n#####\noh my zsh\n#####\n"
	omz update

	echo -e "${RED}\n#####\npowerlevel 10k\n#####\n"
	git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull
	echo $'\a'
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
