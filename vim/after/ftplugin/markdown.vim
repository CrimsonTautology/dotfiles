if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

setlocal wrap 
setlocal linebreak
setlocal nonumber
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj

