"++++++++++++++++++++++++++++++++ Appearance +++++++++++++++++++++++++++++++++"
" Syntax
syntax on
" Default colors
colorscheme codedark
set background=dark
highlight Normal ctermbg=black 
highlight EndOfBuffer ctermbg=black
" Line number settings
set number 
set ruler
highlight LineNr ctermbg=black
" Column delimiter settings
set colorcolumn=80
highlight colorcolumn ctermbg=234
" Theme toggle function
let g:LightTheme = 0
function! ToggleTheme()  
    if g:LightTheme
        let g:LightTheme = 0
        colorscheme codedark
        set background=dark
        highlight Normal ctermbg=black
        highlight EndOfBuffer ctermbg=black
        highlight colorcolumn ctermbg=234
        highlight LineNr ctermbg=black
    else 
        let g:LightTheme = 1
        colorscheme PaperColor
        set background=light
        highlight colorcolumn ctermbg=lightgray
    endif
endfunction
map <F8> :call ToggleTheme()<CR>
"+++++++++++++++++++++++++++++++++ Behaviour +++++++++++++++++++++++++++++++++"
" Space tab settings
filetype indent plugin on
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" Change tab bindings (alt+j/alt+k)
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :tabp<CR>
nnoremap <M-k> :tabn<CR>
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
set showcmd
set hlsearch
set nobackup
set incsearch
set smartcase
set noswapfile
set smartindent
set noerrorbells
"+++++++++++++++++++++++++++++ Netrw (file menu) +++++++++++++++++++++++++++++"
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
"+++++++++++++++++++++++++++++++++++ Notes +++++++++++++++++++++++++++++++++++"
" Find string in files
" :vim foo **/*.js | copen   ()
"
" Move current tab to [i]
" :tabm [i]
"
" Filetype specific identation
" set Filetype [TYPE] tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

