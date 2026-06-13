return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		-- Disable the default <Tab> mapping
		vim.g.copilot_no_tab_map = true

		-- Map Ctrl+L to accept Copilot suggestions
		vim.keymap.set("i", "<C-L>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.b.copilot_enabled = false
			end,
		})
	end,
}
