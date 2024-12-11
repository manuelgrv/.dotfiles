# #!/usr/bin/env zsh

# ~/.zshrc
# Zsh shell configuration

# --- Zinit Installation and Initialization ---
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


# --- Plugins ---
zinit light zsh-users/zsh-syntax-highlighting    # Syntax highlighting
zinit light zsh-users/zsh-completions            # Enhanced completions
zinit light zsh-users/zsh-autosuggestions        # Command suggestions

# --- Keybindings ---
bindkey -e                                       # Enable emacs keybindings
bindkey '^p' history-search-backward            # Search backward in history
bindkey '^n' history-search-forward             # Search forward in history

# --- History Settings ---
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory                            # Append history to file
setopt sharehistory                             # Share history across sessions
setopt hist_ignore_space                        # Ignore commands with leading spaces
setopt hist_ignore_all_dups                     # Remove all duplicate history entries
setopt hist_save_no_dups                        # Don't write duplicate entries
setopt hist_ignore_dups                         # Ignore duplicate commands
setopt hist_find_no_dups                        # Ignore duplicates in search

# --- Completion System ---
autoload -Uz compinit && compinit -u            # Load and initialize completion system
zinit cdreplay -q                               # Ensure plugin completions are loaded
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case-insensitive completion

# --- Globbing ---
setopt EXTENDED_GLOB                            # Enable extended globbing

# --- Spelling Correction ---
setopt CORRECT                                  # Enable spelling correction

# --- Zoxide for Zsh ---
eval "$(zoxide init zsh)"

# --- ZSH Starship ---
eval "$(starship init zsh)"

# --- Source Common Configurations ---
source ~/.commonrc.sh
