# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Add homebrew to PATH
export PATH=/opt/homebrew/bin:$PATH

# Add tmux to PATH
export PATH=/opt/homebrew/opt/tmux/bin:$PATH

# ZSH theme
ZSH_THEME=edvardm
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# ZSH plugins
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

# Source omzsh
source $ZSH/oh-my-zsh.sh


# Aliases
alias vim="nvim"
alias ll="ls -l"
alias la="ll -a"
alias l="ll"

# Directory aliases
alias projects="cd ~/Projects"

# Git Aliases
alias gco="git checkout"
alias gpull="git pull"
alias gpush="git push"
alias gcm="git commit -m"
alias gs="git status"
alias gd="git diff"

# Always open tmux by default
# if [ "$TMUX" = "" ]; then tmux; fi


# Configure NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# Bun

## Bun completions
[ -s "/Users/nachomglz/.bun/_bun" ] && source "/Users/nachomglz/.bun/_bun"

## Bun config
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# pnpm

export PNPM_HOME="/Users/nachomglz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
