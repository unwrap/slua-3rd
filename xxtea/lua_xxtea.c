/**********************************************************\
|                                                          |
| xxtea.c                                                  |
|                                                          |
| XXTEA encryption algorithm library for Lua.              |
|                                                          |
| Encryption Algorithm Authors:                            |
|      David J. Wheeler                                    |
|      Roger M. Needham                                    |
|                                                          |
| Code Authors: Chen fei <cf850118@163.com>                |
|               Ma Bingyao <mabingyao@gmail.com>           |
| LastModified: Feb 7, 2016                                |
|                                                          |
\**********************************************************/

#include <lua.h>
#include <lauxlib.h>
#include "xxtea.h"

static int encrypt(lua_State *L) {
	unsigned char *result;
	const char *data;
	const char *key = "463131984";
	size_t data_len, out_len;

	data = luaL_checklstring(L, 1, &data_len);
	result = xxtea_encrypt(data, data_len, key, &out_len);

	if(result == NULL){
		lua_pushnil(L);
	}else{
		lua_pushlstring(L, (const char *)result, out_len);
		free(result);
	}

	return 1;
}

static int decrypt(lua_State *L) {
	unsigned char *result;
	const char *data;
	const char *key = "463131984";
	size_t data_len, out_len;

	data = luaL_checklstring(L, 1, &data_len);
	result = xxtea_decrypt(data, data_len, key, &out_len);

	if(result == NULL){
		lua_pushnil(L);
	}else{
		lua_pushlstring(L, (const char *)result, out_len);
		free(result);
	}

	return 1;
}

static const luaL_Reg xxtea[] = {
	{"encrypt",	encrypt},
	{"decrypt",	decrypt},
	{0, 0}
};

LUALIB_API int luaopen_xxtea(lua_State * L) {
#if LUA_VERSION_NUM >= 502 // LUA 5.2 or above
    lua_newtable(L);
    luaL_setfuncs(L, xxtea, 0);
#else
	luaL_register(L, "xxtea", xxtea);
#endif
	return 1;
}
