powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

source ~/Library/init/utils.sh

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

if [[ -L ~/.bashrc ]];
    then source ~/.bashrc
fi

if [[ -L ~/.profile ]];
    then source ~/.profile
fi 

if [[ -L ~/.aliases ]]:
    then source ~/.aliases

e_header "Welcome, Alec"
sleep .2
e_success "Loading .bashrc"
sleep .2 
e_success "Loading .profile"
sleep .2
e_success "Loading .aliases"
