" disable compatibility with vi which can cause unexpected issues
set nocompatible
set regexpengine=2
set noswapfile
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set shiftround
set showmatch
set splitbelow
set splitright
set title
set visualbell
set ignorecase
set smartcase
set background=dark
set autoread
set autoindent
set incsearch
set hlsearch
set wildmenu
set wildcharm=<C-z>
set history=10000
set lcs=tab:>\ ,trail:-,nbsp:+
set list
let &showbreak='+++ '
" open the quickfix window whenever a quickfix command is executed
autocmd QuickFixCmdPost [^l]* cwindow | setl cursorline
nnoremap <silent> <C-l> :nohlsearch<CR>
" command mode navigation
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-BS> <C-w>
" basic grep
nnoremap <Space>gg :vimgrep //f **<S-Left><S-Left><Right>
vnoremap <Space>gg "0y:vimgrep /<C-r>=escape(@0,'/\')<CR>/f **<S-Left><Left><Left><Left>
nnoremap <Space>gw :vimgrep /<C-r><C-w>/f **
vnoremap // "0y/\V<C-r>=escape(@0,'/\')<CR><CR>
nnoremap <Space>e :e %:h<C-z>
" find and replace
nnoremap <Space>r :%s/<C-r><C-w>//gI<Left><Left><Left>
vnoremap <Space>r "0y:%s/<C-r>=escape(@0,'/\')<CR>//gI<Left><Left><Left>
