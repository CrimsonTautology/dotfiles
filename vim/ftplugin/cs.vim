if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

setlocal errorformat=\ %#%f(%l\\\,%c):\ %m
setlocal makeprg=dotnet\ build\ /property:GenerateFullPaths=true
nnoremap <silent> <F6> :w<cr>:!dotnet run<cr>
