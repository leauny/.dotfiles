# DotFiles

This repository manages dotfiles by using stow.

## Guide

command

```shell
stow -t <TargetDir> <PackageName>

# eg:

stow -t ~ zsh
```

## Target Dir

The default target directory id $HOME (set by `.stowrc`) if the folder name ending with no extra expression such as '@'.

When need stowing in different position, the folder names' tail would end by '@'. Then you should get into the subdirectory and check the target directory in its own `.stowrc` file. 

