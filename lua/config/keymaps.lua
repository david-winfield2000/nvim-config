-- lazy keymaps
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { noremap = true, silent = true })

-- misc keymaps
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
