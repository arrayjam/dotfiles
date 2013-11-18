au Bufread,BufNewFile *.rb set sw=2 ts=8 et

au Bufread,BufNewFile *.go set sw=4 ts=4
au Bufread,BufNewFile *.erl set sw=4 ts=4
au! BufRead,BufNewFile *.py set sw=4 ts=4 et bs=2
au! BufRead,BufNewFile *.js set sw=2 ts=8 et
au! BufRead,BufNewFile *.json set sw=2 ts=8 et
au! BufRead,BufNewFile *.coffee set sw=2 ts=8 et
au! Bufread,BufNewFile *.html set sw=2 ts=8 et
au! Bufread,BufNewFile *.erb set sw=2 ts=8 et
au! BufRead,BufNewFile *.css set sw=2 sts=2
au! BufRead,BufNewFile *.less set sw=2 sts=2 et ft=css

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-airline'
Bundle 'bling/vim-bufferline'

Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-coffee-script'

Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'mattn/emmet-vim'

"Bundle "sandeepcr529/Buffet.vim"
Bundle "kien/ctrlp.vim"

Bundle 'Syntastic'
Bundle 'airblade/vim-gitgutter'

Bundle "nathanaelkane/vim-indent-guides"
Bundle "Lokaltog/vim-easymotion"
Bundle "jeffkreeftmeijer/vim-numbertoggle"

Bundle "scrooloose/nerdcommenter"
"Bundle "YankRing.vim"
Bundle "maxbrunsfeld/vim-yankstack"

Bundle "tpope/vim-unimpaired"

Bundle "othree/html5.vim"
Bundle "jnwhiteh/vim-golang"
Bundle 'lunaru/vim-less'
Bundle "pangloss/vim-javascript"
"Bundle "utyf/vim-javascript"

filetype plugin indent on


syntax enable
set smarttab smartindent ignorecase smartcase
set noexpandtab

set encoding=utf8
set clipboard+=unnamed

set background=dark
colorscheme solarized

"set rtp+=/home/arrayjam/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2

" Do not back up temporary files.
set backupskip=/tmp/*,/private/tmp/*"

" Store backup files in one place.
set backupdir^=$HOME/.vim/backup//

" Store swap files in one place.
set dir^=$HOME/.vim/swap//

" Store undo files in one place.
set undodir^=$HOME/.vim/undo//

" Store view files in one place.
set viewdir=$HOME/.vim/view//

" Save undo tree.
set undofile

" Allow undoing a reload from disk.
set undoreload=1000

" Auto read externally modified files.
set autoread

set lazyredraw

set bs=2

set number showcmd modeline

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e


let mapleader = ","

map n nzz
map N Nzz
map Y y$

map <tab> :Bufferlist<CR>

highlight SignColumn ctermbg=none
highlight VertSplit ctermbg=black ctermfg=61
highlight LineNr ctermbg=none

let g:gitgutter_sign_column_always = 1

set hidden

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=none
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
let g:EasyMotion_mapping_k = '<Space><C-p>'


let g:ctrlp_map = '\'
nmap <C-\> :CtrlPMRU<CR>
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_settings = {'html':{'indentation':''}}


nnoremap <C-W><h> <C-W><C-H>
nnoremap <C-W><C-N> <C-W><C-J>
nnoremap <C-W><C-P> <C-W><C-K>
nnoremap <C-W><Space> <C-W><C-L>


nnoremap <tab> :e#<CR>


" Duplicate a selection.
vnoremap D y'>p

" Tab to indent in visual mode.
vnoremap <Tab> >gv

" Shift+Tab to unindent in visual mode.
vnoremap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

cnoremap w!! w !sudo tee % >/dev/null

"inoremap <C-CR> <ESC>A<CR>
"inoremap <S-C-CR> <ESC>A:<CR>
set pastetoggle=<F8>


aug cursorline
	au!
	au BufEnter * set cursorline
	au BufLeave * set nocursorline
	au InsertEnter * set nocursorline
	au InsertLeave * set cursorline
aug end

let g:NumberToggleTrigger="<F2>"

let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline_section_c = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:bufferline_echo = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

nnoremap <Esc>1 :b1<CR>
nnoremap <Esc>2 :b2<CR>
nnoremap <Esc>3 :b3<CR>
nnoremap <Esc>4 :b4<CR>
nnoremap <Esc>5 :b5<CR>

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
