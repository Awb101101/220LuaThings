/* TO COMPILE 
g++ -o LuaOpeningC++ LuaOpeningC++.cpp -llua
./LuaOpeningC++

Note: Lua must be in the same directory else the path must be added in the call
*/
#include <iostream>
#include <lua.hpp>

using namespace std;

lua_State *L;

/* The C++ function we want to call from Lua
We pass it one argument, the Lua stack */
int my_add(lua_State *L) {
    /* We tell C++ that that x is the at the top of the stack
    and that y is the second from the top of the stack
    They are both integers */
    int x = lua_tointeger(L, 1);
    int y = lua_tointeger(L, 2);
    // We then push the sum of x and y back onto the stack 
    lua_pushinteger(L, x + y);
    // We return the number of items we pushed onto the stack
    return 1;
}

int main() {
    L = luaL_newstate();
    luaL_openlibs(L);
    // We have to register our function before we can call it from Lua
    lua_register(L, "my_add", my_add);
    // Run the Lua file with the call to our C++ function in it
    luaL_dofile(L, "luaadd.lua");
    // Pop the result off the stack
    lua_pop(L, -1);
    // Close lua
    lua_close(L);
    return 0;
}