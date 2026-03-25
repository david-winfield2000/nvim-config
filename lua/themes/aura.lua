return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"baliestri/aura-theme",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])

			-- line number colors
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" }) -- other lines
			vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#a277ff" }) -- current line
		end,
	},
}
