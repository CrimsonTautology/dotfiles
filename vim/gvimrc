" Settings for GVim
"
" Github: https://github.com/CrimsonTautology/dotvim
"
" vim:foldmethod=marker:foldlevel=0


" do not execute outside of gui
if !has("gui_running")
  finish
endif

" my Custom MSWin settings
source $DOTVIM/mswin_custom.vim

" some corrections to make mswin behave
set selectmode=
set selection=inclusive

" guioptions
set guioptions=!eg

" disable menu alt keys
set winaltkeys=no

" font
set guifont=Hack:h11:cANSI:qDRAFT

" colorscheme;  use light scheme for gvim
set background=light  "unimpaired: *yob*
try
  colorscheme solarized
catch
endtry

" memorize window size
set sessionoptions+=resize,winpos

" editor settings
set scrolloff=0
