"__   _____ __  __ ___  ___ 
"\ \ / /_ _|  \/  | _ \/ __|
" \ V / | || |\/| |   / (__ 
"  \_/ |___|_|  |_|_|_\\___|
"                           

" =========================================================
" Leader Key
" =========================================================
let mapleader = " "         " Map <leader> to Spacebar

" =========================================================
" Set the things...
" =========================================================
set encoding=utf-8
set fileencoding=utf-8
set nocompatible            " Disable Vi compatibility
set number                  " Show line numbers
set tabstop=2               " Number of spaces per tab
set shiftwidth=2            " Indent size
set expandtab               " Use spaces instead of tabs
set smartindent             " Smart auto-indenting
syntax on                   " Syntax highlighting
colorscheme habamax         " Set theme for highlighting, must be after `syntax on`
filetype plugin indent on   " Filetype detection
set nobackup                " Do not save backup files
set nowrap                  " Do not wrap lines
set incsearch               " Show matches as you type a search
set hlsearch                " Highlight all search results
set history=1000            " Default command history is 20, so increase it
set showmode                " Show the mode you are on the last line

" =========================================================
" Key Mappings
" =========================================================
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" =========================================================
" Tab completion enhancements for :e
" =========================================================
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx