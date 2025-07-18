set nocompatible  " disable compatibility with vi which can cause unexpected issues
set regexpengine=2  " set default regexp engine to nfa
set noswapfile  " do not use swapfile for buffer
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab shiftround  " set default indentation
set showmatch  " show matching brackets
set splitbelow splitright  " preferred split behaviour
set title  " set the window title
set visualbell  " use visual bell instead of beeping
set ignorecase  " ignore case in search patterns
set smartcase  " override the 'ignorecase' option if the search pattern contains upper case characters
set matchpairs+=<:>  " additional character that form pairs
set background=dark  " dark bg
set autoread  " auto read file change and indentation
set autoindent  " auto copy indent
set incsearch  " show matches when typing
set hlsearch  " highlight all matches
set wildmenu  " enable auto completion menu after pressing tab.
set history=10000  " max history
set list  " enable list mode that set the characters for the invisibles
set lcs=tab:>\ ,trail:-,nbsp:+  " set the characters for the invisibles
let &showbreak='+++ '  " string to put at the start of lines that have been wrapped
" navigate within command mode like Emacs
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" pattern grep
nnoremap <Space>g :vimgrep //f **<S-Left><S-Left><Right>
vnoremap <Space>g "0y:vimgrep /<C-r>=escape(@0,'/\')<CR>/f **<S-Left><Left><Left><Left>
nnoremap <Space>G :vimgrep /<C-r><C-w>/f **
vnoremap // "0y/\V<C-r>=escape(@0,'/\')<CR><CR>
" find and replace
nnoremap <Space>r :%s/<C-r><C-w>//gI<Left><Left><Left>
vnoremap <Space>r "0y:%s/<C-r>=escape(@0,'/\')<CR>//gI<Left><Left><Left>
" yank marked text/paste to/from global register
nnoremap <Space>Y "+Y
vnoremap <Space>y "+y
nnoremap <Space>p "+p
nnoremap <Space>P "+P
vnoremap <Space>p "+p
" move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
