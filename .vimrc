set nocompatible
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
retab
set nohlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set shiftround
set wildmode=longest:full
set wildmenu
set history=1000
set scrolloff=3
set autochdir
set viminfo='20,<50,s10,h,%
set mouse=a       "enables mouse. dragging selection enters visual mode
set incsearch
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
imap jk <Esc>l

"this lets me use ctrl+C to copy selection to a buffer file
map <C-c> y:'<,'>w! ~/.vimbuffer <CR> 
"and this lets me paste that buffer with ctrl+V
map <C-p> :r ~/.vimbuffer <CR>

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

" shift-J to scroll down. K for up.
nnoremap <S-j> <C-e>
nnoremap <S-k> <C-y>

"shift-L to go right a word. shift-H to go left
nnoremap <S-h> b
nnoremap <S-l> w

" space 4 to go to end of line. space 3 to go to beginning
nnoremap <Space>4 $
nnoremap <Space>3 0

" space 0, space 9, space 8 to go to top, middle, or bottom of page
" respectively
nnoremap <Space>0 H
nnoremap <Space>9 M
nnoremap <Space>8 L





"the next 3 changes are for displaying the syntax group of the
"word under the cursor. helpful when making a colorscheme.
" adds to statusline
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}

" a little more informative version of the above
nmap <C-S-P> :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
