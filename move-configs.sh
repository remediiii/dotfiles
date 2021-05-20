while true
do
    read -p "$(echo "Install init.vim for neovim? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "Installing neovim config..."
            mkdir -pv ~/.config/nvim/
            cp init.vim ~/.config/nvim/
            break;;

        [nN]* ) 
            echo "Not installing neovim config..."
            break;;

        * ) echo "Invalid option entered."

    esac
done

while true
do
    read -p "$(echo "Install neofetch config? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "Installing neofetch config..."
            mkdir -pv ~/.config/neofetch/
            cp neofetch.conf ~/.config/neofetch/config.conf
            break;;

        [nN]* ) 
            echo "Not installing neofetch config..."
            break;;

        * ) echo "Invalid option entered."
    esac
done

while true
do
    read -p "$(echo "Overwrite .zshrc and .p10k.zsh? [y/n]") " answer
    case $answer in
        [yY]* ) 
            echo "Installing zsh and p10k configs..."
            echo "$Moving .zshrc..."
            cp .zshrc ~
            echo "Moving .p10k.zsh..."
            cp .p10k.zsh ~
            break;;

        [nN]* ) 
            echo "Not overwriting zsh and p10k config..."
            break;;

        * ) echo "Invalid option entered."
    esac
done

echo "Operation completed!"
