" 此文件保存了全局状态的按键映射, 如需插件的mapping请查看插件配置

" 设置LEADER
let mapleader=" "

" S保存文件
noremap S :w<CR>
" Q退出VIM
noremap Q :q<CR>
" s键置空
noremap s  <NOP>
" 刷新配置(%代表当前文件)
noremap R :so $MYVIMRC<CR>

" 向下查找并放到屏幕中间
noremap = nzz
noremap - Nzz

" 取消查找高亮
noremap <LEADER><CR> :noh<CR>

"" 分屏
" 先set用来设置分配后的光标默认位置
" split right / left / up / down
noremap sr :set splitright<CR>:vsplit<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>
noremap su :set nosplitbelow<CR>:split<CR>
noremap sd :set splitbelow<CR>:split<CR>

" 分屏转换为垂直分屏
noremap sv <C-w>t<C-w>H
noremap sh <C-w>t<C-w>K

" 分屏切换
noremap <LEADER>l <C-w>l
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j

" normal模式下设置<LEADER> + 方向键为切换分屏, 方便操作
noremap <LEADER><RIGHT> <C-w>l
noremap <LEADER><UP> <C-w>k
noremap <LEADER><LEFT> <C-w>h
noremap <LEADER><DOWN> <C-w>j

" 分屏大小调节
noremap <UP> :res +5<CR>
noremap <DOWN> :res -5<CR>
noremap <LEFT> :vertical resize -5<CR>
noremap <RIGHT> :vertical resize +5<CR>

" 分屏位置交换
noremap <C-w><RIGHT> <C-w>L
noremap <C-w><LEFT> <C-w>H
noremap <C-w><UP> <C-w>K
noremap <C-w><DOWN> <C-w>J

"" 标签页
" 创建标签页
noremap tc :tabe<CR>
" 切换到下一个标签
noremap tn :-tabnext<CR>
" 切换上一个标签
noremap tu :+tabnext<CR>

" 按两次<LEADER>后跳转到下一个'<++>'格式的锚点并且编辑它
map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>c4l

"" 常用小功能
" 强制用root权限保存更改
nnoremap <LEADER>sudo :w !sudo tee > /dev/null %<CR>

