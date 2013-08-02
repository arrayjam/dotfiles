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

Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-coffee-script'

Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'ZenCoding.vim'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

"Bundle 'fholgado/minibufexpl.vim'
"Bundle "sandeepcr529/Buffet.vim"
Bundle "kien/ctrlp.vim"
Bundle "Shougo/unite.vim"
"Bundle "Shougo/vimproc"


Bundle 'Syntastic'
Bundle 'airblade/vim-gitgutter'

Bundle "nathanaelkane/vim-indent-guides"
Bundle "Lokaltog/vim-easymotion"
Bundle "jeffkreeftmeijer/vim-numbertoggle"

Bundle "scrooloose/nerdcommenter"
"Bundle "YankRing.vim"

Bundle "tpope/vim-unimpaired"

Bundle "othree/html5.vim"
Bundle "jnwhiteh/vim-golang"
Bundle 'lunaru/vim-less'
Bundle "pangloss/vim-javascript"

"Bundle 'FredKSchott/CoVim'


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

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e


let mapleader = ","

map n nzz
map N Nzz
map Y y$

map <tab> :Bufferlist<CR>

highlight SignColumn ctermbg=none
highlight VertSplit ctermfg=black ctermfg=black
highlight LineNr ctermbg=none
let g:gitgutter_sign_column_always = 1

set hidden

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=none
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

let g:NumberToggleTrigger="<F2>"

let g:syntastic_csslint_options = "--warnings=none"

let g:EasyMotion_leader_key = '<Space>'
let g:ctrlp_map = '\'
nmap <C-\> :CtrlPMRU<CR>
let g:user_zen_leader_key = '<c-e>'
let g:user_zen_settings = {'html':{'indentation':''}}



let g:unite_source_grep_command='ack'
let g:unite_source_grep_default_opts='--no-heading --no-color'
let g:unite_source_grep_recursive_opt=''

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')

let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '
"nnoremap <silent> <leader><space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_mru file_rec/async buffer bookmark<cr><c-u>
"nnoremap <silent> <leader>f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
nnoremap <silent> <leader>y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> <leader>l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> <leader>b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
"nnoremap <silent> <leader>/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
"nnoremap <silent> <leader>m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> <leader>s :<C-u>Unite -quick-match buffer<cr>
nnoremap <tab> :e#<CR>
