setlocal wrap 
setlocal linebreak
setlocal nonumber

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
