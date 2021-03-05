if exists("current_compiler") | finish | endif
let current_compiler = "spcomp"

if exists(":CompilerSet") != 2    " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

" classic spcomp
"CompilerSet makeprg=spcomp\ %
"CompilerSet errorformat=%f\(%l\)\ :\ fatal\ %t%*[^0-9]%n:\ %m,%f\(%l\)\ :\ %t%*[^0-9]%n:\ %m

" spcomp called by a Makefile at the root project directory
CompilerSet makeprg=make\ -C`git\ rev-parse\ --show-toplevel`\ SRCDS=$SRCDS_DEV_DIR
CompilerSet errorformat=%f\(%l\)\ :\ fatal\ %t%*[^0-9]%n:\ %m,%f\(%l\)\ :\ %t%*[^0-9]%n:\ %m
CompilerSet errorformat+=\%D%*\\a[%*\\d]:\ Entering\ directory\ `%f'
CompilerSet errorformat+=\%D%*\\a[%*\\d]:\ Entering\ directory\ '%f'
CompilerSet errorformat+=\%D%*\\a:\ Entering\ directory\ `%f'
CompilerSet errorformat+=\%D%*\\a:\ Entering\ directory\ '%f'

let &cpo = s:cpo_save
unlet s:cpo_save
