# Theme -----------------------------------------------------------------------
ZSH_THEME="blinks"
if [ -z $SOLARIZED_THEME ]; then
    SOLARIZED_THEME="light"
fi

THEME_DARK="Solarized Dark"
THEME_LIGHT="Solarized Light"

# From https://coderwall.com/p/s-2_nw/change-iterm2-color-profile-from-the-cli
it2_set_profile()
{
    echo -e "\033]50;SetProfile=$1\a"
}

it2_set_theme_dark()
{
    export SOLARIZED_THEME="dark"
    echo 'Darkening...'
    source ~/.zshrc
    clear
    it2_set_profile $THEME_DARK
}

it2_set_theme_light()
{
    export SOLARIZED_THEME="light"
    echo 'Lightening...'
    source ~/.zshrc
    clear
    it2_set_profile $THEME_LIGHT
}

it2_switch_theme()
{
    if [ "$SOLARIZED_THEME" = "light" ]; then
        it2_set_theme_dark
    elif [ "$SOLARIZED_THEME" = "dark" ]; then
        it2_set_theme_light
    fi
}
