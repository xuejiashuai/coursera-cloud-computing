#!/bin/bash

# Read roster.txt into an array
ROSTERARRAY=()

while IFS= read -r line; do
    ROSTERARRAY+=("$line")
done < roster.txt

# Loop through array and create directories in home folder
for name in "${ROSTERARRAY[@]}"; do
    mkdir -p "$HOME/$name"
    echo "Directory created at: $HOME/$name"
done

# Show contents of home directory to confirm success
echo "-----------------------------------"
echo "Home directory contents:"
ls "$HOME"
