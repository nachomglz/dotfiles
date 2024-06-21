# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Add homebrew to PATH
export PATH=/opt/homebrew/bin:$PATH

# Add tmux to PATH
export PATH=/opt/homebrew/opt/tmux/bin:$PATH

ZSH_THEME=edvardm
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# Aliases
alias vim="nvim"
alias ll="ls -l"
alias la="ll -a"
alias l="ll"
alias ld="ll -1"

alias config="cd ~/.config"

alias reload="source ~/.zshrc"
alias vimrc="vim ~/.zshrc"

# Directory aliases
alias projects="cd ~/Projects"
alias courses="cd ~/courses"

# Git Aliases
alias gco="git checkout"
alias gp="git pull"
alias gcm="git commit -m"
alias gs="git status"
alias gd="git diff"

# Docker aliases
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcl="docker-compose logs -f"


# Always open tmux by default
if [ "$TMUX" = "" ]; then tmux; fi

# Add configure nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# bun completions
[ -s "/Users/nachomglz/.bun/_bun" ] && source "/Users/nachomglz/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/nachomglz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end