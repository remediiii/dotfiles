RED='\033[1;31m'
BG_RED='\033[1;41m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
BG_GREEN='\033[1;42m'
BLACK='\033[1;30m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

while true
do
    read -p "$(echo ${BLUE}"Install init.vim for neovim? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "${GREEN}Installing neovim config..."
            mkdir -pv ~/.config/nvim/
            cp init.vim ~/.config/nvim/
            break;;

        [nN]* ) 
            echo "${YELLOW}Not installing neovim config..."
            break;;

        * ) echo "${RED}Invalid option entered."

    esac
done

while true
do
    read -p "$(echo ${BLUE}"Install neofetch config? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "${GREEN}Installing neofetch config..."
            mkdir -pv ~/.config/neofetch/
            cp neofetch.conf ~/.config/neofetch/config.conf
            break;;

        [nN]* ) 
            echo "${YELLOW}Not installing neofetch config..."
            break;;

        * ) echo "${RED}Invalid option entered."
    esac
done

while true
do
    read -p "$(echo ${BG_RED}${BLACK}"Overwrite${NC}${BLUE} .zshrc and .p10k.zsh? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "${GREEN}Installing zsh and p10k configs..."
            echo "${NC}Moving .zshrc..."
            cp .zshrc ~
            echo "Moving .p10k.zsh..."
            cp .p10k.zsh ~
            break;;

        [nN]* ) 
            echo "${YELLOW}Not overwriting zsh and p10k config..."
            break;;

        * ) echo "${RED}Invalid option entered."
    esac
done

echo "${BG_GREEN}${BLACK}Operation completed!"
