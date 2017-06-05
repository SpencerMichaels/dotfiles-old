" COLORS & FONT {{{
    colors zenburn                      " Use Zenburn colorscheme
    if has("nvim")
        set termguicolors               " Use true colors in the terminal
    endif
    if exists("neovim_dot_app")
        call MacSetFont("Hack", 12)     " Use 12pt Hack for Neovim.app font
    endif
" }}}

" DISPLAY {{{
    set number                  " Show line numbers
    set cursorline              " Highlight current line
" }}}

" MOVEMENT {{{
    " Move vertically by visual line
    nnoremap j gj
    nnoremap k gk

    " Disable selecting the mouse
    set mouse=
" }}}

" SPACES, TABS, AND INDENTATION {{{
    set expandtab               " Use spaces instead of tabs
    set tabstop=4               " Tabs count for 4 columns
    set softtabstop=4           " Tabs count for 4 spaces when backspacing
    set shiftwidth=4            " Shifts use 4 spaces
" }}}

" FOLDING {{{
    set foldmethod=indent       " Fold based on indentation
    set foldlevelstart=10       " Auto-fold after 10 indent levels
    set foldnestmax=10          " Nest at most 10 folds
" }}}

" SEARCH {{{
    set ignorecase  " Searches ignore case
    set smartcase   " Searches case-sensitive if they contain uppercase chars
" }}}

" UTILS {{{
    " Strip trailing whitespace in current buffer
    function! StripTrailingWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfunction
    noremap <leader>sw :call StripTrailingWhitespace()<CR>
" }}}
