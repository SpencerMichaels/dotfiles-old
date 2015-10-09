#!/bin/bash
# Symlinks any files in ~/.dotfiles ending in .symlink to the home directory


# Check that the required paths are set up first.
if [ -z "$DOTFILES_ROOT_DIR" ] && \
   [ -z "$SETUP_SCRIPTS_DIR" ] && \
   [ -z "$DOTFILES_OSX_DIR" ]
then
    echo "Paths not set up. Run this script via setup.sh in the root dotfiles"
    echo "folder or source paths.sh manually."
    exit 1
fi


FILES=$(find $DOTFILES_ROOT_DIR -maxdepth 2 -name '*.symlink' )

COUNT=0
for FILE in $FILES; do
    FILE_BASE=$(basename $FILE)
    LINK="$(echo $FILE_BASE | sed 's/.symlink//')"
    if [ -e "$HOME/.$LINK" ]; then
        echo "- $LINK exists, skipping."
    else
        ln -s -h $FILE "$HOME/.$LINK"
        echo "- Linked" $LINK"."
        COUNT=$((COUNT+1))
    fi
done

echo "Linked $COUNT files."
