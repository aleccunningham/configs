" => .vimrc
python from powerline.vim import setup as powerline_setup
python powerline_setup()

set nocompatible	" be improved, required
filetype off		" requried

" set the runtime path to invlude Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'plasticboy/vim-markdown'
Plugin 'kien/ctrlp.vim'

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
colorscheme solarized
set background=dark
set number		" show line numbers
set cursorline		" highlight current line
set wildmenu		" visual autocomplete for command menu
set lazyredraw		" redraw only when we need to
set showmatch		" hight matching {{(

" => Searching
" set incsearch		" search as characters are entered
" set hlsearch		" highlight matches

nmap <leader>i :enew<cr>
nmap <leader>o :bnext<CR>
nmap <leader>p :bprevious<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" move to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

map <C-n> :NERDTreeToggle<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" change <esc> key to leave i mode
inoremap jk <ESC>

" fix issues with backspace in <insert> mode
set backspace=indent,eol,start

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>
