setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

compiler pylint
setlocal makeprg +=\ --disable=R,C\ %

nnoremap <silent> <leader>pdb Ibreakpoint()#TODO<cr><esc>
nnoremap <silent> <leader>ipdb Ifrom IPython import embed; embed()#TODO<cr><esc>

" semicolon isn't used (usually); replace ctrl+; map with regular colon so I
" don't have to hold shift
inoremap <silent> <c-;> <c-o>$:<cr>

" map ctrl+- to quickly add a function anotation arrow
inoremap <silent> <c-_> <c-o>$ -> :<c-o>i

" syntastic
let g:syntastic_python_checkers = ['flake8']

" black
let g:black_linelength = 79

" python-syntax
let g:python_version_2 = 0
let b:python_version_2 = 0
let g:python_highlight_all = 1
let g:python_highlight_file_headers_as_comments	= 0
let g:python_highlight_space_errors = 0
let g:python_slow_sync = 1
