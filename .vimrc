"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Jedi-vim for Python autocompletion
Plugin 'davidhalter/jedi-vim'
" Git interface
Plugin 'tpope/vim-fugitive'
" Filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim' 
Plugin 'jebaum/vim-tmuxify'
" Markdown
" isnowfy only compatible with python not python3
" Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'nelstrom/vim-markdown-preview'
" Python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
" Auto-completion stuff
Plugin 'klen/python-mode'
Plugin 'ervandew/supertab'
"" Code folding and class outlining
Plugin 'tmhedberg/SimpylFold'
Plugin 'majutsushi/tagbar'
" Colors!!!
"  Use a lightweith Vim status line
Plugin 'itchyny/lightline.vim'
"  Include Quantum theme
Plugin 'tyrannicaltoucan/vim-quantum'
" Include Golang support
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call vundle#end()

" Try to solve this weird issue with color background inside tmux: 
" https://github.com/mhartington/oceanic-next/issues/40
set t_ut=

" Get backspace to work properly
set backspace=indent,eol,start

" Solve delay when switching insert mode to normal mode with status line
set timeoutlen=1000 ttimeoutlen=0

" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
	\ "\<lt>C-n>" :
	\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
	\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
	\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Solve weird autocompletion problem in Go, as per
" https://github.com/fatih/vim-go/issues/223
set completeopt=menu

" Disable vim-go autofmt on save, it does not work properly
" (As a workaround, run :GoFmt manually)
let g:go_fmt_autosave = 0

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

" Custom keys
let mapleader=" "
map <leader>g <C-c>g
nmap <F3> :TagbarToggle<CR>

" Vim Colorscheme configuration
syntax on
set t_Co=256
set background=dark
set termguicolors
colorscheme quantum
"let g:quantum_black = 1
let g:lightline = {
	\ 'colorscheme': 'default',
\}
set laststatus=2

" Remap keys for bash execution from Vim
set shell=/bin/bash\ --rcfile\ ~/.bash_profile\ -i
nnoremap <leader>e :.w !bash<CR>
vnoremap <leader>e :w !bash<CR>
"vnoremap <leader>w :!tmw <C-R>"<BS><CR>
vmap <leader>x y:TxSend<CR> <C-R>"<BS>
vmap <leader>w y:TxSend<CR>watch <C-R>"<BS>

" Remaps for clipboard management
set clipboard=unnamedplus
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" NERDTree configuarations
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <F2> :NERDTreeTabsToggle<CR>

let g:tagbar_ctags_bin = '~/bin/ctags'

" I don't like swap files
set noswapfile

" Turn on numbering
set nu
set relativenumber

" Pydiction configuration
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

" it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
" omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
