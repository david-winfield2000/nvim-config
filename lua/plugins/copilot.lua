return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		-- Disable the default <Tab> mapping
		vim.g.copilot_no_tab_map = true

		-- Map Ctrl+J to accept Copilot suggestions
		vim.keymap.set("i", "<C-L>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
	end,
}
