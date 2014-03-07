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

nnoremap ; :

imap jk <Esc>
imap Jk <Esc>
imap JK <Esc>

"this is supposed to let me go to next occurence with incsearch on.
"sometimes it skips occurences.
cmap <c-n> <CR>n/<c-p>

"this lets me use ctrl+C to copy selection to a buffer file
map <C-c> y:'<,'>w! ~/.vimbuffer <CR> 
"and this lets me paste that buffer with ctrl+V
map <C-v> :r ~/.vimbuffer <CR>

"fast saving!
map lkj :w <CR>
