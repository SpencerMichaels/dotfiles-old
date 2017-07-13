" Set leader to ,
let mapleader = ','

" Enter adds lines in normal mode
nnoremap <CR> o<Esc>
cnoremap <CR> <CR>

"j and k move down to the next text on wrapped lines not next line
map j gj
map k gk

" Y yanks from cursor to end of line
nnoremap Y y$

" Switch the default action of , to \
nnoremap \ ,

" Put the ends-of-lines keys somewhere I can actually reach
map L $
map H ^

" K breaks lines, J joins lines
nnoremap J :join!<cr>
map K i<cr><esc>

" Edit .vimrc
nnoremap <silent> <leader>ev :badd ~/.vimrc<cr>
" Source .vimrc
nnoremap <silent> <leader>sv :source ~/.vimrc<cr>
" Save quickly
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>wa :wa<cr>
nnoremap <silent> <leader>wq :wq<cr>
nnoremap <silent> <leader>q :q<cr>

" Yank whole buffer
nnoremap <leader>y ggyG
" Replace buffer with paste
nnoremap <leader>p ggVGp
" Yank filename
nnoremap <silent> <leader>Y :let @+ = expand("%:p")<cr>

" Close quickfix list
nnoremap <silent> <leader>c :ccl<cr>

" Clear highlighting
nnoremap <silent> <leader>n :nohl<cr>

" Format paragraph
nnoremap <silent> <leader>f vipgq

" Buffer Management
nnoremap <silent> <left> :bprev<CR>
nnoremap <silent> <right> :bnext<CR>
nnoremap <silent> <leader>d :BD<CR>

" Make perusing buffers a bit easier while I'm moving through them
nnoremap <silent> <up> <C-u>
nnoremap <silent> <down> <C-d>

" Quick spelling correction
nnoremap <C-f> [s1z=<c-o>
inoremap <C-f> <c-g>u<Esc>[s1z=`]A<c-g>u

" Ctag search selection lands at the top of the window rather than the middle
nnoremap <C-]> <C-]>zt

" Increment numbers
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>
vmap <leader>a <C-a>
vmap <leader>x <C-x>

" Split windows
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader>h :split<cr>

" Make heading
nnoremap <leader>1 I# <esc>
nnoremap <leader>2 I## <esc>
nnoremap <leader>3 I### <esc>

vnoremap <leader>1 I# <esc>
vnoremap <leader>2 I## <esc>
vnoremap <leader>3 I### <esc>

vnoremap <silent> <leader>1 :s/^/\#\ / <cr>
vnoremap <silent> <leader>2 :s/^/\##\ / <cr>
vnoremap <silent> <leader>3 :s/^/\###\ / <cr>

" Make ordered lists
command! -nargs=0 -range=% Number <line1>,<line2>s/^\s*\zs/\=(line('.') - <line1>+1).'. '
vnoremap <silent> <leader>l :s/^/\+\ <cr>
nnoremap <silent> <leader>l I+ <esc>
vnoremap <silent> <leader>o :Number<cr>

" Retain selection when indenting lines
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Cap word
nnoremap <leader>` gUw

" Tmux mappings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

inoremap <silent> <C-h> <C-o>:TmuxNavigateLeft<cr><esc>
inoremap <silent> <C-j> <C-o>:TmuxNavigateDown<cr><esc>
inoremap <silent> <C-k> <C-o>:TmuxNavigateUp<cr><esc>
inoremap <silent> <C-l> <C-o>:TmuxNavigateRight<cr><esc>

"zt is hard to type
nnoremap <leader>t zt

"Lets me use enter in the commandline history buffer, It's usually mapped to add lines
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

" Better CTags Support
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()

nnoremap <silent> <space>f :Files<CR>
nnoremap <silent> <space>b :Buffers<CR>
nnoremap <silent> <space>m :History<CR>
nnoremap <silent> <space>h :History:<CR>
nnoremap <silent> <space>s :History/<CR>
nnoremap <silent> <space>l :Lines<CR>
nnoremap <silent> <space>L :BLines<CR>
nnoremap <silent> <space>c :Commands<CR>
nnoremap <silent> <space>` :Marks<CR>
nnoremap <silent> <space>t :Tags<CR>
nnoremap <silent> <space>T :BTags<CR>

nnoremap <silent> <space>/ :execute 'Ag ' . input('Ag: ')<CR>
nnoremap <silent> <space>* :execute 'Ag ' . expand('<cword>')<CR>
