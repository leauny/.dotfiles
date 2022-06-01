" 基础设置

" 设置TrueColor支持(在tmux中或早期nvim中可能会出错), 可以使用如下命令测试
" curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash

set termguicolors
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endi

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible
filetype on
" filetype indent on
filetype plugin on
syntax on                  " Enable syntax highlighting.
set encoding=utf-8
set pastetoggle=<LEADER><C-p> " 避免粘贴时格式错乱 (paste模式切换)
set mouse=a                " 鼠标模式
set nu                     " Set number on
set relativenumber         " 相对行号
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set cindent

set autochdir              " 使得vim执行操作时总在当前目录下
set backspace=indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus=2           " Always show statusline.
set display=lastline       " Show as much as possible of the last line.
set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

" 查找中高亮
set incsearch              
" 查找高亮
set hlsearch 
" 忽略大小写
set ignorecase
" 智能大小写
set smartcase

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set cursorline             " 游标线
set wrapscan               " Searches wrap around end-of-file.(自动换行)
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.

set wildmenu               " 显示提示

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif



