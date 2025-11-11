#!/usr/bin/bash
# errexit/nounset/errtrace/xtrace
set -Euo pipefail

# ------------------------------------------------------------------------------
# 函数: _log
# 描述: 根据级别打印带颜色的消息，并可选地写入文件（无颜色）。
# 参数:
#   $1 - 日志级别 (INFO, WARN, ERROR)
#   $2 - 日志消息
#   $3 - 日志文件路径 (可选)
# -------------------------------------------------------------------------------
_log() {
	local COLOR_RESET="\033[0m"
	local COLOR_INFO="\033[32m"  # 绿色
	local COLOR_WARN="\033[33m"  # 黄色
	local COLOR_ERROR="\033[31m" # 红色

	local level_name="$1"
	local message="$2"
	local log_file="${3:-}"
	local color=""

	# 获取时间戳
	local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

	# 根据日志级别设置颜色
	case "$level_name" in
	INFO) color="$COLOR_INFO" ;;
	WARN) color="$COLOR_WARN" ;;
	ERROR) color="$COLOR_ERROR" ;;
	*) color="$COLOR_RESET" ;; # 默认无颜色
	esac

	local formatted_message="[$timestamp] [$level_name] $message"

	# 打印到终端，带有颜色
	echo -e "${color}${formatted_message}${COLOR_RESET}" >&2

	# 如果指定了日志文件，则写入文件（无颜色, append）
	if [[ -n "$log_file" ]]; then
		echo "$formatted_message" >>"$log_file"
	fi
}

# info "msg"
info() { _log INFO "$1"; }
warn() { _log WARN "$1"; }
error() { _log ERROR "$1"; }

# finfo FILE_NAME "msg"
finfo() { _log INFO "$2" "$1"; }
fwarn() { _log WARN "$2" "$1"; }
ferror() { _log ERROR "$2" "$1"; }

#-------------------------------------------------------------------------------
# 函数: log_error_trace
# 描述: 打印完整的错误调用栈。
#-------------------------------------------------------------------------------
log_error_trace() {
	local i=0
	echo "❌ 错误发生，调用栈追溯:"
	echo "-------------------------------------"
	while [[ ${FUNCNAME[i]} != "main" ]]; do
		echo "  在文件: ${BASH_SOURCE[i + 1]}，函数: ${FUNCNAME[i]}，行号: ${BASH_LINENO[i]}"
		((i++))
	done
	echo "-------------------------------------"
	exit 1
}

# 用于执行命令的函数，支持调试模式
eval() {
	local exe="$1"

	if $debug; then
		info " $(echo "$@")"
	else
		shift 1
		info " $(echo "$exe $@")"
		$exe "$@"
	fi
}

#-------------------------------------------------------------------------------
# 各步骤函数定义
#-------------------------------------------------------------------------------

function _apt() {
	# 使用中科大源
	eval sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
	eval sudo sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
	eval sudo sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/ubuntu.sources
	eval sudo apt update

	eval sudo apt install \
		vim eza mosh bat zsh stow duf curl wget tmux fd-find

	eval sudo apt install \
		git git-delta build-essential make cmake \
		gcc g++ gdb clangd clang-tidy clang-format clang llvm
}

function _dotfiles() {
	if [[ -d "$HOME/.dotfiles" ]]; then
		info ".dotfiles 已存在, 拉取最新代码"
		eval git -C $HOME/dotfiles pull
	else
		info "克隆 dotfiles 仓库"
		eval git clone https://github.com/leauny/.dotfiles.git $HOME/.dotfiles
	fi

	info "zsh配置"
	if [[ -f ~/.config/zsh/customize.zsh ]]; then
		info "customize.zsh 已存在, 不覆盖"
	else
		info "创建 customize.zsh 配置文件"
		eval cp $HOME/.config/zsh/customize_example.zsh $HOME/.config/zsh/customize.zsh
	fi
}

function _brew() {
	if ! command -v brew &>/dev/null; then
		info "安装 Homebrew"
		eval /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.profile
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	fi

	eval brew install fzf go yazi neovim uv
}

function _zsh() {
	if [[ ! -d ~/.oh-my-zsh ]]; then
		info "安装 Oh My Zsh"
		eval sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi

	# plugins
	eval git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	eval git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

function _other_tools() {
	if ! command -v atuin &>/dev/null; then
		info "安装 atuin"
		eval bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)"
	fi
}

# 执行步骤列表
_step=(
	"_apt"
	"_dotfiles"
	"_brew"
	"_zsh"
	"_other_tools"
)

# 执行指定范围的指令
function run() {
	local begin=${1:-0}
	local end=${2:-$((${#_step[@]} - 1))}
	warn "执行范围: $begin 到 $end"

	for idx in $(seq "$begin" "$end"); do
		if [[ $idx -lt $begin ]]; then
			continue
		fi

		if [[ "$end" != "0" ]] && [[ $idx -gt $end ]]; then
			continue
		fi

		beg_bar="-------- idx: $idx, ${_step[$idx]} --------"
		length=$(echo "${beg_bar}" | awk -F "" '{print NF}')

		info "┌$beg_bar"
		${_step[$idx]}
		info "└$(printf '%*s\n' "$length" '' | tr ' ' '-')"
	done
}

# 运行参数解析
debug=false
begin_idx=""
end_idx=""

while getopts ":b:e:t:d" opt; do
	case "$opt" in
	b)
		info "从 step: $OPTARG 开始执行"
		begin_idx=$OPTARG
		;;
	e)
		info "执行到 step: $OPTARG 结束"
		end_idx=$OPTARG
		;;
	t)
		info "执行第 $OPTARG 个 step"
		begin_idx=$OPTARG
		end_idx=$OPTARG
		;;
	d) debug=true ;;
	:)
		echo "选项 -$OPTARG 需要一个参数。" >&2
		exit 1
		;;
	\?)
		echo "无效的选项: -$OPTARG" >&2
		exit 1
		;;
	esac
done

shift $((OPTIND - 1))

if [[ -z "$begin_idx" ]]; then
	run
else
	if [[ -z "$end_idx" ]]; then
		run "$begin_idx"
	else
		run "$begin_idx" "$end_idx"
	fi
fi
