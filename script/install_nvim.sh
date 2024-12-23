#!/bin/bash

# Variables
DOTFILES_REPO="https://github.com/rudra-coder-mc/.dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
NVIM_CONFIG_DIR="$HOME/.config/"
DOTFILES_Nvim_CONFIG="$DOTFILES_DIR/nvim/.config/nvim" # Update this path

# Clone the .dotfiles repository if it doesn't exist
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning .dotfiles repository..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo ".dotfiles repository already exists. Pulling latest changes..."
  cd "$DOTFILES_DIR" && git pull
fi

# Backup existing Neovim config if it exists
if [ -d "$NVIM_CONFIG_DIR" ]; then
  echo "Backing up existing Neovim config..."
  mv "$NVIM_CONFIG_DIR" "$NVIM_CONFIG_DIR.backup"
fi

# Create the .config directory if it doesn't exist
mkdir -p "$HOME/.config"

# Check if the nvim configuration directory exists in the .dotfiles repo
if [ ! -d "$DOTFILES_Nvim_CONFIG" ]; then
  echo "Error: The nvim configuration directory does not exist in the .dotfiles repository."
  exit 1
fi

# Create the nvim configuration directory if it doesn't exist
mkdir -p "$NVIM_CONFIG_DIR"

# Create a symlink to the Neovim config in the .dotfiles repo
echo "Creating symlink for Neovim configuration..."
ln -sfn "$DOTFILES_Nvim_CONFIG" "$NVIM_CONFIG_DIR"

echo "Neovim configuration installed successfully!"
