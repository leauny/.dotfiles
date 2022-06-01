
" --------------------------------------------------------------
"							插件前置配置 
" --------------------------------------------------------------

" 此插件需要在加载前定义
so $HOME/.vim/subconfig/plugins/vim-polyglot.vim

" --------------------------------------------------------------
"							插件安装 
" --------------------------------------------------------------

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 开始插件安装
call plug#begin('~/.vim/plugged')

" ------------------------- 工具类 ----------------------------
" 文件树
Plug 'preservim/nerdtree'
" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 显示函数列表
Plug 'preservim/tagbar'
" 浏览文件编辑历史
Plug 'mbbill/undotree'
" Markdown预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" 多光标
Plug 'mg979/vim-visual-multi'
" 用指定符号包裹选中的内容
Plug 'tpope/vim-surround'
" 括号内选中
Plug 'gcmt/wildfire.vim'
" 文件查找
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }



" ------------------------- 美化类 ----------------------------
" 状态行
Plug 'vim-airline/vim-airline'
" 主题
Plug 'connorholyday/vim-snazzy'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
" 代码高亮
Plug 'sheerun/vim-polyglot'

" 结束插件安装
call plug#end()


" --------------------------------------------------------------
"							加载插件 
" --------------------------------------------------------------

so $HOME/.vim/subconfig/plugins/nord-vim.vim
so $HOME/.vim/subconfig/plugins/onedark.vim.vim
so $HOME/.vim/subconfig/plugins/vim-snazzy.vim
so $HOME/.vim/subconfig/plugins/vim-airline.vim
so $HOME/.vim/subconfig/plugins/markdown-preview.nvim.vim
so $HOME/.vim/subconfig/plugins/nerdtree.vim
so $HOME/.vim/subconfig/plugins/coc.nvim.vim
so $HOME/.vim/subconfig/plugins/tagbar.vim
so $HOME/.vim/subconfig/plugins/undotree.vim

