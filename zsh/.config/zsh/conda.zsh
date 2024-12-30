# check if conda is installed
if ! [[ -f "${CONDA_HOME}/miniconda3/bin/conda" ]]; then
    log_error "Conda not found in ${CONDA_HOME}/miniconda3/bin/conda"
    return
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("${CONDA_HOME}/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${CONDA_HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${CONDA_HOME}/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="${CONDA_HOME}/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate default