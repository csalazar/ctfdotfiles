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

" Next/Previous buffer with tab
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>

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

" Toggle background color
if exists("*ToggleBackground") == 0
  function ToggleBackground()
    if &background == "dark"
      set background=light
    else
      set background=dark
    endif
  endfunction

  command BG call ToggleBackground()
endif

" Update tmux title
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window 'vim " . expand("%:t") . "'")
autocmd VimLeave * call system("tmux setw automatic-rename")

" ---
" FZF
" ---
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()

nnoremap <c-p> :call FZFOpen(':Files')<cr>

nnoremap <leader>o :call FZFOpen(':History')<CR>
nnoremap <leader>b :call FZFOpen(':Buffers')<CR>
nnoremap <leader>t :call FZFOpen(':BTags')<CR>
nnoremap <leader>T :call FZFOpen(':Tags')<CR>
nnoremap <silent> <Leader>ag :call FZFOpen(':Ag <C-R><C-W>')<CR>
nnoremap <silent> <Leader>AG :call FZFOpen(':Ag <C-R><C-A>')<CR>
xnoremap <silent> <Leader>ag y:call FZFOpen(':Ag <C-R>"')<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)


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


" ----
" goyo
" ----
nnoremap <Leader>g :Goyo<CR>


" --------
" NERDTree
" --------
map <C-e> :NERDTreeToggle<CR>
