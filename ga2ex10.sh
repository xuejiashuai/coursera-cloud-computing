#!/bin/bash

# Detect OS and set config file path
if [ -f /etc/mysql/mariadb.conf.d/50-server.cnf ]; then
    CONF_FILE="/etc/mysql/mariadb.conf.d/50-server.cnf"
elif [ -f /etc/my.cnf.d/mariadb-server.cnf ]; then
    CONF_FILE="/etc/my.cnf.d/mariadb-server.cnf"
else
    echo "MariaDB config file not found."
    exit 1
fi

echo "Using config file: $CONF_FILE"

# Backup file before editing
sudo cp "$CONF_FILE" "${CONF_FILE}.bak"

# Comment out existing bind-address line (if not already commented)
sudo sed -i 's/^\s*bind-address\s*=/#bind-address =/g' "$CONF_FILE"

# Add/replace bind-address with 0.0.0.0
# (append if not present, otherwise ensure correct value exists)
if grep -q "^#bind-address" "$CONF_FILE"; then
    echo "bind-address = 0.0.0.0" | sudo tee -a "$CONF_FILE" > /dev/null
else
    echo "bind-address = 0.0.0.0" | sudo tee -a "$CONF_FILE" > /dev/null
fi

echo "Update complete: bind-address set to 0.0.0.0"
