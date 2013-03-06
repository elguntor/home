" General "{{{
set nocompatible			" be iMproved

"set tags=./tags;$HOME			" walk directory tree upwards to $HOME looking for tags
set tags=$STOKGROK_HOME/tags/tags

set nobackup                            " do not back up files every time you :w, faster writes
" set hlsearch				" highlight search
set ignorecase				" case insensitive searching
set smartcase				" unless the search contains a capital letter
set incsearch				" show matches while typing

set number				" show line numbers
set wildignore=*.o,*.obj,*.bak,*.exe	" tab complete ignores these

map Y y$				" make Y behave like other capitals, yank to end of line

let mapleader = ","			" change mapleader to ,
nnoremap <CR> :noh<CR><CR>		" clear search by hitting return
" }}}

" Formatting {{{
set ts=8				" tab size equals 8 spaces, Linux kernel style
set softtabstop=8
set shiftwidth=8
set noexpandtab

set backspace=indent
set backspace+=eol
set backspace+=start

set autoindent
set cindent
set indentkeys-=0#			" do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

" TODO map these to something besides ctrl-f
" JsBeautify
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" }}}

" Visual "{{{
syntax on				" enable syntax
set background=dark			" black background
colorscheme Tomorrow			" set the Tomorrow color scheme

set showmatch				" Show matching brackets
set matchtime=2				" Bracket blinking

set novisualbell			" No blinking
set noerrorbells			" No noise

set vb t_vb=				" disable any beeps or flashes on error

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2			" always show status line
" }}}

" make sure splits have at least a height of 5 lines
" set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will fail.
" set winheight=5
" set winminheight=5
" set winheight=999
" }}}

" resize horizontal split window
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+
" resize vertical split window
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" load Vundle...required
Bundle 'gmarik/vundle'

" Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'Conque-Shell'
Bundle 'ctrlp.vim'
Bundle 'Go-Syntax'
Bundle 'haml.zip'
Bundle 'vim-scala'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-jsbeautify'
Bundle 'scrooloose/syntastic'
Bundle 'VimClojure'
Bundle 'RubySinatra'
Bundle 'ruby.vim'

filetype plugin indent on " required by Vundle

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" convert spaces to tabs and vice-versa
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" remap split windows controls ctrl-w-[hjkl] to ctrl-[hjkl]
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.svn$',
\ 'file': '\.class$|\.exe$\|\.so$\|\.dll$',
\ }

" absolute / relative line numbers
function! NumberToggle()
	if(&relativenumber ==1)
		set number
	else
		set relativenumber
	endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

function! RubyToggle()
	if(&expandtab ==0)
		setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
	else
		setlocal ts=8 softtabstop=8 shiftwidth=8 noexpandtab
	endif
endfunc

nnoremap <C-r> :call RubyToggle()<cr>
" set absolute numbers when vim loses focus
":au FocusLost * :set number
":au FocusGained * :set relativenumber

" set absolute numbers when in insert mode
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber
