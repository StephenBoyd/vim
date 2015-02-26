set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Plugins. Place between here are filetype plugin indent on

set t_Co=256 "lets vim use 256 color mode
filetype plugin on
filetype indent on
syntax enable
set expandtab
set tabstop=2
set number
set autoindent
set softtabstop=2
set smartindent
set shiftwidth=2 " it's the Ruby way.
set shiftround
retab
set smartcase
set ruler
set wildmode=longest:full
set wildmenu
set history=1000
set scrolloff=3
set autochdir
set viminfo='20,<50,s10,h,%
set mouse=a       "enables mouse. dragging selection enters visual mode
set incsearch
set ignorecase
set nohlsearch
set noswapfile    "I'm never dealing with swapfiles again. I just save often

" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of
" extra
" whitespace
set pastetoggle=<F7>

"pretty colors like Sublime Text. Slate is also a decent choice.
colorscheme slate
colorscheme monkey

"this changed my life.
nnoremap ; :

"the l is so the cursor doesn't move when I change modes
"unlike jj, typing jk in normal mode doesn't move the cursor 
inoremap jk <Esc>l

"this lets me use ctrl+C to copy selection to a buffer file
nnoremap <C-c> y:'<,'>w! ~/.vimbuffer <CR> 
vnoremap <C-c> y:'<,'>w! ~/.vimbuffer <CR> 
"and this lets me paste that buffer with ctrl+V
nnoremap <C-p> :r ~/.vimbuffer <CR>
 
"fast saving!
nnoremap '; :w <CR>

"fast saving in insert mode
inoremap '; <Esc>:w <CR>l

"use enter to select from wildmenu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. From github.com/valloric
cnoremap w!! w !sudo tee % >/dev/null

" This makes j and k work on "screen lines" instead of on "file lines"; now,
" when we have a long line that wraps to multiple screen lines, j and k behave
" as I expect them to.
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
" This doesn't work right now.
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()

" Disable arrow keys in normal mode, for training.
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" alt-J to scroll down. K for up.
nnoremap <A-j> 3<C-e>
nnoremap <A-k> 3<C-y>

" shift-J to move cursor down 3 lines. K for up.
nnoremap <S-j> 3j
nnoremap <S-k> 3k
vnoremap <S-j> 3j
vnoremap <S-k> 3k

"shift-L to go right a word. shift-H to go left
nnoremap <S-h> b
nnoremap <S-l> w
vnoremap <S-h> b
vnoremap <S-l> w

" ctrl-l  to go to end of line. ctrl- h to go to beginning
nnoremap <C-l> $
nnoremap <C-h> 0
vnoremap <C-l> $
vnoremap <C-h> 0

" space 0, space 9, space 8 to go to top, middle, or bottom of page
" respectively
nnoremap <Space>0 H
nnoremap <Space>9 M
nnoremap <Space>8 L

"Since I disabled the up and down keys anyway...
"Up to increment number under the curser.
"Down to decrement
"I use screen a lot, so Ctrl-A is a problem.
nnoremap <Up> <C-A>
nnoremap <Down> <C-X>

"Disabling mouse for moving the cursor,
"because the habit's been slowing me down.
"replace it with a global search for function definition,
"which should only work with cscope or ctags
"right-click goes to a list of all references to the token.
nnoremap <RightMouse> <nop>
inoremap <LeftMouse> <nop>
inoremap <RightMouse> <nop>
nnoremap <LeftMouse> <nop>

"the next 3 changes are for displaying the syntax group of the
"word under the cursor. helpful when making a colorscheme.
" adds to statusline
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}
" a little more informative version of the above
"nmap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
"    if !exists("*synstack")
"        return
"    endif
"    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc
