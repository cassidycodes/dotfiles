"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruler & Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorcolumn
set colorcolumn=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelling & Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal spell spelllang=en_ca
autocmd FileType Markdown setlocal spell
autocmd FileType Markdown setlocal nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search & Replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>r :noautocmd %s/<C-r><C-w>/<C-r><C-w>/gc

" Remove trailing white spaces
nnoremap <Leader>w :%s/\s\+$// <CR>
