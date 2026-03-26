return {
	"tiagovla/tokyodark.nvim",
	enabled = false,
	config = function(_, opts)
		require("tokyodark").setup(opts)
		vim.cmd([[colorscheme tokyodark]])
	end,
}
