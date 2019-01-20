# msys2
## 1. 安装
下载地址[http://www.msys2.org/](http://www.msys2.org/)

一般安装在根目录下，如E:\msys2

## 2. 配置
### 修改镜像源
修改\etc\pacman.d目录下的三个文件

*  mirrorlist.msys 文件

```
##
## MSYS2 repository mirrorlist
##

## Primary
## msys2.org
## Server = http://repo.msys2.org/msys/$arch/
## Server = https://sourceforge.net/projects/msys2/files/REPOS/MSYS2/$arch/
## Server = http://www2.futureware.at/~nickoe/msys2-mirror/msys/$arch/
## Server = https://mirror.yandex.ru/mirrors/msys2/msys/$arch/
Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/msys/$arch
```
* mirrorlist.mingw32 文件

```
##
## 32-bit Mingw-w64 repository mirrorlist
##

## Primary
## msys2.org
## Server = http://repo.msys2.org/mingw/i686/
## Server = https://sourceforge.net/projects/msys2/files/REPOS/MINGW/i686/
## Server = http://www2.futureware.at/~nickoe/msys2-mirror/mingw/i686/
## Server = https://mirror.yandex.ru/mirrors/msys2/mingw/i686/
Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/i686
```
* mirrorlist.mingw64 文件

```
##
## 64-bit Mingw-w64 repository mirrorlist
##

## Primary
## msys2.org
## Server = http://repo.msys2.org/mingw/x86_64/
## Server = https://sourceforge.net/projects/msys2/files/REPOS/MINGW/x86_64/
## Server = http://www2.futureware.at/~nickoe/msys2-mirror/mingw/x86_64/
## Server = https://mirror.yandex.ru/mirrors/msys2/mingw/x86_64/
Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/x86_64
```
### 更新Msys2系统环境
```
pacman -Sy
#更新源
pacman -Syu
pacman -Su
```

### 安装make
```
pacman -S make
pacman -S gcc
```

### 安装MinGW-w64 和 MinGW-x86版本
```
pacman -S  mingw-w64-i686-toolchain
pacman -S  mingw-w64-x86_64-toolchain
```
### 添加右键菜单
1. 更改home目录

添加环境变量`HOME`，值为`%USERPROFILE%`， 将Mingw的home目录和windows设为一致

找到msys2_shell.cmd中的
```
rem set MSYS2_PATH_TYPE=inherit
```
去掉rem，取消这一句的注释，使 MSYS2 的环境变量继承自系统

2. 添加注册表项

新建文件`右键添加命令行.reg`，拷贝以下内容并运行

注意`E:\\msys2`改为msys2实际的安装路径
```
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\Mingw64]
@="MinGW &64 Bash Here"
"Icon"="E:\\msys2\\msys2.ico"

[HKEY_CLASSES_ROOT\Directory\Background\shell\Mingw64\command]
@="E:\\msys2\\msys2_shell.cmd -mingw64 -here"

[HKEY_CLASSES_ROOT\Directory\Background\shell\Mingw32]
@="MinGW &32 Bash Here"
"Icon"="E:\\msys2\\msys2.ico"

[HKEY_CLASSES_ROOT\Directory\Background\shell\Mingw32\command]
@="E:\\msys2\\msys2_shell.cmd -mingw32 -here"
```

### 修改窗体颜色

\etc\pacman.conf
将其中的 #Color 注释去掉。


