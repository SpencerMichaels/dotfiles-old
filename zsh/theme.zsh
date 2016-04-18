# Theme -----------------------------------------------------------------------
ZSH_THEME="avit"
if [ -z $SOLARIZED_THEME ]; then
    SOLARIZED_THEME="light"
fi

SOL_THEME_DARK="Solarized Dark"
SOL_THEME_LIGHT="Solarized Light"

# From https://coderwall.com/p/s-2_nw/change-iterm2-color-profile-from-the-cli
it2_set_profile()
{
    echo -e "\033]50;SetProfile=$1\a"
}

it2_set_theme_sol_dark()
{
    export SOLARIZED_THEME="dark"
    echo 'Darkening...'
    source ~/.zshrc
    clear
    it2_set_profile $SOL_THEME_DARK
}

it2_set_theme_sol_light()
{
    export SOLARIZED_THEME="light"
    echo 'Lightening...'
    source ~/.zshrc
    clear
    it2_set_profile $SOL_THEME_LIGHT
}

it2_switch_theme()
{
    if [ "$SOLARIZED_THEME" = "light" ]; then
        it2_set_theme_sol_dark
    elif [ "$SOLARIZED_THEME" = "dark" ]; then
        it2_set_theme_sol_light
    fi
}
