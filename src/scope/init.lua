
local Scope = {}
Scope.__index = Scope

function Scope.new()
   local instance = {_finalizers = {}}
   setmetatable(instance, Scope)
   return instance
end

function Scope:on_exit(callback)
   if (type(callback) ~= 'function') then
      error("on_exit argument should be a function")
   end
   table.insert(self._finalizers, callback)
end


local scope_function = function(target)
   local guard = Scope.new()
   local success, msg = pcall(target, guard)
   for _, f in ipairs(guard._finalizers) do f() end
   if (not success) then
      error(msg, 2)
   end
end

return scope_function
