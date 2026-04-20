return {
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		event = "VeryLazy",
		opts = {
			virt_text_pos = "eol",
		},
		config = function(_, opts)
			require("nvim-dap-virtual-text").setup(opts)
		end,
	},
}
