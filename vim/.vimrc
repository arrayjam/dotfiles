set shell=/bin/bash
au Bufread,BufNewFile *.rb set sw=2 ts=8 et
au Filetype ruby set sw=2 ts=8 et
au Bufread,BufNewFile *.go set sw=4 ts=4
au Bufread,BufNewFile *.erl set sw=4 ts=4
au! BufRead,BufNewFile *.py set sw=4 ts=4 et bs=2
au! BufRead,BufNewFile *.js set sw=2 ts=8 et
au! BufRead,BufNewFile *.jsx set sw=2 ts=8 et
au! BufRead,BufNewFile *.json set sw=2 ts=8 et
au! BufRead,BufNewFile *.coffee set sw=2 ts=8 et
au! Bufread,BufNewFile *.html set sw=2 ts=8 et
au! Bufread,BufNewFile *.erb set sw=2 ts=8 et
au! Bufread,BufNewFile *.slim set sw=2 ts=8 et
au! Bufread,BufNewFile *.yaml set sw=2 ts=8 et
au! BufRead,BufNewFile *.css set sw=2 sts=2
au! BufRead,BufNewFile *.less set sw=2 sts=2 et ft=css
au! BufRead,BufNewFile *.scss set sw=2 sts=2 et
au! BufRead,BufNewFile *.sh set sw=2 sts=2 et
au! BufRead,BufNewFile *.c set sw=4 sts=4 et
au! BufRead,BufNewFile *.cpp set sw=4 sts=4 et
au! BufRead,BufNewFile *.cc set sw=2 sts=2 et
au! BufRead,BufNewFile *.scala set sw=2 sts=2 et
au! BufRead,BufNewFile *.lua set sw=2 sts=2 et
au! BufRead,BufNewFile *.java set sw=4 sts=4 et

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline'

Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'

Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-coffee-script'

Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'mattn/emmet-vim'

Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

Plugin 'Syntastic'
Plugin 'mhinz/vim-signify'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'haya14busa/vim-easyoperator-phrase'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

Plugin 'maxbrunsfeld/vim-yankstack'


Plugin 'othree/html5.vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'lunaru/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'derekwyatt/vim-scala'


Plugin 'kana/vim-niceblock'

Plugin 'reedes/vim-pencil'

Plugin 'jpalardy/vim-slime'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-dispatch'

Plugin 'tpope/vim-jdaddy'

Plugin 'sunaku/vim-ruby-minitest'
Plugin 'vim-ruby/vim-ruby'

Plugin 'slim-template/vim-slim'

Plugin 'rking/ag.vim'

Plugin 'tommcdo/vim-lion'

Plugin 'mbbill/undotree'

Plugin 'editorconfig/editorconfig-vim'


call vundle#end()
filetype plugin indent on


syntax enable
set smarttab smartindent ignorecase smartcase
set noexpandtab

set formatoptions-=o

set encoding=utf8
if $TMUX == ''
	set clipboard+=unnamed
endif

if !exists("autocmd_colorscheme_loaded")
	let autocmd_colorscheme_loaded = 1
	autocmd ColorScheme * highlight yuriTodo ctermfg=Red
	autocmd ColorScheme * highlight yuriNote ctermfg=LightGreen
	autocmd ColorScheme * highlight yuriImportant ctermfg=3
	autocmd ColorScheme * highlight yuriStudy ctermfg=2
	autocmd ColorScheme * highlight jsConsoleLog ctermfg=9
endif

set background=dark
colorscheme solarized

"set rtp+=/home/arrayjam/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2

" Do not back up temporary files.
set backupskip=/tmp/*,/private/tmp/*"

" Store backup files in one place.
set backupdir=$HOME/.vim/backup//

" Store swap files in one place.
set dir=$HOME/.vim/swap//

" Store undo files in one place.
set undodir=$HOME/.vim/undo//

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

highlight SignColumn ctermbg=none
highlight VertSplit ctermbg=black ctermfg=61
highlight LineNr ctermbg=none

set hidden

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=none
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0


let g:ctrlp_map = '\'
let g:ctrlp_follow_symlinks = 1
nmap <C-\> :CtrlPMixed<CR>
nmap <M-\> :CtrlPClearAllCaches<CR>
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" set wildignore+=node_modules/*

nmap <M-\> :Ag
" let g:user_emmet_leader_key = "<c-e>"
let g:user_emmet_settings = {"html":{"indentation":""}}


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
let g:airline_section_warning = ""
let g:airline_section_c = ""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

nnoremap <Tab> :e #<CR>
nnoremap <Esc>1 :b1<CR>
nnoremap <Esc>2 :b2<CR>
nnoremap <Esc>3 :b3<CR>
nnoremap <Esc>4 :b4<CR>
nnoremap <Esc>5 :b5<CR>
nnoremap <Esc>6 :b6<CR>
nnoremap <Esc>7 :b7<CR>
nnoremap <Esc>8 :b8<CR>
nnoremap <Esc>9 :b9<CR>
nnoremap <Esc>0 :b10<CR>

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

let syntastic_mode_map = { "passive_filetypes": ["html"] }

let g:slime_target = "tmux"

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_tex_chktex_showmsgs = 0


let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

nmap <esc>; <C-w><C-w>
imap <esc>; <Esc><C-w><C-w>

if has("autocmd")
	if v:version > 701
		autocmd Syntax * call matchadd('yuriTodo', 'TODO')
		autocmd Syntax * call matchadd('yuriNote', 'NOTE')
		autocmd Syntax * call matchadd('yuriImportant', 'IMPORTANT')
		autocmd Syntax * call matchadd('yuriStudy', 'STUDY')
		autocmd Syntax * call matchadd('jsConsoleLog', 'console.log')
	endif
endif

let g:rsi_no_meta = 1

set cino=(0

let g:tex_flavor='latex'

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" map <space> <Plug>(easymotion-s2)
map <space> <Plug>(easymotion-s)
vmap <space> <Plug>(easymotion-s)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

let g:EasyMotion_keys = 'arsdheiqwfpgjluyzxcvbkmtno'

" JK motions: Line motions
map <Leader><C-n> <Plug>(easymotion-j)
map <Leader><C-p> <Plug>(easymotion-k)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

onoremap an :<c-u>call <SID>NextTextObject('a')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i')<cr>

function! s:NextTextObject(motion)
  echo
  let c = nr2char(getchar())
  exe "normal! f".c."v".a:motion.c
endfunction

let hlstate=0
nnoremap <F4> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

