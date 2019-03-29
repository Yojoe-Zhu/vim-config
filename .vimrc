"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common setup
"
set nocompatible
set paste
set number
set incsearch 
set hlsearch
set ruler
set showcmd
set laststatus=2
set matchpairs+=<:>
set encoding=utf-8
set tabstop=4
set re=1
set ttyfast
set lazyredraw

autocmd WinLeave * set nocursorline nocursorcolumn
autocmd WinEnter * set cursorline cursorcolumn
set cursorline
set cursorcolumn

" Enable fold
set foldmethod=indent
set foldlevel=99
" Use <space> to fold and unfold code block
nnoremap <space> za

" key map for slipt view
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

syntax on
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up plugins
"
" NERDTree
"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$', '\.o$']
" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" Open NERDTree automtically when vim starts up on opening a directory.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only window left is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&b:NERDTree.isTabTree()) | q | endif
" Use <C-n> to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_autofocus=1
map <F8> :TagbarToggle<CR>

let g:SimpylFold_docstring_preview=1

let python_highlight_all=1

if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Python
autocmd BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix

" C
autocmd BufNewFile,BufRead *.c
\ set tabstop=8 |
\ set softtabstop=8 |
\ set shiftwidth=8 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix


