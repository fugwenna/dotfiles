return {
    --"catppuccin/nvim",
    --name = "catppuccin",
    --priority = 1000,
    --config = function()
    --    vim.cmd.colorscheme "catppuccin-macchiato"
    --end

    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local nordic = require("nordic")
        nordic.setup({
            bright_border = true
        })
        nordic.load()
    end
}
