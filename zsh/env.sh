# Brew, NVM, PNPM, UV
if [[ -d /opt/homebrew ]]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi
export NVM_DIR="$HOME/.nvm"; [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
export PNPM_HOME="$HOME/.local/share/pnpm"; export PATH="$PNPM_HOME:$PATH"
command -v uv >/dev/null && { alias python="uv run python"; alias pip="uv run pip"; }
