DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

FILES=$(find $DIR -maxdepth 2 -name '*.symlink' )

COUNT=0
for FILE in $FILES; do
    FILE_BASE=$(basename $FILE)
    LINK="$(echo $FILE_BASE | sed 's/.symlink//')"
    if [ -e "$HOME/.$LINK" ]; then
        echo "$LINK exists, skipping."
    else
        ln -s -h $FILE "$HOME/.$LINK"
        echo "Linked" $LINK"."
        COUNT=$((COUNT+1))
    fi
done

echo "\nLinked $COUNT files."
