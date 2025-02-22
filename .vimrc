set ruler
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set hlsearch
set ignorecase
set smartcase
set smartindent
set showmatch
set cursorline
set list
syntax on

colorscheme desert

set background=dark
set t_Co=256
set history=1000
set undolevels=1000
set undofile
set undodir=~/.vim/undo
set undoreload=10000
set undolevels=1000
set showcmd
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.doc,*.xls,*.ppt
set wildignore+=*.tmp,*.log,*.swp,*.tmp,*.tmp.*
set bex=bex

source ~/.vim/functions/InsertToSql.vim

map <F2> iOFS <ESC>




