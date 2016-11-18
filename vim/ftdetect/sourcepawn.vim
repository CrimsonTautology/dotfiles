" SourcePawn
autocmd BufNewFile,BufRead *.sp set filetype=sourcepawn
autocmd BufNewFile,BufRead *.inc set filetype=sourcepawn

au FileType sourcepawn compiler sourcepawn
