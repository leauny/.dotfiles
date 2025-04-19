# DotFiles

本项目为个人使用的 dotfile 仓库，基于 GNU Stow 管理

> [!WARNING]
> 项目内使用了 `.stowrc`，会改变默认行为

## 使用教程

### 命令

> 详细使用方法请查看[StowIntro](./StowIntro.md)

```shell
stow -t <TargetDir> <PackageName>
```

> 例: 将zsh包安装到$HOME为目标的文件夹中

```shell
stow -t ~ zsh
```
