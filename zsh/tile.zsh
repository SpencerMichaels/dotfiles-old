#!/bin/bash
# Before running this,
# brew install dark-mode

tile()
{
    brew services start kwm
    open /Applications/Übersicht.app
    menubar-toggle --hide
    dark-mode --mode Dark
    echo "Tiling mode on."
}

untile()
{
    brew services stop kwm
    # killall doesn't like the umlaut, appparently
    kill -9 `pidof bersicht`
    dark-mode --mode Light
    menubar-toggle --show
    echo "Tiling mode off."
}
