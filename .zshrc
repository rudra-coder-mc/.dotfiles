# Disable Powerlevel10k instant prompt (if necessary).
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off  # Change to 'quiet' to suppress warning instead

# Enable Powerlevel10k instant prompt (keep this at the top).
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew initialization (macOS only)
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# nvm initialization
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Ensure nvm's Node.js takes precedence
export PATH="$NVM_DIR/versions/node/$(nvm version)/bin:$PATH"

# Zinit Setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Ensure Zinit is installed.
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Powerlevel10k theme
zinit light romkatv/powerlevel10k

# Essential Zsh plugins with lazy loading
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Oh-My-Zsh snippets with conditional loading
zinit snippet OMZL::git.zsh
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found


# Create completion directory if it doesn't exist
if [ ! -d ~/.cache/zsh ]; then
  mkdir -p ~/.cache/zsh
fi


# Zinit replay
zinit cdreplay -q

# Load Powerlevel10k configuration
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Keybindings
# bindkey -v                         # Default Emacs-style keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory              # Append new history lines to the history file
setopt sharehistory               # Share history across multiple sessions
setopt hist_ignore_space          # Ignore commands starting with a space
setopt hist_ignore_all_dups       # Remove duplicate entries in history
setopt hist_save_no_dups          # Avoid saving duplicates when writing history
setopt hist_ignore_dups           # Ignore duplicates in the same session
setopt hist_find_no_dups          # Ignore duplicates during history search

# Completion and preview settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

# Add Go to PATH
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/go/bin:$PATH"

# Load essential Zsh functions
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -Uz compinit
compinit

# Ensure bash completion is initialized
autoload -U bashcompinit && bashcompinit

# Enable debugging for gitstatus
# export GITSTATUS_LOG_LEVEL=DEBUG

