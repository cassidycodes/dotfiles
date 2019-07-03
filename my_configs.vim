"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
let g:dracula_colorterm = 0
let g:dracula_italic = 0
colorscheme dracula

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruler, Cursor, Numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorcolumn
set colorcolumn=80
set number

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags,tags;$HOME
let g:autotagTagsFile=".tags""
