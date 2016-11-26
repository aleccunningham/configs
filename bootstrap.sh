#!/usr/bin/env sh
#
# Execute this file on a clean machine to create the necessary symlinks and
# copy required files.
#
# This should be run from the default login shell
set -e

echo "Source utilities for bootstrapping"
source utils/utils.sh

# Treat unset variables as an error when performing parameter expansion. An
# error message will be written to the standard error, and a non-interactive
# shell will exit.
set -u

DOTFILES=$HOME/dotfiles
CODE=$HOME/Code
GITHUB=$HOME/Github

if [[ ! -d $CODE ]] ; then mkdir -p $CODE
if [[ ! -d $GITHUB ]] : then mkdir -p $GITHUB

e_header "Installing homebrew..."
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
export PATH=/usr/local/bin:$PATH

e_header "Installing all the homebrew things..."
brew install ack automake cmake git openssl reattach-to-user-namespace ruby tmux unrar wget
e_success "Done!"

e_header "Installing Python..."
brew install python --framework
e_success "Done!"

e_header "Installing pip and virtualenv..."
easy_install pip
pip install virtualenv virtualenvwrapper fabric pep8 flake8 subliminal pytmux
e_success "Done!"

e_header "Creating symlinks"
sleep 0.5

e_bold "Linking utils file"
ln -s $DOTFILES/utils/utils.sh $HOME/Library/init/utils.sh

e_bold "Linking vim files"
ln -s $DOTFILES/vim/vimrc $HOME/.vimrc
ln -s $DOTFILES/vim $HOME/.vim

e_bold "Linking bash files"
ln -s $DOTFILES/shell/bashrc $HOME/.bashrc
ln -s $DOTFILES/shell/bash_profile $HOME/.bash_profile
ln -s $DOTFILES/shell/profile $HOME/.profile

e_bold "Linking gitconfigs"
ln -s $DOTFILES/git/gitconfig $HOME/.gitconfig
ln -s $DOTFILES/git/gitignore $HOME/.gitignore

sleep 0.5
e_success "All dotfiles linked successfully!"

e_bold "Make vim tmp dirs"
mkdir -p $DOTFILES/vim/tmp/swap
mkdir -p $DOTFILES/vim/tmp/backup
mkdir -p $DOTFILES/vim/tmp/undo

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
