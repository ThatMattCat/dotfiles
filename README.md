# ThatMattCat's Dotfiles

A comprehensive collection of bash and vim configurations, aliases, functions, and utilities designed for enhanced productivity in Ubuntu environments.

## Features

### Bash Enhancements
- **Eternal Bash History**: Unlimited command history with timestamps stored in `~/.bash_eternal_history`
- **Smart SSH Agent Management**: Automatically starts or connects to existing SSH agents
- **Custom Aliases**: Useful shortcuts including `ll`, `k` (kubectl), `h` (history), and more
- **Path Management**: Functions to safely append/prepend to PATH without duplication
- **Color Support**: Comprehensive color definitions and auto-completion for color variables
- **Kubectl Integration**: Auto-completion and aliases for Kubernetes management

### Vim Configuration
- **Modern Plugin Management**: Uses vim-plug with NERDTree and ALE (linter)
- **Molokai Color Scheme**: Professional dark theme with syntax highlighting
- **Smart Folding**: Custom fold text with line counts and intuitive controls
- **Custom Syntax Highlighting**: Special highlighting for bash color definition files
- **Sensible Defaults**: Optimized settings for development work

### Utilities
- **Color Preview Tool**: `bin/color_preview.sh` to visualize all available terminal colors
- **Custom Completion**: Enhanced bash completion for color variables and kubectl

## Installation

**WARNING**: This script modifies your `.bashrc` and `.vimrc` files. While it attempts to prevent overriding existing configurations, please review the install script before running.

```bash
cd ~
git clone git@github.com:ThatMattCat/dotfiles.git
cd dotfiles
./install.sh [all|vim|bash]
```

### Installation Options
- `bash` - Install bash configurations, aliases, and utilities only
- `vim` - Install vim configuration, plugins, and themes only  
- `all` - Install both bash and vim configurations

The installer will:
- Set up eternal bash history
- Configure Git username/email (if not already set)
- Install vim plugins (NERDTree, ALE) and Molokai theme
- Make utility scripts executable
- Source configurations in your existing dotfiles

## Usage Examples

### Bash Features
```bash
# Use eternal history with timestamps
h | tail -10

# Quick directory listing with details
ll

# Kubernetes shorthand
k get pods

# Preview all terminal colors
color_preview.sh
```

### Vim Features
- `F3` - Toggle NERDTree file explorer
- `Space` - Toggle code folding
- Automatic plugin installation on first run
- Custom syntax highlighting for bash color files

## Environment

Tested and optimized for Ubuntu 24.04, particularly in cloud-init VM environments. Your mileage may vary on other systems.

## Credits

Much of the bash configuration was inspired by [fotinakis/bashrc](https://github.com/fotinakis/bashrc/tree/master), including the excellent "eternal bash history" implementation.

