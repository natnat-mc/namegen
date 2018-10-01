--BEGIN useful functions

--[[
list union(list... sets)
 Returns a list containing all the elements of the lists given in arguments.
 There are no duplicates.
]]
local function union(...)
	local list={}
	local seen={}
	for k, v in ipairs({...}) do
		for i, o in ipairs(v) do
			if not seen[o] then
				table.insert(list, o)
				seen[o]=true
			end
		end
	end
	return list
end

--[[
boolean contains(list set, any item)
 Returns true if the value is contained in the list.
]]
local function contains(set, item)
	for i, v in ipairs(set) do
		if v==item then
			return true
		end
	end
	return false
end

--[[
any getrandom(list elements)
 Retuns a random element from the list.
]]
local function getrandom(list)
	return list[math.random(#list)]
end

--END useful functions

--BEGIN constants

-- list of all letters and their type
local vowels={'a', 'e', 'i', 'o', 'u', 'y'}
local consonants={'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z'}
local letters=union(vowels, consonants)

--END constants

--BEGIN main algorithm

--[[
string namegen(int length)
 Returns a username of length `length`.
 The username should be pronounceable. Theoretically.
]]
local function namegen(length)
	local chars={}
	local type, lasttype='none', 'none'
	local list
	for i=1, length do
		if type==lasttype then
			if type=='vowel' then
				list=consonants
			elseif type=='consonants' then
				list=vowels
			else
				list=letters
			end
		else
			list=letters
		end
		local val=getrandom(list)
		lasttype=type
		if contains(vowels, val) then
			type='vowel'
		else
			type='consonants'
		end
		if i==1 then
			val=val:upper()
		end
		table.insert(chars, val)
	end
	return table.concat(chars)
end

--END main algorithm

return namegen
