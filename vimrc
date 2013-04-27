au Bufread,BufNewFile *.rb set sw=2 ts=8 et
au Bufread,BufNewFile *.go set sw=4 ts=4
au Bufread,BufNewFile *.erl set sw=4 ts=4
au! BufRead,BufNewFile *.py set sw=4 ts=4 et bs=2
au! BufRead,BufNewFile *.js set sw=2 ts=4 et
au! BufRead,BufNewFile *.coffee set sw=2 ts=8 et
au! Bufread,BufNewFile *.html set sw=2 ts=8 et
au! Bufread,BufNewFile *.erb set sw=2 ts=8 et

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on

set background=dark
colorscheme solarized

set rtp+=/home/arrayjam/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2


syntax enable
set smarttab smartindent ignorecase smartcase
set noexpandtab

set bs=2

set number showcmd modeline

map n nzz
map N Nzz
map Y y$

