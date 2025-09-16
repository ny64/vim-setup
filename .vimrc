" APPEARANCE
" Syntax
syntax on
" Default colors
colorscheme monokai_pro
set background=dark
" Line number settings
set number 
set ruler
" Column delimiter settings
set colorcolumn=80
" Italic comments
highlight Comment cterm=italic gui=italic
" Force black background
"highlight Normal guibg=black guifg=white
"set background=dark
" Theme toggle function
let g:LightTheme = 0
function! ToggleTheme()  
    if g:LightTheme
        let g:LightTheme = 0
        colorscheme monokai_pro
        set background=dark
    else 
        let g:LightTheme = 1
        colorscheme PaperColor
        set background=light
    endif
endfunction
map <F8> :call ToggleTheme()<CR>

" BEHAVIOUR
" Space tab settings
filetype indent plugin on
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" Change tab bindings (alt+j/alt+k)
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :tabp<CR>
nnoremap <M-k> :tabn<CR>
" Fix exiting w/ CTRL+[
set timeoutlen=1000
set ttimeoutlen=5
" Auto-close brackets
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap <expr> ) 
    \strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] 
    \strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } 
    \strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> " 
    \strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>" 
inoremap <expr> ' 
    \strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
" Fix pasting from other application
set pastetoggle=<F2>
" Other
set nowb
set mouse=a
set showcmd
set hlsearch
set nobackup
set incsearch
set smartcase
set noswapfile
set smartindent
set noerrorbells

" NETRW (file menu) 
" Appearance
let g:netrw_liststyle = 3 
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
" Netrw toggle function
let g:NetrwIsOpen = 0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
map <C-Bslash> :call ToggleNetrw()<CR>

" NOTES
" Find string in files
" :vim foo **/*.js | copen   ()
"
" Move current tab to [i]
" :tabm [i]
"
" Filetype specific identation
" set Filetype [TYPE] tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

