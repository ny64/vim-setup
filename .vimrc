" Display line numbers 
set number

" Syntax highlighting and colorscheme (F8 /Shift+F8 to change light/dark theme)
syntax on
colorscheme PaperColor
set background=dark
set colorcolumn=80  " set line delimiter
highlight colorcolumn ctermbg=234
map <F8> :set background=light \| highlight colorcolumn ctermbg=lightgray<CR>
map <S-F8> :set background=dark \| highlight colorcolumn ctermbg=234<CR>

" Space tab settings
filetype indent plugin on
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Change tab bindings (alt+j/alt+k)
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :tabp<CR>
nnoremap <M-k> :tabn<CR>

" Netrw settings
let g:NetrwIsOpen = 0
function! ToggleNetrw() " netrw toggle function
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
let g:netrw_liststyle = 3 
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 25

"+++++++++++++++++++++++++++++++++++ Notes +++++++++++++++++++++++++++++++++++"
" Find string in files
" :vim foo **/*.js | copen   ()
"
" Move current tab to [i]
" :tabm [i]
"
" Filetype specific identation
" set Filetype [TYPE] tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

