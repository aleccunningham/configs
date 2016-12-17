#!/usr/bin/env sh
#
# Execute this file on a clean machine to create the necessary symlinks and
# copy required files.
#
# This should be run from the default login shell
set -e

e_bold "Source utilities for bootstrapping"
source utils/utils.sh

# Treat unset variables as an error when performing parameter expansion. An
# error message will be written to the standard error, and a non-interactive
# shell will exit.
set -u

DOTFILES="$HOME/dotfiles"

CODE="$HOME/Code"
GITHUB="$HOME/Github"
INIT="~/Library/init/"
SSH="$HOME/.ssh"

e_header "Create config directories if absent"
if [[ ! -d $CODE ]] ; then mkdir -p $CODE
if [[ ! -d $GITHUB ]] ; then mkdir -p $GITHUB
if [[ ! -d $INIT ]] ; then sudo mkdir -p $INIT
if [[ ! -d $SSH ]] ; then mkdir -p $SSH
e_success "Directories created"

e_header "Installing homebrew..."
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
export PATH=/usr/local/bin:$PATH

e_header "Installing all the homebrew things..."
brew install ack automake cmake git openssl ruby tmux unrar wget
e_success "Done"

e_header "Installing Python..."
brew install python --framework
e_success "Done"

e_header "Installing pip and virtualenv..."
easy_install pip
pip install virtualenv virtualenvwrapper fabric pep8 flake8 subliminal pytmux
e_success "Done"


e_header "Creating symlinks"
sleep 0.5

link() {
  if [[ -h "$1" ]]; then
    e_warning "Relinking $1"
    # Symbolic link? Then recreate.
    rm "$1"
    ln -sn "$2" "$1"
  elif [[ ! -e "$1" ]]; then
    e_success "Linking $1 to $2"
    ln -sn "$2" "$1"
  else
    e_error "$1 exists as a real file, skipping."
  fi
}

e_bold "Linking utils file"
link /Library/init/utils.sh $DOTFILES/utils/utils.sh

e_bold "Linking vim files"
link ~/.vimrc        $DOTFILES/vim/vimrc
link ~/.vim          $DOTFILES/vim

e_bold "Linking bash files"
link ~/.bash_profile $DOTFILES/shell/bash_profile
link ~/.bashrc       $DOTFILES/shell/bashrc
link ~/.profile      $DOTFILES/shell/profile

e_bold "Linking gitconfigs"
link ~/.gitconfig    $DOTFILES/git/gitconfig
link ~/.gitignore    $DOTFILES/git/gitignore

e_bold "Linking tmux"
link ~/.tmux.conf    $DOTFILES/tmux.conf

sleep 0.5
e_success "All dotfiles linked successfully!"

e_bold "Installing and symlink gist"
pip install python-gist
link ~./gist $DOTFILES/git/gist


e_header "GPG, PGP, and SSH config"
brew install gnupg2
e_bold "Create GPG and SSH folders"
mkdir -p ~/.gnupg ; chmod 700 ~/.gnupg
mkdir -p ~/.ssh ; chmod 700 ~/.ssh

e_bold "Link those configs"
link ~/.ssh/ssh_config    $DOTFILES/ssh_config
link ~/.gnupg/gpg.conf    $DOTFILES/gpg.conf

e_bold "Install keyservers CA Certificate to /etc/"
sudo curl -s "https://sks-keyservers.net/sks-keyservers.netCA.pem" -o /etc/sks-keyservers.netCA.pem

# installing nodejs
seek_confirmation "Do you want to install node.js?"
if is_confirmed; then
  cd $GITHUB && git clone git://github.com/joyent/node.git &&
  cd $GITHUB/node && ./configure && make && make install &&
  e_success "Node.js installed!"
else
  e_error "Did not install Node.js"
fi

# imports all bash settings
source bash_profile
