" pathogen
call pathogen#infect()
filetype off " On some Linux systems, this is necessary to make sure pathogen
             " picks up ftdetect directories in plugins! :(

" Load plugins from .vim/bundles using .vim/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()

" change leader to ,
let mapleader = ","

" colors
syntax on
set background=dark

" color scheme
" colorscheme solarized
" colorscheme koehler
" colorscheme torte
colorscheme emacs

" set hlsearch
" set ignorecase
set number
filetype plugin indent on

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" convert spaces to tabs and vice-versa
set ts=8
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" map terminal to Control-b
" nmap <silent> <C-B> :ConqueTerm bash<CR>

" NERDtree plugin
nmap <silent> <C-n> :NERDTreeToggle<CR>

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

" tab for auto completion
function! SuperTab()
	if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
		return "\<Tab>"
	else
		return "\<C-n>"
	endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>

" status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2

"VimClojure
"let vimfiles=$HOME . "/.vim"
"let classpath = join(
"	\ [".",
"	\ "classes",
"	\  "lib/*",
"	\  "/usr/local/lib/java",
"	\  "/usr/local/lib",
"	\  $HOME . "/.vim/lib/*",
"	\ ], ":")
"
"let vimclojureRoot = $HOME . "/.vim/bundle/vimclojure-2.3.0"
"let vimclojure#HighlightBuiltins=1
"let vimclojure#HighlightContrib=1
"let vimclojure#DynamicHighlighting=1
"let vimclojure#ParenRainbow=1
"let vimclojure#NailgunClient = vimclojureRoot."/lib/vimclojure-nailgun-client/ng"
"let vimclojure#WantNailgun=1

" Start vimclojure nailgun server (uses screen.vim to manage lifetime)
" nmap <silent> <Leader>sc :execute "ScreenShell java -cp \"" . classpath . ":" . vimclojureRoot . "/lib/*" . "vimclojure.nailgun.NGServer 127.0.0.1" <cr>
" Start a generic Clojure repl (uses screen.vim)
" nmap <silent> <Leader>sC :execute "ScreenShell java -cp \"" . classpath . "\" clojure.main" <cr>
