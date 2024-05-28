return {
    {
        "akinsho/git-conflict.nvim",
        config = function()
            require("git-conflict").setup({
                debug = false,
                default_mappings = true, -- disable buffer local mapping created by this plugin
                default_commands = true, -- disable commands created by this plugin
                disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
                list_opener = 'copen', -- command or function to open the conflicts list
                highlights = { -- They must have background color, otherwise the default color will be used
                    incoming = 'DiffAdd',
                    current = 'DiffText',
                }
            });
        end
    },
    {
        "tpope/vim-fugitive",
        lazy = true,
        keys = {
            { "<leader>gs", "<cmd>Git<cr>", desc = "Status" },
            { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
            { "<leader>go", "<cmd>Git browse<cr>", desc = "Browse" },
        },
    },
}

