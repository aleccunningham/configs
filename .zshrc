# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/go/bin:/usr/local/bin:$PATH

source ~/.profile

# Path to your oh-my-zsh installation.
export ZSH="/Users/alec/.oh-my-zsh"

# Source oh-my-zsh itself
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="refined"

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

plugins=(
  git
  ubuntu
)

# Source oh-my-zsh itself
source $ZSH/oh-my-zsh.sh

# Source the z plugin for directory jumping
source $ZSH/plugins/z/z.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Language configuration
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Shell functions
source $HOME/.func

# Docker helper functions
source $HOME/.dockerfunc

# Extensive alias'
source $HOME/.alias

# dircolors.
if [ -x "$(command -v dircolors)" ]; then
    eval "$(dircolors -b ~/.dircolors)"
fi

# fzf key bindings.
if [ -x "$(command -v fzf)" ]; then
    source ~/.fzf/shell/key-bindings.zsh
fi
