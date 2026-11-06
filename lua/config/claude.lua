-- Visual-select -> headless `claude -p` -> replace selection with the result.
local SYSTEM = "You are a code editing tool. Output ONLY the full replacement for the given text, "
	.. "with no explanations and no markdown code fences. Keep indentation and style."

local FIX = "Fix anything missing or incorrect: resolve TODOs, follow comments that are clearly "
	.. "instructions (and remove them once done), fix typos, improve unclear variable names. "
	.. "Make no other changes."

local function run(instruction)
	vim.cmd("normal! \27") -- leave visual mode so '< and '> are set
	local buf = vim.api.nvim_get_current_buf()
	local s, e = vim.fn.line("'<"), vim.fn.line("'>")
	local lines = vim.api.nvim_buf_get_lines(buf, s - 1, e, false)
	local input = ("Filetype: %s\n\nInstruction: %s\n\nText:\n%s"):format(
		vim.bo[buf].filetype,
		instruction,
		table.concat(lines, "\n")
	)

	vim.notify("Claude: working...")
	vim.system({ "claude", "-p", "--append-system-prompt", SYSTEM }, { text = true, stdin = input }, function(res)
		vim.schedule(function()
			if res.code ~= 0 or res.stdout == "" then
				return vim.notify("Claude failed: " .. (res.stderr or ""), vim.log.levels.ERROR)
			end
			local out = res.stdout:gsub("^%s*```[%w_-]*\n", ""):gsub("\n```%s*$", ""):gsub("\n$", "")
			vim.api.nvim_buf_set_lines(buf, s - 1, e, false, vim.split(out, "\n"))
			vim.notify("Claude: done (u to undo)")
		end)
	end)
end

vim.keymap.set("x", "<leader>cc", function()
	vim.ui.input({ prompt = "Claude: " }, function(text)
		if text and text ~= "" then
			run(text)
		end
	end)
end, { desc = "Claude: edit selection with prompt" })

vim.keymap.set("x", "<leader>cf", function()
	run(FIX)
end, { desc = "Claude: fix selection" })
