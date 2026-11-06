return {
	dir = "/Users/davidwinfield/Documents/claude-nvim",
	name = "claude-nvim",
	opts = {
		-- Each entry maps a key to a command (works in normal and visual mode):
		-- ["<leader>cx"] = {
		--   model = "sonnet",        -- required: passed to `claude --model`
		--   name = "son",            -- optional: notification label (default: model up to first "-" or ":")
		--   prompt = "Fix bugs",     -- optional: omit to be asked each time
		--   whole_file = true,       -- optional: act on the whole buffer, not the selection/line
		--   cmd = { "ollama", "run", "x" }, -- optional: custom backend instead of `claude`
		--   desc = "My command",     -- optional: keymap description
		-- },
		commands = {
			["<leader>ch"] = {
				model = "haiku",
				desc = "Claude Haiku: custom prompt",
			},
			["<leader>cs"] = {
				model = "sonnet",
				desc = "Claude Sonnet: custom prompt",
			},
			["<leader>cc"] = {
				model = "qwen3.5-16k",
				cmd = { "ollama", "run", "qwen3.5-16k", "--think=false" },
				desc = "Ollama: fix selection",
				prompt = "Quick-fix the selection: fix bugs and typos, complete unfinished code (TODOs, stubs, "
					.. "missing pieces), and wire it up to the surrounding file (use existing names, imports, and "
					.. "conventions). Add type hints where missing. Keep changes minimal; don't refactor or restyle working code.",
			},
			["<leader>cf"] = {
				model = "qwen3.5-16k",
				whole_file = true,
				cmd = { "ollama", "run", "qwen3.5-16k", "--think=false" },
				desc = "Ollama: fix file",
				prompt = "Quick-fix the file: fix bugs and typos, complete unfinished code (TODOs, stubs, "
					.. "missing pieces), and wire it up to the surrounding file (use existing names, imports, and "
					.. "conventions). Add type hints where missing. Keep changes minimal; don't refactor or restyle working code.",
			},
		},
	},
}
