
if has("gui_running")
	"GUI only settings
	"MSWin settings
	"source $VIMRUNTIME/mswin.vim
    "My Custom MSWin settings
    source $HOME/.vim/mswin_custom.vim

	"Some corrections to behave mswin
	set selectmode=
	set selection=inclusive

	"guioptions
	"set guioptions+=h "Horizontal scrollbar
	"set guioptions-=mTtrL
    set guioptions=egm
	"set guioptions+=c

	"disable menu alt keys
	set winaltkeys=no


	"Font"
	"set guifont="Inconsolata Medium 12"
	set guifont=Consolas:h12:cANSI
	
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

	set scrolloff=0 


	set cursorline

    "unicode
    set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ 

endif
