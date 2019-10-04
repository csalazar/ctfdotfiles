" ---
" GUI
" ---
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

if exists('$TMUX')
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
colorscheme onedark

let g:airline_theme = 'onedark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

" -------------
" Configuration
" -------------
let mapleader="\<Space>"

syntax on
set clipboard+=unnamedplus
set modeline            " Enable modeline.
set shell=/usr/bin/zsh
set noswapfile

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set cc=90               " highlight column
set cursorline
set number relativenumber

filetype plugin indent on
set tabstop=2           " Render TABs using this many spaces.
set softtabstop=2
set shiftwidth=2        " Indentation amount for < and > commands.
set expandtab           " Insert spaces when TAB is pressed.
set pastetoggle=<leader>v

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

set noerrorbells        " No beeps.
set linespace=15         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands
set list                " Show problematic characters.

if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Autocomplete menu
set completeopt=longest,menuone,preview

set nosmd  " Don't show last line

" ----------------
" Neovim Variables
" ----------------

" set python paths
let g:python3_host_prog = $HOME . '/miniconda3/bin/python'
let g:python_host_prog = $HOME . '/miniconda3/envs/neovim2/bin/python'
