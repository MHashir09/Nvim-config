# Hashir's Neovim Configuration

My personal Neovim setup with all the plugins and configurations I use for development.

## ✨ Features

- [Add your features here, like:]
- LSP support
- File explorer
- Syntax highlighting
- Auto-completion
- [etc...]

## 🚀 Installation

### Method 1: Automated Installation (Recommended)
```bash
curl -sSL https://raw.githubusercontent.com/Hashir-10/Nvim-config/main/install.sh | bash
```

### Method 2: Manual Installation
```bash
# Backup existing config (optional)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null

# Download without git history
curl -L https://github.com/Hashir-10/Nvim-config/archive/main.zip -o nvim-config.zip
unzip nvim-config.zip
mv Nvim-config-main ~/.config/nvim
rm nvim-config.zip
```

### Method 3: Git Clone (Advanced users)
```bash
git clone https://github.com/Hashir-10/Nvim-config.git ~/.config/nvim
rm -rf ~/.config/nvim/.git  # Remove git history to prevent accidental commits
```

## 📋 Requirements

- Neovim >= 0.8
- Git
- [Add other requirements like Node.js, Python, etc. if needed]

## ⚠️ Important Notes

- This installation will backup your existing Neovim config if you have one
- After installation, the config becomes independent (no git history)
- You can safely modify it without affecting this repository

## 🎯 Usage

After installation, simply run:
```bash
nvim
```

## 📝 Key Mappings

[Add your custom key mappings here]

## 🛠️ Customization

Feel free to modify the configuration files in `~/.config/nvim/` to suit your needs!

---

⭐ If you found this helpful, please give it a star!
