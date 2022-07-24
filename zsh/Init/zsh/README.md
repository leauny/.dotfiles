## Zsh

> zsh 及其附属插件/主题等安装介绍操作手册

## oh-my-zsh

> 本地脚本(可以直接运行安装): [oh-my-zsh install](./ohmyzshInstall.sh)

```shell
# curl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# wget

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

## P10k

1. 安装字体

修改文件`/etc/locale.gen`, 将`en_US.UTF-8 UTF-8`和`zh_CN.UTF-8 UTF-8`注释删除, 接着执行`locale-gen`命令生成. (可能需要安装fc软件, `sudo pacman -S fontconfig`)

```shell
# 将字体文件存入字体文件夹

mv MesloLGS* /usr/share/fonts/TTF/

```

2. 安装P10K 

```shell 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k 
```

3. 启用主题

在　~/.zshrc 中设置 ZSH_THEME

```shell
ZSH_THEME="powerlevel10k/powerlevel10k"
```

4. 重启zsh

`exec zsh`

5. 配置

恢复配置: `stow zsh`

生成配置: `p10k config`

## Plugins

### zsh-autosuggestions

1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

```shell
plugins=(
    # other plugins...
    zsh-autosuggestions
)
```

3. Start a new terminal session.

### zsh-syntax-highlighting

1. Clone this repository in oh-my-zsh's plugins directory:

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

2. Activate the plugin in ~/.zshrc:

```shell
plugins=( [plugins...] zsh-syntax-highlighting)
```

3. Restart zsh (such as by opening a new instance of your terminal emulator).

### autojump

1. Clone

```shell
git clone git://github.com/joelthelion/autojump.git
```

2. install

```shell
# 进入目录
./install.py
```





