# Add an "alert" alias for long running commands.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Aliases
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias keyboard='setxkbmap'

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ld='ls -ld'
alias la='ls -Alh'
alias ll='ls -l'
alias update='sudo apt-get update && sudo apt-get upgrade -y'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove -y'

alias top='htop'

alias fman="compgen -c | fzf | xargs man"

# conda
alias condastart='eval "$(~/miniconda3/bin/conda shell.bash hook)"'

## Git Aliases
alias gc='git commit'
alias gcm='git commit -m'
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

## Go Aliases
alias air='~/go/bin/air'

