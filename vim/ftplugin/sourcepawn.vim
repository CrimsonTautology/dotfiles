setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal makeprg=make\ -C`git\ rev-parse\ --show-toplevel`

setlocal errorformat+=\%D%*\\a[%*\\d]:\ Entering\ directory\ `%f'
setlocal errorformat+=\%D%*\\a[%*\\d]:\ Entering\ directory\ '%f'
setlocal errorformat+=\%D%*\\a:\ Entering\ directory\ `%f'
setlocal errorformat+=\%D%*\\a:\ Entering\ directory\ '%f'
