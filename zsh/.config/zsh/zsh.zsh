# ---------------------------------------------------------------
#                            ZSH配置
# ---------------------------------------------------------------

# oh-my-zsh安装路径
export ZSH="$HOME/.oh-my-zsh"

# 设置默认主题
ZSH_THEME="agnoster"

# 大小写敏感开关
# CASE_SENSITIVE="true"

# 连字符不敏感开关(true则可以混用'-'和'_')
HYPHEN_INSENSITIVE="true"

# 自动更新mode设置
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# 禁用版本控制中未跟踪文件标记为Dirty, 加快启动速度
DISABLE_UNTRACKED_FILES_DIRTY="true"

# 改变命令执行时间的显示格式
# 可选: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# 自定义custom文件夹, 不修改则默认使用 $ZSH/custom
# ZSH_CUSTOM=/path/to/new-custom-folder

# 加载插件
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    git
    extract
    tmux
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
