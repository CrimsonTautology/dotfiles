" highlight pythonDocstring as Comment
syn region pythonDocString start=+^\s*[uU]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError fold
syn region pythonDocString start=+^\s*[uU]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError fold

hi! link pythonDocString Comment
