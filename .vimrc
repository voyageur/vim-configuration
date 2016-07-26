syntax on
set background=dark

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
if has("mouse")
  set mouse=a		" Enable mouse usage (all modes)
endif

"set autochdir
set wildmenu
set hlsearch

" Closer to <C-k> (see cscope plugin)
nmap <C-l> <C-t>

" open file under cursor
map <F3> <C-w>gf<CR>

"Switch C/H
"map <F5> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<cr>
function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "c")
    find %:t:r.h
  else
    find %:t:r.c
  endif
endfunction

nmap <F5> :call SwitchSourceHeader()<CR>

"Completion
set completeopt=longest,menu,preview

"XML tags fun with %
runtime macros/matchit.vim

execute pathogen#infect()

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python', 'pep8']

"set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
