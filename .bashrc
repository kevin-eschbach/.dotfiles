export DOTFILES="$HOME/.dotfiles"
# nvim
export PATH="$HOME/neovim/bin:$PATH"

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    # todo: create your own prompt
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

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


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
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


# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go
export GO_HOME="$HOME/go"

# Ruby
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"

# Built path
export PATH=$PATH:/usr/local/go/bin  # Go
export PATH="$HOME/gems/bin:$PATH"  # Ruby
export PATH="$SCRIPTS/bin:$PATH"  # Scripts
export PATH="$HOME/bin:$PATH"

# nvim as manpager
export MANPAGER="nvim +Man!"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
