" modified from https://github.com/Glench/Vim-Jinja2-Syntax

" Figure out which type of hilighting to use for html.
fun! s:SelectHTML()
  let n = 1
  while n < 50 && n <= line('$')
    " check for jinja
    if getline(n) =~# '{{.*}}\|{%-\?\s*\(end.*\|extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      set filetype=jinja.html
      return
    endif
    let n = n + 1
  endwhile
endfun

augroup jinja_custom
  autocmd!
  autocmd BufNewFile,BufRead *.html,*.htm call s:SelectHTML()
  autocmd BufNewFile,BufRead *.jinja,*.jinja2,*.j2 set filetype=jinja
augroup END
