#!/bin/bash

ROSTER_FILE="./roster.txt"
LOG_FILE="./ga2ex11-log.sh"

# Check if roster file exists
if [ ! -f "$ROSTER_FILE" ]; then
    echo "Error: roster.txt not found in current directory"
    exit 1
fi

# Read each line into LINE variable
while IFS= read -r LINE; do

    NAME="$LINE"
    HOME_DIR="/home/$NAME"
    SSH_DIR="$HOME_DIR/.ssh"

    echo "Processing user: $NAME"

    # Check if user home directory exists
    if [ ! -d "$HOME_DIR" ]; then

        sudo useradd -c "Account for $NAME" \
            -s /usr/bin/bash \
            -d "$HOME_DIR" \
            -m "$NAME" 2>&1 | tee -a "$LOG_FILE"

        echo "$(date) - Account created for $NAME" >> "$LOG_FILE"
        echo "Account created: $NAME"

    else
        echo "Skipping account creation (already exists): $NAME"
    fi

    # Ensure .ssh directory exists and is owned by user
    if [ ! -d "$SSH_DIR" ] || [ ! -O "$SSH_DIR" ]; then
        sudo mkdir -p "$SSH_DIR"
        sudo chown "$NAME:$NAME" "$SSH_DIR"
    fi

    # Create SSH key if it does not exist
    if [ ! -f "$SSH_DIR/id_ed25519_$NAME" ]; then

        sudo ssh-keygen -t ed25519 \
            -f "$SSH_DIR/id_ed25519_$NAME" \
            -N "" 2>&1 | tee -a "$LOG_FILE"

        sudo chown "$NAME:$NAME" "$SSH_DIR"/id_ed25519_$NAME*

        echo "$(date) - SSH keys created for $NAME" >> "$LOG_FILE"
        echo "SSH keys created for: $NAME"

    else
        echo "SSH keys already exist for: $NAME"
    fi

done < "$ROSTER_FILE"
