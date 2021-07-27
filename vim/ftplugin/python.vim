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
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--extend-ignore=E203,E501,W503'

" black
let g:black_linelength = 99

" run Black on save
"autocmd BufWritePre <buffer> call ExecuteBlack()
"function ExecuteBlack()
"  if exists('g:load_black')
"    execute ':Black'
"  endif
"endfunction
