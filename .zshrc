if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

# Remotely source zsh scripts
zplug "aleccunningham/dotfiles", at:master
# oh-my-zsh plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
# CLI tools
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "supercrabtree/k"                 # `k` ls for git
zplug "rupa/z", use:z.sh
# Theme
zplug 'themes/agnoster', from:oh-my-zsh # theme

source ~/.zprofile

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
