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
Bundle 'Shougo/unite.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/vcscommand.vim'

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

" PyLint
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0

" SCons
au BufNewFile,BufRead SCons* set filetype=scons


" Haskell
" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

" switch on syntax highlighting
syntax on
set synmaxcol=150

" enable filetype detection, plus loading of filetype plugins
filetype plugin on

" configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" key mappings for YCM
map <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
