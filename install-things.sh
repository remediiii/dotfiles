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
    read -p "$(echo ${BLUE}"Install oh-my-zsh? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "${GREEN}Installing oh-my-zsh...${NC}"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            break;;

        [nN]* ) 
            echo "${YELLOW}Not installing oh-my-zsh..."
            break;;

        * ) echo "${RED}Invalid option entered."

    esac
done

while true
do
    read -p "$(echo ${BLUE}"Install powerlevel10k? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "${GREEN}Installing powerlevel10k...${NC}"
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
            break;;

        [nN]* ) 
            echo "${YELLOW}Not installing powerlevel10k..."
            break;;

        * ) echo "${RED}Invalid option entered."

    esac
done

while true
do
    read -p "$(echo ${BLUE}"Install vimplug? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "${GREEN}Installing vimplug...${NC}"
            sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            break;;

        [nN]* ) 
            echo "${YELLOW}Not installing vimplug..."
            break;;

        * ) echo "${RED}Invalid option entered."

    esac
done

echo "${BG_GREEN}${BLACK}Operation completed!"
