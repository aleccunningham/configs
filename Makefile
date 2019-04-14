XDG_CONFIG_HOME := $(HOME)/.config

.PHONY: install
install: ## Sets up symlink for user and root .vimrc for vim and neovim.c
  ln -nfs "$(HOME)"/.dot/.zshrc "$(HOME)"/.zshrc
  ln -nfs "$(HOME)"/.dot/.zprofile "$(HOME)"/.zprofile
  ln -nfs "$(HOME)"/.dot/.gitconfig "$(HOME)"/.gitconfig
  ln -nfs "$(HOME)"/.dot/.tmux.conf "$(HOME)/.tmux.conf
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"
	mkdir -p "$(XDG_CONFIG_HOME)"
	ln -snf "$(HOME)/.vim" "$(XDG_CONFIG_HOME)/nvim"
	ln -snf "$(HOME)/.vimrc" "$(XDG_CONFIG_HOME)/nvim/init.vim"
