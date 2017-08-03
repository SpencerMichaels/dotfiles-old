" Text Writing, copped straight from Dr. Bunsen
func! WordProcessorMode()
    setlocal expandtab
    setlocal spell spelllang=en_us
    setlocal spell
    setlocal nolist
    setlocal linebreak
    setlocal showbreak=
    set complete+=s
    set formatprg=par
    set formatoptions+=t
    set formatoptions-=l
	set textwidth=79
    syntax spell toplevel
endfu
com! WP call WordProcessorMode()

" Filetype-specific settings
augroup filetxt_txt
    autocmd!
    autocmd BufEnter,BufNewFile,BufRead *.txt call WordProcessorMode()
augroup END

augroup filetype_md
    autocmd!
    autocmd BufEnter,BufRead,BufNewFile *.md call WordProcessorMode()
augroup END

augroup filetype_tex
    autocmd!
    autocmd BufEnter,BufRead,BufNewFile *.tex call WordProcessorMode()
augroup END

augroup filetype_pde
    autocmd!
    autocmd BufEnter,BufRead,BufNewFile *.pde setf java
augroup END

"Remove auto comment
augroup remove_autocomment
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

augroup filetype_js
    autocmd!
    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
augroup END

" Wrap text to 72 chars in git commit messages
au FileType gitcommit set tw=72 fo-=l fo+=t
