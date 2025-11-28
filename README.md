# Dotfiles Repository

A comprehensive macOS dotfiles configuration that automates environment setup, includes development tools, GPU support, and a modular Zsh shell configuration powered by Prezto.

## Table of Contents

- [Quick Start](#quick-start)
- [Features](#features)
- [Installation](#installation)
- [Installed Apps & Tools](#installed-apps--tools)
- [Zsh Configuration](#zsh-configuration)
- [Git Configuration](#git-configuration)
- [Usage & Commands](#usage--commands)
- [GPU Support](#gpu-support)
- [Troubleshooting](#troubleshooting)

## Quick Start

```bash
# Clone this repo to ~/.dotfiles
cd ~/.dotfiles
make bootstrap
```

This will install Homebrew packages and link all configuration files.

## Features

- **Automated Bootstrap**: Single command setup for entire environment
- **Modular Zsh Configuration**: Clean, organized shell configuration with Prezto framework
- **Development Stack**: Support for Python (UV), Node.js (pnpm, NVM), Rust, Go, and Java
- **GPU Support**: GPU verification utilities and compute libraries (OpenCL, Vulkan)
- **Git Configuration**: Pre-configured git settings with global gitignore
- **Make-based Workflow**: Simple commands for common tasks

## Installation

### Prerequisites

- macOS with Zsh shell (default since Catalina)
- Git installed
- Administrator access for Homebrew installation

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone <repo-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run bootstrap**
   ```bash
   make bootstrap
   ```
   This will:
   - Install Homebrew (if not present)
   - Install all packages from Brewfile
   - Link all dotfiles to their proper locations

3. **Restart shell or source zshrc**
   ```bash
   exec zsh
   ```

## Installed Apps & Tools

### Programming Languages & Compilers

- **LLVM**: Compiler infrastructure and toolchain
- **Rust**: Systems programming language
- **Go**: Concurrent programming language
- **Java**: OpenJDK 21 (via Temurin)

### Numerical Computing & ML

- **OpenBLAS**: Optimized BLAS library for linear algebra
- **LAPACK**: Linear algebra package
- **libomp**: OpenMP runtime for parallel computation
- **CMake**: Build system generator

### GPU & Compute Support

- **Vulkan Headers & Loader**: Graphics and compute API
- **Molten-VK**: Vulkan implementation for Metal
- **OpenCL Headers**: Compute language headers
- **clblast**: GPU-accelerated BLAS library

### Other Development Tools

- **llama.cpp**: Fast LLM inference

### Package Managers & Runtime Tools

- **Homebrew**: macOS package manager
- **Node.js (NVM)**: Node version manager
- **pnpm**: Fast Node package manager
- **UV**: Python project and tool manager

## Zsh Configuration

### Framework: Prezto

This configuration uses [Prezto](https://github.com/sorin-ionescu/prezto), a Zsh framework that provides:

- **Modules**: Curated set of shell features organized as modules
- **Themes**: Pre-built prompt themes
- **Completion**: Advanced completion system

### Enabled Modules

- `environment`: Environment variable management
- `terminal`: Terminal settings
- `editor`: Vim-style keybindings
- `directory`: Directory navigation and history
- `history`: Command history management
- `completion`: Intelligent tab completion
- `autosuggestions`: Fish-like syntax suggestions
- `syntax-highlighting`: Real-time command syntax highlighting
- `git`: Git-related functions and abbreviations
- `prompt`: Prompt customization

### Configuration Files

#### `zshrc` (Main Configuration)
Loads Prezto and sources modular shell configuration files.

#### `env.sh` (Environment Variables)
Sets up:
- Homebrew environment
- Node Version Manager (NVM)
- PNPM home directory
- UV Python aliases

#### `aliases.sh` (Command Aliases)

Common shortcuts for development work:

```bash
ls        → ls -G              # Colorized ls
npm       → pnpm              # Use pnpm instead of npm
npx       → pnpm dlx          # pnpm executable runner
p         → pnpm              # Short alias
pi        → pnpm install      # Install dependencies
pr        → pnpm run          # Run scripts
```

#### `prompt.sh` (Prompt Theme)
Enables the "sorin" theme from Prezto, providing a clean, informative prompt with git status.

#### `zpreztorc` (Prezto Configuration)
Configures which Prezto modules to load and their settings.

## Git Configuration

### Setup

Edit `git/gitconfig` with your details:

```bash
[user]
    name = Your Name
    email = you@example.com
```

### Features

- **Global Gitignore**: Common patterns ignored across all repositories
- **Editor**: Uses Neovim for git commits
- **Global Patterns**: Automatically ignores:
  - `.DS_Store` (macOS system files)
  - `node_modules/` (Node dependencies)
  - `dist/` (Build output)
  - `.env` (Environment files)

## Usage & Commands

### Make Targets

All tasks are managed through Make:

```bash
make bootstrap    # Full environment setup (brew install + link configs)
make link         # Link all dotfiles to home directory
make brew         # Run Homebrew bundle
make gpu-check    # Verify GPU and compute support
```

### Common Workflows

**Update Homebrew packages**
```bash
brew bundle upgrade --file=~/.dotfiles/Brewfile
```

**Add new Homebrew package**
```bash
brew install <package-name>
brew bundle dump --file=~/.dotfiles/Brewfile --force
```

**Update Prezto**
```bash
cd ~/.zprezto && git pull
```

**Modify shell aliases**
```bash
vim ~/.dotfiles/zsh/aliases.sh
exec zsh  # Reload shell
```

## GPU Support

### Verification Script

Run `make gpu-check` to verify GPU capabilities:

```bash
make gpu-check
```

This will check:
- **Metal**: Apple's graphics framework
- **Vulkan**: Cross-platform compute API
- **OpenCL**: Compute language support

### What's Included

- Vulkan SDK headers and loaders
- Molten-VK for Vulkan support on Metal
- clblast for GPU-accelerated linear algebra
- llama.cpp for optimized LLM inference

### Using GPU in Development

```bash
# Python with GPU support
uv run python script.py

# Rust with GPU
rustc --target x86_64-apple-darwin script.rs

# Check available GPUs
system_profiler SPDisplaysDataType | grep Metal
```

## Troubleshooting

### Make commands not found

```bash
# Ensure you're in the dotfiles directory
cd ~/.dotfiles

# Try with full path if needed
make -C ~/.dotfiles <command>
```

### Zsh not loading configuration

```bash
# Check if symlinks are correct
ls -la ~/.zshrc ~/.gitconfig

# Re-link files
make link

# Reload
exec zsh
```

### Homebrew issues

```bash
# Verify brew is installed
brew --version

# Install Homebrew if missing
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then run bootstrap
make bootstrap
```

### Prezto not found

The zshrc expects Prezto to be installed at `~/.zprezto`. If it's missing:

```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
exec zsh
```

### GPU verification fails

```bash
# Ensure dependencies are installed
make brew

# Check individual components
vulkaninfo          # Vulkan support
system_profiler SPDisplaysDataType | grep Metal  # Metal support
python3 -c "import pyopencl"  # OpenCL Python bindings
```

## Structure

```
~/.dotfiles/
├── bootstrap.sh        # Main setup script
├── Brewfile            # Homebrew packages
├── Makefile            # Task automation
├── README.md           # This file
├── zsh/
│   ├── zshrc          # Main shell config
│   ├── zpreztorc      # Prezto settings
│   ├── env.sh         # Environment variables
│   ├── aliases.sh     # Command aliases
│   └── prompt.sh      # Prompt theme
├── git/
│   ├── gitconfig      # Git user & editor config
│   └── gitignore_global # Global git ignore patterns
└── scripts/
    └── verify_gpu.sh  # GPU verification utility
```

## Customization

### Add a new shell alias

1. Edit `zsh/aliases.sh`
2. Add your alias: `alias myalias='command'`
3. Reload: `exec zsh`

### Add environment variables

1. Edit `zsh/env.sh`
2. Add: `export MYVAR="value"`
3. Reload: `exec zsh`

### Add Homebrew packages

1. Install with `brew install package-name`
2. Update Brewfile: `brew bundle dump --file=~/.dotfiles/Brewfile --force`
3. Commit changes to repository

### Switch Zsh theme

1. Edit `zsh/prompt.sh`
2. Change theme name in: `zstyle ':prezto:module:prompt' theme 'theme-name'`
3. Run `exec zsh`

Available Prezto themes: sorin, powerlevel9k, minimal, and others

## License

This repository is provided as-is for personal use.
