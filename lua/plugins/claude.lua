return {
	"david-winfield2000/claude-nvim",
	opts = {
		-- [key] = { model = required, prompt = omit to be asked each time, desc = optional }
		commands = {
			["<leader>cc"] = { model = "haiku", desc = "Claude: custom prompt" },
			["<leader>cf"] = {
				model = "haiku",
				desc = "Claude: fix selection",
				prompt = "Resolve TODOS, finish incomplete functions, fix typos, add type hints.",
			},
		},
	},
}
