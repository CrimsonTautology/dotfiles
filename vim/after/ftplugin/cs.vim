setlocal errorformat=\ %#%f(%l\\\,%c):\ %m
setlocal makeprg=dotnet\ build\ /property:GenerateFullPaths=true
nnoremap <silent> <F6> :w<cr>:!dotnet run<cr>
