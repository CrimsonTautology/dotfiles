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

Plugin 'Shougo/neocomplcache'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-endwise', {'name': 'endwise'}
Plugin 'tpope/vim-fugitive', {'name': 'fugitive'}
Plugin 'tpope/vim-markdown', {'name': 'markdown'}
Plugin 'tpope/vim-rails', {'name': 'rails'}
Plugin 'tpope/vim-repeat', {'name': 'repeat'}
Plugin 'tpope/vim-surround', {'name': 'surround'}
Plugin 'tpope/vim-unimpaired', {'name': 'unimpaired'}
"Plugin 'vim-ruby/vim-ruby', {'name': 'ruby'}
Plugin 'withgod/vim-sourcepawn', {'name': 'sourcepawn'}
Plugin 'scrooloose/syntastic'
Plugin 'alvan/vim-closetag', {'name': 'closetag'}
Plugin 'digitaltoad/vim-jade', {'name': 'jade'}
Plugin 'othree/html5.vim'
Plugin 'kchmck/vim-coffee-script', {'name': 'coffeescript'}
Plugin 'othree/yajs.vim'
Plugin 'gavocanov/vim-js-indent', {'name': 'jsindent'}
Plugin 'leafgarland/typescript-vim', {'name': 'typescript'}
Plugin 'moll/vim-node', {'name': 'node'}

call vundle#end()
filetype plugin indent on
" }}}

runtime macros/matchit.vim

"-----------------------------------------------------------------------------
""Global Vim settings
""-----------------------------------------------------------------------------

"Syntax highlighting and color scheme
set bg=dark
syntax on
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
colorscheme solarized

"Set the status line
set showcmd          "Display incomplete commands.
set laststatus=2
set showmode         "Show the current mode

set statusline=""
set statusline+=%f   "Tail of filename
set statusline+=%m   "Modified flag
set statusline+=\ %y "filetype
set statusline+=\ %r "read only flag
set statusline+=\ %h "help file flag
set statusline+=%=   "left/right separator
set statusline+=\ %{fugitive#statusline()}
"set statusline+=\ %{tagbar#currenttag('[%s]','')}
set statusline+=\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n

"Other Settings
set number
set ruler
set nowrap       "No wordwrap
set showmatch    "Show matching parentheses
set noerrorbells "Damn the bell
set hlsearch     "Highlight search
set ignorecase
set smartcase
set splitbelow   "Split window below current one with :sp
set splitright   "Split new window to the right with :vs
set nocompatible "Dont' be vi compatible
set history=100
set wildmenu     "Command line completion
set backspace=2  "Allow backspacing over indent, eol, and the start of an insert
set scrolloff=8  "Keep 8 lines below and above the cursor

"Tabbing
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"Auto switch directory
set autochdir
set directory+=,~/tmp,$TMP

"Enable file type
filetype on
filetype plugin on
filetype indent on

set ofu=syntaxcomplete#Complete

" Tell vim to remember certain things when we exit
"  '100  :  marks will be remembered for up to 10 previously edited files
"  "100  :  will save up to 100 lines for each register
"  :20   :  up to 20 lines of command-line history will be remembered
"  %     :  saves and restores the buffer list
"  n...  :  where to save the viminfo files
set viminfo='100,\"100,:20,%,n~/.viminfo

"Set the tags files to be the following
set tags+=../tags

"Unicode
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

"-----------------------------------------------------------------------------
""Key maps
""-----------------------------------------------------------------------------
"Windowsplit jumper
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Correctly map shift y to yank to end of line
nmap Y y$

"Make shift h and l easy begining and end of line"
map H ^
map L $

"Quick macro to the q registry, use Q to play back
nnoremap Q @q

"Remap keys to alt that have been lost by mswin
noremap <M-v>       <C-V>
noremap <M-a>       <C-a>
noremap <M-x>       <C-x>
noremap <M-z>       <C-z>
noremap <M-s>       <C-s>

"-----------------------------------------------------------------------------
""Leader Maps
""-----------------------------------------------------------------------------
let mapleader = ","

"Super cool auto timestamp and comment
map <leader>da yypf.l<c-a>WdE"=strftime("%m/%d/%y")<CR>PWcewms<esc>WC

"Diff get and put
map <leader>dp :diffput<cr>]c
map <leader>dg :diffget<cr>]c

