" vim:foldmethod=marker:foldlevel=0
set nocompatible    " be iMproved

" In case I'm on windows use correct runtimepath
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" Vundle {{{

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
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
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise', {'name': 'endwise'}
Plugin 'tpope/vim-fugitive', {'name': 'fugitive'}
Plugin 'tpope/vim-markdown', {'name': 'markdown'}
Plugin 'tpope/vim-repeat', {'name': 'repeat'}
Plugin 'tpope/vim-surround', {'name': 'surround'}
Plugin 'tpope/vim-unimpaired', {'name': 'unimpaired'}
Plugin 'alvan/vim-closetag', {'name': 'closetag'}
"Plugin 'Shougo/neocomplcache'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'

Plugin 'vim-ruby/vim-ruby', {'name': 'ruby'}
Plugin 'tpope/vim-rails', {'name': 'rails'}
Plugin 'withgod/vim-sourcepawn', {'name': 'sourcepawn'}
Plugin 'digitaltoad/vim-pug', {'name': 'pug'}
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript', {'name':  'javascript'}


call vundle#end()
filetype plugin indent on

" }}}
" Colors/Syntax Highlighting {{{

set bg=dark
syntax on
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
colorscheme solarized

" }}}
" Status Line {{{

set showcmd          " Display incomplete commands.
set laststatus=2
set showmode         " Show the current mode

set statusline=""
set statusline+=%f   " Tail of filename
set statusline+=%m   " Modified flag
set statusline+=\ %y " filetype
set statusline+=\ %r " read only flag
set statusline+=\ %h " help file flag
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=   " left/right separator
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n

" }}}
" Spaces/Tabs {{{

set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" }}}
" UI/Editor Settings {{{

set number
set ruler
set nowrap       " No wordwrap
set showmatch    " Show matching parentheses
set noerrorbells " Damn the bell
set hlsearch     " Highlight search
set ignorecase
set smartcase
set splitbelow   " Split window below current one with :sp
set splitright   " Split new window to the right with :vs
set history=100
set wildmenu     " Command line completion
set backspace=2  " Allow backspacing over indent, eol, and the start of an insert
set scrolloff=8  " Keep 8 lines below and above the cursor

" }}}
" Default Syntax {{{
filetype on
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete

" }}}
" Other Vim Settings {{{

set autochdir
set directory+=,~/tmp,$TMP

" Tell vim to remember certain things when we exit
"  '100  :  marks will be remembered for up to 10 previously edited files
"  "100  :  will save up to 100 lines for each register
"  :20   :  up to 20 lines of command-line history will be remembered
"  %     :  saves and restores the buffer list
"  n...  :  where to save the viminfo files
set viminfo='100,\"100,:20,%,n~/.viminfo

" Enable Unicode
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    scriptencoding utf-8
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "setglobal bomb
    set fileencodings=ucs-bom,utf-8,latin1
endif
" }}}
" Key Re-Maps {{{

" Normal Mode have space alternate folds
nnoremap <space> za

" Windowsplit jumper
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Correctly map shift y to yank to end of line
nnoremap Y y$

" Make shift h and l easy begining and end of line
noremap H ^
noremap L $

" Easy Visual Mode tabbing; using < or > does not clear selection
vnoremap > >gv
vnoremap < <gv

" Quick macro to the q registry, use Q to play back
nnoremap Q @q

"-----------------------------------------------------------------------------
" Leader Commands
let mapleader = ","

" Super cool auto timestamp and comment
nnoremap <leader>da yypf.l<c-a>WdE"=strftime("%m/%d/%y")<CR>PWcewms<esc>WC

nnoremap <silent> <leader>ve :e $HOME/.vim/vimrc<CR>
nnoremap <silent> <leader>vo :e! $HOME/.vim/vimrc<CR>
nnoremap <silent> <leader>vs :so $HOME/.vim/vimrc<CR>

" 'cd' to the directory containing the file in the buffer
nnoremap <silent> <leader>cd :lcd %:h<CR>

"CK log
nnoremap <silent> <leader>ck o-<TAB><ESC>"=strftime("%m/%d/%y")<CR>pA<TAB>

"-----------------------------------------------------------------------------
" Function Keys

" Run source
nnoremap <silent> <F5> :w<cr>:make<cr>

" }}}
" Auto Commands {{{

" Automatically restore cursor position
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

function! ResCur()
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
autocmd QuickFixCmdPost [^l]* nested botright cwindow
autocmd QuickFixCmdPost    l* nested botright lwindow

" }}}
" NERDTree {{{

nnoremap <silent> <leader>nt :NERDTreeToggle<cr>
amenu Plugin.NERDTree :NERDTreeToggle <cr>

let NERDTreeShowBookmarks = 1
let NERDTreeChDirMode     = 1
let NERDTreeDirArrows     = 1

let NERDTreeIgnore=['\.hi$', '\.o$', '\.sw.$', '\~$', '\.smx$', '\.exe$', '\.beam$', '\~$']

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" }}}
" Tagbar {{{

nnoremap <silent> <leader>tb :TagbarToggle<cr>
amenu Plugin.Tagbar :TagbarToggle <cr>

" }}}
" Syntastic {{{

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" }}}
" Auto-Pairs {{{
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

" }}}
"Custom Overrides {{{

if ($AUCTION == "SOUTHERN")
    source ~/.southern.vim
endif

" }}}
