if ($ART == "LOGIC")
    set tabstop=3
    set softtabstop=3
    set shiftwidth=3
endif

setlocal omnifunc=javascriptcomplete#CompleteJS

let g:syntastic_javascript_checkers = ['eslint']
