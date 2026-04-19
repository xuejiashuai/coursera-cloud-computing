#!/bin/bash

# Read roster.txt into an array
ROSTERARRAY=()

while IFS= read -r line; do
    ROSTERARRAY+=("$line")
done < roster.txt

# Loop through array
for NAME in "${ROSTERARRAY[@]}"; do

    DIR="$HOME/$NAME"

    if [ -d "$DIR" ]; then
        echo "Directory $NAME exists"
    else
        mkdir -p "$DIR"
        echo "New directory created: $DIR"
    fi

done

# Show home directory contents
echo "-----------------------------------"
echo "Home directory contents:"
ls "$HOME"
