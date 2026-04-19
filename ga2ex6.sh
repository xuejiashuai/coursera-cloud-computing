#!/bin/bash

FILE="$1"

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' does not exist."
    exit 1
fi

# Check executable permission
if [ -x "$FILE" ]; then
    echo "File '$FILE' is executable."
else
    echo "Error: The file '$FILE' is not executable."
fi
