version 6.0
set cpo&vim
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en

filetype plugin on
set list listchars=tab:\|_,trail:.
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch
set incsearch

" NH shortcuts for hiding numbers
:command UCOPY set list <bar> set number <bar> set nopaste
:command COPY set nolist <bar> set nonumber <bar> set paste
map [ :COPY<CR>
map ] :UCOPY<CR>

" NH shortcuts for easily viewing TSVs
:command COL set tabstop=60 <bar> set nowrap
:command UNCOL set tabstop=4 <bar> set wrap
nmap <F9> :COL<CR>
nmap <F7> :UNCOL<CR>

" map \s to find/replace  word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

hi Tab guifg=green
