" GUI only settings
if has("gui_running")

  " my Custom MSWin settings
  source $HOME/.vim/mswin_custom.vim

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
    let g:solarized_menu=0
    colorscheme solarized
  catch
  endtry

  " memorize window size
  set sessionoptions+=resize,winpos

  " editor settings
  set scrolloff=0

endif
