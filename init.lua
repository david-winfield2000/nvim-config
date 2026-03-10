-- load config
require("config.lazy")
require("config.keymaps")
require("config.options")

-- ruff settings
vim.lsp.config("ruff", {
	init_options = {
		settings = {
			args = {
				"--line-length=88", -- max line length
				"--select=E,F,W", -- enable error, formatting, warning codes
			},
		},
	},
})

vim.lsp.enable("ruff")
