return {
    { "nvim-tree/nvim-web-devicons" },
    { 
        "nvim-tree/nvim-tree.lua",
        config = function()
            vim.g.termguicolors = true
            vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)
            vim.keymap.set("n", "<leader>ff", vim.cmd.NvimTreeFindFile)

            require("nvim-tree").setup({
                filters = {
                    dotfiles = false
                }
            })
        end
    }
}
