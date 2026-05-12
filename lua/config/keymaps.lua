-- lazy
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { noremap = true, silent = true })

-- quickfix
vim.keymap.set("n", "<leader>q", ":copen<CR>", { noremap = true, silent = true })

-- misc
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
