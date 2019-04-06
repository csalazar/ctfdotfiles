" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'christoomey/vim-tmux-navigator'

" Python
Plug 'raimon49/requirements.txt.vim', { 'for': 'requirements' }
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python' }

" Ruby
Plug 'vim-ruby/vim-ruby'

" General
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'vimlab/split-term.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jsfaint/gen_tags.vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Visual
Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/goyo.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kshenoy/vim-signature'
Plug 'unblevable/quick-scope' "to search better color scheme
Plug 'ekalinin/Dockerfile.vim'

" Theme
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Search
call plug#end()
