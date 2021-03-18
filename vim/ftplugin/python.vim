let g:python_recommended_style = 0
"let g:syntastic_python_checkers = ['pycodestyle', 'pylint']
let g:syntastic_python_checkers = ['pycodestyle']

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

compiler pylint
setlocal makeprg +=\ --disable=R,C\ %

nnoremap <silent> <leader>pdb Iimport pdb; pdb.set_trace()#TODO<cr><esc>
nnoremap <silent> <leader>ppt Ifrom pprint import pprint; pprint(vars(var_here))#TODO<cr><esc>
nnoremap <silent> <leader>ipy Iimport IPython; IPython.start_ipython(argv=[])#TODO<cr><esc>

" semicolon isn't used (usually); replace with regular colon so I don't have
" to hold shift
inoremap <silent> <c-;> <c-o>$:<cr>
