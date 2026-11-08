return {
	"milanglacier/minuet-ai.nvim",
	enabled = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		provider = "openai_fim_compatible",
		n_completions = 1,
		virtualtext = {
			auto_trigger_ft = { "lua", "python", "go" },
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
}
