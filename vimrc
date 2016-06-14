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
Plugin 'scrooloose/syntastic'
Plugin 'crusoexia/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'

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
let NERDTreeIgnore=['\.pyc$', '\~$']
set nu
set wildignore+=*.so,*.swp,*.pyc
map <F2> :NERDTreeToggle<CR>
imap <C-c> <Esc>
let g:syntastic_check_on_open = 1

" Virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

