" --------
" supertab
" --------
let g:SuperTabDefaultCompletionType = "<c-n>"


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
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" open list of error
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5


" -------------
" vim-auto-save
" -------------
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave"]


" ---------------------
" vim-better-whitespace
" ---------------------
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" --------------
" LanguageClient
" --------------
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}

function! ConfigureLanguageClient()
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <buffer> <leader>r :call LanguageClient#textDocument_rename()<CR>
  nnoremap <buffer> <leader>n :call LanguageClient#textDocument_references()<CR>
  setlocal omnifunc=LanguageClient#complete
endfunction
