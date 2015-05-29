lua-scope
=========

*lua-scope* is simple Resource Acquisition Is Initialization implementation for Lua.

[![Build Status](https://travis-ci.org/basiliscos/lua-scope.png)](https://travis-ci.org/basiliscos/lua-scope)

```lua
local scope = require "scope"

scope(function(guard)
    local f = assert(io.open("out", "w"))
    guard:on_exit(function() f:close() end) -- always executed at the end of the function
    domorestuff()                           -- might die or might not
end)
```
