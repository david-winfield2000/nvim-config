return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>ff", require("telescope.builtin").find_files, desc = "Find files" },
		{ "<leader>fg", require("telescope.builtin").live_grep, desc = "Live grep" },
		{ "<leader>fb", require("telescope.builtin").buffers, desc = "Buffers" },
		{ "<leader>fh", require("telescope.builtin").help_tags, desc = "Help tags" },
		{
			"<leader>fc",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find files in neovim config",
		},
	},
	opts = {
		defaults = {
			mappings = {
				n = { ["q"] = require("telescope.actions").close },
			},
		},
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
	end,
}
