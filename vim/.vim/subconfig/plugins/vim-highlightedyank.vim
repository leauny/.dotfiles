" 复制高亮

" 高亮持续时间 (如果需要常亮, 则设置为负数即可)
let g:highlightedyank_highlight_duration = 800

" 高亮颜色设置 (应放在colorscheme后)
highlight HighlightedyankRegion cterm=reverse gui=reverse

" visual模式是否启用(0:off; 1:on)
let g:highlightedyank_highlight_in_visual = 0
