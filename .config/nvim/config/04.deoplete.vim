" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

" disable the candidates in comment/string
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" ignored sources
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'around']

" define languages
let g:deoplete#sources = {'python': ['jedi']}

" Close preview after doing tab completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
