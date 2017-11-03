set nocompatible
set encoding=utf-8
filetype off
let mapleader="\<Space>"

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
Plugin 'tmhedberg/SimpylFold'
Plugin 'majutsushi/tagbar'
Plugin 'tikhomirov/vim-glsl'

" Launch Vundle
call vundle#end()

" Set powerline from system installation
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Misc
filetype plugin indent on
let g:ycm_autoclose_preview_window_after_completion=1
let g:tagbar_autoclose=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
syntax on
colorscheme monokai
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', '\.egg-info$']
set nu
set wildignore+=*.so,*.swp,*.pyc
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
nmap <C-k> <C-b>
nmap <C-j> <C-f>
imap <C-c> <Esc>
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

autocmd BufWritePost *.py call Flake8()
au BufRead,BufNewFile *.pyi set filetype=python

let g:flake8_show_quickfix=0
let g:flake8_show_in_gutter=1

set nobackup
set noswapfile
set incsearch
set ignorecase
set smartcase
set showcmd
set nofoldenable
set expandtab
set tabstop=4
set shiftwidth=4
set clipboard=unnamed
