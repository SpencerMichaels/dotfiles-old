echo "- Cloning oh-my-zsh to ~/.oh-my-zsh."
git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"

echo "- Changing shell to zsh (needs root password)."
if [ -f /usr/local/bin/zsh ]; then
    sudo chsh -s /usr/local/bin/zsh `whoami`
else
    echo "/usr/local/bin/zsh not found!"
    exit 1
fi

exit 0
