""""""""""""""""""""""""""""""""""
"       GENERALLY USEFUL         "
""""""""""""""""""""""""""""""""""

" automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

" searching
set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

" wrapping
set textwidth=80
set nowrap                    " no wrapping

" In text files, always limit the width of text to 78 characters
autocmd BufRead *.txt set tw=78

" navigate in split screens
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l

" display
set ch=2                       " set command line 2 lines high 
set helpheight=50              " default help height
set nolist                     " show/hide tabs and EOL chars
set number                     " show/hide line numbers (nu/nonu)
set scrolloff=5                " scroll offsett, min lines above/below cursor
set scrolljump=5               " jump 5 lines when running out of the screen
set sidescroll=10              " minumum columns to scroll horizontallset backspace=indent,start,eol " repair wired terminal/vim settings
set showcmd                    " show command status
set showmatch                  " jump to matching bracket char when iserting
set showmode                   " show editing mode in status (-- INSERT --)
set ruler                      " show cursor position
set title
set autoindent
set smartindent
set mouse=a

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\Buf:#%n\[%b][0x%B]
" " tell VIM to always put a status line in, even if there is only one window
set laststatus=2
"
" " Don't update the display while executing macros
set lazyredraw
set showcmd
"
" " Show the current mode
set showmode
set guioptions=acg
set wildmenu
set complete=.,w,b,t
set showfulltag
set fillchars = ""
set diffopt+=iwhite
set hlsearch
set incsearch
set clipboard+=unnamed
set autoread

" keep center the text
set scrolloff=8

set dictionary=/usr/share/dict/words

syntax enable
set background=dark

syn match tab display "\t"
hi link tab Error
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
 
" vim latex requires that
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

" kill any trailing whitespace on save
autocmd FileType c,cabal,cpp,haskell,javascript,php,python,readme,text
  \ autocmd BufWritePre <buffer>
  \ :call <SID>StripTrailingWhitespaces()

set background=dark
colorscheme solarized

nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

imap <F2> <ESC>:w<CR>
nmap <F2> :w<CR>

set tags=tags;/
set tags +=~/.vim/qttags

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" language specific stuff
au FileType make    setlocal noexpandtab
au FileType pyhton  set tabstop=2|set shiftwidth=4|set expandtab
au FileType *       set formatoptions+=tcq
