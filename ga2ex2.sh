#!/bin/bash

# Read each line of roster.txt into an array
ROSTERARRAY=()

while IFS= read -r line; do
    ROSTERARRAY+=("$line")
done < roster.txt

# Echo the 2nd element (index 1)
echo "${ROSTERARRAY[1]}"
