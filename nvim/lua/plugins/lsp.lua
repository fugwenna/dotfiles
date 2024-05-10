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
            local util = require("lspconfig.util")
            config.lua_ls.setup({})
            config.tsserver.setup({}) -- TODO
            --config.angularls.setup({}) -- TODO
            --local pid = vim.fn.getpid()
            --local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"

            config.omnisharp.setup({
                --cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
                cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
                enable_import_completion = true,
                organization_imports_on_format = true,
                enable_roslyn_analyzers = true,
                root_dir = function ()
                    --return vim.loop.cwd()
                    return util.root_pattern("*.sln", "*.csproj", "*.projitems", "*.shproj")
                end,
            })
            config.pylsp.setup({})

            vim.keymap.set("n", "<F12>", function() vim.lsp.buf.definition() end, {})
            vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end
    }
}
