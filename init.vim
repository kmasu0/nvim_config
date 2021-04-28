"-------------------------------------------
" plugins install
"-------------------------------------------
" [ dein ]
if &compatible
  set nocompatible
endif

if (has("termguicolors"))
  set termguicolors
endif

set rtp+=$HOME/.fzf
set rtp+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim
set termguicolors

if dein#load_state($HOME . '/.config/nvim/dein')
  let g:dein#cache_directory = $HOME . '/.cache/dein'
  call dein#begin($HOME . '/.config/nvim/dein')

  call dein#add($HOME . '/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  let s:toml_dir  = $HOME . '/.config/nvim/dein/toml' 
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" [ netrw ]
let g:netrw_liststyle = 3
let g:netrw_sizestyle = "H"
let g:netrw_timefmt   = "%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_banner    = 0
let g:netrw_preview   = 1
let g:netrw_winsize   = 30

"-------------------------------------------
" nvim setting
"-------------------------------------------
set nocompatible

set nobackup
set nowritebackup
set shortmess+=c

set signcolumn=yes

set ttimeoutlen=50
set updatetime=200

" window visual
set title
set number
set numberwidth=5
" set cursorline
set nocursorline
set nocursorcolumn
set laststatus=2
set cmdheight=2
set showmatch
set ruler
" set list
" set listchars=tab:▸\ ,eol:↲,extends:»,precedes:«,nbsp:%
" set listchars=tab:▸\ 
set showcmd

" cursor move
set scrolloff=2
set sidescroll=10
"set smartindent 

" terminal
set sh=zsh
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <A-c> <C-\><C-n>

" file process
set confirm
set noswapfile
set autoread
set nowrap

" search
set hlsearch
set incsearch
set ignorecase
set wrapscan
" set gdefault

" tab/indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartcase
set smarttab
set matchpairs+=<:>

" commandline mode
set wildmenu wildmode=list:longest,full
set history=3000

" beap
set visualbell t_vb=
set noerrorbells

" other
" set matchpairs& matchpairs+=<:>
set infercase
set cursorline
set tags=tags

set guifont=RobotoMono\ Nerd\ Font\ Mono\ Regular

" user set command
augroup QuickFixCmd
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

" Enable local setting file '.vimrc.local'
function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" Emacs like shorcut
" inoremap <C-k> <Right><ESC>Da
inoremap <C-d> <Del>

inoremap <C-a>  <Home>
inoremap <C-e>  <End>
inoremap <C-b>  <Left>
inoremap <C-f>  <Right>
inoremap <C-n>  <Down>
inoremap <C-p>  <UP>

inoremap <C-c> <ESC>
nnoremap gb `.zz
nnoremap <C-g> g;

" for ctags
nnoremap <C-]> g<C-]>
inoremap <C-]> <ESC>g<C-]>

" cursor shape
set guicursor=n-v-c-sm:block,i-ci:ver20-blinkon100

let g:terminal_color_0  = "#1b2b34" "black
let g:terminal_color_1  = "#ed5f67" "red
let g:terminal_color_2  = "#9ac895" "green
let g:terminal_color_3  = "#fbc963" "yellow
let g:terminal_color_4  = "#669acd" "blue
let g:terminal_color_5  = "#c695c6" "magenta
let g:terminal_color_6  = "#5fb4b4" "cyan
let g:terminal_color_7  = "#c1c6cf" "white
let g:terminal_color_8  = "#65737e" "bright black
let g:terminal_color_9  = "#fa9257" "bright red
let g:terminal_color_10 = "#343d46" "bright green
let g:terminal_color_11 = "#4f5b66" "bright yellow
let g:terminal_color_12 = "#a8aebb" "bright blue
let g:terminal_color_13 = "#ced4df" "bright magenta
let g:terminal_color_14 = "#ac7967" "bright cyan
let g:terminal_color_15 = "#d9dfea" "bright white
let g:terminal_color_background="#1b2b34" "background
let g:terminal_color_foreground="#c1c6cf" "foreground
