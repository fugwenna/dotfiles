return {
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local oil = require("oil")
            oil.setup({
                columns = { "icon" },
            })

            vim.keymap.set("n", "<leader>o", oil.toggle_float)
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            vim.g.termguicolors = true
            vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)
            vim.keymap.set("n", "<leader>ff", vim.cmd.NvimTreeFindFile)

            require("nvim-tree").setup({
                filters = {
                    dotfiles = false
                },
                view = {
                    width = 70
                }
            })
        end
    }
}
