return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
	    "nvim-lua/plenary.nvim"
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules/*",
                }
            }
        })

	    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
	    vim.keymap.set("n", "<C-f>", builtin.git_files, {})
	    vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
	    vim.keymap.set("n", "<leader>m", builtin.lsp_document_symbols, {})
    end
}
