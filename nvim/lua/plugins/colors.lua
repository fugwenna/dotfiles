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
        local colors = require("nordic.colors")
        nordic.setup({
            bright_border = true,
            override = {
                LineNr = {
                    fg = colors.grey5
                },
                Visual = {
                    bg = colors.blue1,
                    fg = colors.black1
                }
            }
        })
        nordic.load()
    end
}
