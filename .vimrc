" pathogen
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" load Vundle...required
Bundle 'gmarik/vundle'

" Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'Conque-Shell'
Bundle 'ctrlp.vim'
Bundle 'Go-Syntax'
Bundle 'Haml'
Bundle 'vim-scala'
Bundle 'Lokaltog/vim-easymotion'

" change leader to ,
let mapleader = ","

" colors
syntax on
set background=dark

" color scheme
colorscheme Tomorrow

" set hlsearch
" set ignorecase
set number
filetype plugin indent on " required by Vundle

" ctags
set tags="$STOKGROK_HOME/tags/tags"

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" convert spaces to tabs and vice-versa
set ts=8
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" make Y behave like other capitals, yank to end of line
map Y y$

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
" toggle between the last two files
nnoremap <leader><leader> <c-^>

" tab complete ignores these
set wildignore=*.o,*.obj,*.bak,*.exe

" make sure splits have at least a height of 5 lines
" set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
" set winheight=5
" set winminheight=5
" set winheight=999

" remap ctrl-w-[hjkl] to ctrl-[hjkl]
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" resize horizontal split window
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+
" resize vertical split window
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>

" status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2

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

" set absolute numbers when vim loses focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" set absolute numbers when in insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
