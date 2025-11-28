#!/usr/bin/env bash
set -e
DOTFILES_DIR="$HOME/.dotfiles"

echo "== Bootstrapping Dotfiles =="
# Brew bundle if Brewfile exists
if command -v brew >/dev/null 2>&1 && [ -f "$DOTFILES_DIR/Brewfile" ]; then
  brew bundle --file="$DOTFILES_DIR/Brewfile"
fi
# Link dotfiles
make -C "$DOTFILES_DIR" link
echo "Bootstrap complete."
