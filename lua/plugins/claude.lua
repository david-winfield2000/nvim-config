return {
	dir = "/Users/davidwinfield/Documents/claude-nvim",
	name = "claude-nvim",
	opts = {
		-- [key] = { model = required, prompt = omit to be asked each time, desc = optional }
		commands = {
			["<leader>ch"] = {
				model = "haiku",
				desc = "Claude Haiku: custom prompt",
			},
			["<leader>cs"] = {
				model = "sonnet",
				desc = "Claude Sonnet: custom prompt",
			},
			["<leader>cq"] = {
				model = "qwen3.5-16k",
				cmd = { "ollama", "run", "qwen3.5-16k", "--think=false" },
				desc = "Ollama: fix selection",
				prompt = "Quick-fix the selection: fix bugs and typos, complete unfinished code (TODOs, stubs, "
					.. "missing pieces), and wire it up to the surrounding file (use existing names, imports, and "
					.. "conventions). Add type hints where missing. Keep changes minimal; don't refactor or restyle working code.",
			},
		},
	},
}
