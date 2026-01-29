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
set so=7                    " Keep 7 lines visible above/below cursor
set ruler                   " Show line, col nums and percentage in bottom right
set showmatch               " Show matching brackets when text indicator is over them
set undofile                " Enable persistent undo
set spellcapcheck=\S        " Check capitalized words at the start of a sentence for spelling
set spelllang=en_us         " Use English dictionary lang for spellchecking
set backspace=indent,eol,start " Intuitive backspace behavior.

" =========================================================
" Undo Files (save in files for multi-session undo functionality)
" =========================================================

" Store undo files in a dedicated directory instead of default location
if !isdirectory(expand("~/.vim/undo"))
  call mkdir(expand("~/.vim/undo"), "p")
endif
set undodir="$HOME/.vim/undo"

" Max number of undo levels
set undolevels=1000

" Max number of lines for undo entries
set undoreload=10000

" =========================================================
" Swap Files (save outside the project you are working on)
" =========================================================

" Store swap files in a dedicated directory instead of default location
if !isdirectory(expand("~/.vim/swap"))
  call mkdir(expand("~/.vim/swap"), "p")
endif

" Store swap files in dedicated folder (~/.vim/swap), preserving path hierarchy.
" fallback to /tmp if needed
set directory^="$HOME/.vim/swap//,/tmp"

" =========================================================
" Key Mappings
" =========================================================

" Leader + space to toggle off highlights after a search
nnoremap <leader><space> :nohlsearch<CR>

" Leader + w to write
nnoremap <leader>w :w<CR>

" Leader + q to quit
nnoremap <leader>q :q<CR>

" Leader + ss for toggle spell checker
nnoremap <leader>ss :setlocal spell!<cr>

" Leader + Tab + v to open explore in a vertical split
nnoremap <leader><Tab>v :Vexplore<CR>

" Leader + Tab + h to open explore in a horizontal split
nnoremap <leader><Tab>h :Sexplore<CR>

" Leader + Tab + Tab to open explore in current window
nnoremap <leader><Tab><Tab> :Explore<CR>

" Leader + h/j/k/l to move between panes
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l


nnoremap <leader>f :Format<CR>

command! Format call FormatFile()
" =========================================================
" Code Formatting
" =========================================================
function! FormatFile()
  let l:pos = getpos('.')

  if &filetype == 'python'
    silent !black %
  elseif &filetype =~ 'javascript\|typescript\|css\|html\|json'
    silent !prettier --write %
  endif

  silent edit!
  call setpos('.', l:pos)
  redraw!
endfunction

" =========================================================
" Tab completion enhancements for :e
" =========================================================
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
