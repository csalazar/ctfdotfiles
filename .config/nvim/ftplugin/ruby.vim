" ---
" ale
" ---
let b:ale_fixers = ['rufo']


" --------------
" LanguageClient
" --------------
if executable('solargraph')
  let g:LanguageClient_serverCommands.ruby = ['solargraph', 'stdio']
endif

autocmd FileType ruby call ConfigureLanguageClient()
