# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Theme to load
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history)
POWERLEVEL9K_SHORT_STRATEGY=truncate_middle
POWERLEVEL9K_SHORTEN_DELIMETER="*"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

plugins=()

source $ZSH/oh-my-zsh.sh
