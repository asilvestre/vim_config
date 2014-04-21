" General Stuff
syntax on
set nocp
filetype plugin on

" Set lines above and below to trigger scroll
" set scrolloff=20

" Relative line numbers
set rnu

" Vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'elzr/vim-json'
Bundle 'vim-scripts/LogViewer'
Bundle 'vim-scripts/searchfold.vim'
Bundle 'pbrisbin/html-template-syntax'
" Bundle 'nvie/vim-flake8'

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

" Pretty print XML
function! DoXmlLint()
    exec "%!xmllint --format -"
endfunction
command! XmlLint call DoXmlLint()

" Toggle maximize
nnoremap <C-W>O :call MaximizeToggle ()<CR>
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " ...
endif

" Status bar
set laststatus=2
set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]

set wildmode=longest:full
set wildmenu


" Python indenting
set tabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=120


" CTags build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>


" CommandT
map <C-F11> :CommandTFlush <CR>
let g:CommandTMaxFiles=30000



" PyLint
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0


" SCons
au BufNewFile,BufRead SCons* set filetype=scons



" ##C++ Specific##


" OmniCppComplete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
 
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Some generic tags files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

set wildignore+=external/boost,*.o,*.obj,*.git,*.pyc

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
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'

" key mappings for YCM
map <F3> :YcmCompleter GoToDefinitionElseDeclaration<CR>

