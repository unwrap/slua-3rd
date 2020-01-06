@echo off
set ndkPath=D:/android-ndk-r15c
cd ./platform-android
call %ndkPath%/build/ndk-build clean APP_ABI="armeabi-v7a,x86,arm64-v8a" APP_PLATFORM=android-21
call %ndkPath%/build/ndk-build APP_ABI="arm64-v8a" APP_PLATFORM=android-21
copy libs\arm64-v8a\libslua.so ..\Plugins\Android\libs\arm64-v8a
call %ndkPath%/build/ndk-build clean APP_ABI="armeabi-v7a,x86,arm64-v8a" APP_PLATFORM=android-21
echo Successfully linked
exit