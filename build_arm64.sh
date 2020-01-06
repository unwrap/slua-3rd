NDK=D:/android-ndk-r15c

# Android/ARM, armeabi-v7a (ARMv7 VFP), Android 4.0+ (ICS)
cd luajit-2.1.0-beta3/src
NDKABI=21
NDKVER=$NDK/toolchains/aarch64-linux-android-4.9
NDKP=$NDKVER/prebuilt/windows-x86_64/bin/aarch64-linux-android-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm64" 
NDKARCH="-DLJ_ABI_SOFTFP=0 -DLJ_ARCH_HASFPU=1 -DLUAJIT_ENABLE_GC64=1"

make clean
make HOST_CC="gcc -m64" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF $NDKARCH"
cp ./libluajit.a ../../platform-android/jni/libluajit.a
make clean
rm -rf libluajit.so luajit

if [[ "$OSTYPE" == "msys" ]]; then
    cd ../../
    # can't pass $NDK to bat
    cmd /c "link_arm64.bat"
    rm -rf platform-android/libs platform-android/obj platform-android/jni/*.a NUL
else
    cd ../../platform-android
    $NDK/ndk-build clean APP_ABI="armeabi-v7a,x86,arm64-v8a" APP_PLATFORM=android-21
    $NDK/ndk-build APP_ABI="arm64-v8a" APP_PLATFORM=android-21
    cp libs/arm64-v8a/libtolua.so ../Plugins/Android/libs/arm64-v8a
    $NDK/ndk-build clean APP_ABI="armeabi-v7a,x86,arm64-v8a" APP_PLATFORM=android-21
    rm -rf libs obj jni/*.a NUL
fi

cd ..