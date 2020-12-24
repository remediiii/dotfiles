read -p "Install init.vim for neovim? [y/n] " answer

while true
do
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


read -p "Install neofetch config? [y/n] " answer

while true
do
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

echo "Moving .zshrc..."
cp .zshrc ~
echo "Moving .p10k.zsh..."
cp .p10k.zsh ~

echo "Moving completed!"
