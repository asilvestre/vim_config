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

Bundle 'wincent/Command-T'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle 'elzr/vim-json'
Bundle 'vim-scripts/searchfold.vim'
Bundle 'pbrisbin/html-template-syntax'
Bundle 'Shougo/vimproc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'eagletmt/neco-ghc'
Bundle 'Shougo/unite.vim'
Bundle 'vim-scripts/vcscommand.vim'
" pep8 python indenting
Bundle 'vim-scripts/indentpython.vim'
" Support for C++11 syntax
Bundle 'vim-jp/cpp-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on     " required!

" Configure syntastic python
let g:syntastic_python_flake8_args="--max-line-length=120"
let g:syntastic_python_pylint_args="--max-line-length=120"

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

" CommandT
map <C-F11> :CommandTFlush <CR>
let g:CommandTMaxFiles=30000

" SCons
au BufNewFile,BufRead SCons* set filetype=scons

" switch on syntax highlighting
syntax on
set synmaxcol=150

" enable filetype detection, plus loading of filetype plugins
filetype plugin on

" configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
" Let neco-ghc be a source for YouCompleteMe
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" key mappings for YCM
map <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
" let g:ycm_server_keep_logfiles = 1

" colored current line and column
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
