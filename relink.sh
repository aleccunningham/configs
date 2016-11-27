#!/bin/bash
source utils/utils.sh

relink() {
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

DOTFILES="$HOME/dotfiles"

relink ~/.bash_profile $DOTFILES/shell/bash_profile
relink ~/.bashrc       $DOTFILES/shell/bashrc
relink ~/.profile      $DOTFILES/shell/profile
relink ~/.gitconfig    $DOTFILES/git/gitconfig
relink ~/.gitignore    $DOTFILES/git/gitignore
relink ~/.vimrc        $DOTFILES/vim/vimrc
relink ~/.vim          $DOTFILES/vim
relink ~/.tmux.conf    $DOTFILES/tmux.conf
relink ~/Library/init/utils.sh $DOTFILES/utils/utils.sh

e_success "Success!"
