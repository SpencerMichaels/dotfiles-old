" Plugin initialization {{{
    call plug#begin('~/.config/nvim/plugged')

    Plug 'easymotion/vim-easymotion'
    Plug 'jnurmine/Zenburn'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'lervag/vimtex'
    "Plug 'jaawerth/neomake-local-eslint-first'
    "Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
    "Plug 'neomake/neomake', { 'on': 'Neomake' }
    "Plug 'Shougo/unite.vim'
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
    Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --all', 'frozen': 1 }

    call plug#end()
" }}}

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/utils.vim
