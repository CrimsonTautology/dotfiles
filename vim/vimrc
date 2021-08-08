" vim:foldmethod=marker:foldlevel=0
set nocompatible

" Windows {{{

if has('win32') || has('win64')
  " on windows add $HOME/.vim and runtimepath
  set runtimepath=$HOME/.vim,$VIMRUNTIME,$HOME/.vim/after
  set encoding=utf-8
endif

" }}}
" Vundle {{{

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"
" Brief help
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginUpdate
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginList       - lists configured plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

Plugin 'jiangmiao/auto-pairs', {'name': 'autopairs'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise', {'name': 'endwise'}
Plugin 'tpope/vim-fugitive', {'name': 'fugitive'}
Plugin 'tpope/vim-markdown', {'name': 'markdown'}
Plugin 'tpope/vim-repeat', {'name': 'repeat'}
Plugin 'tpope/vim-surround', {'name': 'surround'}
Plugin 'tpope/vim-unimpaired', {'name': 'unimpaired'}
Plugin 'alvan/vim-closetag', {'name': 'closetag'}
Plugin 'preservim/tagbar'
Plugin 'chrisbra/Colorizer.git'

Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript', {'name':  'javascript'}
Plugin 'leafgarland/typescript-vim', {'name': 'typescript'}
Plugin 'vim-python/python-syntax', {'name': 'python'}
Plugin 'psf/black'
Plugin 'Vimjas/vim-python-pep8-indent', {'name': 'pep8indent'}
Plugin 'davidhalter/jedi-vim', {'name': 'jedi'}


call vundle#end()
filetype plugin indent on

" }}}
" VIM Editor Settings {{{

set number
set nowrap       " no wordwrap
set showmatch    " show matching parentheses
set noerrorbells " damn the bell

set hlsearch     " highlight search
set ignorecase
set smartcase

set splitbelow   " split window below current one with :sp
set splitright   " split new window to the right with :vs
set history=100
set wildmenu     " command line completion
set backspace=2  " allow backspacing over indent, eol, and the start of an insert
set scrolloff=8  " keep 8 lines below and above the cursor

set cursorline
set colorcolumn=80,100  " add marker on column 80 and 100

set title

" syntax configuration
syntax on
filetype on
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete

" indentation settings
set autoindent
set nosmartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" colorscheme
set background=dark
colorscheme solarized

" square cursor in mintty
let &t_EI.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_te.="\e[0 q"
let &t_ti.="\e[1 q"

" enable mouse in mintty
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

" automatically set working directory to current file
set autochdir

" prevent vim from generating swap and backup files in working directory
set directory=$HOME/.vim/swapfiles//
set backupcopy=yes


" tell vim to remember certain things when we exit
"  '100  marks will be remembered for up to 10 previously edited files
"  "100  will save up to 100 lines for each register
"  :20   up to 20 lines of command-line history will be remembered
"  %     saves and restores the buffer list
"  n...  where to save the viminfo files
set viminfo='100,\"100,:20,%,n~/.viminfo

" recursivly go up until home directory to find a tags file
set tags^=tags;~,.git/tags;~

" }}}
" Custom Statusline {{{

set showcmd          " display incomplete commands.
set laststatus=2
set showmode         " show the current mode

set statusline=""
set statusline+=%f   " tail of filename
set statusline+=%m   " modified flag '[+]'
set statusline+=\ %y " filetype
set statusline+=\ %r " read only flag '[RO]'
set statusline+=\ %h " help file flag
set statusline+=\ %{fugitive#statusline()}
set statusline+=%=   " left/right separator
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ %4l/%L:C%-2c%4p%%     "78/274:C50 28%

" }}}
" Key Re-Maps {{{

" in normal mode have space alternate folds
nnoremap <space> za

" windowsplit jumper;  use ctrl+jkhl to jump between window splits instead of
" ctrl+w jkhl
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" map shift+y to yank to end of line to match shift+c and shift+d
nnoremap Y y$

" map shift+h and shift+l jump to begining and end of line
noremap H ^
noremap L $

" in visual mode < and > shifts indentation and does not clear selection
vnoremap > >gv
vnoremap < <gv

" quick macro to the q registry, use shift+q to play back
nnoremap Q @q

" in insert mode ctrl+j inserts a new line at the end of the current line and
" goes to the next line;  this allows you to jump to the next line while in
" the middle of text.
" ctrl+; and ctrl+, does the same but also adds a semicolon and comma
inoremap <c-j> <c-o>$<cr>
inoremap <c-;> <c-o>$;<cr>
inoremap <c-,> <c-o>$,<cr>

"------------------------------------------------------------------------------
" Leader Commands
"------------------------------------------------------------------------------

let mapleader = ","

" shortcuts to open and load vimrc
nnoremap <silent> <leader>ve :e $HOME/.vim/vimrc<CR>
nnoremap <silent> <leader>vo :e! $HOME/.vim/vimrc<CR>
nnoremap <silent> <leader>vs :so $HOME/.vim/vimrc<CR>

" 'cd' to the directory containing the file in the buffer
nnoremap <silent> <leader>cd :lcd %:h<CR>

" dump current date after current line, good for appending to log files
nnoremap <silent> <leader>da o<c-r>=strftime("%m/%d/%Y")<CR>
nnoremap <silent> <leader>dt o<c-r>=strftime("%m/%d/%Y %r")<CR>
nnoremap <silent> <leader>di o<c-r>=strftime("%F")<CR>

"------------------------------------------------------------------------------
" Function Keys
"------------------------------------------------------------------------------

" F5 calls make
nnoremap <silent> <F5> :w<cr>:make<cr>

" }}}
" Auto Commands {{{

" automatically restore cursor position
augroup restore_cursor
  autocmd!
  autocmd BufWinEnter * call RestoreCursor()
augroup END

function! RestoreCursor()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty. 
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers. 
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen. 
augroup auto_load_quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* nested botright cwindow
  autocmd QuickFixCmdPost    l* nested botright lwindow
augroup END

" }}}
" NERDTree {{{

nnoremap <silent> <leader>nt :NERDTreeToggle<cr>

let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=1
let NERDTreeDirArrows=1

let NERDTreeIgnore=[ '\.hi$', '\.o$', '\.sw.$', '\~$', '\.smx$', '\.exe$', '\.beam$', '\~$' ]

let g:NERDTreeDirArrowExpandable="\U25B6"
let g:NERDTreeDirArrowCollapsible="\U25BC"

" }}}
" Tagbar {{{

nnoremap <silent> <leader>tb :TagbarToggle<cr>

" }}}
" Syntastic {{{

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" }}}
