echo "### ZSH ###"

echo "- Changing shell to zsh (needs root password)."
if [ -f /usr/local/bin/zsh ]; then
    sudo chsh -s /usr/local/bin/zsh `whoami`
else
    echo "  - /usr/local/bin/zsh not found!"
    exit 1
fi

echo "- Installing zsh plugins."
if command -v zplug; then
	zplug install
else
    echo "  - zplug not found!"
    exit 1
fi

echo

exit 0
