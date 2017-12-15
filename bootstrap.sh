#!/usr/bin/env sh
#
# Execute this file on a clean machine to create the necessary symlinks and
# copy required files.
#
# This should be run from the default login shell
set -eu

DOTFILES="$HOME/.dotfiles"

echo "Installing homebrew..."
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
export PATH=/usr/local/bin:$PATH

echo "Installing packages..."
brew install ack automake cmake git openssl ruby tmux\
        unrar wget shpotify googler python python3
pip install -r requirements-global.txt

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

echo "Linking dotfiles"
link ~/.vimrc        $DOTFILES/vim/vimrc
link ~/.vim          $DOTFILES/vim
link ~/.bash_profile $DOTFILES/zsh/zshrc
link ~/.bashrc       $DOTFILES/zsh/aliases
link ~/.gitconfig    $DOTFILES/git/gitconfig
link ~/.gitignore    $DOTFILES/git/gitignore
link ~/.tmux.conf    $DOTFILES/tmux.conf

echo "Install keyservers CA Certificate to /etc/"
sudo curl -s "https://sks-keyservers.net/sks-keyservers.netCA.pem" -o /etc/sks-keyservers.netCA.pem
