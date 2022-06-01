
" 用于指明不需要加载的语言包
" 如果添加.plugin在类型名称后代表此需要使用文件类型检测, 但不需要此插件的高亮
let g:polyglot_disabled = ['tmux.plugin']


" Vim Polyglot tries to automatically detect indentation settings (just like vim-sleuth). If this feature is not working for you for some reason, please file an issue and disable it temporarily with:

" let g:polyglot_disabled = ['autoindent']


" 禁用filetype detect
" let g:polyglot_disabled = ['ftdetect']

" 插件自动启用了一些设置, 可以通过以下方式设置关闭
" - Use utf-8 encoding by default
" - Automatically reload file if changed somewhere else
" - Disable existing swapfile warnings, instead just create multiple swapfiles
" - Don't create swapfiles in current directory, instead in data directory
" - Whitespace characters when using :set list
" - Delete comment character when joining commented lines
" - Search upwards for tags file(s) instead only locally
" - Fix issues with fish shell
" - Increase history size to 1000 items
" - Allow for up to 50 opened tabs on Vim start.
" - Reduce updatetime from 4000 to 300 to avoid issues with coc.nvim
" - Always save upper case variables to viminfo file
" - Don't save options in sessions and views
" - Allow color schemes to do bright colors without forcing bold
" - Load vim's built-in matchit plugin
" let g:polyglot_disabled = ['sensible']
