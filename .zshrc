# ---------------------------------
# Powerlevel10k instant prompt
# ---------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------------------------------
# Oh My Zsh path
# ---------------------------------
export ZSH="$HOME/.oh-my-zsh"

# ---------------------------------
# Auto-install Oh My Zsh if missing
# ---------------------------------
if [ ! -d "$ZSH" ]; then
  echo "🚀 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# ---------------------------------
# Auto-install plugins if missing
# ---------------------------------
declare -A PLUGINS_REPO=(
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
  [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting"
  [zsh-completions]="https://github.com/zsh-users/zsh-completions"
  [fzf-tab]="https://github.com/Aloxaf/fzf-tab"
)

for plugin in "${(@k)PLUGINS_REPO}"; do
  if [ ! -d "$ZSH/custom/plugins/$plugin" ]; then
    echo "📦 Installing plugin: $plugin"
    git clone --depth=1 "${PLUGINS_REPO[$plugin]}" "$ZSH/custom/plugins/$plugin"
  fi
done

# ---------------------------------
# Auto-install Powerlevel10k theme if missing
# ---------------------------------
if [ ! -d "$ZSH/custom/themes/powerlevel10k" ]; then
  echo "🎨 Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH/custom/themes/powerlevel10k"
fi

# ---------------------------------
# Theme & Plugins
# ---------------------------------
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  dnf
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  zsh-completions
  sudo
  command-not-found
  zsh-z
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# ---------------------------------
# Completions setup
# ---------------------------------
# Fedora system completions
fpath=(/usr/share/zsh/site-functions $fpath)

# Custom completions directory
fpath=("$HOME/.zsh/completions" $fpath)
mkdir -p "$HOME/.zsh/completions"

# Example: Add zellij completions if missing
if [ ! -f "$HOME/.zsh/completions/_zellij" ] && command -v zellij >/dev/null 2>&1; then
  zellij setup --generate-completion zsh > "$HOME/.zsh/completions/_zellij"
fi

autoload -Uz compinit
compinit

# ---------------------------------
# FZF key bindings
# ---------------------------------
export FZF_ALT_C_COMMAND='sort -t"|" -k2,2nr ~/.z | awk -F"|" "{print \$1}"'
source <(fzf --zsh)

# ---------------------------------
# History settings
# ---------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# ---------------------------------
# Aliases
# ---------------------------------
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# ---------------------------------
# Powerlevel10k config
# ---------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---------------------------------
# NVM setup
# ---------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ---------------------------------
# Quiet instant prompt
# ---------------------------------
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
