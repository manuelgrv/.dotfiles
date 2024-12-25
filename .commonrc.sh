#!/usr/bin/env bash

# ~/.commonrc.sh
# Shared shell configuration for both Bash and Zsh
# Includes aliases, environment variables, and common functions

# --- Conda ---
eval "$(conda "shell.$(basename "${SHELL}")" hook)"

tmux source-file ~/.config/tmux/.tmux.conf # Load tmux configuration

# --- Node Version Manager (NVM) ---
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # Load NVM
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # NVM bash completion

# --- Poetry Path (Python Dependency Manager) ---
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# --- Custom Functions ---
## Open `yazi` with temporary cwd file handling
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

## Create a directory and navigate into it
function mkd() {
  mkdir -p "$@" && cd "$_" || return
}

# --- Aliases ---
## Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias p="cd ~/projects"
alias l="exa"
alias la="exa -la"
alias ll="exa -l"
alias lt="exa -T"
alias cl="clear"

## Programs
alias g="git"
alias vim="nvim"
alias v="nvim"

# --- Environment Variables ---
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH" # PostgreSQL
export XDG_CONFIG_HOME="$HOME/.config"                  # XDG Configurations
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# --- Initialization Commands ---
command neofetch # Show system info
