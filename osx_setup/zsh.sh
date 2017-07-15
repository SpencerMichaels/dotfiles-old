echo "### ZSH ###"

echo "- Changing shell to zsh (needs root password)."
if [ -f /usr/local/bin/zsh ]; then
    sudo chsh -s /usr/local/bin/zsh `whoami`
else
    echo "  - /usr/local/bin/zsh not found!"
    exit 1
fi

echo "- Installing zplug."
brew install zplug

echo "- Installing zsh plugins."
/usr/local/bin/zsh -c "source /usr/local/opt/zplug/init.zsh && zplug install"

echo

exit 0
