# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Common command
alias sudo='sudo ' # Helps sys continue check if the following command has been aliased. (because of the space at the end os the alias command)
alias cp="cp -i"
alias rm="rm -i" # prompt once
alias vi="vim "
alias vzsh="vim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias vvim="vim ~/.vim/vimrc"
alias .="cd ."
alias ..="cd .."
alias his="cat ~/.zsh_history | grep "
alias gs="git status"
alias ga="git add "
alias gclone="git clone "
alias gc="git commit -m "
alias glog="git log --oneline --graph --all --abbrev"
alias truecolor="curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash"

# Additional custome software command
alias clashon="nohup clash -f ~/.config/clash/paoluyun.yaml > ~/.config/clash/nohupClash.log &"
alias clashlog="tail -n 10 -f ~/.config/clash/nohupClash.log"
alias winproxy="proxychains4 -f ~/.config/proxy/winproxy.conf "
alias linproxy="proxychains4 -f ~/.config/proxy/linproxy.conf "
alias clashupdate="~/.config/clash/paoluyun.sh"
alias d2l="conda activate d2l-zh"
alias jn="conda activate d2l-zh && nohup jupyter notebook > ~/.log/jupyter.log &"
alias sstow="stow --dir=$DIR_OF_DOTFILES "
alias glow="glow -p "



