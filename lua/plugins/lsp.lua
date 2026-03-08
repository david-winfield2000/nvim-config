return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua LSP example
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        -- optional: add server-specific settings here
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      vim.lsp.enable("lua_ls")

    end,
  }
}
