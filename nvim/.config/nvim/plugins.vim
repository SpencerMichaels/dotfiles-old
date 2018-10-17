" INITIALIZATION {{{
    filetype off
    set rtp+=/usr/local/opt/fzf

    call plug#begin('~/.config/nvim/plugged')

    Plug 'majutsushi/tagbar'
    Plug 'easymotion/vim-easymotion'

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'

    Plug 'christoomey/vim-tmux-navigator'
    Plug 'wellle/targets.vim'
    Plug 'triglav/vim-visual-increment'
    Plug 'vim-scripts/bufkill.vim'
    Plug 'ap/vim-buftabline'
    Plug 'junegunn/fzf.vim'
    Plug 'Valloric/YouCompleteMe', {
                \ 'do': 'python3 install.py --clang-completer --racer-completer',
                \ 'frozen': 1 }

    Plug 'luochen1990/rainbow'
    Plug 'jiangmiao/auto-pairs'
    Plug 'jceb/vim-orgmode'

    " Language-specific
    Plug 'rust-lang/rust.vim'
    Plug 'lervag/vimtex'
    Plug 'justinmk/vim-syntax-extra'
    Plug 'keith/swift.vim'

    Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
    "Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
    "Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
    "Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
    "Plug 'Tinside/vim-hoogle', { 'for': 'haskell' }
    "Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

    Plug 'junegunn/vim-easy-align'

    Plug 'tikhomirov/vim-glsl'

    " Colors
    Plug 'jnurmine/Zenburn'
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'kaicataldo/material.vim'

    call plug#end()

    filetype plugin indent on
" }}}

" LATEX {{{
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

" YOUCOMPLETEME {{{
    " Autoclose the function preview window after choosing a completion option
    let g:ycm_autoclose_preview_window_after_insertion=1
    " Don't ask for confirmation to load .ycm_extra_conf.py
    let g:ycm_confirm_extra_conf=0
    let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
    " Rust source files
    "let g:ycm_rust_src_path=system('rustc --print sysroot')[:-2] . '/lib/rustlib/src/rust/src/'

    " Enable latex completion
    if !exists('g:ycm_semantic_triggers')
        let g:ycm_semantic_triggers = {}
    endif
    let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" }}}

" FZF {{{
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" }}}

" RAINBOW {{{
    let g:rainbow_active = 1

    let g:rainbow_conf = {
    \   'guifgs': ['gold3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold',
    \                   'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3',
    \                       'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/',
    \                           'start=/{/ end=/}/ fold', 
    \                           'start=/(/ end=/)/ containedin=vimFuncBody',
    \                           'start=/\[/ end=/\]/ containedin=vimFuncBody',
    \                           'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
" }}}
