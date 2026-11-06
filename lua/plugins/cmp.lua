return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			{
				"milanglacier/minuet-ai.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
				opts = {
					provider = "openai_fim_compatible",
					n_completions = 1,
					virtualtext = {
						auto_trigger_ft = { "*" },
						keymap = {
							accept = false,
							next = "<A-]>",
							prev = "<A-[>",
							dismiss = "<A-e>",
							accept_n_lines = false,
						},
					},
					context_window = 512,
					provider_options = {
						openai_fim_compatible = {
							api_key = "TERM", -- ollama needs no key; any set env var works
							name = "Ollama",
							end_point = (vim.env.OLLAMA_HOST or "http://localhost:11434") .. "/v1/completions", -- follow OLLAMA_HOST like the ollama CLI
							model = "qwen2.5-coder:7b",
							optional = { max_tokens = 56, top_p = 0.9 },
						},
					},
				},
			},
		},
		config = function()
			local cmp = require("cmp")
			vim.keymap.set("i", "<A-y>", function()
				require("config.hunks").accept(true)
			end, { desc = "Accept all ghost text" })

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if not require("config.hunks").skip() then
							fallback()
						end
					end, { "i", "s" }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if require("minuet.virtualtext").action.is_visible() then
							require("config.hunks").accept()
						elseif cmp.visible() then
							cmp.confirm({ select = true })
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
					{ name = "buffer" },
				}),
			})

			-- Buffer source
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } },
			})

			-- Command line
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- LSP support
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})
			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})

			-- Enable LSP
			vim.lsp.enable({ "lua_ls", "pyright", "gopls" })

			-- Insert `(` after select function or method item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
