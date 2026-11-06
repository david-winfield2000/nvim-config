-- Accept/skip minuet ghost text one blank-line-separated block (hunk) at a time.
local M = {}

local function upvalue(f, name)
	for i = 1, 100 do
		local n, v = debug.getupvalue(f, i)
		if not n then return end
		if n == name then return v end
	end
end

local function ghost_lines()
	local vt = require("minuet.virtualtext")
	local m = vim.api.nvim_buf_get_extmark_by_id(0, vt.ns_id, 1, { details = true })
	local d = m[3]
	if not d or not d.virt_text then return end
	local lines = { d.virt_text[1][1] }
	for _, l in ipairs(d.virt_lines or {}) do
		table.insert(lines, l[1][1])
	end
	return lines
end

-- index of the last line of the first hunk
local function hunk_end(lines)
	local s = 1
	while lines[s] == "" and s < #lines do s = s + 1 end
	local e = s
	while lines[e + 1] and lines[e + 1] ~= "" do e = e + 1 end
	return e
end

function M.accept(all)
	local lines = ghost_lines()
	if not lines then return false end
	local e = hunk_end(lines)
	-- the model often repeats the text after the cursor (e.g. "):") in its first line;
	-- drop the buffer copy so it isn't duplicated
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_get_current_line()
	local suffix = line:sub(col + 1)
	if suffix ~= "" and lines[1]:sub(-#suffix) == suffix then
		vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, #line, { "" })
	end
	-- minuet adds 1 itself when the suggestion starts with a newline
	require("minuet.virtualtext").action.accept(not all and (e - (lines[1] == "" and 1 or 0)) or nil)
	return true
end

function M.skip()
	local lines = ghost_lines()
	if not lines then return false end
	local action = require("minuet.virtualtext").action
	local e = hunk_end(lines)
	if e >= #lines then
		action.dismiss()
		return true
	end
	local get_ctx = upvalue(action.dismiss, "get_ctx")
	local ctx = get_ctx()
	-- keep the leading "\n" so the next hunk renders on its own line
	local rest = vim.list_slice(lines, e + 1)
	ctx.suggestions[ctx.choice] = table.concat(rest, "\n")
	action.next() -- re-render
	return true
end

return M
