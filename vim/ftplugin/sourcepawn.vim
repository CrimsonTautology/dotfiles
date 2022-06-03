setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

" F4 calls make test-install
nnoremap <silent> <F4> :w<cr>:make clean test-install<cr>
