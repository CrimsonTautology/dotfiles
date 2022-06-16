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


" highlight match/case statements
" https://github.com/vim-python/python-syntax/pull/91
syn keyword pythonMatch match case
syn cluster pythonExpression contains=pythonStatement,pythonRepeat,pythonConditional,pythonMatch,pythonOperator,pythonNumber,pythonHexNumber,pythonOctNumber,pythonBinNumber,pythonFloat,pythonString,pythonFString,pythonRawString,pythonRawFString,pythonBytes,pythonBoolean,pythonNone,pythonSingleton,pythonBuiltinObj,pythonBuiltinFunc,pythonBuiltinType,pythonClassVar
hi! link pythonMatch Conditional
