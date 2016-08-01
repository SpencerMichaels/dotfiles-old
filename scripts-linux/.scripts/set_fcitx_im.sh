#!/bin/bash

case $1 in
    zhuyin)
        fcitx-remote -o
        fcitx-remote -s chewing
        ;;
    pinyin)
        fcitx-remote -o
        fcitx-remote -s sunpinyin
        ;;
    english)
        fcitx-remote -c
        ;;
    *)
        echo "Unrecognized keyword. Choose zhuyin, pinyin, or english."
        ;;
esac

if [ ! -z "$FCITX_STATE" ]; then
    echo `fcitx-remote` > $FCITX_STATE
else
    echo "Can't write state."
fi
