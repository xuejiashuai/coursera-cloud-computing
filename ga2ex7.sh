#!/bin/bash

FILE="$1"
DIR="$HOME/topsecret"

# Check if filename was provided
if [ -z "$FILE" ]; then
    echo "Error: No filename provided."
    exit 1
fi

# Check if file exists in ~/topsecret
if [ -e "$DIR/$FILE" ]; then
    echo "File '$FILE' exists in $DIR"
else
    echo "Error: File '$FILE' does not exist in $DIR"
fi
