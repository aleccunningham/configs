# Path to your oh-my-zsh installation.
export ZSH="/Users/alec/.oh-my-zsh"

# Source oh-my-zsh itself
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="refined"

# Completion configuration
# autoload -U compinit
# compinit

# Complete path when aliased command
# setopt complete_aliases

# auto menu complete
# setopt auto_menu

# auto change directory
# setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
# setopt auto_pushd

# compacked complete list display
# setopt list_packed

# Set up $PATH
[ -f $HOME/.zprofile ] && source $HOME/.zprofile

# Source the z plugin for directory jumping
source $HOME/z.sh

# oh-my-zsh plugins
plugins=(git k z ruby docker)

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

#
# Shell functions
#
source $HOME/.func

#
# Docker helper functions
#
source $HOME/.dockerfunc

#
# Extensive alias'
#
source $HOME/.alias
