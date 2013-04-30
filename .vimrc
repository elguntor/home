" General "{{{
set nocompatible			" be iMproved
filetype plugin indent on		" required by Vundle

set tags=./tags;$HOME			" walk directory tree upwards to $HOME looking for tags
" set tags=$STOKGROK_HOME/tags/tags
set ttyfast				" fast terminal
set nobackup                            " do not back up files every time you :w, faster writes
set ignorecase				" case insensitive searching
set smartcase				" unless the search contains a capital letter
set incsearch				" show matches while typing

set number				" show line numbers
set wildignore=*.o,*.obj,*.bak,*.exe	" tab complete ignores these
set wildignore+=*.pyc,*.class,*.so,*.exe
set wildignore+=.git/*,.svn/*,*.dll

"\ 'dir':  '\.git$\|\.svn$',
"\ 'file': '\.class$|\.exe$\|\.so$\|\.dll$|\.pyc$',

map Y y$				" make Y behave like other capitals, yank to end of line

let mapleader = ","			" change mapleader to ,

" set hlsearch				" highlight search
" nnoremap <CR> :noh<CR><CR>		" clear search by hitting return
" }}}

" Formatting {{{
set ts=8				" tab size equals 8 spaces, Linux kernel style
set softtabstop=8
set shiftwidth=8
set noexpandtab

set backspace=indent,eol,start
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

" Controls and Commands "{{{
" resize horizontal split window
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+
" resize vertical split window
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>

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

" absolute / relative line numbers
function! NumberToggle()
	if(&relativenumber ==1)
		set number
	else
		set relativenumber
	endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" set absolute numbers when vim loses focus
":au FocusLost * :set number
":au FocusGained * :set relativenumber

" set absolute numbers when in insert mode
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" map easy motion to <Leader><Leader>
let g:EasyMotion_leader_key='<Leader><Leader>'
" }}}

" Vundle "{{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" load Vundle...required
Bundle 'gmarik/vundle'

" Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'Conque-Shell'
"Bundle 'ctrlp.vim'
Bundle 'Command-T'
Bundle 'Go-Syntax'
Bundle 'haml.zip'
Bundle 'vim-scala'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-jsbeautify'
Bundle 'scrooloose/syntastic'
Bundle 'VimClojure'
Bundle 'RubySinatra'
Bundle 'ruby.vim'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-flake8'
"Bundle 'vim-django-support'
"Bundle 'vim_django'
"Bundle 'django.vim'
" }}}

" CtrlP"{{{
"let g:ctrlp_custom_ignore = {
"\ 'dir':  '\.git$\|\.svn$',
"\ 'file': '\.class$|\.exe$\|\.so$\|\.dll$|\.pyc$',
"\ }
" }}}

" Syntastic General"{{{
let g:syntastic_check_on_open=1
" }}}

" Languages "{{{
" html
autocmd Filetype html setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab

" python
autocmd Filetype python setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
let g:flake8_max_line_length=250
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args="--max-line-length=160"
" django support
" leader dt starts Command T in template directory corresponding to the application
map <Leader>dt :VimDjangoCommandTTemplate<CR>
" leader da starts Command T in the app directory
map <Leader>da :VimDjangoCommandTApp<CR>

" ruby
autocmd Filetype ruby setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
" }}}
