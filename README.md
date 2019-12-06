# slua集成第三方库

## 1. 环境

### NDK下载

[MacOSX](https://dl.google.com/android/repository/android-ndk-r10e-darwin-x86_64.zip)

[Win64-bit](https://dl.google.com/android/repository/android-ndk-r10e-windows-x86_64.zip)

### Windows平台

使用mingw来编译，需要安装msys2

### macOS平台

* 配置环境变量

编辑 `vi ~/.bash_profile`

```
export NDKPATH=/Users/unwrap/work/android/android-ndk-r10e
export PATH=$PATH:$NDKPATH/
```
使其立即生效 `source ~/.bash_profile`

可以使用 `echo $NDKPATH` 检查此变量是否已正确设置。

## 2. 编译
* pc

在Windows操作系统下编译，生成dll文件。
mingw32运行 `build_win32.sh`，生成x86动态库。
mingw64运行 `build_win64.sh`，生成x64动态库。

* android

需要先下载NDK并配置好环境变量，可以在Windows下编译也可以在macOS下编译，生成so文件。
在Windows下编译，需要用mingw32来运行 `build_android_win.sh`，生成arm和x86架构的so文件。在maxOS下则运行 `build_android.sh`。两个脚本只需运行其中一个即可。

* mac && iOS

在macOS下编译，运行 `build_osx.sh` 生成slua.bundle，运行 `build_ios.sh` 生成libslua.a。

## 3rd library

* pbc

[https://github.com/cloudwu/pbc](https://github.com/cloudwu/pbc)

* luasocket

[https://github.com/diegonehab/luasocket](https://github.com/diegonehab/luasocket)

* luacjson

[https://github.com/mpx/lua-cjson](https://github.com/mpx/lua-cjson)

* lpeg

[http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html](http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html)

* kcp

[https://github.com/skywind3000/kcp](https://github.com/skywind3000/kcp)
