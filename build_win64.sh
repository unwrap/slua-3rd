#!/bin/bash
# 64 Bit Version
mkdir -p window/x86_64

cd luajit-2.1.0-beta3
mingw32-make clean

mingw32-make BUILDMODE=static CC="gcc -m64 -O2" XCFLAGS=-DLUAJIT_ENABLE_GC64
cp src/libluajit.a ../window/x86_64/libluajit.a
cp src/luajit.exe ../jit/win/x64/luajit.exe
cp src/luajit.exe ../jit/win/gc64/luajit.exe
mingw32-make clean

cd ..

gcc -m64 -O2 -std=gnu99 -shared \
    slua.c \
    lpeg.c \
    ikcp.c \
    lkcp.c \
    lutil.c \
    snapshot.c \
    bit.c \
    pb.c \
    cjson/strbuf.c \
    cjson/lua_cjson.c \
    cjson/fpconv.c \
    luasocket/auxiliar.c \
    luasocket/buffer.c \
    luasocket/except.c \
    luasocket/inet.c \
    luasocket/io.c \
    luasocket/luasocket.c \
    luasocket/mime.c \
    luasocket/options.c \
    luasocket/select.c \
    luasocket/tcp.c \
    luasocket/timeout.c \
    luasocket/udp.c \
    luasocket/wsocket.c \
    xxtea/xxtea.c \
    xxtea/lua_xxtea.c \
    -o window/x86_64/slua.dll \
    -I./ \
    -Iluajit-2.1.0-beta3/src \
    -Iluasocket \
    -Ipbc \
    -lws2_32 \
    -Wl,--whole-archive window/x86_64/libluajit.a -Wl,--no-whole-archive -static-libgcc -static-libstdc++

cp window/x86_64/slua.dll Plugins/x64/slua.dll

rm -rf window