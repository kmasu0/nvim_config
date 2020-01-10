"-------------------------------------------
" plugins install
"-------------------------------------------
" [ dein ]
if &compatible
  set nocompatible
endif

let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim
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

call dein#add($HOME . '/.config/nvim/dein/plugins/vim-scripts/gtags.vim')

"-------------------------------------------
" denite
noremap [denite] <Nop>
nmap <Leader>f [denite]
nnoremap <silent> [denite]x :<C-u>DeniteBufferDir -cursor-wrap=true filetype<CR>
nnoremap <silent> [denite]l :<C-u>DeniteBufferDir -cursor-wrap=true line<CR>
nnoremap <silent> [denite]g :<C-u>DeniteBufferDir -cursor-wrap=true grep<CR>
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir -cursor-wrap=true file file:new<CR>
nnoremap <silent> [denite]r :<C-u>DeniteBufferDir -cursor-wrap=true register<CR>
nnoremap <silent> [denite]m :<C-u>DeniteBufferDir -cursor-wrap=true menu<CR>
nnoremap <silent> [denite]o :<C-u>DeniteBufferDir -cursor-wrap=true file/rec<CR>

let s:menus = {}
let s:menus.file = {'description': 'File search (buffer, file, file/rec, file_mru'}
let s:menus.line = {'description': 'Line search (change, grep, line, tag'}
let s:menus.others = {'description': 'Others (command, command_history, help)'}
let s:menus.file.command_candidates = [
      \ ['buffer', 'Denite buffer'],
      \ ['file: Files in the current directory', 'Denite file'],
      \ ['file/rec: Files, recursive list under the current directory', 'Denite file/rec'],
      \ ['file_mru: Most recently used files', 'Denite file_mru']
      \ ]
let s:menus.line.command_candidates = [
      \ ['change', 'Denite change'],
      \ ['grep :grep', 'Denite grep'],
      \ ['line', 'Denite line'],
      \ ['tag', 'Denite tag']
      \ ]
let s:menus.others.command_candidates = [
      \ ['command', 'Denite command'],
      \ ['command_history', 'Denite command_history'],
      \ ['help', 'Denite help']
      \ ]

call denite#custom#var('menu', 'menus', s:menus)


call denite#custom#option('default', 'prompt', '>')
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')

call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')

call denite#custom#map('insert', '<C-o>', '<denite:enter_mode:normal>')
if executable('ag')
  call denite#custom#var('file_rec', 'command',
        \ ['ag', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['ag'])
endif

"-------------------------------------------
" nerdtree
" let g:NERTTreeShowBookmarks=1
" let g:NERDTreeShowHidden = 1
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map <C-l> :NERDTreeTabsToggle<CR>
"-------------------------------------------
"  nerdtree-tabs
if argc() == 0
    let g:nerdtree_tabs_open_on_console_startup = 1
end
"-------------------------------------------
" [ nerdtree-git-plugin ]
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"-------------------------------------------
" airline
"-------------------------------------------
" let g:airline_section_a = airline#section#create(['mode', 'crypt'])
set ttimeoutlen=50
set updatetime=200
"-------------------------------------------
" nvim setting
"-------------------------------------------
set nocompatible

set nobackup
set nowritebackup
set shortmess+=c

set signcolumn=yes

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
