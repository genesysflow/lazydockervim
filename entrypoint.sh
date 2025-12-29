#!/bin/bash

# Fix permissions on .config directory if needed
if [ -d "$HOME/.config" ] && [ ! -w "$HOME/.config" ]; then
    echo "Fixing permissions on $HOME/.config..."
    sudo chown -R developer:developer "$HOME/.config"
fi

# Ensure .config exists
mkdir -p "$HOME/.config"

CONFIG_DIR="$HOME/.config/nvim"

# Clone LazyVim starter if config doesn't exist
if [ ! -f "$CONFIG_DIR/init.lua" ]; then
    echo "LazyVim config not found, cloning starter..."
    
    # Fix permissions if directory exists but is not writable
    if [ -d "$CONFIG_DIR" ] && [ ! -w "$CONFIG_DIR" ]; then
        sudo chown -R developer:developer "$CONFIG_DIR"
    fi
    
    rm -rf "$CONFIG_DIR"
    git clone https://github.com/LazyVim/starter "$CONFIG_DIR"
    rm -rf "$CONFIG_DIR/.git"
fi

# Execute the command passed to the container
exec "$@"
