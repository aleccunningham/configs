" => .vimrc
set nocompatible	" be improved, required
filetype off		" requried

" set the runtime path to invlude Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" You Complete Me
Plugin 'Valloric/YouCompleteMe'

" VIM Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" all Plugins must be added before the following line
call vundle#end()	" required
filetype plugin indent on 	" required

" => Vundle Reference
" :PluginList		- lists configured plugins
" :PluginInstall 	- installs, append ! to update or PluginUpdate

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Spaces and Tabs
set tabstop=4		" number of visual spaces per TAB
set softtabstop=4	" number of spaces in tab when editing
set expandtab		" tabs are spaces

" => UI Config
syntax on
colorscheme buddy
set number		" show line numbers
set showcmd		" show command in bottom bar
set cursorline		" highlight current line
set wildmenu		" visual autocomplete for command menu
set lazyredraw		" redraw only when we need to
set showmatch		" hight matching {{(

" => Searching
set incsearch		" search as characters are entered
set hlsearch		" highlight matches


" move vertically by visual line
nnoremap j gj
nnoremap k gk 

" move to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

" change <esc> key to leave i mode
inoremap jk <ESC>
