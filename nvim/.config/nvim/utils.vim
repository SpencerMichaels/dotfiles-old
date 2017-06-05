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
