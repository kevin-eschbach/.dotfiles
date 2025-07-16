export DOTFILES="$HOME/.dotfiles"
source $DOTFILES/exports
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Alias definitions.
if [ -f $DOTFILES/.bash_aliases ]; then
    . $DOTFILES/.bash_aliases
fi

# Key bindings 
if [ -f $DOTFILES/keybindings ]; then
    . $DOTFILES/keybindings 
fi

# Use the following command to enable programmable completion features:
if ! shopt -oq posix; then
 if [ -f /usr/share/bash-completion/bash_completion ]; then
 . /usr/share/bash-completion/bash_completion
 elif [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
 fi
fi


## Functions
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Common Directories
export WORKSPACE="$HOME/ws"
export SCRIPTS="$DOTFILES/scripts"

# Settings
export EDITOR=nvim
export VISUAL=nvim

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"


# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go
export GO_HOME="$HOME/go"

# Ruby
# Install Ruby Gems to ~/gems
# export GEM_HOME="$HOME/gems"

# Built path
export PATH=$PATH:/usr/local/go/bin  # Go
export PATH="$HOME/gems/bin:$PATH"  # Ruby
export PATH="$SCRIPTS/bin:$PATH"  # Scripts
export PATH="$HOME/bin:$PATH"

# nvim as manpager
export MANPAGER="nvim +Man!"

if [ -z "$TMUX" ]; then
    :
else
    cdir=$(pwd)
    if [ -f "$cdir/.tmux-sessionizer" ]; then
        source $cdir/.tmux-sessionizer
    fi
fi

kitten theme "Gruvbox Dark Hard"
