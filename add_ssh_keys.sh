#!/bin/bash

# Start ssh-agent and add all private keys, excluding public keys
eval "$(ssh-agent -s)"
for keyfile in ~/.ssh/*; do
    if [[ "$keyfile" != *.pub ]]; then
        ssh-add "$keyfile"
    fi
done

# Optional: Display added keys
ssh-add -l

# Optional: Check if ssh-agent is running
ssh-add -l >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "ssh-agent is running."
else
    echo "ssh-agent is not running."
fi
