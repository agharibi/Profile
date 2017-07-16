syntax on
set background=dark
set smarttab tabstop=4 shiftwidth=3
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set preserveindent
filetype indent on
"set mouse=a

"CURSOR SHAPE
set timeoutlen=1000 ttimeoutlen=0
" solid vertical bar
"let &t_SI .= "\<Esc>[6 q"
" solid block
"let &t_EI .= "\<Esc>[2 q"
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

autocmd Filetype cpp,c,java,src,hh setlocal ts=4 sw=4 expandtab smarttab cindent softtabstop=4
autocmd Filetype python setlocal ts=4 sw=4 expandtab smarttab softtabstop=4
autocmd BufWritePre * :%s/\s\+$//e
set dir=/tmp
set modeline

set ls=2
"search
"set ignorecase
set smartcase
set incsearch

filetype plugin on
set nu
