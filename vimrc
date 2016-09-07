set nocompatible
filetype off
let mapleader="\<Space>"

" Set powerline from system installation
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set t_Co=256

" Start Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Add Plugin
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'crusoexia/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'nvie/vim-flake8'

" Launch Vundle
call vundle#end()
filetype plugin indent on

" Misc
let g:ycm_autoclose_preview_window_after_completion=1
set encoding=utf-8
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
syntax on
colorscheme monokai
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', '\.egg-info$']
set nu
set wildignore+=*.so,*.swp,*.pyc
map <F2> :NERDTreeToggle<CR>
nmap <C-k> <C-b>
nmap <C-j> <C-f>
imap <C-c> <Esc>

autocmd BufWritePost *.py call Flake8()
let g:flake8_show_quickfix=0
let g:flake8_show_in_gutter=1

:set incsearch
:set ignorecase
:set smartcase
:set showcmd
:set nofoldenable
:set expandtab
:set tabstop=4
:set shiftwidth=4

