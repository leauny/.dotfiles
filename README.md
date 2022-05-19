# DotFiles

This repository manages dotfiles by using stow.

## Guide

command

```shell
stow -t <TargetDir> <PackageName>

# eg:

stow -t ~ zsh
```

## Running Dir

The default folder would be $HOME if the folder with no extra expression.

When need stowing in different position, the folder names' tail would end by '@'. Then you should check the target directory in this file. 

### $HOME | ~

- zsh
- tmux
- clash
- proxychans

