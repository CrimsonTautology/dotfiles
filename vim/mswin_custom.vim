" Set options and add mapping such that Vim behaves a lot like MS-Windows
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Feb 09

" NOTE: I am maping the character created with Alt+a/x/z/s/v;  it doesn't seem
" to work if I just use VIM's mapping syntax for whatever reason
"
" <M-A> -> á
" <M-X> -> ø
" <M-Z> -> ú
" <M-S> -> ó
" <M-V> -> ö
" <M-Y> -> ù

" bail out if this isn't wanted (mrsvim.vim uses this).
if exists("g:skip_loading_mswin") && g:skip_loading_mswin
  finish
endif

" set the 'cpoptions' to its Vim default
let s:save_cpo = &cpoptions
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

if has("clipboard")
  " CTRL-X and SHIFT-Del are Cut
  " Use ALT-X instead
  vnoremap ø "+x
  vnoremap <S-Del> "+x

  " CTRL-C and CTRL-Insert are Copy
  " CTRL-C OK
  vnoremap <C-C> "+y
  vnoremap <C-Insert> "+y

  " CTRL-V and SHIFT-Insert are Paste
  " Use ALT-V instead
  map ö "+gP
  map <S-Insert> "+gP
  cmap ö  <C-R>+
  cmap <S-Insert> <C-R>+
endif

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

exe 'inoremap <script> ö <C-G>u' . paste#paste_cmd['i']
exe 'inoremap <script> <S-Insert> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> ö ' . paste#paste_cmd['v']
exe 'vnoremap <script> <S-Insert> ' . paste#paste_cmd['v']

" Use CTRL-S for saving, also in Insert mode
" Use ALT-S instead
noremap ó :update<CR>
vnoremap ó <C-C>:update<CR>
inoremap ó <C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
" Use ALT-Z instead
noremap ú u
inoremap ú <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
" Use ALT-Y instead
noremap ù <C-R>
inoremap ù <C-O><C-R>

if has("gui")
  " Alt-Space is System menu
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>

  " Alt-Enter maximizes/restores window
  let g:gui_maximize_restore_toggle = 0
  function! MaximizeRestoreToggle()
    " alternates between maximizing and restoring
    " TODO:  still have an issue where if window starts maximized you'll need
    " to do Alt-Enter twice.
    let g:gui_maximize_restore_toggle = !g:gui_maximize_restore_toggle
    if g:gui_maximize_restore_toggle
      simalt ~x
    else
      simalt ~R
    endif
  endfunction

  noremap <M-Enter> :call MaximizeRestoreToggle()<CR>
  inoremap <M-Enter> <C-O>:call MaximizeRestoreToggle()<CR>
  cnoremap <M-Enter> <C-C>:call MaximizeRestoreToggle()<CR>
endif

" CTRL-A is Select all
" Use ALT-A instead
noremap á gggH<C-O>G
cnoremap á <C-C>gggH<C-O>G
onoremap á <C-C>gggH<C-O>G
snoremap á <C-C>gggH<C-O>G
xnoremap á <C-C>ggVG

" restore 'cpoptions'
set cpo&
let &cpoptions = s:save_cpo
unlet s:save_cpo

" disable middle mouse button paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
