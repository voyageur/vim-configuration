" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set tabstop=4
set shiftwidth=4
set nowrapscan
set ignorecase
set smartcase

" Completion
set tags=../tags,./tags
map <C-K> <C-]>
map <C-l> <C-T>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters
  au FileType text setlocal tw=78
  " For XML files, indent with 2 spaces
  au FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

runtime ftplugin/man.vim

set background=dark
