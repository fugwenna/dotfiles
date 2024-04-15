return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig",
        config = function()
            require("mason-lspconfig").setup({
                lazy = false,
                opts = {
                    auto_install = true
                },
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "angularls",
                    "omnisharp",
                    "pylsp"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local config = require("lspconfig")
            config.lua_ls.setup({})
            config.tsserver.setup({}) -- TODO
            --config.angularls.setup({}) -- TODO
            config.omnisharp.setup({
                root_dir = function ()
                    return vim.loop.cwd() -- current working directory
                end,
            }) -- TODO
            config.pylsp.setup({})

            vim.keymap.set("n", "<F12>", function() vim.lsp.buf.definition() end, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end
    }
}
