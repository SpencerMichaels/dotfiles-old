" INITIALIZATION {{{
    call plug#begin('~/.config/nvim/plugged')

    Plug 'easymotion/vim-easymotion'
    Plug 'jnurmine/Zenburn'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'lervag/vimtex'

    "Plug 'jaawerth/neomake-local-eslint-first'
    "Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
    "Plug 'neomake/neomake', { 'on': 'Neomake' }
    "Plug 'Shougo/unite.vim'
    "
    Plug 'rust-lang/rust.vim'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "Plug 'Shougo/deoplete.nvim'
    "Plug 'zchee/deoplete-clang'
    "Plug 'zchee/deoplete-jedi'
    "Plug 'carlitux/deoplete-ternjs'

    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --clang-completer --racer-completer', 'frozen': 1 }

    call plug#end()
" }}}

" AIRLINE {{{
    let g:airline_powerline_fonts = 1       " Use Powerline fonts
    let g:airline_theme='zenburn'           " Zenburn theme
" }}}

" LATEX {{{
    " Check spelling with US English and CJK dictionaries
    autocmd FileType tex setlocal spell spelllang=en_us,cjk
    " Cleanup TeX build files when Vim closes
    autocmd FileType tex :autocmd! VimLeave * :VimtexClean
    " Conceal math characters
    autocmd FileType tex set cole=2

    if has("macunix")
        " Use TeXShop for PDF rendering (Preview can't do continuous mode)
        let g:vimtex_view_general_viewer = '/Applications/TeX/TeXShop.app/Contents/MacOS/TeXShop'
    endif

    let g:vimtex_latexmk_continuous = 1     " Recompile when file changes
    let g:tex_flavor='latex'                " plaintex = tex
    let g:tex_conceal='adgm'                " Prettify Unicode
" }}}

" NEOMAKE {{{
    " Use ESLint for JS linting
    let g:neomake_javascript_enabled_makers = ['eslint']

    " Syntax-check the current file after every write
    "autocmd BufWritePost * Neomake
" }}}

" NEOSNIPPET {{{
    " Set config directory
    let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'
" }}}

" YOUCOMPLETEME {{{
    " Autoclose the function preview window after choosing a completion option
    let g:ycm_autoclose_preview_window_after_insertion=1
    " Don't ask for confirmation to load .ycm_extra_conf.py
    let g:ycm_confirm_extra_conf=0
    " Rust source files
    let g:ycm_rust_src_path=system('rustc --print sysroot')[:-2] . '/lib/rustlib/src/rust/src/'
" }}}
