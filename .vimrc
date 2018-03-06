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

set completeopt=menu                    " shut down the annoying auto opening help window

map Y y$                                " make Y behave like other capitals, yank to end of line

let mapleader = ","                     " change mapleader to ,

" set hlsearch                          " highlight search
" nnoremap <CR> :noh<CR><CR>            " clear search by hitting return

" turn off ex mode
map q: <nop>
nnoremap Q <nop>

" Mac stuff
if has("unix")
    let s:uname = system("echo -n \"$(uname)\"")
    if !v:shell_error && s:uname == "Darwin"
        "set mouse=a
        set mouse=nicr
        " fzf
        set rtp+=/usr/local/opt/fzf
    else
        " fzf
        set rtp+=~/.fzf
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
set spelllang=en_gb
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

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

" absolute / relative line numbers
function! NumberToggle()
	if(&relativenumber == 1)
		set number norelativenumber
	else
		set number relativenumber
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
" let g:EasyMotion_leader_key='<Leader><Leader>'
" }}}
map <Leader>w <Plug>(easymotion-bd-w)

" vim plug
call plug#begin('~/.vim/plugged')


" Plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'
Plug 'jlanzarotta/bufexplorer'
Plug 'python-mode/python-mode'
Plug 'vim-scripts/Gundo'
Plug 'Lokaltog/vim-easymotion'
Plug 'maksimr/vim-jsbeautify'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'nvie/vim-flake8'
Plug 'bling/vim-airline'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'rking/ag.vim'
Plug 'StanAngeloff/php.vim'
Plug 'evidens/vim-twig'
Plug 'dracula/vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'PProvost/vim-ps1'

call plug#end()

" Visual "{{{
syntax on                   " enable syntax
set background=dark         " dark background
colorscheme emacs " set the color scheme
" color dracula " set the color scheme
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

" EasyMotion{{{
let g:EasyMotion_leader_key='<Leader><Leader>'
" }}}

" fzf{{{
nmap <Leader>t :Files<CR>
" }}}

" BufExplorer"{{{
nnoremap <F3> :BufExplorer<CR>
" }}}

" Gundo"{{{
let g:gundo_prefer_python3 = 1
nnoremap <F5> :GundoToggle<CR>
" }}}

" NerdTree"{{{
map <C-t> :NERDTreeToggle<CR>
" }}}

" Syntastic General "{{{
let g:syntastic_java_checkers=[]
let g:syntastic_check_on_open=1
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args="--max-line-length=220 --ignore=E124,E126,E127,E128"
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_html_tidy_exec = 'tidy5'
" }}}

" python-mode "{{{
let g:pymode_python = 'python3'
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 220
let g:pymode_rope = 0
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
" python
autocmd BufRead,BufNewFile *.py setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.feature setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.j2 setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab syntax=htmldjango
autocmd BufRead,BufNewFile buildout.cfg setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
" ruby
autocmd Filetype ruby setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.erb setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufRead,BufNewFile *.slim setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab syntax=slim
" yaml
autocmd Filetype yaml setlocal ts=2 softtabstop=2 shiftwidth=2 expandtab
" zwo Zwift workout file
autocmd BufRead,BufNewFile *.zwo setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab syntax=xml
" }}}

