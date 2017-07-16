echo "### ZSH ###"

echo "- Change shell to zsh (needs root password)."
if [ -f /usr/local/bin/zsh ]; then
    sudo chsh -s /usr/local/bin/zsh `whoami`
else
    echo "  - /usr/local/bin/zsh not found!"
    exit 1
fi

echo "- Installzplug."
brew install zplug

#echo "- Installing zsh plugins."
#/usr/local/bin/zsh -c "source /usr/local/opt/zplug/init.zsh && zplug install"

echo "- Create cache directory."
mkdir -p ~/.zsh/cache

echo

exit 0
