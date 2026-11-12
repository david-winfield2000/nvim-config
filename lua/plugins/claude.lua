return {
	"david-winfield2000/claude-nvim",
	name = "claude-nvim",
	opts = {
		-- Each entry maps a key to a command (works in normal and visual mode):
		-- ["<leader>cx"] = {
		--   model = "sonnet",        -- required: passed to `claude --model`
		--   name = "son",            -- optional: notification label (default: model up to first "-" or ":")
		--   prompt = "Fix bugs",     -- optional: omit to be asked each time
		--   whole_file = true,       -- optional: act on the whole buffer, not the selection/line
		--   lsp = true,              -- optional: send LSP definitions (other files) of symbols in the selection
		--   ask = true,              -- optional: with prompt, ask for optional extra instructions (empty = just prompt)
		--   desc = "My command",    -- optional: keymap description
		-- },
		commands = {
			["<leader>cf"] = {
				model = "haiku",
				prompt = "Fill this pseudocode with real working code",
				desc = "Claude Haiku: fill pseudocode",
			},
			["<leader>ch"] = {
				model = "haiku",
				desc = "Claude Haiku: custom prompt",
			},
			["<leader>cs"] = {
				model = "sonnet",
				desc = "Claude Sonnet: custom prompt",
			},
		},
	},
}
