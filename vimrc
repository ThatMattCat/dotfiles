" Folding control: zo zc zR zM space=toggle


" GENERAL CONFIGS ------------------------------------------------------- {{{
"
colorscheme molokai
filetype on
filetype plugin on
filetype indent on
syntax on

set nocompatible
set history=1000

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent


set autoread
set scrolloff=7
set number
set showmode
set wrap
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


set expandtab
set smarttab
set ai
set si
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus
"set mouse=a


set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set showmatch
set incsearch
set hlsearch
set smartcase

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" }}}


" PLUGINS ---------------------------------------------------------------- {{{
"
" :PlugInstall to install plugins

call plug#begin('~/.vim/plugged')

  Plug 'preservim/nerdtree'
  Plug 'dense-analysis/ale'



call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Yank from cursor to the end of line.
nnoremap Y y$

" Space toggles folds
nnoremap <space> za

" NERDTree bindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <F3> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" No more stretch
inoremap jj <esc>

" Up/down by visual, not real, lines
nnoremap j gj
nnoremap k gk


" }}}


 " VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" If HTML set tab to 2 spaces
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" Set some GUI-specific args
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
    let line = getline(v:foldstart)
    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart + 1
    let prefix = " ... "
    let postfix = "「" . foldedlinecount . " lines」"
    let line = strpart(line, 0, windowwidth - len(prefix) - len(postfix) - 2)
    let fillcharcount = windowwidth - len(prefix) - len(line) - len(postfix)
    return prefix . line . repeat(" ",fillcharcount) . postfix
endfunction


" }}}

