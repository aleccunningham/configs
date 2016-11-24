#!/usr/bin/env sh
#
# Execute this file on a clean machine to create the necessary symlinks and
# copy required files.
#
# Requires Dropbox
# This should be run from the default login shell

set -e

# Treat unset variables as an error when performing parameter expansion. An
# error message will be written to the standard error, and a non-interactive
# shell will exit.
set -u

DOTFILES=$HOME/dotfiles
CODE=$HOME/Code
GITHUB=$HOME/Github

mkdir -p $CODE
mkdir -p $GITHUB

echo "Installing homebrew..."
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
export PATH=/usr/local/bin:$PATH

echo "Installing all the homebrew things..."
brew install ack automake cmake git openssl reattach-to-user-namespace ruby tmux unrar wget

echo "Updating submodules..."
git submodule init
git submodule update

echo "Installing Python..."
brew install python --framework

echo "Installing pip and virtualenv..."
easy_install pip
pip install virtualenv virtualenvwrapper fabric pep8 flake8 subliminal pytmux

echo "Linking rc files"
ln -s $DOTFILES/vimrc $HOME/.vimrc
ln -s $DOTFILES/vim $HOME/.vim
ln -s $DOTFILES/bashrc $HOME/.bashrc
ln -s $DOTFILES/bash_profile $HOME/.bash_profile
ln -s $DOTFILES $HOME/.profile

mkdir -p $DOTFILES/vim/tmp/swap
mkdir -p $DOTFILES/vim/tmp/backup
mkdir -p $DOTFILES/vim/tmp/undo

# git
ln -s $DOTFILES/gitconfig $HOME/.gitconfig

cd $GITHUB && git clone git://github.com/joyent/node.git
cd $GITHUB/node && ./configure && make && make install
