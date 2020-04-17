let g:python_recommended_style = 0
let g:syntastic_python_checkers = ['pycodestyle', 'pylint']

compiler pylint
setlocal makeprg +=\ --disable=R,C\ %

nnoremap <silent> <leader>pdb Iimport pdb; pdb.set_trace()#TODO<cr><esc>
nnoremap <silent> <leader>ppt Ifrom pprint import pprint; pprint(vars(var_here))#TODO<cr><esc>
nnoremap <silent> <leader>ipy Iimport IPython; IPython.start_ipython(argv=[])#TODO<cr><esc>
