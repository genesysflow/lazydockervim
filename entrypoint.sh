#!/bin/bash

# Fix ownership of entire home directory (needed for bind mounts)
if [ -d "$HOME" ] && [ "$(stat -c '%u' "$HOME")" != "$(id -u)" ]; then
    echo "Fixing permissions on $HOME..."
    sudo chown -R developer:developer "$HOME"
fi

# Ensure essential directories exist
mkdir -p "$HOME/.config" "$HOME/.local/share" "$HOME/.local/state" "$HOME/.cache" "$HOME/projects"

# Initialize zsh config if it doesn't exist
if [ ! -f "$HOME/.zshrc" ]; then
    echo "Initializing zsh configuration..."
    echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
    echo 'source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> "$HOME/.zshrc"
    echo 'source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> "$HOME/.zshrc"
    echo 'export PATH=$PATH:$HOME/go/bin' >> "$HOME/.zshrc"
fi

CONFIG_DIR="$HOME/.config/nvim"

# Clone LazyVim starter if config doesn't exist
if [ ! -f "$CONFIG_DIR/init.lua" ]; then
    echo "LazyVim config not found, cloning starter..."
    rm -rf "$CONFIG_DIR"
    git clone https://github.com/LazyVim/starter "$CONFIG_DIR"
    rm -rf "$CONFIG_DIR/.git"
fi

# Execute the command passed to the container
exec "$@"
