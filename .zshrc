if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

autoload colors && colors
setopt prompt_subst

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh", defer:0 # Defer is needed for themes to load properly
zplug "plugins/git", from:oh-my-zsh, as:plugin, defer:2
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
# zplug "knu/z", use:z.sh, nice:10
zplug 'themes/agnoster', from:oh-my-zsh

source ~/.zprofile

# Tab completion for sshrc
# compdef sshrc=ssh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

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

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load