nmap <silent> <leader>ve :e $HOME/.vim/vimrc<CR>
nmap <silent> <leader>vo :e! $HOME/.vim/vimrc<CR>
nmap <silent> <leader>vs :so $HOME/.vim/vimrc<CR>

"cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

"CK log
nmap <silent> <leader>ck o-<TAB><ESC>"=strftime("%m/%d/%y")<CR>pA<TAB>

"Ribon log
nmap <silent> <leader>rib yyp^WdE"=strftime("%m/%d/%y")<CR>PWC

"-----------------------------------------------------------------------------
""Function Keys
""-----------------------------------------------------------------------------
"Run source
map <silent> <F5> :w<cr>:make<cr>

"-----------------------------------------------------------------------------
""Auto Commands
""-----------------------------------------------------------------------------
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

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

"-----------------------------------------------------------------------------
""Functions
""-----------------------------------------------------------------------------
"Restore cursor position
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

"-----------------------------------------------------------------------------
""NERDTree
""-----------------------------------------------------------------------------
nmap <silent> <leader>nt :NERDTreeToggle<cr>
amenu Plugin.NERDTree :NERDTreeToggle <cr>

let NERDTreeShowBookmarks = 1
let NERDTreeChDirMode     = 1
let NERDTreeDirArrows     = 1

let NERDTreeIgnore=['\.hi$', '\.o$', '\.sw.$', '\~$', '\.smx$', '\.exe$', '\.beam$', '\~$']

"-----------------------------------------------------------------------------
""Fugitive
""-----------------------------------------------------------------------------
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>gr :Gread<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gd :Gdiff<CR>

"-----------------------------------------------------------------------------
"""vim-rails
""-----------------------------------------------------------------------------
nmap <silent> <leader>ae :AE<CR>
nmap <silent> <leader>as :AS<CR>
nmap <silent> <leader>av :AV<CR>

nmap <silent> <leader>re :RE<CR>
nmap <silent> <leader>rs :RS<CR>
nmap <silent> <leader>rv :RV<CR>

nmap <silent> <leader>rp :RPreview<CR>

"-----------------------------------------------------------------------------
"NeoComplCache
""-----------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_max_list = 100
let g:neocomplcache_max_keyword_width = 50
let g:neocomplcache_max_filename_width = 15

let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 2

let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_min_syntax_length = 3

let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1

let g:neocomplcache_disable_auto_complete = 0

let g:neocomplcache_enable_wildcard = 1
let g:neocomplcache_enable_quick_match = 0
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_auto_delimiter = 0

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_enable_caching_message = 1

if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
endif
let g:neocomplcache_same_filetype_lists.html = 'css'
let g:neocomplcache_same_filetype_lists.xhtml = 'html'
let g:neocomplcache_same_filetype_lists.zsh = 'sh'

if !exists('g:neocomplcache_filetype_include_lists')
    let g:neocomplcache_filetype_include_lists= {}
endif
let g:neocomplcache_plugin_disable = { 'tags_complete': 1 }

if !exists('g:neocomplcache_plugin_rank')
    let g:neocomplcache_plugin_rank = {}
endif
let g:neocomplcache_plugin_rank.buffer_complete = 10 

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'


" Plugin key-mappings.
"inoremap <expr><CR> neocomplcache#close_popup() . "\<CR>"
"inoremap <expr><CR> pumbvisible() ? neocomplache#close_popup : "\<CR>"

imap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

inoremap <expr><C-n> pumvisible() ? "\<C-n>" : neocomplcache#manual_keyword_complete()
inoremap <expr><C-e> neocomplcache#cancel_popup()

nmap <silent> <leader>esnip :NeoComplCacheEditSnippets<CR>

let g:neocomplcache_snippets_dir = $VIM_DIR.'/snippets'

"-----------------------------------------------------------------------------
"Extra
""-----------------------------------------------------------------------------
if ($AUCTION == "SOUTHERN")
    source ~/.southern.vim
endif
