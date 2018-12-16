if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

if ($ART == "LOGIC")
    set tabstop=3
    set softtabstop=3
    set shiftwidth=3
    let g:syntastic_python_pycodestyle_post_args = '--ignore=E111,E114,E121,E501'
    "let g:syntastic_python_pylint_post_args = '--disable=R,C'
endif

let g:syntastic_python_checkers = ['pycodestyle']
"let g:syntastic_python_checkers = ['pylint']

compiler pylint
setlocal makeprg +=\ --disable=R,C\ %

nnoremap <silent> <leader>pdb Iimport pdb; pdb.set_trace()#TODO<cr><esc>
nnoremap <silent> <leader>ppt Ifrom pprint import pprint; pprint(vars(var_here))#TODO<cr><esc>
nnoremap <silent> <leader>ipy Iimport IPython; IPython.start_ipython(argv=[])#TODO<cr><esc>
