LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libluajit
LOCAL_SRC_FILES := libluajit.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := slua
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../luajit-2.1.0-beta3/src
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../luasocket
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../pbc
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../

LOCAL_CPPFLAGS := -O2
LOCAL_CFLAGS :=  -O2 -std=gnu99
LOCAL_SRC_FILES :=  ../../slua.c \
                    ../../lpeg.c \
                    ../../kcp.c \
                    ../../snapshot.c \
                    ../../bit.c \
                    ../../cjson/strbuf.c \
                    ../../cjson/lua_cjson.c \
                    ../../cjson/fpconv.c \
                    ../../luasocket/auxiliar.c \
                    ../../luasocket/buffer.c \
                    ../../luasocket/except.c \
                    ../../luasocket/inet.c \
                    ../../luasocket/io.c \
                    ../../luasocket/luasocket.c \
                    ../../luasocket/mime.c \
                    ../../luasocket/options.c \
                    ../../luasocket/select.c \
                    ../../luasocket/tcp.c \
                    ../../luasocket/timeout.c \
                    ../../luasocket/udp.c \
                    ../../luasocket/usocket.c \
                    ../../pbc/src/alloc.c \
                    ../../pbc/src/array.c \
                    ../../pbc/src/bootstrap.c \
                    ../../pbc/src/context.c \
                    ../../pbc/src/decode.c \
                    ../../pbc/src/map.c \
                    ../../pbc/src/pattern.c \
                    ../../pbc/src/proto.c \
                    ../../pbc/src/register.c \
                    ../../pbc/src/rmessage.c \
                    ../../pbc/src/stringpool.c \
                    ../../pbc/src/varint.c \
                    ../../pbc/src/wmessage.c \
                    ../../pbc/binding/lua/pbc-lua.c
                     
LOCAL_WHOLE_STATIC_LIBRARIES += libluajit
include $(BUILD_SHARED_LIBRARY)