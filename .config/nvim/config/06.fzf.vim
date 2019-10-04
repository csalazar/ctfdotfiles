" ---
" FZF
" ---

""""""""""""""""
" General config
""""""""""""""""
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)command! -bang -nargs=* Rg

" Utility to not open nerdtree
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <c-p> :call FZFOpen(':Files')<cr>
nnoremap <leader>o :call FZFOpen(':History')<CR>
nnoremap <leader>b :call FZFOpen(':Buffers')<CR>
nnoremap <leader>t :call FZFOpen(':Tags')<CR>
nnoremap <silent> <Leader>ag :call FZFOpen(':Ag <C-R><C-W>')<CR>
nnoremap <silent> <Leader>AG :call FZFOpen(':Ag <C-R><C-A>')<CR>
xnoremap <silent> <Leader>ag y:call FZFOpen(':Ag <C-R>"')<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)
