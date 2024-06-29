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
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local config = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            config.lua_ls.setup({
                capabilities = capabilities
            })

            config.tsserver.setup({
                capabilities = capabilities,
            })

            config.angularls.setup({
                capabilities = capabilities,
            }) -- TODO

            config.omnisharp.setup({
                capabilities = capabilities,
                cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
                enable_import_completion = true,
                organization_imports_on_format = true,
                enable_roslyn_analyzers = true,
                root_dir = function()
                    return vim.loop.cwd()
                end,
            })
            config.pylsp.setup({
                plugins = {
                    autopep8 = { enabled = false },
                }
            })

            vim.keymap.set("n", "<F12>", function() vim.lsp.buf.definition() end, {})
            vim.keymap.set("n", "<S-F12>", function() vim.lsp.buf.go_to_implementation() end, {})
            --vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, {})
            vim.keymap.set("n", "<C-l>", vim.cmd.LspInfo)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end
    }
}
