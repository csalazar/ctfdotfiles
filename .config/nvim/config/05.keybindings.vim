" ------------
" Disable keys
" ------------

" Disable mouse
set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Disable arrow keys and use them to resize panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Scroll down and up with centered screen
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" Use backspace to clear the highlighting of search
nmap <silent> <BS> :nohlsearch<CR>

" Move text one line up/down under selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Save file
nnoremap <Leader>w :w<CR>

" Close file
nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>

" Close quickfix or location window
noremap <Leader>c :ccl <bar> lcl<CR>

" Escape automatically regexp in search
nnoremap / /\v

" Autoclose location list after enter file/mark
autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>

" Terminal without numbers
au TermOpen * setlocal nonumber norelativenumber

" Close quickfix if we close file
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" ----------
" easymotion
" ----------
nmap <Leader><Leader> <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)


" ---
" ale
" ---
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <leader>f <Plug>(ale_fix) <bar> :w<CR>


" ----------
" split-term
" ----------
nnoremap <C-`> :Term<CR>


" ----------
" airline
" ----------
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
