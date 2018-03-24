# .zshrc is always sourced
# variables here are available to all other programs
# 
export VISUAL=subl
export EDITOR=vim
export PATH=$PATH:~/bin:/usr/local/bin
export TERM="xterm-256color"

env_config_files(~/.zsh/**/*.zshenv(N))
if test ! -z "$env_config_files" ;
    then
    for file in ${env_config_files}
    do
        source $file
    done
fi

