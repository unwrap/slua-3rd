#!/usr/bin/env bash
cd "$( dirname "${BASH_SOURCE[0]}" )"

cd luajit-2.1.0-beta3

make clean
make CC="gcc -m32"
cp src/luajit ../jit/mac/x86/luajit

make clean
make CC="gcc"
cp src/luajit ../jit/mac/x64/luajit

make clean
make CC="gcc" CFLAGS=-DLUAJIT_ENABLE_GC64
cp src/luajit ../jit/mac/gc64/luajit

make clean
make CC="gcc -m32" BUILDMODE=static
cp src/libluajit.a ../platform-osx/libluajit_x86.a

make clean
make CC="gcc" BUILDMODE=static CFLAGS=-DLUAJIT_ENABLE_GC64
cp src/libluajit.a ../platform-osx/libluajit_x86_64.a

cd ../platform-osx
xcodebuild clean
xcodebuild -configuration=Release
cp -r build/Release/slua.bundle ../Plugins/
