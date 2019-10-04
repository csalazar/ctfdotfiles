" -----------
" quick-scope
" -----------
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" ----------
" git-gutter
" ----------
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''

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
let g:strip_whitespace_confirm=0


" ---
" ale
" ---
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_use_global_executables = 1

highlight ALEErrorSign ctermbg=NONE ctermfg=NONE
highlight ALEWarningSign ctermbg=NONE ctermfg=NONE
let g:ale_sign_error = '🛑'
let g:ale_sign_warning='🔶'

" ---
" coc
" ---
let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-snippets'
  \ ]


" --------
" NERDTree
" --------
let NERDTreeIgnore = ['\.pyc$']

" quit if nerdtree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" --------
" gen_tags
" --------
let g:loaded_gentags#gtags = 1
let g:gen_tags#ctags_auto_gen = 1


" --------
" snippets
" --------
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
