#!/usr/bin/env zsh

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
END="\033[0m"

log_message() {
    local level="$1"      # 日志级别
    local message="$2"    # 日志内容
    shift 2
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $message $@"
}

log_info() {
    log_message "${GREEN}I${END}" "$@"
}

log_warn() {
    log_message "${YELLOW}W${END}" "$@"
}

log_error() {
    log_message "${RED}E${END}" "$@"
}