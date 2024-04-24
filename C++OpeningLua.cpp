// Alex Badami
// C++ Version 199711

/* TO COMPILE 
g++ -o C++OpeningLua C++OpeningLua.cpp -llua
./LuaOpeningC++

Note: Lua must be in the same directory else the path must be added in the call
*/
#include <lua.hpp>
#include <iostream>

using namespace std;

int main() {
	// Creates a new lua_State, which acts like a stack off of which
	// all calls to lua operate off of
	lua_State* L;
	L = luaL_newstate();

	cout << "Opening and running entire Lua files:" << endl;
	luaL_openlibs(L); // Opens all standard libraries in lua
	luaL_dofile(L, "hello.lua"); // Runs the lua file
	cout << "[C++] Hello World!" << endl;

	cout << "and running functions: " << endl;
	luaL_dofile(L, "func.lua"); // Opens and runs the lua file
	lua_getglobal(L, "add"); // Pushes the "add" function onto the stack
	lua_pushinteger(L, 2); // Pushes 2 onto the stack
	lua_pushinteger(L, 5); // Pushes 5 onto the stack
	lua_call(L, 2, 1); // Makes a call for a function that takes two arguments from the stack and returns one
	int result = lua_tointeger(L, -1); // Sets result to value at the top of the stack
	cout << "The result of the Lua function: " << result << endl;
	
	lua_pop(L, 1); // Pops the result off of the stack

	lua_close(L); // Closes our stack
}
