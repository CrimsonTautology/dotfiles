call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"-----------------------------------------------------------------------------
""Global Vim settings
""-----------------------------------------------------------------------------
set bg=dark
"colorscheme xterm16
set scrolloff=8  " Keep 8 lines below and above the cursor


"Syntax highlighting and color scheme"
syntax on
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
colorscheme solarized



"Set the status line
set showcmd      " Display incomplete commands.
set laststatus=2 
set showmode " Show the current mode

set statusline=""
set statusline+=%f	"Tail of filename"
set statusline+=%m	"Modified flag"
set statusline+=\ %y	"filetype"
set statusline+=\ %r	"read only flag"
set statusline+=\ %h	"help file flag"
set statusline+=%=	"left/right separator"
set statusline+=\ %{fugitive#statusline()}
"set statusline+=\ %{tagbar#currenttag('[%s]','')}
set statusline+=\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n

"other
"set cursorline
set number
set ruler
set nowrap       " no wordwrap
set showmatch    " Show matching parentheses
set noerrorbells " Damn the bell
set hlsearch     " Highlight search
set ignorecase
set smartcase
set splitbelow   " Split window below current one with :sp
set splitright   " Split new window to the right with :vs
set nocompatible " Dont' be vi compatible
set history=100
set wildmenu "command line completion
set backspace=2 " Allow backspacing over indent, eol, and the start of an insert

"Tabbing"
set autoindent
set smartindent
set noexpandtab

"Auto switch directory
set autochdir
set directory+=,~/tmp,$TMP
"autocmd BufEnter * lcd %:p:h

"Enable file type
filetype on
filetype plugin on
filetype indent on

set ofu=syntaxcomplete#Complete

" Tell vim to remember certain things when we exit
"  '100  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='100,\"100,:20,%,n~/.viminfo

set diffexpr=MyDiff()


"" Set the tags files to be the following
set tags+=../tags


"-----------------------------------------------------------------------------
""Abreviations
""-----------------------------------------------------------------------------
ab sss SCCSIDE: %W% %E% %U




"-----------------------------------------------------------------------------
""Key maps
""-----------------------------------------------------------------------------
"Windowsplit jumper"
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Easy esc (CTRL + Enter)"
inoremap <C-CR> <Esc>

"Correctly map shift y to yank to end of line"
nmap Y y$

"in insert mode, ctrl j/k are used to scroll the acp window
inoremap <c-j> <c-n>
inoremap <c-k> <c-p>

"Make shift h and l easy begining and end of line"
map H ^
map L $

"Easy visual mode tabbing, so using < or > does not clear selection"
vmap > >gv
vmap < <gv

"Quick macro to the q registry, use Q to play back
nnoremap Q @q

"I never use ' so just map it to " for quick registers
nnoremap ' "

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

"diff get and put
map <leader>dp :diffput<cr>]c
map <leader>dg :diffget<cr>]c

nmap <silent> <leader>ve :e $HOME/.vimrc<CR>
nmap <silent> <leader>vo :e! $HOME/.vimrc<CR>
nmap <silent> <leader>vs :so $HOME/.vimrc<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
"nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

"Run the file it's self
nmap <silent> <leader>rr :!%<cr>


" CK log
nmap <silent> <leader>ck yyp^WdE"=strftime("%m/%d/%y")<CR>PWC


" Quick coldfusion/html comments
nmap <silent> <leader>cc mpI<!--- <esc>A ---><esc>`p<cr>
nmap <silent> <leader>ch mpI<!-- <esc>A --><esc>`p<cr>

" Search the current file for what's currently in the search
" register and display matches
nmap <silent> <leader>gs
			\ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> <leader>gw
			\ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> <leader>gW
			\ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>


"-----------------------------------------------------------------------------
""Function Keys
""-----------------------------------------------------------------------------
"Run source
"map <silent> <f5> :!%<cr>
map <silent> <F5> :w<cr>:make<cr>



"Display Highlight group
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


"-----------------------------------------------------------------------------
""Auto Commands
""-----------------------------------------------------------------------------
"Restore cursor position
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

"Auto set any unknown file to .txt syntax                                       
au BufRead,BufNewFile *  setfiletype txt

"Auto fold visual basic
autocmd BufNewFile,BufRead *.vb setfiletype vb
autocmd BufNewFile,BufRead *.vb setlocal syntax=vb
autocmd BufNewFile,BufRead *.vb call NetFold()

