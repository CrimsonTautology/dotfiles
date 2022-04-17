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

" syntastic
let g:syntastic_python_checkers = ['flake8', 'mypy']

" black
let g:black_linelength = 79

" python-syntax
let g:python_version_2 = 0
let b:python_version_2 = 0
let g:python_highlight_all = 1
let g:python_highlight_file_headers_as_comments	= 0
let g:python_slow_sync = 1
