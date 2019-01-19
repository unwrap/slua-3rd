# slua集成第三方库

## 1. 环境

### windows平台

使用mingw来编译，需要安装msys2

### android平台

* NDK下载

[MacOSX](https://dl.google.com/android/repository/android-ndk-r10e-darwin-x86_64.zip)

[Win64-bit](https://dl.google.com/android/repository/android-ndk-r10e-windows-x86_64.zip)

* 配置环境变量

编辑 `vi ~/.bash_profile`

```
export NDKPATH=/Users/unwrap/work/android/android-ndk-r10e
export PATH=$PATH:$NDKPATH/
```
使其立即生效 `source ~/.bash_profile`

可以使用 `echo $NDKPATH` 检查此变量是否已正确设置。


### iMac和iOS平台
