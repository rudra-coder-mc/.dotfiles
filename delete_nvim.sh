#!/bin/bash

# Variables
NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_BACKUP_DIR="$NVIM_CONFIG_DIR.backup"

# Delete the symlink for Neovim config
if [ -L "$NVIM_CONFIG_DIR" ]; then
  echo "Removing Neovim configuration symlink..."
  rm "$NVIM_CONFIG_DIR"
else
  echo "No Neovim configuration symlink found to delete."
fi

# Optionally restore the backup if it exists
if [ -d "$NVIM_BACKUP_DIR" ]; then
  echo "Restoring backup of Neovim configuration..."
  mv "$NVIM_BACKUP_DIR" "$NVIM_CONFIG_DIR"
  echo "Backup restored."
else
  echo "No backup found to restore."
fi

echo "Neovim configuration deleted successfully!"
