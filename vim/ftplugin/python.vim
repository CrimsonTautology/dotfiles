if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

if ($ART == "LOGIC")
    set tabstop=3
    set softtabstop=3
    set shiftwidth=3
    let g:syntastic_python_pycodestyle_post_args = '--ignore=E111,E114,E121,E501'
endif

let g:syntastic_python_checkers = ['pycodestyle']
"let g:syntastic_python_checkers = ['pylint']

compiler pylint
setlocal makeprg +=\ %
