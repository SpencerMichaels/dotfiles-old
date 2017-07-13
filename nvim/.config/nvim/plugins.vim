" INITIALIZATION {{{
    filetype off
    set rtp+=/usr/local/opt/fzf

    call plug#begin('~/.config/nvim/plugged')

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
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --clang-completer --racer-completer', 'frozen': 1 }

    " Language-specific
    Plug 'rust-lang/rust.vim'
    Plug 'lervag/vimtex'
    Plug 'justinmk/vim-syntax-extra'
    " Plug 'keith/swift.vim'
    " Plug 'tmux-plugins/vim-tmux'

    "Colors
    Plug 'jnurmine/Zenburn'
    Plug 'morhetz/gruvbox'

    call plug#end()

    filetype plugin indent on
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

" YOUCOMPLETEME {{{
    " Autoclose the function preview window after choosing a completion option
    let g:ycm_autoclose_preview_window_after_insertion=1
    " Don't ask for confirmation to load .ycm_extra_conf.py
    let g:ycm_confirm_extra_conf=0
    " Rust source files
    let g:ycm_rust_src_path=system('rustc --print sysroot')[:-2] . '/lib/rustlib/src/rust/src/'
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

" RAINBOW PARENTHESES {{{
	" TODO: Fix this
	" let g:rbpt_colorpairs = [
	"     \ ['brown',       'RoyalBlue3'],
	"     \ ['Darkblue',    'SeaGreen3'],
	"     \ ['darkgray',    'DarkOrchid3'],
	"     \ ['darkgreen',   'firebrick3'],
	"     \ ['darkcyan',    'RoyalBlue3'],
	"     \ ['darkred',     'SeaGreen3'],
	"     \ ['darkmagenta', 'DarkOrchid3'],
	"     \ ['brown',       'firebrick3'],
	"     \ ['gray',        'RoyalBlue3'],
	"     \ ['darkmagenta', 'DarkOrchid3'],
	"     \ ['Darkblue',    'firebrick3'],
	"     \ ['darkgreen',   'RoyalBlue3'],
	"     \ ['darkcyan',    'SeaGreen3'],
	"     \ ['darkred',     'DarkOrchid3'],
	"     \ ['red',         'firebrick3'],
	"     \ ]

	augroup rainbow
		au VimEnter * RainbowParenthesesToggle
		au Syntax * RainbowParenthesesLoadRound
		au Syntax * RainbowParenthesesLoadSquare
		au Syntax * RainbowParenthesesLoadBraces
	augroup END
" }}}
