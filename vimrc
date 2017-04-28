version 6.0
set cpo&vim
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en

filetype plugin on
set list listchars=tab:\|_,trail:.
set list|set number
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set hlsearch
set incsearch

" NH shortcuts for hiding numbers
cabbr UCOPY set list | set number
cabbr COPY set nolist | set nonumber
map [ :COPY
map ] :UCOPY

" perltidy
vmap t :'<,'>!perltidy -q -icb -icp
map \t :%!perltidy -q -icb -icp

" map sq brackets to show/hide line numbers for easier copy paste to terminal
ca COPY set nolist<bar>set nonumber
ca UCOPY set list<bar>set number
map [ :COPY<CR>
map ] :UCOPY<CR>

" map \s to find/replace  word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"define :Tidy command to run perltidy on visual selection || entire buffer
command -range=% -nargs=* Tidy <line1>,<line2>!perltidy -q -icp -icb

"run :Tidy on entire buffer and return cursor to (approximate) original position
fun DoTidy()
    let Pos = line2byte( line( "." ) ) 
    :Tidy
    exe "goto " . Pos 
endfun

"shortcut for normal mode to run on entire buffer then return to current line
au Filetype perl nmap <F2> :call DoTidy()<CR>

"shortcut for visual mode to run on the the current visual selection"
au Filetype perl vmap <F2> :Tidy<CR>

inoremap jk <ESC>

hi Tab guifg=green