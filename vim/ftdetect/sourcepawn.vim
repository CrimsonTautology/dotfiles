" SourcePawn

augroup sourcepawn_custom
  autocmd!
  autocmd BufNewFile,BufRead *.sp set filetype=sourcepawn
  autocmd BufNewFile,BufRead *.inc set filetype=sourcepawn
  autocmd FileType sourcepawn compiler spcomp
augroup END
