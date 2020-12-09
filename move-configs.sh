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

cp .zshrc .p10k.zsh ~
echo "Everything seems to have installed okay!"
