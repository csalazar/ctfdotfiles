" --------
" settings
" --------
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

let g:python_highlight_all = 1

" ---
" ale
" ---
let b:ale_linters = ["pylint", "mypy"]
let b:ale_fixers = ["isort", "black"]
