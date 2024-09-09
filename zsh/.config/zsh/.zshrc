# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config//zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# to source aliasrc 
[ -f "${ZDOTDIR}/aliasrc" ] && source "${ZDOTDIR}/aliasrc"

[ -f "${ZDOTDIR}/optionrc" ] && source "${ZDOTDIR}/optionrc"

[ -f "${ZDOTDIR}/pluginrc" ] && source "${ZDOTDIR}/pluginrc"

# source plugin

# source ${ZDOTDIR}/plugins/f-sy-h/F-Sy-H.plugin.zsh
# source ${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ${ZDOTDIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
# source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# keymap

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep extendedglob nomatch notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/forcoding/.zshrc'



autoload -U colors && colors	      # colours
autoload -U compinit && compinit    # basic completion
autoload -U compinit colors zcalc   # theming

autoload -Uz compinit
compinit

# End of lines added by compinstall

# To customize prompt, run `p10k configure` or edit ~/.config//zsh//.p10k.zsh.
[[ ! -f ~/.config//zsh//.p10k.zsh ]] || source ~/.config//zsh//.p10k.zsh
