"" Syntax highlighting
syntax on

" Lightline settings
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'PaperColor'
    \ }

" Colorscheme
colorscheme one
set background=light

"" Display line numbers 
set number

"" Space tab settings
" Enable auto indent
filetype indent plugin on
" Set default indentation
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" Set language specific indentation
" set Filetype python tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

"" Brackets
" Auto close brackets and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
" Skipping over closing brackets and quotes
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> "  strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"

"" Netrw settings
" List style
let g:netrw_liststyle = 3
" Remove banner
let g:netrw_banner = 0
" Open new files in own tab
" (close tab w/ [Ctrl-W c])
":tabs         list all tabs including their displayed windows
":tabm 0       move current tab to first
":tabm         move current tab to last
":tabm {i}     move current tab to position i+1
":tabn         go to next tab
":tabp         go to previous tab
":tabfirst     go to first tab
":tablast      go to last tab
let g:netrw_browse_split = 3
" Set netrw window size (25%)
let g:netrw_winsize = 25

" load vim-plug plugin
call plug#begin('~/.vim/plugged')

"" Plugins
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ap/vim-css-color'
Plug 'ajh17/VimCompletesMe'
call plug#end()

" Settings 
map <C-Bslash> :NERDTreeToggle<CR>
autocmd FileType vim let b:vcm_tab_complete = 'vim'
