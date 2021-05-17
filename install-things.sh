while true
do
    read -p "$(echo "Install oh-my-zsh? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "Installing oh-my-zsh...${NC}"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            break;;

        [nN]* ) 
            echo "Not installing oh-my-zsh..."
            break;;

        * ) echo "Invalid option entered."

    esac
done

while true
do
    read -p "$(echo "Install powerlevel10k? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "Installing powerlevel10k...${NC}"
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
            break;;

        [nN]* ) 
            echo "Not installing powerlevel10k..."
            break;;

        * ) echo "Invalid option entered."

    esac
done

while true
do
    read -p "$(echo "Install vimplug? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "Installing vimplug...${NC}"
            sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            break;;

        [nN]* ) 
            echo "Not installing vimplug..."
            break;;

        * ) echo "Invalid option entered."

    esac
done

echo "Operation completed!"
