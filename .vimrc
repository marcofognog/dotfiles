filetype plugin indent on
set autoindent
set smartindent
syntax on
set ruler
set hidden
set backspace=indent,eol,start
set shiftwidth=2
set smarttab
set expandtab
set number
set nocompatible
set wildmenu
set hlsearch
set showcmd
set ignorecase
set clipboard=unnamed
set smartcase
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
colorscheme solarized
set background=dark
vnoremap p pgvy
nnoremap Y y$
" auto remove Trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

filetype indent on " Enable filetype-specific indenting
filetype plugin on
nnoremap <space><space> <c-^>

" Maximum number of changes that can be undone
set undolevels=1000

" Maximum number lines to save for undo on a buffer reload
set undoreload=10000

" Create those directories if they don't exist already
silent execute '!mkdir -p ~/.vim/{backup_files,swap_files,undo_files}'

set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

set nu rnu

"Show invisible chars
set list
set listchars=tab:»\ ,trail:·

set ts=2 sts=2 sw=2 expandtab

" Vundle
set nocompatible
set modelines=0
set nomodeline

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'

filetype plugin indent on

"Kee 10 lines above and below the cursor
set scrolloff=20

