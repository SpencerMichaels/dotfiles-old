" Set color scheme
colorscheme gruvbox
set background=dark
set termguicolors

" Buftabline colors
hi BufTabLineActive ctermfg=DarkGreen ctermbg=Black
hi BufTabLineCurrent ctermfg=DarkBlue ctermbg=Black
hi BufTabLineHidden ctermbg=Gray ctermfg=Black
hi BufTabLineFill ctermbg=Gray ctermfg=Gray

" Always show statusline
set laststatus=2
" Disable swap files
set nobackup
set nowritebackup
set noswapfile
" Smart tab defaults
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" Auto indenting
set autoindent
set smarttab
" yank / paste to OS clipboard
set clipboard=unnamed
" mouse
set mouse=a
" Case insensitive searching
set incsearch
set ignorecase
set smartcase
" Make backspace work as indented
set backspace=indent,eol,start
" Highlight current line
set cursorline
" Don't add a space when joining a line
"set nojoinspaces
" Super fast key response times
" TODO: This seems to interfere with tmux
"set ttimeout
"set ttimeoutlen=100
" Show line numbers
set number
" Find tags file
set tags=tags;/
" set tags=./tags,tags;
" Fixes weird dinging
set visualbell
" Enable line wrapping and put && at start of linebreak
set wrap
"set showbreak=&&
set linebreak
set breakindent

" Not sure what this does
" set viminfo+=n~/.vim/viminfo

" Doesn't turn long wrapped lines into @s
set display=lastline
" Switch from unsaved buffers
set hidden
" Highlight previous search
set hlsearch

" Enable syntax highlighting
syntax on
" Turn off the stupid preview window
set completeopt-=preview

" tpope-esque statusline
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

" Make netrw look like NerdTREE
let g:netrw_liststyle=3
let g:netrw_banner=0
