vim.g.mapleader = " "
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>h", vim.cmd.split)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.setqflist)
--vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, {})
