"hard wrap
"set textwidth=72

" soft wrap
set wrap 

" numbered rows
set number 

"""""""""""""""""""""""""""""""""""""""""" INDENTING OPTIONS 

" new lines inherit the indentation of previous lines
set autoindent

" sets number of spaces to 4 inserted when using autoindent
set shiftwidth=4

" insert 4 spaces as a tab, as opposed to the default 8
set tabstop=4

" tabs 'feel' like 4 spaces, regardless of what tabstop is set to
set softtabstop=4

" numbered row column has a length of 1
set numberwidth=1 

" insert blanks according to 'shiftwidth' 
set smarttab

"""""""""""""""""""""""""""""""""""""""""" END OF INDENTING OPTIONS 
"""""""""""""""""""""""""""""""""""""""""" SEARCH OPTIONS

" enable search highlighting
set hlsearch

" ignore case when searching
set ignorecase

" incremental search that shows partial matches
set incsearch

" switch to case-sensitive search when search query contains an uppercase letter
set smartcase

"""""""""""""""""""""""""""""""""""""""""" END OF SEARCH OPTIONS

" increase the undo limit
set history=1000

" set a leader
:let mapleader = "-"

" press Ctrl+u to uppercase a word in normal and visual modes
" noremap makes mappings non-recursive
inoremap <leader><c-u> <esc>viwU
nnoremap <leader><c-u> viwU

augroup gitsetup
  autocmd!
  
  " these commands apply to fields with the .gitcommit extension
  autocmd BufNewFile,BufRead *.gitcommit setlocal filetype=gitcommit

  " only set this command for git commits
  " the first line in a file will hard wrap at 50 chars, else 72
  autocmd FileType gitcommit
	\ hi def link gitcommitOverflow Error
	\| autocmd CursorMoved,CursorMovedI *
	\ let &textwidth= line(".") == 1 ? 50 : 72
augroup END
