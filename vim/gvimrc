
if has("gui_running")
	"GUI only settings
	"MSWin settings
	source $VIMRUNTIME/mswin.vim

	"Some corrections to behave mswin
	set selectmode=
	set selection=inclusive

	"guioptions
	set guioptions+=bh "Horizontal scrollbar
	set guioptions-=T
	"set guioptions+=c

	"disable menu alt keys
	set winaltkeys=no


	"Font"
	set guifont="Inconsolata Medium 12"
	
	"Syntax highlighting and color scheme"
	syntax on
	let g:solarized_termtrans = 0
	let g:solarized_termcolors = 256
	colorscheme solarized
	set background=light

	"Memorize window size
	set sessionoptions+=resize,winpos

	"set lines=42 columns =112
	
	"Proper tab stop
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4

	set scrolloff=0  " Keep 8 lines below and above the cursor
endif
