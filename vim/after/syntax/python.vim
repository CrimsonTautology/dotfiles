" highlight pythonDocstring as Comment
syn region pythonDocString
      \ start=+^\s*[uU]\?"""+ end=+"""+
      \ contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
      \ keepend excludenl fold
syn region pythonDocString
      \ start=+^\s*[uU]\?'''+ end=+'''+
      \ contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
      \ keepend excludenl fold

hi! link pythonDocString Comment
