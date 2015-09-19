" General "{{{
autocmd! bufwritepost .vimrc source %   " auto reload .vimrc
set nocompatible                        " be iMproved
filetype off                            " required by Vundle

set hidden                              " not sure why this isn't on by default
set encoding=utf-8                      " I hate ASCII!
set tags=$HOME/src/ctags
set ttyfast                             " fast terminal
set nobackup                            " do not back up files every time you :w, hate tildes
set ignorecase                          " case insensitive searching
set smartcase                           " unless the search contains a capital letter
set incsearch                           " show matches while typing

set number                              " show line numbers
set wildignore=*.o,*.obj,*.bak,*.exe    " tab complete ignores these
set wildignore+=*.pyc,*.class,*.so,*.exe
set wildignore+=.git/*,.svn/*,*.dll

map Y y$                                " make Y behave like other capitals, yank to end of line

let mapleader = ","                     " change mapleader to ,

" set hlsearch                          " highlight search
" nnoremap <CR> :noh<CR><CR>            " clear search by hitting return
"
" Mac stuff
if has("unix")
    let s:uname = system("echo -n \"$(uname)\"")
    if !v:shell_error && s:uname == "Darwin"
        "set mouse=a
        set mouse=nicr
    endif
endif
" }}}

" Formatting {{{
set ts=4                                " tab size equals 4 spaces
set softtabstop=4
set shiftwidth=4
set expandtab

set backspace=indent,eol,start
" }}}


" Spelling "{{{
" set spell spelllang=en_gb
" }}}

" Controls and Commands "{{{
" save
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
" matchit!
runtime macros/matchit.vim
" copy and paste
set pastetoggle=<F2>
set clipboard=unnamed
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

" easier tab movement
map <leader>n <esc>:tabprevious<CR>
map <leader>m <esc>:tabnext<CR>

" sort
map <leader>s :sort<CR>

" move blocks of code that are highlighted in visual mode
vnoremap < <gv
vnoremap > >gv

" absolute / relative line numbers
function! NumberToggle()
	if(&relativenumber == 1)
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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" load Vundle...required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'The-NERD-Commenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'bufexplorer.zip'
Plugin 'klen/python-mode'
"Plugin 'ctrlp.vim'
Plugin 'Command-T'
Plugin 'Gundo'
Plugin 'faith/vim-go'
Plugin 'haml.zip'
Plugin 'davidhalter/jedi-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-jsbeautify'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'VimClojure'
Plugin 'RubySinatra'
Plugin 'ruby.vim'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-flake8'
Plugin 'tpope/vim-vividchalk'
Plugin 'bling/vim-airline'
Plugin 'taglist.vim'
Plugin 'matchit.zip'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'losingkeys/vim-niji'
Plugin 'rking/ag.vim'
Plugin 'derekwyatt/vim-scala'

call vundle#end()
filetype plugin indent on              " required by Vundle
" }}}

" Visual "{{{
syntax on                   " enable syntax
set background=dark         " dark background
colorscheme emacs " set the color scheme
" colorscheme molokai " set the color scheme
" let g:molokai_original = 1
" colorscheme vividchalk      " set the color scheme

set showmatch               " Show matching brackets
set matchtime=2	            " Bracket blinking

set novisualbell            " No blinking
set noerrorbells            " No noise

set vb t_vb=                " disable any beeps or flashes on error

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2            " always show status line
" }}}

" BufExplorer"{{{
nnoremap <F3> :BufExplorer<CR>
" }}}
" Jedi "{{{
let g:jedi#force_py_version = 3
" }}}
"
" Taglist"{{{
"let Tlist_Auto_Highlight_Tag = 0
"let Tlist_Highlight_Tag_On_BufEnter = 0
"let Tlist_GainFocus_On_ToggleOpen = 1
"nnoremap <F4> :TlistToggle<CR>
" }}}

" Gundo"{{{
let g:gundo_prefer_python3 = 1
nnoremap <F5> :GundoToggle<CR>
" }}}

" CommandTFlush"{{{
nnoremap <F8> :CommandTFlush<CR>
" }}}

" NerdTree"{{{
map <C-t> :NERDTreeToggle<CR>
" }}}

" Ctrl P"{{{
"let g:ctrl_map = '<c p>'
" }}}

" Syntastic General "{{{
let g:syntastic_java_checkers=[]
let g:syntastic_check_on_open=1
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args="--max-line-length=160 --ignore=E124,E126,E127,E128"
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" }}}

" python-mode "{{{
let g:pymode_python = 'python3'
" }}}

" YouCompleteMe "{{{
" let g:ycm_extra_conf_globlist = ['~/src/*']
" let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
" }}}

" Languages "{{{
" html, xml
autocmd BufRead,BufNewFile *.xml setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.html setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.handlebars setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
" javascript
autocmd BufRead,BufNewFile *.js setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
"json
autocmd BufRead,BufNewFile *.json setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
"css, less
autocmd BufRead,BufNewFile *.css setlocal filetype=less ts=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.less setlocal filetype=less ts=2 softtabstop=2 shiftwidth=2 expandtab
" php
autocmd Filetype php setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
" python
autocmd Filetype python setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.feature setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.j2 setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab syntax=htmldjango
autocmd BufRead,BufNewFile buildout.cfg setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
" django support
" leader dt starts Command T in template directory corresponding to the application
" map <Leader>dt :VimDjangoCommandTTemplate<CR>
" leader da starts Command T in the app directory
" map <Leader>da :VimDjangoCommandTApp<CR>

" ruby
autocmd Filetype ruby setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.erb setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.slim setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab syntax=slim
" yaml
autocmd Filetype yaml setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
" }}}

