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



" - Partially stolen from:
" Vim filetype plugin file
" Language:	python
" Maintainer:	Tom Picton <tom@tompicton.co.uk>
" Previous Maintainer: James Sully <sullyj3@gmail.com>
" Previous Maintainer: Johannes Zellner <johannes@zellner.org>
" Last Change:	Sun, 15 April 2018
" https://github.com/tpict/vim-ftplugin-python
let s:keepcpo= &cpo
set cpo&vim

setlocal cinkeys-=0#
setlocal indentkeys-=0#
setlocal include=^\\s*\\(from\\\|import\\)

" For imports with leading .., append / and replace additional .s with ../
let b:grandparent_match = '^\(.\.\)\(\.*\)'
let b:grandparent_sub = '\=submatch(1)."/".repeat("../",strlen(submatch(2)))'

" For imports with a single leading ., replace it with ./
let b:parent_match = '^\.\(\.\)\@!'
let b:parent_sub = './'

" Replace any . sandwiched between word characters with /
let b:child_match = '\(\w\)\.\(\w\)'
let b:child_sub = '\1/\2'

setlocal includeexpr=substitute(substitute(substitute(
      \v:fname,
      \b:grandparent_match,b:grandparent_sub,''),
      \b:parent_match,b:parent_sub,''),
      \b:child_match,b:child_sub,'g')

setlocal suffixesadd=.py
setlocal comments=b:#,fb:-
setlocal commentstring=#\ %s

setlocal omnifunc=pythoncomplete#Complete
if has('python3')
       setlocal omnifunc=python3complete#Complete
endif

set wildignore+=*.pyc

let b:next_toplevel='\v%$\|^(class\|def\|async def)>'
let b:prev_toplevel='\v^(class\|def\|async def)>'
let b:next_endtoplevel='\v%$\|\S.*\n+(def\|class)'
let b:prev_endtoplevel='\v\S.*\n+(def\|class)'
let b:next='\v%$\|^\s*(class\|def\|async def)>'
let b:prev='\v^\s*(class\|def\|async def)>'
let b:next_end='\v\S\n*(%$\|^(\s*\n*)*(class\|def\|async def)\|^\S)'
let b:prev_end='\v\S\n*(^(\s*\n*)*(class\|def\|async def)\|^\S)'

execute "nnoremap <silent> <buffer> ]] :call <SID>Python_jump('n', '". b:next_toplevel."', 'W', v:count1)<cr>"
execute "nnoremap <silent> <buffer> [[ :call <SID>Python_jump('n', '". b:prev_toplevel."', 'Wb', v:count1)<cr>"
execute "nnoremap <silent> <buffer> ][ :call <SID>Python_jump('n', '". b:next_endtoplevel."', 'W', 0, v:count1)<cr>"
execute "nnoremap <silent> <buffer> [] :call <SID>Python_jump('n', '". b:prev_endtoplevel."', 'Wb', 0, v:count1)<cr>"
execute "nnoremap <silent> <buffer> ]m :call <SID>Python_jump('n', '". b:next."', 'W', v:count1)<cr>"
execute "nnoremap <silent> <buffer> [m :call <SID>Python_jump('n', '". b:prev."', 'Wb', v:count1)<cr>"
execute "nnoremap <silent> <buffer> ]M :call <SID>Python_jump('n', '". b:next_end."', 'W', 0, v:count1)<cr>"
execute "nnoremap <silent> <buffer> [M :call <SID>Python_jump('n', '". b:prev_end."', 'Wb', 0, v:count1)<cr>"

execute "onoremap <silent> <buffer> ]] :call <SID>Python_jump('o', '". b:next_toplevel."', 'W', v:count1)<cr>"
execute "onoremap <silent> <buffer> [[ :call <SID>Python_jump('o', '". b:prev_toplevel."', 'Wb', v:count1)<cr>"
execute "onoremap <silent> <buffer> ][ :call <SID>Python_jump('o', '". b:next_endtoplevel."', 'W', 0, v:count1)<cr>"
execute "onoremap <silent> <buffer> [] :call <SID>Python_jump('o', '". b:prev_endtoplevel."', 'Wb', 0, v:count1)<cr>"
execute "onoremap <silent> <buffer> ]m :call <SID>Python_jump('o', '". b:next."', 'W', v:count1)<cr>"
execute "onoremap <silent> <buffer> [m :call <SID>Python_jump('o', '". b:prev."', 'Wb', v:count1)<cr>"
execute "onoremap <silent> <buffer> ]M :call <SID>Python_jump('o', '". b:next_end."', 'W', 0, v:count1)<cr>"
execute "onoremap <silent> <buffer> [M :call <SID>Python_jump('o', '". b:prev_end."', 'Wb', 0, v:count1)<cr>"

execute "xnoremap <silent> <buffer> ]] :call <SID>Python_jump('x', '". b:next_toplevel."', 'W', v:count1)<cr>"
execute "xnoremap <silent> <buffer> [[ :call <SID>Python_jump('x', '". b:prev_toplevel."', 'Wb', v:count1)<cr>"
execute "xnoremap <silent> <buffer> ][ :call <SID>Python_jump('x', '". b:next_endtoplevel."', 'W', 0, v:count1)<cr>"
execute "xnoremap <silent> <buffer> [] :call <SID>Python_jump('x', '". b:prev_endtoplevel."', 'Wb', 0, v:count1)<cr>"
execute "xnoremap <silent> <buffer> ]m :call <SID>Python_jump('x', '". b:next."', 'W', v:count1)<cr>"
execute "xnoremap <silent> <buffer> [m :call <SID>Python_jump('x', '". b:prev."', 'Wb', v:count1)<cr>"
execute "xnoremap <silent> <buffer> ]M :call <SID>Python_jump('x', '". b:next_end."', 'W', 0, v:count1)<cr>"
execute "xnoremap <silent> <buffer> [M :call <SID>Python_jump('x', '". b:prev_end."', 'Wb', 0, v:count1)<cr>"

if !exists('*<SID>Python_jump')
  fun! <SID>Python_jump(mode, motion, flags, count, ...) range
      let l:startofline = (a:0 >= 1) ? a:1 : 1

      if a:mode == 'x'
          normal! gv
      endif

      if l:startofline == 1
          normal! 0
      endif

      let cnt = a:count
      mark '
      while cnt > 0
          call search(a:motion, a:flags)
          let cnt = cnt - 1
      endwhile

      if l:startofline == 1
          normal! ^
      endif
  endfun
endif

let &cpo = s:keepcpo
unlet s:keepcpo
