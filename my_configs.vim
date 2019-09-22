"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable set background=dark
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
set colorcolumn=120
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelling & Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal nospell spelllang=en_ca
autocmd FileType Markdown setlocal spell
autocmd FileType Markdown setlocal nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search & Replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>r :noautocmd %s/<C-r><C-w>/<C-r><C-w>/gc

" Remove trailing white spaces
nnoremap <Leader>w :%s/\s\+$// <CR>

 "display tabs and trailing spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
set nolist

"recalculate the trailing whitespace warning when idle, and after saving
:autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp & MRU
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set tags=./tags,tags;$HOME
let g:autotagTagsFile=".tags"

" set max length for the mru file list
let g:mru_file_list_size = 7 " default value"
"value  set path pattens that should be ignored
let g:mru_ignore_patterns = 'fugitive\|\.git/\|\_^/tmp/|^/log/' " default value"
autocmd FileType MRU setlocal nospell

let g:bufExplorerSortBy='mru'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_function': { 'filename': 'LightlineFilename' },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Dispatch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <Leader>rt :execute "Dispatch bundle exec rspec %:" . line(".")<CR>
nnoremap <Leader>rtt :execute "Dispatch bundle exec rspec %"<CR>
nnoremap <Leader>rl :execute "Dispatch bundle exec rubocop -a %"<CR>
