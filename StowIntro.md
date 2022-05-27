Open the link  or use command `info stow` to see the [Official English Doc](https://www.gnu.org/software/stow/manual/stow.html).

返回[README](../README.md)

注: 此工具最初的目的是为了管理软件. 而非用于dotfiles的管理. 因此有的功能并不使用于配置文件管理的情形, 如[[#目标维护]].

## 术语

- 包 `package`: 是一组需要管理的文件集合（如：Emacs）, 并且需要被安装到指定目录结构（例如：bin, lib等文件夹）
- 目标目录 `target directory`: 是一个或多个需要安装的包的树状目录的根。 常见的根目录如`/usr/local`, 本文将以此目录为例子
- stow目录 `stow directory`: 是目录的根, 其子树包含package. 执行时以当前目录作为默认stow目录. 本文以`/usr/local/stow`为例. 因此例如emacs等文件路径就为`/usr/local/stow/emacs`
- 安装映像 `installtion image`: 是包所需的文件/目录相对于target directory(目标目录)的布局
- 包目录 `package directory`: 是包含特定包的安装映像的文件树根. 每个包目录必须位于stow目录, 例如包目录`/usr/local/stow/emacs`必须在stow目录`/usr/local/stow`下. 所含的包的名称就是stow目录下的文件夹的名称

## 语法

```bash
stow [options] [action flag] package …
```

### options

`-d dir`
`--dir=dir`

设置stow的目录为dir. 默认值为`STOW_DIR`变量的内容(如果设置的话), 否则默认为当前目录

---
`-t dir`
`--target=dir`

设置target direcotry 为dir, 而不是默认的stow directory的父目录. 因此通常从`/usr/local/stow`执行stow(因为用户应用安装在`/usr/local`目录下)

---
`--ignore=regexp`

此(可重复)命令会避免执行动作到匹配给定正则表达式文件. 
例如: `--ignore='.*\.orig' --ignore='.*\.dist'`, 使得stow忽略文件结尾为.orig或.dist的文件.
注意: stow自动会忽略一些文件, 详见[IgnoreLists](https://www.gnu.org/software/stow/manual/stow.html#Ignore-Lists). 正则表达式被锚定在文件名的末尾

---

`--defer=regexp`

此(可重复)命令会避免stow执行, 当文件匹配正则表达式且已经被部署过的时候. (与`--override=regexp`作用相反)
例如: `--defer=man --defer=info` 会跳过已经存在的man和info文件. `--defer='man | info'`有同样效果(因为参数是正则表达式)
注意: 正则表达式被锚定在目标路径的开头

---

`--override=regexp`

此(可重复)命令强制覆盖已存在且匹配到的文件(否则会报错)
注意: 正则表达式被锚定在目标路径的开头

---

`--no-folding`

默认stow会保证使用最少的符号链接, 而不是在每个文件夹都用符号链接去填充. 因此可以通过此命令来修改默认行为.
此选项会禁止任何可能的tree folding和tree refolding. 

tree folding: 当某个目录结构中的文件都存在与单个安装映像, 则stow仅仅会创建此文件夹的链接 (保持软连接的数量最少)
tree unfolding: 当某个目录一起被folding, 但后期有其他包使用到该folded的文件夹时stow会自动删除此文件夹的链接并创建真实的文件夹到该目录中. 接着继续执行
tree refolding: 当unfolding的目录由于删除文件等原因可以达到fold的条件时, stow会执行refolding

---

`--adopt`

**警告**: 此命令用于修改stow目录中文件的内容

一般来说如果在执行时遇到已经存在, 但不属于任何一个stow包的文件时, stow会将其视为冲突并拒绝执行. 此命令会将此文件移动到stow路径里包安装镜像中相同的相对路径, 并且继续执行stow进程. 因此此文件将被stow包收录, 且内容不变.

可以用于收集配置文件 [[#第一次收集配置文件]]

---

`-n`
`--no`
`--simulate`

不执行任何操作在文件系统中, 可以与`-v`结合来给出模拟结果

---

`-v`
`--verbose[=n]`

显示执行信息到标准错误流中, 其等级从0~5. 默认为0, 可以通过`-v` / `--verbose`来使等级加一, 或直接`--verbose=N`来设置等级为n

可以通过`-vv`来提升两级

---

`-p`
`--compat`

在unstowing时扫描完整的目标文件树. 默认情况下, unstow期间仅扫描安装映像中指定的目录.
但`--badlinks`参数可能是检查安装不存在野符号链接更好的方式.

---

`-V`
`--version`

查看版本

### action flags

`-D`
`--delete`

从目标目录删除(unstow)指定的包. (可重复)

---

`-R`
`--restow`

重新stow(先删除, 再stow)指定的包. 用于从目标树中去除过时的符号链接. (可重复)

---

`-S`
`--stow`

明确需要stow的包. 如果未使用`-D`或`-R`参数则可以忽略. (可重复)

## 混合参数

2.0版本后支持混合参数.

例如使用如下参数来升级emacs-21.3版本到emac-21.4a. 此方法比单独执行两个分离的命令更快.

`stow -D emacs-21.3 -S emacs-21.4a`

甚至可以混合更多的参数. 

例如下面的操作unstow了pkg3, pkg4 和 pkg6, 接着stow了 pkg1, pkg2, pkg5 和 pkg6.

`stow -S pkg1 pkg2 -D pkg3 pkg4 -S pkg5 -R pkg6`



## 包的安装

### 折叠 folding

> 可以通过`--no-foldin`阻止

当某个目录结构中的文件都存在与单个安装映像, 则stow仅仅会创建此文件夹的链接 (保持软连接的数量最少)

### 展开 unfolding

当某个目录一起被folding, 但后期有其他包使用到该folded的文件夹时stow会自动删除此文件夹的链接并创建真实的文件夹到该目录中. 接着继续执行

### 重新折叠 refolding

> 可以通过`--no-foldin`阻止

当unfolding的目录由于删除文件等原因可以达到fold的条件时, stow会执行refolding

执行顺序的不同会导致空文件夹不会被删除.

如果实体文件夹中仅存在指向一个package x的链接时执行`stow -D x`只会删除实体文件夹下的链接, 并不会修改此实体文件夹. 但如果有package y的安装映像包含在实体文件夹下, 且文件夹只存在x和y的链接, 则执行stow -D删除任意包后其实体文件夹将会折叠为指向文件夹的软连接.
即当有stow -D访问到文件夹时且执行后文件夹内仅存在stow拥有且仅指向一个包的链接时, 才会执行refolding操作, 因而可以在后期删除指向文件夹的链接. 若内容为空, 则stow并不知道应该链接到哪个包映像, 因此并不会折叠文件夹, 因而在stow -D时也不会删除此实体文件夹.

### 所有权

当打开一个折叠的树时, stow确保删除的链接指向了stow路径中的有效包. stow不会删除任何不属于stow的内容. 
stow拥有所有存在于目标树并且指向stow目录有效包中的链接. stow拥有的任何链接都可以被重新计算得出.
注意: stow并不拥有任何stow目录中的内容 (即不会删除)

### 冲突

如果stow需要创建文件夹或符号链接在目标树, 但由于出现不属于stow的重名文件时而无法创建时, 一个冲突就出现了. 具体查看[[#冲突]]

## 包的删除

当-D参数给出后, stow将从目标树中删除包. 注意stow不会删除不属于其的文件, 并不意味着删除stow目录下的包文件.

为了删除一个包，Stow 递归地扫描目标树，跳过任何不包含在安装映像中的目录。例如，如果目标目录是/usr/local，而被删除的包的安装映像在顶层只有一个bin目录和一个man目录，那么我们只扫描/usr/local/bin和/usr/local /man，而不是 /usr/local/lib 或 /usr/local/share，或者就本文而言是 /usr/local/stow。

任何指向将要删除包内文件的链接都会被删除。任何仅包含指向要删除的包的符号链接的目录都将被删除。

## 冲突

当在安装时发现目标目录存在重名文件, 且此文件不是可以分裂的折叠树时就会出现冲突. 当存在一个目录而stow却需要创建一个文件的链接时也会发生冲突. 但如果存在的名字只是链接到了指向当前stow管理的文件时, 则不会出现冲突(因此可以重复安装已经安装过的文件).

### 推迟操作

从2.0版本开始, stow采用一种两步执行算法, 在stow或unstow前的第一次扫描用于检查任何可能的冲突. 如果有冲突, 则显示信息并终止(不会修改任何内容)

早于2.0的版本会在执行一半时终止, 其终止状态是未定义的.

## 多Stow目录

如果存在多个stow目录, 可以通过创建`.stow`在每个stow目录下面, 这代表了如果此目录<2>并不是执行stow<1>命令时的stow目录, 或甚至说它是包含于target目录<1>下的子目录. 但是执行stow命令的目录<1>仍不拥有(见[[#所有权]])任何此目录<2>的内容. 

当多个stow目录共用一个目标目录, 如果在安装时一个折叠链接需要打开, 只要符号链接指向的顶层stow目录包含.stow目录, 则Stow就会知道如何正确处理.

## 目标维护

从ver2开始, stow提供了新的工具`chkstow`来帮助维护目标树结构. 它包括三个运行模式, 由于其耗费时间因此在正常stow执行期间不会自动运行.

```shell
chkstow [options]
```

`-t dir`
`--target=dir`

同上(option中的相同参数). 设置目标目录

---

`-b`
`--badlinks`

检查目标目录中的错误软连接, 即指向不存在文件的链接

---

`-a`
`--aliens`

检查目录中非符号链接的文件. 除了包含.stow文件的目录外, 目标目录应该单独被stow管理

---

`-l`
`--list`

将会显示每一个链接指向的包 (不好用, 需要指定-t参数, 对链接的指向有要求, 当链接的路径信息中存在`../`时无效)

## 配置文件

默认命令参数可以保存到`.stowrc`中(当前文件夹或~文件夹下), 以此顺序进行解析, 且如果都存在则串接到一起执行.(必须把.stowrc所在目录作为stow directory)

对于不可重复的参数, 命令行输入的参数优先级高于配置文件中的; 但若是可重复的参数, 则都会执行.

环境变量有会影响参数的解析, 因此尽量避免`$` 或 `~`符号, 实在需要使用则使用`\`转义.

`.stowrc`文件中的参数 `-D`, `-S`, 和 `-R` 会被忽略, 以及其中的package name也会被忽略.

## 自举

> 基本不用看, 因为目前都是用的包管理软件进行stow的安装

假设存在一个stow目录以及准备好运行, `/usr/local/stow/perl`包含Perl安装文件, `/usr/local/stow/stow`包含Stow自身. ( 将要使用Stow安装Perl但需要先安装配置Stow时).

```shell
# 此方法无效
cd /usr/local/stow
stow -vv * # 提升提示等级, 并安装所有包

# 此方法依然无效
cd /usr/local/stow
stow/bin/stow -vv * # 即从Stow安装文件中调用stow二进制文件安装stow

# 由于Stow的实现需要使用Perl来进行, 因而当Perl未安装时上面两个方法是无效的
# 必须用以下方式执行
cd /usr/local/stow
perl/bin/perl stow/bin/stow -vv * # 明确两个bin文件的位置后进行安装操作
```

## 使用样例

### 首次收集配置文件

第一次收集配置文件时，推荐使用`--adopt`选项转移配置文件。具体操作如下：

1.  在家目录下创建`stow dir`， 比如命名为 dotfiles。
    
2.  在`stow dir`下分门别类的创建好各类配置文件的文件夹，比如专门放置 bash 相关配置文件的文件夹。
    
3.  在 bash 文件夹下创建对应的配置文件，文件内容为空即可，比如`.bashrc`，`.bash_profile`。
    
4.  在`stow dir`下执行`stow --adopt bash`，这一命令分别对比`target dir`（也即是家目录）和 bash 目录的结构， 并将家目录下同树结构的文件采纳到`stow dir`下：将`.bashrc`移到bash目录覆盖掉对应的空配置文件， 并在家目录创建符号链接指向转移过来的配置文件。
    
5.  重复上述 2-4 步，陆续添加其他文件夹和配置文件。
    

收集到配置文件后，我们一般使用 git 来管理，这样可以方便的跟踪修改，也可以方便的拉取到另一台电脑上。 实际上，我们上面使用的`--adopt` 命令可以结合 git 来方便的对比两台电脑间配置文件的不同。 `--adopt`选项会处理 stow 遇到的冲突文件，并统一采用`target dir`下的文件**替换**`stow dir` 下的文件， 当`stow dir`被 git 管理时，被替换的文件就可以方便的和仓库中的文件对比，方面你修改，采纳，或者删除。

**注意**: `--adopt`选项会修改`stow dir`下的内容，非第一次收集配置文件，或者`stow dir`没有被版本控制软件管理前，请谨慎使用。

### 折叠文件夹

如果需要生成针对整个文件夹的链接则: 

1. 可以创建路径可达待折叠文件夹的新package
2. 执行新package的删除操作`-D`, 即可使得文件夹折叠
