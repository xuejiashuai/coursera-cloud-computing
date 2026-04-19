#!/bin/bash

INPUT_FILE="files/Chapter-08/lab/names.txt"
DUP_FILE="/tmp/duplicates.txt"

# Clear or create duplicates file
> "$DUP_FILE"

# Read file line by line
while IFS= read -r NAME; do

    DIR="/tmp/$NAME"

    if [ -d "$DIR" ]; then
        echo "$NAME" >> "$DUP_FILE"
    else
        mkdir -p "$DIR"
        echo "Created: $DIR"
    fi

done < "$INPUT_FILE"

echo "-----------------------------------"
echo "Done processing names.txt"
echo "Duplicates (if any) saved to: $DUP_FILE"
