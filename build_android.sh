#!/usr/bin/env bash
cd "$( dirname "${BASH_SOURCE[0]}" )"

SRCDIR=$(pwd)
DIR=$(pwd)
${NDKPATH?"Need to set NDKPATH"}
NDK=$NDKPATH

cd luajit-2.1.0-beta3/src
NDKABI=19
NDKVER=$NDK/toolchains/arm-linux-androideabi-4.9
NDKP=$NDKVER/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm"
NDKARCH="-march=armv7-a -mfloat-abi=softfp -Wl,--fix-cortex-a8"
make clean
make HOST_CC="gcc -m32" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF $NDKARCH"
cp ./libluajit.a ../../platform-android/jni/libluajit.a
make clean

cd ../../platform-android
$NDK/ndk-build clean APP_ABI="armeabi-v7a,x86"
$NDK/ndk-build APP_ABI="armeabi-v7a"
cp libs/armeabi-v7a/libslua.so ../Plugins/Android/libs/armeabi-v7a
$NDK/ndk-build clean APP_ABI="armeabi-v7a,x86"

cd ..

cd luajit-2.1.0-beta3/src
NDKABI=19
NDKVER=$NDK/toolchains/x86-4.9
NDKP=$NDKVER/prebuilt/darwin-x86_64/bin/i686-linux-android-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-x86"
make clean
make HOST_CC="gcc -m32" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF"
cp ./libluajit.a ../../platform-android/jni/libluajit.a
make clean

cd ../../platform-android
$NDK/ndk-build clean APP_ABI="armeabi-v7a,x86"
$NDK/ndk-build APP_ABI="x86"
cp libs/x86/libslua.so ../Plugins/Android/libs/x86
$NDK/ndk-build clean APP_ABI="armeabi-v7a,x86"

cd ..
