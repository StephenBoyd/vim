set nocompatible
set t_Co=256
syntax enable
set expandtab
set tabstop=2
retab
set number
set autoindent
set smartindent
set shiftwidth=2 " it's the Ruby way.
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
set noswapfile "I'm never dealing with swapfiles again. I just save often

" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of
" extra
" whitespace
set pastetoggle=<F7>

"pretty colors like Sublime Text. Slate is also a decent choice.
colorscheme slate
colorscheme molokai

"this changed my life.
nnoremap ; :

"the l is so the cursor doesn't move when I change modes
imap jk <Esc>l

"this lets me use ctrl+C to copy selection to a buffer file
map <C-c> y:'<,'>w! ~/.vimbuffer <CR> 
"and this lets me paste that buffer with ctrl+V
map <C-p> :r ~/.vimbuffer <CR>

"fast saving!
nnoremap '; :w <CR>

"fast saving in insert mode
imap '; <Esc>l:w<CR>

"use enter to select from wildmenu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. From github.com/valloris
cnoremap w!! w !sudo tee % >/dev/null

" This makes j and k work on "screen lines" instead of on "file lines"; now,
" when we have a long line that wraps to multiple screen lines, j and k behave
" as we expect them to.
nnoremap j gj
nnoremap k gk

" Highlight Class and Function names
function! s:HighlightFunctionsAndClasses()
  syn match cCustomFunc      "\w\+\s*\((\)\@="
  syn match cCustomClass     "\w\+\s*\(::\)\@="
  hi def link cCustomFunc      Function
  hi def link cCustomClass     Function
endfunction
autocmd Syntax * call s:HighlightFunctionsAndClasses()

" Different highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()
