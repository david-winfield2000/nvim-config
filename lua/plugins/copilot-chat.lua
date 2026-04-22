return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
			{
				"<leader>cc",
				":'<,'>CopilotChat<cr>",
				mode = "v",
				desc = "Chat with selection",
			},
		},
	},
}
