# ---------------------------------------------------------------
#                            自定义配置
# ---------------------------------------------------------------

# 配置模板位于 ~/.config/zsh/customize_example.zsh, 用于控制功能的开关 
source $HOME/.config/zsh/customize.zsh
# 配置文件git文件夹路径
export DIR_OF_DOTFILES="$HOME/.dotfiles"


# ---------------------------------------------------------------
#                            前置加载项 
# ---------------------------------------------------------------

# 默认启动tmux
if [ $CUST_TMUX = ON ]
then
    source $HOME/.config/zsh/tmux.zsh
fi

# ---------------------------------------------------------------
#                            ZSH配置
# ---------------------------------------------------------------

source $HOME/.config/zsh/zsh.zsh

# ---------------------------------------------------------------
#                            系统基础设置
# ---------------------------------------------------------------

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ---------------------------------------------------------------
#                            环境变量 PATH
# ---------------------------------------------------------------

# 通用环境变量
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH"

# 用户自定义环境变量
source $HOME/.config/zsh/path.zsh

# ---------------------------------------------------------------
#                             别名alias 
# ---------------------------------------------------------------

# 必须靠后, 依赖上面定义的变量
source $HOME/.config/zsh/alias.zsh

# ---------------------------------------------------------------
#                            应用配置&加载
# ---------------------------------------------------------------

# 加载Conda
source $HOME/.config/zsh/conda.zsh

# 加载fzf
[ -f ~/.config/zsh/fzf.zsh ] && source ~/.config/zsh/fzf.zsh  

# 加载autojump

# autojump
[[ -s /home/$CUST_USER/.autojump/etc/profile.d/autojump.sh ]] && source /home/$CUST_USER/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -U
