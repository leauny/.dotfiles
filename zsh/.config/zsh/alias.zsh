# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Common command
alias cp="cp -i"
alias rm="rm -i" # prompt once
# alias rm="trash-put -v -- "
alias vi="vim "
alias vzsh="vim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias vvim="vim ~/.vim/vimrc"
alias psp="ps -aux | grep -v grep | grep "
alias .="cd ."
alias ..="cd .."
alias his="cat ~/.zsh_history | grep "
alias bat="batcat "
alias gs="git status"
alias ga="git add"
alias gclone="git clone "
alias gc="git commit -m "
alias glog="git log --oneline --graph --all --abbrev"
alias truecolor="curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash"

# Additional custome software command
alias ls='exa '
alias la='ls -lah'
alias brightness='sudo ddcutil setvcp 10 '
alias winproxy="proxychains4 -f ~/.config/proxy/winproxy.conf "
alias linproxy="proxychains4 -f ~/.config/proxy/linproxy.conf "
alias sstow="stow --dir=$DIR_OF_DOTFILES "
alias glow="glow -p "

# Functions
s2c() { scp "$@" ${SSH_CLIENT%% * }:~/; }
c2s() { scp ${SSH_CLIENT%% *}:"$@" .; }
proxy() {
	if [[ "$#" -lt 1 ]]; then
		echo "enable proxy"
		export ALL_PROXY="socks5h://127.0.0.1:7890"
	else
		echo "unset proxy"
		unset ALL_PROXY
	fi
}