"Load coldfusion dictionary
autocmd BufNewFile,BufRead *.cf  setlocal dictionary=$VIM\vimfiles\dict\CF.dict
autocmd BufNewFile,BufRead *.cfm  setlocal dictionary=$VIM\vimfiles\dict\CF.dict

" Java
autocmd FileType java compiler javac
autocmd FileType java setlocal makeprg=javac\ %
autocmd FileType java map <silent> <F11> :w<cr>:!java %:r<cr>

" C files
autocmd FileType c compiler gcc
autocmd FileType c setlocal makeprg=gcc\ %
autocmd FileType c map <silent> <F11> :w<cr>:!a.exe<cr>

" SourcePawn SourceMod
autocmd BufNewFile,BufRead *.sp,*.inc setfiletype filetype=sourcepawn
autocmd FileType sourcepawn compiler spcomp
autocmd FileType sourcepawn setlocal makeprg=spcomp\ %:p\ -w203\ -w204
autocmd FileType sourcepawn map <silent> <F11> :w<cr>:!moveToDev.py %:t:r.smx<cr>
autocmd FileType sourcepawn map <silent> <S-F11> :w<cr>:silent !startDevServer.py<cr>

"Python files:  Open current file through command line or have vim run it
"autocmd BufNewFile,BufRead *.py setlocal makeprg=python\ %:p 
"autocmd BufNewFile,BufRead *.py map <silent> <F11> :w<cr>:!python %<cr>
"autocmd BufNewFile,BufRead *.py map <silent> <S-F11> :w<cr>:pyfile %<cr>
autocmd FileType python setlocal makeprg=python\ % 
autocmd FileType python map <silent> <F11> :w<cr>:!python %<cr>
autocmd FileType python map <silent> <S-F11> :w<cr>:pyfile %<cr>

" HTML
autocmd BufNewFile,BufRead *.html map <silent> <F11> :w<cr>:!"C:\Program Files (x86)\Mozilla Firefox\firefox.exe" %<cr>

" Haskel
"autocmd FileType haskell setlocal makeprg=ghc\ % 
autocmd FileType haskell compiler ghc
"autocmd FileType haskell compiler ghc-mod

"if executable("switchToAndThen.exe")  "Check if my switchToAndThen program is in the path.  This will switch focus to an existing ghci instead of creating a new one
"autocmd FileType haskell map <silent> <F11> :w<cr>:!start switchToAndThen ghci "ghci %:p" ":r{enter}"<cr>
"else
autocmd FileType haskell map <silent> <F11> :w<cr>:!start ghci %:p<cr>
"endif

autocmd FileType haskell map <silent> <s-F11> :w<cr>:! %:t:r.exe<cr>
autocmd FileType haskell let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '`': '`', '«': '»'}

autocmd FileType haskell imap <silent> <m-.> ->
autocmd FileType haskell imap <silent> <m-.><m-.> =>
autocmd FileType haskell imap <silent> <m-,> <-

" Erlang
autocmd FileType erlang setlocal makeprg=erlc\ %
autocmd FileType erlang map <silent> <F11> :w<cr>:!start werl %<cr>
autocmd FileType erlang map <silent> <s-F11> :w<cr>:!start %:t:r.exe<cr>
autocmd FileType erlang imap <silent> <F10> ->
autocmd FileType erlang imap <silent> <F10><F10> =>

" F#  (fsharp)
autocmd FileType fsharp setlocal makeprg=fsc\ % 
autocmd FileType fsharp setlocal errorformat=\ %#%f(%l\\\,%c):\ %m
autocmd FileType fsharp map <silent> <F11> :w<cr>:!start fsi %:p<cr>
autocmd FileType fsharp map <silent> <s-F11> :w<cr>:!start %:t:r.exe<cr>
autocmd FileType fsharp let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '`': '`', '«': '»'}



