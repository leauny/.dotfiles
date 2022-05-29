
### Oh-my-tmux安装

#### Requirements:

tmux >= 2.3 (soon >= 2.4) running inside Linux, Mac, OpenBSD, Cygwin or WSL
awk, perl and sed
outside of tmux, $TERM must be set to xterm-256color

#### Install

> To install, run the following from your terminal: (you may want to backup your existing ~/.tmux.conf first)

```shell
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```
