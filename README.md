# DotFiles

This repository manages dotfiles by using stow.

## Guide

command

> 详细使用方法请查看[StowIntro](./StowIntro.md)

```shell
stow -t <TargetDir> <PackageName>

# eg:

stow -t ~ zsh
```

## Target Dir

The default target directory id $HOME (set by `.stowrc`) if the folder name ending with no extra expression such as '@'.

When need stowing in different position, the folder names' tail would end by '@'. Then you should get into the subdirectory and check the target directory in its own `.stowrc` file. 

