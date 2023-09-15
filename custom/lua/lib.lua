-- common functions as library

local Lib = {}

local kmap = vim.keymap.set

local function is_empty(t)
	local next = next
	if next(t) == nil then
		return true
	else
		return false
	end
end

local function noremap(flag, key, value)
	local opts = { noremap = true, silent = true }
	local type = type
	local v_type = type(value)

	if v_type == "table" then
		if not (is_empty(value)) then
			local val = value[1]
			local extraOpts = value[2]

			if type(extraOpts) == "table" and not (is_empty(extraOpts)) then
				for k, v in pairs(extraOpts) do
					opts[k] = v
				end
			end

			kmap(flag, key, val, opts)
		end
	else
		kmap(flag, key, value, opts)
	end
end

function Lib.nnoremap(keys)
	for key, value in pairs(keys) do
		noremap("n", key, value)
	end
end

function Lib.inoremap(keys)
	for key, value in pairs(keys) do
		noremap("i", key, value)
	end
end

function Lib.vnoremap(keys)
	for key, value in pairs(keys) do
		noremap("v", key, value)
	end
end

function Lib.tnoremap(keys)
	for key, value in pairs(keys) do
		noremap("t", key, value)
	end
end


return Lib
