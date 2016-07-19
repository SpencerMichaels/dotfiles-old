call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-rooter'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'neomake/neomake', { 'on': 'Neomake' }
"Plug 'jceb/vim-orgmode'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'rhysd/vim-clang-format'
"Plug 'Rip-Rip/clang_complete' ", { 'do': 'make install' }
"Plug 'Shougo/deoplete.nvim'
"Plug 'Shougo/unite.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc', { 'do': 'make' }
"Plug 'sts10/vim-mustard'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --all', 'frozen': 1 }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'zchee/deoplete-clang'
"Plug 'zchee/deoplete-jedi'

call plug#end()

" Colorscheme
"colors solarized
colors zenburn
" True colors
if has("nvim")
    set termguicolors
endif

" Leader = ,
let g:mapleader=','
" File-local leader = \
let g:maplocalleader='\\'

" Replace : with ;
nnoremap ; :
nnoremap : ;

" Ctrl-P
nnoremap <C-p> :Unite file_rec/async<cr>

" Buffer switching
nnoremap <space>s :Unite -quick-match buffer<cr>

" Prettify Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='zenburn'
" Tab bar
"let g:airline#extensions#tabline#enabled = 1

" GUI font
if exists("neovim_dot_app")
    call MacSetFont("Hack", 12)
endif

" Show line numbers
set number

" Prettify characters when possible
set conceallevel=1
" Conceal the cursor line in normal and visual mode only
set concealcursor=nv

" Replace tabs with spaces
set expandtab
" 4 tabs per space
set tabstop=4
" 4 spaces per shift
set shiftwidth=4

" Ignore case in searcehs unless the search string contains uppercase chars
set smartcase

" deoplete clang libs (for Mac)
"let g:deoplete#sources#clang#libclang_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib"
"let g:deoplete#sources#clang#libclang_header="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"

"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
"inoremap <Leader><Tab> <Space><Space>

" Neosnippet config
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'

" YCM
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_confirm_extra_conf=0

" LaTeX
"autocmd FileType tex setlocal spell spelllang=en_us,cjk
autocmd FileType tex :autocmd! VimLeave * :VimtexClean
autocmd FileType tex :set ai nocin nosi inde=
autocmd FileType tex :set tw=80 fo+=t
" Pretty unicode in Latex
let g:tex_conceal='adgm'
autocmd FileType tex set cole=2
autocmd FileType tex :let g:syntastic_quiet_messages = { "level": "warnings" }
let g:SuperTabDefaultCompletionType='context'
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = '/Applications/TeX/TeXShop.app/Contents/MacOS/TeXShop'
let g:vimtex_latexmk_continuous = 1
let g:vimtex_quickfix_ignore_all_warnings = 1
" plaintex = tex
let g:tex_flavor='latex'

function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>sw :call StripWhitespace()<CR>
