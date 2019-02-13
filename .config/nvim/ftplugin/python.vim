" --------
" settings
" --------
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

" no docstring popup at completion
autocmd FileType python setlocal completeopt-=preview

" --------
" jedi-vim
" --------
let g:jedi#completions_enabled = 0

let g:jedi#goto_command = "gd"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" ---
" ale
" ---
let b:ale_linters = ['flake8']
let b:ale_fixers = ['isort', 'black']
