#!/usr/bin/env bash

# ~/.bashrc
# Bash shell configuration.

# --- Bash Starship ---
eval "$(starship init bash)"

# --- Zoxide for bash ---
eval "$(zoxide init bash)"

source ~/.commonrc.sh

. "$HOME/.local/bin/env"
