" --------------------
" vim-multiple-cursors
" --------------------
function! Multiple_cursors_before()
  exe 'ALEDisable'
endfunction

function! Multiple_cursors_after()
  exe 'ALEEnable'
endfunction


" --------------
" vim-easymotion
" --------------
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1


" ---------------------
" vim-better-whitespace
" ---------------------
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1
let g:strip_whitespace_confirm=0


" ---
" ale
" ---
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_use_global_executables = 1

highlight ALEErrorSign ctermbg=NONE ctermfg=NONE
highlight ALEWarningSign ctermbg=NONE ctermfg=NONE
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''


" ---
" coc
" ---
let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-json',
  \ ]


" --------
"  airline
"  -------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_type = 0

let g:airline_theme = 'one'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 0
let g:airline_section_c = ''
