return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},

	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers({
					sort_mru = true,
					ignore_current_buffer = true,
				})
			end,
			desc = "Buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help tags",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end,
			desc = "Find files in Neovim config",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").live_grep({
					default_text = vim.fn.expand("<cword>"),
				})
			end,
			desc = "Live grep word under cursor",
		},
	},

	opts = function()
		local actions = require("telescope.actions")

		return {
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
				},
				buffers = {
					attach_mappings = function(_, map)
						map("i", "<C-d>", actions.delete_buffer)
						map("n", "<C-d>", actions.delete_buffer)
						return true
					end,
				},
			},
		}
	end,

	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)

		pcall(telescope.load_extension, "fzf")
	end,
}
