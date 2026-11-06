return {
	"david-winfield2000/claude-nvim",
	opts = {
		-- [key] = { model = required, prompt = omit to be asked each time, desc = optional }
		commands = {
			["<leader>cc"] = { model = "sonnet", desc = "Claude: custom prompt" },
			["<leader>cf"] = {
				model = "haiku",
				desc = "Claude: fix selection",
				prompt = "Fix anything missing or incorrect: resolve TODOs, follow comments that are clearly "
					.. "instructions (and remove them once done), fix typos, improve unclear variable names. "
					.. "Make no other changes.",
			},
		},
	},
}
