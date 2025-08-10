#!/bin/bash

echo "🚀 Installing Hashir's Neovim Configuration..."

# Backup existing config if it exists
if [ -d "$HOME/.config/nvim" ]; then
    echo "📦 Backing up existing config..."
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo "✅ Backup created!"
fi

# Clone the repository
echo "📥 Downloading configuration..."
git clone https://github.com/Hashir-10/Nvim-config.git "$HOME/.config/nvim"

# Remove git history to prevent accidental commits
echo "🧹 Cleaning up git history..."
rm -rf "$HOME/.config/nvim/.git"

echo "🎉 Installation complete!"
echo "💡 You can now open Neovim and enjoy the configuration!"
echo "📝 Note: This config is now independent - no risk of pushing to the original repo."
