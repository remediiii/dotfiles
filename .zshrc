# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/will/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions colored-man-pages sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

###### aliases ######
# For a full list of active aliases, run `alias`.

# open zshrc
alias zshconfig="nano ~/.zshrc"

# update package database depending on distro version
# TODO: support for fedora, since it doesn't use lsb_release to check distro version
# TODO: this is easy but add support for debian as well
function update() {
	RED='\033[1;31m'
	BLUE='\033[1;34m'
	GREEN='\033[1;32m'
	NC='\033[0m' # No Color
	if [ $(lsb_release -ds | grep -c neon) -eq 1 ]
	then	
		echo -e "${BLUE}###############\npkcon updates\n###############\n"
		sudo pkcon update
	elif [ $(lsb_release -ds | grep -c ubuntu) -eq 1 ]
	then
		echo -e "${RED}##############\napt updates\n###############\n"
		sudo apt update && sudo apt upgrade
	elif [ $(lsb_release -ds | grep -c Manjaro) -eq 1 ]
	then
		echo -e "${GREEN}###############\npacman updates\n###############\n"
		sudo pacman -Syu --noconfirm
		echo -e "\n###############\nAUR updates\n###############\n"
		yay -Syu --noconfirm
	fi
    echo -e "${NC}\n###############\noh my zsh\n###############\n"
	upgrade_oh_my_zsh
	# avoid using snaps, as it increases boot time very slightly
	# echo -e "${NC}###############\nsnap updates\n###############\n"
	# sudo snap update
}

# shortcut for superuser nano
alias n="sudo nano"

# similiar to macOS open
# open a dolphin window detached from the terminal.
# takes one or no arguments, with no arguments, it 
# will just open current directory.
function open() {
	if [ -z "$1" ]
	then
		( nohup dolphin . > /dev/null 2>&1& )
	else
		( nohup dolphin "$1" > /dev/null 2>&1& )
	fi
}

# add to path
export PATH="$PATH:/snap/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
