#!/bin/bash

# Clone LazyVim starter if config doesn't exist
if [ ! -f "$HOME/.config/nvim/init.lua" ]; then
    echo "LazyVim config not found, cloning starter..."
    rm -rf "$HOME/.config/nvim"
    git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
    rm -rf "$HOME/.config/nvim/.git"
fi

# Execute the command passed to the container
exec "$@"
