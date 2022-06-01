# >>> conda initialize >>>


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

#CONDA_INSTALL_PATH="/opt/miniconda3/"
#
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('$CONDA_INSTALL_PATH/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
    #eval "$__conda_setup"
#else
    #if [ -f "CONDA_INSTALL_PATH/etc/profile.d/conda.sh" ]; then
        #. "CONDA_INSTALL_PATH/etc/profile.d/conda.sh"
    #else
        #export PATH="CONDA_INSTALL_PATH/bin:$PATH"
    #fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
