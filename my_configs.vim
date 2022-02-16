""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'uplus/deoplete-solargraph'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'leafgarland/typescript-vim'


let g:deoplete#enable_at_startup = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:dracula_colorterm = 0
let g:dracula_italic = 0
colorscheme dracula

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Fix for auto-indenting pasted text in tmux
if &term =~ "screen"
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  exec "set t_PS=\e[200~"
  exec "set t_PE=\e[201~"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruler, Cursor, Numbers, Folds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorcolumn
set colorcolumn=100
set number
noremap pbc :w !pbcopy<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelling & Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal nospell spelllang=en_ca
" FIXME
autocmd FileType Markdown setlocal spell nofoldenable
autocmd FileType gitcommit setlocal spell spelllang=en_ca

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search & Replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <Leader>r :noautocmd %s/<C-r><C-w>/<C-r><C-w>/gc

" Remove trailing white spaces
nnoremap <Leader>ws :%s/\s\+$// <CR>

 "display tabs and trailing spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
set nolist

"recalculate the trailing whitespace warning when idle, and after saving
:autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp & MRU & Autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|log)$'
set tags=./tags,tags;$HOME
let g:easytags_dynamic_files = 1

" set max length for the mru file list
let g:mru_file_list_size = 7 " default value"

" value  set path pattens that should be ignored
let g:mru_ignore_patterns = 'fugitive\|\.git/\|\_^/tmp/|^/log/|tags|' " default value"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
autocmd FileType MRU setlocal nospell

" Default sort bufexplorer by mru
let g:bufExplorerSortBy='mru'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Show NERDTree on the lef
let g:NERDTreeWinPos = "left"
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
nnoremap <Leader>rt :execute "Dispatch bundle exec spring rspec %:" . line(".")<CR>
nnoremap <Leader>rtt :execute "Dispatch bundle exec spring rspec %"<CR>
nnoremap <Leader>rl :execute "Dispatch bundle exec rubocop -a %"<CR>

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\  'markdown': ['remark-lint'],
\  'avro': ['jsonlint', 'prettier']
\}

let js_fixers = ['eslint', 'prettier']

let g:ale_fixers= {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'avro': ['prettier'],
\  'javascript': js_fixers,
\  'markdown': ['remark-lint'],
\  'ruby': ['rubocop'],
\  'typescript': js_fixers
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  SnipMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:snipMate = { 'snippet_version' : 1 }
