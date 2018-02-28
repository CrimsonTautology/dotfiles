if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

if ($ART == "LOGIC")
    set tabstop=3
    set softtabstop=3
    set shiftwidth=3
endif

let g:syntastic_python_checkers = ['pylint', 'pycodestyle']
let g:syntastic_python_pycodestyle_post_args = '--ignore=E111,E114,E501'
