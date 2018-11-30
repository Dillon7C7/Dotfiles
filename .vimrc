"hard wrap
"set textwidth=72

"soft wrap
set wrap 

"numbered rows
set number 

"numbered row column has a length of 1
set numberwidth=1 

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
