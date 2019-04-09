" --------
" settings
" --------
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

" ---
" ale
" ---
let b:ale_linters = []
let b:ale_fixers = ['isort', 'black']
