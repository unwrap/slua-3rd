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
                    ../../ikcp.c \
                    ../../lkcp.c \
                    ../../lutil.c \
                    ../../snapshot.c \
                    ../../bit.c \
                    ../../pb.c \
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
                    ../../xxtea/xxtea.c \
                    ../../xxtea/lua_xxtea.c \
                     
LOCAL_WHOLE_STATIC_LIBRARIES += libluajit
include $(BUILD_SHARED_LIBRARY)