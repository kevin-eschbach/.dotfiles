## Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='ls --color=auto'
alias ld='ls -ld'
alias la='ls -la'
alias ll='ls -l'

## Git Aliases
alias gc='git commit'
alias gs='git status'
alias gd='git diff -w'
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcl='git clone'
alias gbr='git branch'

## NeoVim Aliases
alias vim='nvim'
alias vi='nvim'

## Functions
mkcd() {
    mkdir -p "$1" && cd "$1"
}

## Settings
export EDITOR=nvim
