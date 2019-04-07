" -----------
" quick-scope
" -----------
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" ----------
" git-gutter
" ----------
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = '❗'
let g:gitgutter_sign_removed = '➖'


" ---
" fzf
" ---
" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

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


" -------------
" indent-guides
" -------------
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2


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


" ---
" ale
" ---
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0

" ---
" coc
" ---
let g:coc_global_extensions = ['coc-python', 'coc-json', 'coc-solargraph']
