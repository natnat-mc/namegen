#!/usr/bin/lua

local args={...}

local len=#args>0 and tonumber(args[1]) or tonumber(io.write('Length:\t') and io.read())
local qty=#args>1 and tonumber(args[2]) or tonumber(io.write('Quantity:\t') and io.read())

for i=1, qty do
	io.write(require('namegen')(len)..'\n')
end
