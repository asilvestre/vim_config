" General Stuff
syntax on
set nocp
filetype plugin on

" Vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/Vundle.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle 'elzr/vim-json'
Bundle 'vim-scripts/searchfold.vim'
Bundle 'pbrisbin/html-template-syntax'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-scripts/vcscommand.vim'
Bundle 'dkprice/vim-easygrep'
" Haskell
Bundle 'Shougo/vimproc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'eagletmt/neco-ghc'
Bundle 'Shougo/unite.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'Shougo/neocomplete.vim'
" pep8 python indenting
Bundle 'vim-scripts/indentpython.vim'
" Support for C++11 syntax
Bundle 'vim-jp/cpp-vim'
" better indenting and highlighting of haskell code
Bundle 'raichoo/haskell-vim'
" Support for puppet
Bundle 'rodjek/vim-puppet'
Bundle 'godlygeek/tabular'
" Support for JavaScript
Bundle 'pangloss/vim-javascript'
" switch between header and cpp
Bundle 'vim-scripts/a.vim'
" Asciidoc enhanced handling
Bundle 'dahu/vimple'
Bundle 'dahu/Asif'
Bundle 'Raimondi/VimRegStyle'
Bundle 'vim-scripts/SyntaxRange'
Bundle 'dahu/vim-asciidoc'
" Purescript
Bundle 'raichoo/purescript-vim'
Bundle 'frigoeu/psc-ide-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on     " required!

" Configure syntastic python
let g:syntastic_python_flake8_args="--max-line-length=120"
let g:syntastic_python_pylint_args="--max-line-length=120 --load-plugins pylint_django"
let python_highlight_all=1

" NertTree
map <silent> <C-n> :NERDTreeToggle<CR>

" Mediawiki
augroup filetypedetect 
au BufNewFile,BufRead *.wiki setf Wikipedia 
augroup END

" Highlight search
:set hlsearch

" Status bar
set laststatus=2
set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]

set wildmode=longest:full
set wildmenu
set wildignore+=external/boost,*.o,*.obj,*.git,*.pyc

" Python indenting
set tabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=120
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" SCons
au BufNewFile,BufRead SCons* set filetype=scons

set synmaxcol=150

" enable filetype detection, plus loading of filetype plugins
filetype plugin on

" pastemode
:set pastetoggle=<F10>

" key mappings for YCM
map <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
" let g:ycm_server_keep_logfiles = 1
let g:ycm_confirm_extra_conf = 0

" colored current line and column
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" EasyGrep tools
let g:EasyGrepRecursive = 1
let g:EasyGrepCommand = 1
let g:EasyGrepFilesToExclude = ".git,node_modules,bower_components"

" YouCompleteMe tab

" ghc-mod
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

let g:syntastic_puppet_checkers=['puppetlint']
let g:syntastic_puppet_puppetlint_args=['--no-80chars-check']
let g:syntastic_puppet_puppet_args = '--parser=future'

" haskell tabular
" let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
"au FileType haskell let b:ghcmod_use_basedir = getcwd()

syntax on
filetype plugin indent on

set nocompatible
set number
set rnu
set nowrap
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
let g:ycm_semantic_triggers = {'haskell' : ['.']}
"set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•
"set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:•
"set list
