if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	" SourcePawn
	au BufNewFile,BufRead *.sp,*.inc		setf sourcepawn

	"TF2/L4D/Source syntax
	autocmd BufNewFile,BufRead *cfg/*.cfg	setf tf2
augroup END