"TF2/L4D/Source syntax
autocmd BufNewFile,BufRead *cfg/*.cfg set syntax=tf2


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

function! NetFold()
	set foldmethod=syntax
	syn region myFold start="#Region" end="#End Region" fold
	syn sync fromstart
	set foldcolumn=2
endfunction

function! NetUnFold()
	set foldmethod=manual
	set foldcolumn=0
	norm zE
endfunction

function! MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction




"-----------------------------------------------------------------------------
""Surround.vim
""-----------------------------------------------------------------------------
"autocmd FileType php let b:surround_45 = "<?php \r ?>" 
"let g:surround_{char2nr("d")} = "<div\1id: \r..*\r id=\"&\"\1>\r</div>"  
"let g:surround_{char2nr("c")} = "[\1\1\2=..*\2*\r]\r[/\1\1]"  

"test [url=google.com]word[/url]  [url* ]link ][/url] <div id="me" color="blue">text</div>
" more words to test in this test with [url=googleh*]code][/url=google] 



"-----------------------------------------------------------------------------
""NERDTree
""-----------------------------------------------------------------------------
nmap <silent> <leader>nt :NERDTreeToggle<cr>
amenu Plugin.NERDTree :NERDTreeToggle <cr>

let NERDTreeShowBookmarks = 1
let NERDTreeChDirMode     = 1
let NERDTreeDirArrows     = 0

let NERDTreeIgnore=['\.hi$', '\.o$', '\.sw.$', '\~$', '\.smx$', '\.exe$', '\.beam$', '\~$']

"-----------------------------------------------------------------------------
""Tagbar
""-----------------------------------------------------------------------------
nmap <silent> <leader>tb :TagbarToggle<cr>
amenu Plugin.Tagbar :TagbarToggle<cr>
let g:tagbar_expand = 1

let g:tagbar_type_sourcepawn = {
			\ 'ctagstype' : 'c++',
			\ 'kinds'     : [
			\ 'd:macros:1',
			\ 'p:prototypes:1',
			\ 'g:enums',
			\ 'e:enumerators',
			\ 't:typedefs',
			\ 'n:namespaces',
			\ 'c:classes',
			\ 's:structs',
			\ 'u:unions',
			\ 'f:functions',
			\ 'm:members',
			\ 'v:variables'
			\ ],
			\ 'sro'        : '::',
			\ 'kind2scope' : {
			\ 'g' : 'enum',
			\ 'n' : 'namespace',
			\ 'c' : 'class',
			\ 's' : 'struct',
			\ 'u' : 'union'
			\ },
			\ 'scope2kind' : {
			\ 'enum'      : 'g',
			\ 'namespace' : 'n',
			\ 'class'     : 'c',
			\ 'struct'    : 's',
			\ 'union'     : 'u'
			\ }
			\ }

"suport for visual basic
let g:tagbar_type_vb = {
			\ 'ctagstype' : 'vb',
			\ 'kinds' : [
			\ 's:subroutine',
			\ 'f:function',
			\ 'v:variable',
			\ 'c:const',
			\ 'n:name',
			\ 'e:enum',
			\ 'l:label',
			\ ],
			\ 'sro'        : '.',
			\ 'kind2scope' : {
			\ 's' : 'subroutine',
			\ 'f' : 'function',
			\ 'v' : 'variable',
			\ 'c' : 'const',
			\ 'n' : 'name',
			\ 'e' : 'enum',
			\ 'l' : 'label',
			\ },
			\ 'scope2kind' : {
			\  'subroutine': 's',
			\  'function' : 'f',
			\  'variable' : 'v',
			\  'const' : 'c',
			\  'name'  : 'n',
			\  'enum'  : 'e',
			\  'label' : 'l',
			\ }
			\ }



"-----------------------------------------------------------------------------
""Fugitive
""-----------------------------------------------------------------------------
nmap <silent> <leader>grm :Gremove<CR>
nmap <silent> <leader>ga :Gwrite<CR>

nmap <silent> <leader>gb :Gblame!<CR>
nmap <silent> <leader>hgc :VCSCommit<CR>
nmap <silent> <leader>hgd :VCSDiff<CR>
nmap <silent> <leader>hgi :VCSInfo<CR>
nmap <silent> <leader>hgr :VCSRevert<CR>

"-----------------------------------------------------------------------------
"NeoComplCache
""-----------------------------------------------------------------------------
"let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup          = 1

let g:neocomplcache_enable_auto_select         = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case          = 1
let g:neocomplcache_enable_camel_case_completion = 1

let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_snippets_dir = substitute(globpath(&rtp, 'snippets/'), "\n", ',', 'g')

set completeopt="longest,menuone,preview"
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : neocomplcache#manual_keyword_complete()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

nmap <silent> <leader>esnip :NeoComplCacheEditSnippets<CR>

" <CR>: close popup and save indent.
"inoremap <expr><CR>  pumvisible() ? neocomplcache#cancel_popup() : "\<CR>"

" <TAB>: completion.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
			\ "\<Plug>(neocomplcache_snippets_expand)" : "\<TAB>"

smap <expr><TAB> "\<Plug>(neocomplcache_snippets_expand)"


