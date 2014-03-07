set nocompatible
set t_Co=256
syntax enable
set expandtab
set tabstop=2
retab
set number
set autoindent
set smartindent
set shiftwidth=2
filetype indent on
set nohlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set softtabstop=2
set shiftround
filetype plugin on
set wildmode=longest:full
set wildmenu
set history=1000
set scrolloff=3
set autochdir
set viminfo='20,<50,s10,h,%
set mouse=a
set incsearch
set noswapfile

colo slate

nnoremap ; :

"the l is so the cursor doesn't move when I change modes
imap jk <Esc>l
imap Jk <Esc>
imap JK <Esc>

"this lets me use ctrl+C to copy selection to a buffer file
map <C-c> y:'<,'>w! ~/.vimbuffer <CR> 
"and this lets me paste that buffer with ctrl+V
map <C-p> :r ~/.vimbuffer <CR>

"fast saving!
nnoremap '; :w <CR>

"fast saving in insert mode
imap '; <Esc>:w<CR>

"use enter to select from wildmenu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
