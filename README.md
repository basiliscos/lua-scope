lua-scope
=========

*lua-scope* is simple Resource Acquisition Is Initialization implementation for Lua.

[![Build Status](https://travis-ci.org/basiliscos/lua-scope.png)](https://travis-ci.org/basiliscos/lua-scope)

Synopsis
=========

```lua
local scope = require "scope"

scope(function(guard)
    local f = assert(io.open("out", "w"))
    -- always executed at the end of the function
    guard:on_exit(function() f:close() end)
    -- might die or might not
    do_more_stuff(f)
    
    local f2 = assert(io.open("out", "w"))
    -- some other protector
    guard:on_exit(function() f2:close() end)
    do_more_stuff_2(f2)
end)
```

Installation
============

```luarocks install luascope```
